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
    
    <title>My JSP 'checklogin1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
    <%
    	request.setCharacterEncoding("utf-8");
    	boolean flag = false;
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
					
					ResultSet rs = stmt.executeQuery("select * from buyer where account='"+ account +"' and password='"+ password +"'");
					
					flag = rs.next();
					if(flag){
						session.setAttribute("uname", rs.getString(2));
						response.sendRedirect("index.jsp");
					}
					con.close();
				}
			}
		}catch (ClassNotFoundException e){
			e.printStackTrace();
		}catch (SQLException e){
			e.printStackTrace();
		}
		if(!flag){
			out.println("用户名或密码错误！请重新输入！");
		}
    	
     %>
  </body>
</html>
