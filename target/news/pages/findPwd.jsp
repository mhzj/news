<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找回密码界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.img1{
		margin-top: 20px;
		width:150px;
		
	}
	a:HOVER {
	cursor: hand;
}
	</style>
<link rel="stylesheet" href="css/style.css">
  <script type="text/javascript">
var index = 0;
function changeCode(){
var iamgeCode = document.getElementById("codeId");
iamgeCode.src = "AuthImage?name="+index;
index++;
}
</script>
  </head>
<body>

<div class="register-container">
	<h1>密码找回</h1>
	
	<div class="connect">
		<p>find password......</p>
	</div>
	
	<form action="" method="post" id="registerForm">
		<div>
			<input type="text" name="username" class="username" placeholder="您的用户名" autocomplete="off"/>
		</div>
		
		<div>
			<input type="text" name="phone_number" class="phone_number" placeholder="输入手机号码" autocomplete="off" id="number"/>
		</div>
		<div>
			<input type="email" name="email" class="email" placeholder="输入邮箱地址" oncontextmenu="return false" onpaste="return false" />
		</div>


<div>
  <b> &nbsp;&nbsp; 验证码：</b>
&nbsp;&nbsp;<input type="text"  name="code" style="width:100px " />&nbsp;<img src="AuthImage" onclick="changeCode()" id="codeId" class="img1"/></div>

<br>
<div id="img1"><a  onclick="changeCode()">看不清？换一张</a>  </div>

	

		<button id="submit" type="submit"><a href="pages/modifyPwd.jsp">找回密码</a></button>
	</form>
	

</div>

</body>
<script src="js/jquery.min.js"></script>
<script src="js/common.js"></script>
<!--背景图片自动更换-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>
</html>
