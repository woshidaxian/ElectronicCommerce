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
    
    <title>My JSP 'addGoods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <% 
    	request.setCharacterEncoding("utf-8");
    	String account = (String)session.getAttribute("uname2");
    	String name = request.getParameter("name");
    	String price = request.getParameter("price");
    	String describle = request.getParameter("describle");
    	String img = request.getParameter("img");
    	String type1 = request.getParameter("type1");
    	String type2 = request.getParameter("type2");
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
					
					//ResultSet rs = stmt.executeQuery("select * from buyer where account='"+ account +"' and password='"+ password +"'");
					stmt.executeUpdate("insert into goods(name,price,img,type1,type2,type3,describle,account)"+
					"values('"+ name +"','"+ price +"','img/"+ img +"','"+ type1 +"','"+ type2 +"','"+ type3 +"','"+ describle +"','"+ account +"')");
					stmt.close();
					con.close();
					out.println("注册成功，即将跳转到登录页面！！！");
					response.setHeader("Refresh", "2;url=shopManager.jsp");
		}catch (ClassNotFoundException e){
			e.printStackTrace();
		}catch (SQLException e){
			e.printStackTrace();
		}
    	
    %>
  </body>
</html>
