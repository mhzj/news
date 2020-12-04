<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <%--   <base href="<%=basePath%>"> --%>
    
    <title>密码修改界面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/style.css">
  </head>
  
  <body>
  
<div class="login-container">
	<%String mesg=request.getParameter("mesg");
	if("".equals(mesg) || null==mesg){}
	else{
	 %>
	 <h1><%=mesg %></h1>
	 <%} %>
	<h1>密码修改</h1>
	
	<div class="connect">
		<p>请妥善保存密码</p>
	</div>
	
	<form action="modifyPwd" method="post" id="loginForm">
	<div>
			<input type="password" name="password" class="password" placeholder="输入新密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="password" name="confirm_password" class="confirm_password" placeholder="再次输入新密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		
		
		<button id="submit" type="submit">
		<!-- <a href="login.jsp">修改密码并返回登录</a> -->修改密码并返回登录
		</button>
	</form>


</div>

<script src="<%=basePath %>js/jquery.min.js"></script>
<script src="<%=basePath %>js/common.js"></script>
<!--背景图片自动更换-->
<script src="<%=basePath %>js/supersized.3.2.7.min.js"></script>
<script src="<%=basePath %>js/supersized-init.js"></script>
<!--表单验证-->
<script src="<%=basePath %>js/jquery.validate.min.js?var1.14.0"></script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. 不支持IE8及以下浏览器。</p>
</div>
  			
  </body>
</html>
