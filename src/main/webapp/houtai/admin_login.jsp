<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <%--     <base href="<%=basePath%>"> --%>

    <title>管理员登录</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" href="<%=basePath%>css/style.css">

        <style>
            body {
                background-image: url("<%=basePath%>images/2.jpg");
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
</head>

<body>
<%
    String mesg = request.getParameter("mesg");
    if ("".equals(mesg) || mesg == null) {
    } else {
%><br>
<h1><%=mesg %>
</h1><br>
<%} %>
<div class="login-container">
    <h1>江西联微内容管理系统</h1>

    <div class="connect">
        <p>管理员登录</p>
    </div>

    <form action="<%=request.getContextPath()%>/Managerlogin" method="post" id="loginForm">
        <div>
            <input type="text" name="username" class="username" placeholder="用户名" autocomplete="off"/>
        </div>
        <div>
            <input type="password" name="password" class="password" placeholder="密码" oncontextmenu="return false"
                   onpaste="return false"/>
        </div>
        <button id="submit" type="submit">Login by Admin</button>
    </form>


</div>
<%--<a href="<%=basePath%>/index.jsp">
    <button type="button" class="register-tis">返回主页</button>
</a>--%>
<script src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/common.js"></script>
<!--背景图片自动更换-->
<script src="<%=basePath%>/js/supersized.3.2.7.min.js"></script>
<script src="<%=basePath%>/js/supersized-init.js"></script>
<!--表单验证-->
<script src="<%=basePath%>/js/jquery.validate.min.js?var1.14.0"></script>

</body>
</html>
