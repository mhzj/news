<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>

<!DOCTYPE HTML>
<html>
<head>
<title>用户管理</title>
<link href="${path}/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path}/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${path}/js/bootstrap.min.js"></script>
<script type="text/javascript">

	   
 	function del(mid) {
var msg = "您真的确定要删除吗？\n\n请确认！";
if (confirm(msg)==true){

   window.location.href="<%=request.getContextPath()%>/delUser?id="+mid;
}
else{
window.location.href="<%=request.getContextPath()%>/UserInfo";
}

}
       
	</script>
</head>

<body>

	<div class="container">
	
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>USER INFO</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
					<a class="btn btn-primary"href="${path}/index">返回首页</a>
			</div>
		</div>
		<!-- 表格  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
					<th>用户编号</th>
						<th>姓名</th>
						<th>电话</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="user" begin="1">
						<tr>
							<td>${user.uid}</td>
							<td>${user.uname}</td>
							<td>${user.tel }</td>
							<td>
									<a type="button"
								onclick="del(${user.uid})"
								class="btn btn-danger btn-sm"> 
								<span
									class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<hr style="height:1px;border:none;border-top:1px solid #ccc;" />
		<!-- 分页导航栏 -->

		<!-- 分页信息 -->
		<div class="row">
			<!-- 分页文字信息，其中分页信息都封装在pageInfo中 -->
			<div class="col-md-6">
				当前第：${pageInfo.pageNum}页，总共：${pageInfo.pages}页，总共：${pageInfo.total}条记录
			</div>

			<!-- 分页条 -->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="${path}/UserInfo?pn=1">首页</a>
						</li>
						<c:if test="${pageInfo.hasPreviousPage }">
							<li><a
								href="${path}/UserInfo?pn=${pageInfo.pageNum-1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>

						<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
							<c:if test="${page_Num == pageInfo.pageNum }">
								<li class="active"><a href="#">${ page_Num}</a>
								</li>
							</c:if>
							<c:if test="${page_Num != pageInfo.pageNum }">
								<li><a href="${path}/UserInfo?pn=${ page_Num}">${
										page_Num}</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${pageInfo.hasNextPage }">
							<li><a
								href="${path}/UserInfo?pn=${pageInfo.pageNum+1}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a>
							</li>
						</c:if>
						<li><a
							href="${path}/UserInfo?pn=${pageInfo.pages}">末页</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

</body>
</html>