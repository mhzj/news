<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%--     <base href="<%=basePath%>"> --%>
    
    <title>My JSP 'file.jsp' starting page</title>
    
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
 <form action="uploadfiles"  method="post" enctype="multipart/form-data">
 <td><input name="duofile" id="" type="file" multiple><input type="submit" value="上传"> </td></form>
   <%
  String url=(String)session.getAttribute("url");
  if("".equals(url) || null==url){}
  else{
   %>
   <img  height="200px" width="200px" src="<%=url %>"/>
   <%} %>
    
  </body>
</html>
