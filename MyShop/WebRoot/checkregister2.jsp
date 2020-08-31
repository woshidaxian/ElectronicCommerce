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
    
    <title>My JSP 'checkregister2.jsp' starting page</title>
    
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
    	String account = request.getParameter("account");
    	String password = request.getParameter("password");
		
		try{
			if(account!=null && password!=null){
				if(!password.equals("") && !account.equals("")){
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
					stmt.executeUpdate("insert into seller(account,password)"+"values('"+ account +"','"+ password +"')");
					stmt.close();
					con.close();
					out.println("注册成功，即将跳转到登录页面！！！注意选择商家登录");
					response.setHeader("Refresh", "3;url=login.jsp");
				}else{
					out.println("信息不完整，请重新注册！！");
					response.setHeader("Refresh", "3;url=register.jsp");
				}
			}
		}catch (ClassNotFoundException e){
			e.printStackTrace();
		}catch (SQLException e){
			e.printStackTrace();
		}
    	
     %>
  </body>
</html>
