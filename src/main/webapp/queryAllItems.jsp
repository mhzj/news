<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.github.pagehelper.PageHelper"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
 Integer pageNum=(Integer)session.getAttribute("pageNum");
Integer totalPage=(Integer)session.getAttribute("totalPage"); 
%>
  <head>
<%--     <base href="<%=basePath%>"> --%>
    
    <title>My JSP 'queryAllItems.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	a{text-decoration: none; color:black; font-size: 18px; font-family: 微软雅黑;}
a:hover{color:blue;font-size: 19px;}

table.dataintable {
  margin-top:15px;
  border-collapse:collapse;
  border:1px solid #aaa;
  width:100%;
}
table.dataintable th {
  vertical-align:baseline;
  padding:5px 15px 5px 6px;
  background-color:#3F3F3F;
  border:1px solid #3F3F3F;
  text-align:left;
  color:#fff;
}
table.dataintable td {
  vertical-align:text-top;
  padding:6px 15px 6px 6px;
  border:1px solid #aaa;
}
table.dataintable tr:nth-child(odd) {
  background-color:#F5F5F5;
}
table.dataintable tr:nth-child(even) {
  background-color:#fff;
}
	
	</style>
<script type="text/javascript">
function deleteitems(id){
    var flag=alert("确定要删除吗？");
    if(!flag){
        window.location.href="deleteItems.action?id="+id;
    }
}

function firstPage(){
    var pageNum=document.getElementById("pageNum").value;
    console.log(pageNum);
    if(1==pageNum){
        alert("亲，已经是首页了");
    }else{
        window.location.href="<%=request.getContextPath()%>/queryAllItems?pageNum="+1;
       //window.opener.document.location.reload(); 
    }
}
function prePage(){
    var pageNum=document.getElementById("pageNum").value;
    pageNum--;
   // window.location.href="<%=request.getContextPath()%>/com/news/controller/queryAllItems?pageNum="+pageNum;
   window.location.href="<%=request.getContextPath()%>/queryAllItems?pageNum="+pageNum;
}
function nextPage(){
    var pageNum=document.getElementById("pageNum").value;
    pageNum++;
     window.location.href="<%=request.getContextPath()%>/queryAllItems?pageNum="+pageNum;
}
function lastPage(){
    var pageNum=document.getElementById("pageNum").value;
    var totalPage=document.getElementById("totalPage").value;
    if(pageNum==totalPage){
        alert("亲，已经是尾页了");
    }else{
        window.location.href="<%=request.getContextPath()%>/queryAllItems?pageNum="+pageNum;
    }
}
</script>
  </head>
  
  <body>
     <table class="dataintable">
        <tr>
        <th>编号</th>
                <th>新闻标题</th>
                        <th>作者</th>
        </tr>
        <c:forEach items="${itemsList }" var="item">
            <tr>
                <td>${item.nid}</td>
                <td><a href="xinwenchushihua?flag=${item.nid}"  style="">${item.title}</a></td>
                <td>${item.author }</td>

            </tr>
        </c:forEach>
    </table>
    <br>
    <div>
        <input type="text" id="pageNum" value="<%=pageNum%>" style="width:20px;border:none; "readonly unselectable="on" >/&nbsp;&nbsp;
        <input type="text" id="totalPage" value="<%=totalPage%>" style="width:20px;border:none; "readonly unselectable="on">
        <span onclick="firstPage()">首页</span> <span onclick="prePage()">上一页</span>
        <span onclick="nextPage()">下一页</span> <span onclick="lastPage()">尾页</span>
    </div>
  </body>
</html>
