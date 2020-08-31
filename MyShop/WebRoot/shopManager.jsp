<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shopManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="https://cdn.bootcdn.net/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/shopManager.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/shopManager.js"></script>

  </head>
  
  <body>
    <div class="con-top-bg">
        <div class="con-top">
            <div class="top-left">
                <%
                		if(session.getAttribute("uname2")==null){
			        		response.setHeader("refresh", "1;url=login.jsp");
			        	}else{
			        		out.println("<a href='BuyerMess.jsp' class='login-url'>欢迎！"+ session.getAttribute("uname2") +"</a> ");
			        	}
                	%>·
                <a href="" class="re-url">免费注册</a>
            </div>
            <div class="top-right">
                <a href="" class="order-url">
                    <span class="fa fa-server"></span>
                    我的订单
                </a>
                <span style="margin: 0 10px;">|</span>
                <a href="" class="order-url">
                    <span class="fa fa-shopping-cart"></span>
                    购物车
                </a>
                <span style="margin: 0 10px;">|</span>
                <a href="" class="order-url">
                    <span class="fa fa-users"></span>
                    成为商家
                </a>
                <span style="margin: 0 10px;">|</span>
                <a href="" class="order-url">
                    <span class="fa fa-paint-brush"></span>
                    开发中ing...
                </a>
            </div>
        </div>
    </div>
    <div class="shop-manager-bg">
        <div class="shop-manager">
            <div class="box-title-div other-style">
                <div class="item-id">id</div>
                <div class="item-name">商品名</div>
                <div class="item-img">图片</div>
                <div class="item-price">价格（¥）</div>
                <div class="item-one">一级目录</div>
                <div class="item-two">二级目录</div>
                <div class="item-three">三级目录</div>
                <div class="item-do">操作</div>
            </div>
            <% 
                	request.setCharacterEncoding("utf-8");
                	String account = (String)session.getAttribute("uname2");
					try{
						String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
						String DB_URL = "jdbc:mysql://localhost:3306/shop_data?useSSL=false&serverTimezone=UTC";
						String User = "root";
						String Password = "root";
						Class.forName(JDBC_DRIVER);
						Connection con = null;
									
						con = DriverManager.getConnection(DB_URL,User,Password);
						Statement stmt = null;
						stmt = con.createStatement();
									
						ResultSet rs = stmt.executeQuery("select * from goods where account = '"+ account +"'");
						
							while(rs.next()){
								String id = rs.getString(1);
								String name = rs.getString(2);
								String price = rs.getString(3);
								String img = rs.getString(4);
								String type1 = rs.getString(5);
								String type2 = rs.getString(6);
								String type3 = rs.getString(7);
								out.println("<div class='box-title-div'>");
								out.println("<div class='item-id'>"+ id +"</div>");
								out.println("<div class='item-name'>"+ name +"</div>");
								out.println("<div class='item-img'><img src='"+ img +"' style='width:50%;'></div>");
								out.println("<div class='item-price'>￥"+ price +"</div>");
								out.println("<div class='item-one'>"+ type1 +"</div>");
								out.println("<div class='item-two'>"+ type2 +"</div>");
								out.println("<div class='item-three'>"+ type3 +"</div>");
								out.println("<div class='item-do'>");
								out.println("<form method='post' action='delete.jsp?id="+ id +"'>");
								out.println("<input type='submit' value='删除' class='delete-style'>");
								out.println("</form></div></div>");
							}
							stmt.close();
							con.close();
					}catch (ClassNotFoundException e){
						e.printStackTrace();
					}catch (SQLException e){
						e.printStackTrace();
					}
            %>
            
        </div>
    </div>
    <div class="add-bg">
        <div class="add">
            <div class="">新增商品</div>
            <div class="box-div">
                <form method="post" action="addGoods.jsp">
                    <div>
                        商品名：
                        <input type="text" name="name" class="inp-style">
                    </div>
                    <div>
                        价格：
                        <input type="text" name="price" class="inp-style">
                    </div>
                    <div>
                        描述：
                        <input type="text" name="describle" class="inp-style">
                    </div>
                    <div>
                        图片：
                        <input type="file" name="img" class="inp-style">
                    </div>
                    <div>
                        一级分类：
                        <select id="sel1" name="type1">
                        
                        </select>
                    </div>
                    <div>
                        二级分类：
                        <select id="sel2" name="type2">
                        
                        </select>
                    </div>
                    <div>
                        三级分类：
                        <select id="sel3" name="type3">
                        
                        </select>
                    </div>
                    <div> 
                        <input type="submit" name="" id="btn-submit" value="提交">
                    </div>
                </form>
            </div>
        </div>
    </div>
  </body>
</html>
