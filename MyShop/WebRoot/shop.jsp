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
    <link rel="stylesheet" href="css/shop.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/shop.js"></script>

  </head>
  
  <body>
     <div class="container">
        <div class="con-top-bg">
            <div class="con-top">
                <div class="top-left">
                	<%
                		if(session.getAttribute("uname")==null){
			        		response.setHeader("refresh", "1;url=login.jsp");
			        	}else{
			        		out.println("<a href='sellerMess.jsp' class='login-url'>欢迎！"+ session.getAttribute("uname") +"</a> ");
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
        </div>
        <div class="con-center-top-bg">
            <div class="con-center-top">
                <span style="font-size: 22px;">数码商城</span>
                <div class="search-div">
                    <input type="text" class="inp-search" placeholder="请输入">
                    <button class="btn-search">搜索</button>
                </div>
            </div>
        </div>
        <div class="center-nav-bg">
            <div class="center-nav">
                <ul class="center-nav-ul">
                    <li>
                        <a class="nav-item-url" href="">
                            <span class="fa fa-mobile-phone"></span>
                            <div class="nav-item-text">手机/配件</div>
                        </a>
                    </li>
                    <li>
                        <a class="nav-item-url" href="">
                            <span class="fa fa-gamepad"></span>
                            <div class="nav-item-text">游戏设备</div>
                        </a>
                    </li>
                    <li>
                        <a class="nav-item-url" href="">
                            <span class="fa fa-desktop"></span>
                            <div class="nav-item-text">电脑主机</div>
                        </a>
                    </li>
                    <li>
                        <a class="nav-item-url" href="">
                            <span class="fa fa-camera"></span>
                            <div class="nav-item-text">相机摄像</div>
                        </a>
                    </li>
                    <li>
                        <a class="nav-item-url" href="">
                            <span class="fa fa-cutlery"></span>
                            <div class="nav-item-text">生活厨电</div>
                        </a>
                    </li>
                    <li>
                        <a class="nav-item-url" href="">
                            <span class="fa fa-music"></span>
                            <div class="nav-item-text">影音/智能</div>
                        </a>
                    </li>
                    <li>
                        <a class="nav-item-url" href="">
                            <span class="fa fa-shower"></span>
                            <div class="nav-item-text">个护健康</div>
                        </a>
                    </li>
                </ul>
                <div class="nav-block"></div>
            </div>
        </div>
        <div class="hot-block-bg">
            <div class="hot-block">
                <%
                	request.setCharacterEncoding("utf-8");
                	String type3 = request.getParameter("type3");
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
									
						ResultSet rs = stmt.executeQuery("select id,price,img,shopname,describle from goods where type3='"+ type3 +"'");
						
							while(rs.next()){
								String id = rs.getString(1);
								String price = rs.getString(2);
								String img = rs.getString(3);
								String shopName = rs.getString(4);
								String describle = rs.getString(5);
								out.println("<a href='describle.jsp?id="+ id +"' class='hot-div'>");
								out.println("<div class='hot-div-top'>");
								out.println("<div class='img-div' style='background:url("+ img +");background-size:cover;background-position:center center'></div></div>");
								out.println("<div class='hot-div-bottom'>");
								out.println("<div class='item-price'>"+ price +"</div>");
								out.println("<div class='item-de'>"+ describle +"</div>");
								out.println("<div class='item-shop'><span class='fa fa-user'></span>&nbsp;&nbsp;"+ shopName +"</div>");
								out.println("</div></a>");
							}
						stmt.close();
						con.close();
					}catch (ClassNotFoundException e){
						e.printStackTrace();
					}catch (SQLException e){
						e.printStackTrace();
					}
                %>
                
                <%-- <a href="" class="hot-div">
                    <div class="hot-div-top">
                        <div class="img-div"></div>
                    </div>
                    <div class="hot-div-bottom">
                        <span class="item-de">测试文字测试测试文字测试文字</span>
                        <span class="item-price">¥99.8</span>
                    </div>
                </a> --%>
            </div>
        </div>
        <div class="footer">
            Copyright &copy; 2020 蚂蚁商城 All rights Reserved
        </div>
    </div>
  </body>
</html>
