<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String goodsId0 = request.getParameter("id");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>蚂蚁商城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="https://cdn.bootcdn.net/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/describle.css">

  </head>
  
  <body>
    <div class="con-top-bg">
        <div class="con-top">
            <div class="top-left">
                <%
                		if(session.getAttribute("uname")==null){
			        		response.setHeader("refresh", "1;url=login.jsp");
			        	}else{
			        		out.println("<a href='BuyerMess.jsp' class='login-url'>欢迎！"+ session.getAttribute("uname") +"</a> ");
			        	}
                %>
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
        <%
            //request.setCharacterEncoding("utf-8");
        	String goodsId = request.getParameter("id");
        	if(goodsId!=null){
        		if(!goodsId.equals("")){
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
									
						ResultSet rs = stmt.executeQuery("select * from goods where id='"+ goodsId +"'");
						if(rs.next()){
							String name = rs.getString(2);
							String price = rs.getString(3);
							String img = rs.getString(4);
							String shopName = rs.getString(8);
							String de = rs.getString(10);
							//out.println(goodsId);
							out.println("<div class='box-div'><div class='box-left'>");
							out.println("<img src='"+ img +"' alt=''> </div>");
					        out.println("<div class='box-right'><div class='box-name'>"+ name +"</div>");
					        out.println("<div class='box-price'>￥"+ price +"</div>");
					        out.println("<div class='box-de'>"+ de +"</div>");
					        out.println("<div class='box-do'>");
					        out.println("<a href='buy.jsp?id="+ goodsId +"'>购买</a>");
					        out.println("<a href='add.jsp?id="+ goodsId +"'>加入购物车</a></div>");
					        out.println("<div class='box-shopName'><span class='fa fa-shopping-cart'></span>&nbsp;&nbsp;"+ shopName +"</div>");
					        out.println("</div></div>");
						}
						stmt.close();
						con.close();
					}catch (ClassNotFoundException e){
						e.printStackTrace();
					}catch (SQLException e){
						e.printStackTrace();
					}
        		}
        	}
        %>
        <%-- <div class="box-div">
            <div class="box-left">
                <img src="img/timg1.jpeg" alt="">
            </div>
            <div class="box-right">
                <div class="box-price">¥999.99</div>
                <div class="box-de">
                    测试文字测试文字测试文字测试文字测试文字测试文字
                    测试文字测试文字测试文字测试文字测试文字测试文字
                    测试文字测试文字测试文字测试文字测试文字测试文字
                    测试文字测试文字测试文字测试文字测试文字
                </div>
                <div class="box-do">
                    <button>购买</button>
                    <button>加入购物车</button>
                </div>
            </div>
        </div> --%>
        <div class="box-mess">
            <div class="box-title">留言板</div>
            <div class="box-box">
                <form action="chatcheck.jsp?id=<%=goodsId0%>" method="post">
                	<input type="text" name="chat" id="inp-te">
                	<input type="submit" value="留言" id="inp-btn">
                </form>
            </div>
            <%
            	
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
									
						ResultSet rs = stmt.executeQuery("select * from chat where ids='"+ goodsId +"'");
						while(rs.next()){
							String name = rs.getString(2);
							String text = rs.getString(3);
							out.println("<div class='box-box-1'>");
							out.println("<span class='box-acc'>"+ name +":</span>");
					        out.println("<span class='box-te'>"+ text +"</span></div>");
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
  </body>
</html>
