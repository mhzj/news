<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%--    <base href="<%=basePath%>">  --%>
    
    <title>登录界面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="<%=basePath%>css/style.css">
  </head>
  
  <body>
  
<div class="login-container">
	<h1>${mesg }登录</h1>
	
	<div class="connect">
		<p>neu.news.com</p>
	</div>

	<form action="../login" method="post" id="loginForm">
		<div>
			<input type="text" name="username" class="username" placeholder="用户名" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<button id="submit" type="submit">	登 陆</button>
	</form>

	<a href="pages/register.jsp">
		<button type="button" class="register-tis">还有没有账号？</button>
	</a>
	<p></p>
	<a href="pages/findPwd.jsp">
		<button type="button" class="register-tis">忘记密码？</button>
	</a> 

</div>

<script src="<%=basePath%>js/jquery.min.js"></script>
<script src="<%=basePath%>js/common.js"></script>
<!--背景图片自动更换-->
<script src="<%=basePath%>js/supersized.3.2.7.min.js"></script>
<script src="<%=basePath%>js/supersized-init.js"></script>
<!--表单验证-->
<script src="<%=basePath%>js/jquery.validate.min.js?var1.14.0"></script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. 不支持IE8及以下浏览器。</p>
</div>

  			
  </body>
</html>
