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
        window.location.href="<%=request.getContextPath()%>/searchByTitle?pageNum="+1;
       //window.opener.document.location.reload(); 
    }
}
function prePage(){
    var pageNum=document.getElementById("pageNum").value;
    pageNum--;
   // window.location.href="<%=request.getContextPath()%>/com/news/controller/searchByTitle?pageNum="+pageNum;
   window.location.href="<%=request.getContextPath()%>/searchByTitle?pageNum="+pageNum;
}
function nextPage(){
    var pageNum=document.getElementById("pageNum").value;
    pageNum++;
     window.location.href="<%=request.getContextPath()%>/searchByTitle?pageNum="+pageNum;
}
function lastPage(){
    var pageNum=document.getElementById("pageNum").value;
    var totalPage=document.getElementById("totalPage").value;
    if(pageNum==totalPage){
        alert("亲，已经是尾页了");
    }else{
        window.location.href="<%=request.getContextPath()%>/searchByTitle?pageNum="+pageNum;
    }
}
</script>
  </head>
  
  <body>
     <table width="100%" border=1>
        <tr>
            <td>编号</td>
            <td>新闻标题</td>
            <td>作者</td>
        </tr>
        <c:forEach items="${itemsList }" var="item">
            <tr>
                <td>${item.nid}</td>
                <td><a href="xinwenchushihua?flag=${item.nid}">${item.title}</a></td>
                <td>${item.author }</td>
             <%--    <td><a href="queryOneItems.action?id=${item.id}">编辑</a> <a
                    href="javascript:void(0)" onclick="deleteitems(${item.id})">删除</a>
                </td> --%>

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
