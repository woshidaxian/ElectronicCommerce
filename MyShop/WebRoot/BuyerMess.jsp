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
    
    <title>蚂蚁商城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="https://cdn.bootcdn.net/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/BuyerMess.css">

  </head>
  
  <body>
     <div class="container">
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
        <div class="con-mess-bg">
            <div class="con-mess">
                <div class="mess-title">
                    商家个人信息
                </div>
                <form action="updataSeller.jsp" method="post">
                <div class="con-mess-box">
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
									
						ResultSet rs = stmt.executeQuery("select * from seller where account = '"+ account +"'");
						
							if(rs.next()){
								String id = rs.getString(1);
								String acc = rs.getString(2);
								String password = rs.getString(3);
								String shopName = rs.getString(4);
								String email = rs.getString(5);
								String contact = rs.getString(6);
								String address = rs.getString(7);
								out.println("<div class='mess-div-s'> 编号：<input type='text' readonly name='id' value='"+ id +"' class='inp-style'></div>");
								out.println("<div class='mess-div-s'> 用户名：<input type='text' name='acc' value='"+ acc +"' class='inp-style'></div>");
								out.println("<div class='mess-div-s'>店铺名：<input type='text' name='shopname' value='"+ shopName +"' class='inp-style'></div>");
								out.println("<div class='mess-div-s'> 新密码：<input type='password' name='password' value='"+ password +"' class='inp-style'></div>");
								out.println("<div class='mess-div-s'>email：<input type='text' name='email' value='"+ email +"' class='inp-style'></div>");
								out.println("<div class='mess-div-s'>联系方式：<input type='text' name='contact' value='"+ contact +"' class='inp-style'></div>");
								out.println("<div class='mess-div-s'> 联系地址：<input type='text' name='address' value='"+ address +"' class='inp-style'></div>");
							}
						stmt.close();
						con.close();
					}catch (ClassNotFoundException e){
						e.printStackTrace();
					}catch (SQLException e){
						e.printStackTrace();
					}
                %>
                <div class="mess-div-s">
                        <input type="submit" value="保存" class="inp-btn">
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
  </body>
</html>
