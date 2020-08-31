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
    
    <title>My JSP 'delete.jsp' starting page</title>
    
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
    	String id = request.getParameter("id");
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
									
			stmt.executeUpdate("delete from goods where id = '"+ id +"'");
			out.println("删除成功，即将返回原页面！！！");
			response.setHeader("refresh", "1;url=shopManager.jsp");
			stmt.close();
			con.close();
		}catch (ClassNotFoundException e){
			e.printStackTrace();
		}catch (SQLException e){
			e.printStackTrace();
		}
     %>
  </body>
</html>
