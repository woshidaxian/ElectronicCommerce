<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<link rel="stylesheet" href="css/login.css">
	<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/login.js"></script>

  </head>
  
  <body>
    <div class="container">
        <div class="con-div">
            <div class="con-left"></div>
            <form class="formDo" method="post" action="checklogin1.jsp">
            	<div class="con-right">
                	<div style="font-size: 28px;color: rgb(90, 90, 90);">登录</div>
                	<input type="text" placeholder="账号" name="account" class="inp-s inp-acc">
                	<input type="password" placeholder="密码" name="password" class="inp-s inp-pass">
                	<div class="box-div">
                    	<input type="checkbox" class="inp-box">
                   		 商家登录
                	</div>
                	<input class="btn" type="submit" name="submit"></button>
            	</div>
            </form>
        </div>
    </div>
  </body>
</html>
