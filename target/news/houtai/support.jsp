<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>

<!DOCTYPE HTML>
<html>
<head>
<title>赞助管理</title>
<link href="${path}/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path}/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${path}/js/bootstrap.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

#menuContent a {
	text-decoration: none;
	color: #ffffff
}

.c {
	border-style: solid;
	width: 400px;
	height: 260px;
	margin: 4 23 0 23;
	border-radius: 5;
	display: block;
	background: #fff;
	margin: 10% auto;
}

.modifyMask,.addMask { /*   width: 400px;
          height: 260px; */
	width: 50%;
	height: 50%;
	position: absolute;
	/* background:rgba(0,0,0,.3); */
	display: none;
}

#editForm {
	margin-top: -30px;
}
</style>
<script type="text/javascript">
	 //页面上添加按钮的关闭按钮切换方法
	   function showAddMask(flag){
		    if(flag=="true"){
		 	   $(".addMask").css("display","block");//让.addMask元素显示
		    }else{
		 	   $(".addMask").css("display","none");//让.addMask隐藏
		    }
	   }
	   

	   
 	function del(mid) {
var msg = "您真的确定要删除吗？\n\n请确认！";
if (confirm(msg)==true){

   window.location.href="<%=request.getContextPath()%>/support/delSupport?id="+mid;
}
else{
window.location.href="<%=request.getContextPath()%>/support/SupportInfo";
}

}

	   

	
			//页面上添加按钮的提交验证,通过就提交
			function check1(){
				
				if($("#addName").val()==null||$("#addName").val()==""){
		           alert("赞助商不能为空！");
		           return false;
		       }
		       	if($("#addMoney").val()==null||$("#addMoney").val()==""){
		           alert("金额不能为空！");
		           return false;
		       }
		       	if($("#addText").val()==null||$("#addText").val()==""){
		           alert("广告内容不能为空！");
		           return false;
		       }

				
				return true;
			}
			
       
 		//页面的"编辑"按钮点击事件
       function editSupport(id,name,money,text){

       		  $("#editSupportId").val(id);
              $("#editName").val(name);
              $("#editMoney").val(money);
                 $("#editText").val(text);
    
              //显示弹出框
              $(".modifyMask").css("display","block");
        
       }	    

	    //"编辑"窗体关闭按钮事件
       function cancelEdit(){
    	   $(".modifyMask").css("display","none");
       }       	 
	</script>
</head>

<body>

	<div class="container">
	
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SUPPORT INFO</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
			<%-- 	<a class="btn btn-primary" href="${path}/manager/editManager">新增</a> --%>
				<a class="btn btn-primary" onclick="showAddMask('true')">新增</a>	&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-primary"href="${path}/index">返回首页</a>
			</div>
		</div>
		<!-- 表格  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>id</th>
						<th>赞助商</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="support">
						<tr>
							<td>${support.sid}</td>
							<td>${support.sname }</td>
							<td>
                                    <a type="button"
								onclick=" editSupport('${support.sid}','${support.sname }','${support.smoney }','${support.text}')"
								class="btn btn-info btn-sm"> <span
									class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									编辑</a> 
									<a type="button"
								onclick="del(${support.sid})"
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
						<li><a href="${path}/support/SupportInfo?pn=1">首页</a>
						</li>
						<c:if test="${pageInfo.hasPreviousPage }">
							<li><a
								href="${path}/support/SupportInfo?pn=${pageInfo.pageNum-1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>

						<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
							<c:if test="${page_Num == pageInfo.pageNum }">
								<li class="active"><a href="#">${ page_Num}</a>
								</li>
							</c:if>
							<c:if test="${page_Num != pageInfo.pageNum }">
								<li><a href="${path}/support/SupportInfo?pn=${ page_Num}">${
										page_Num}</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${pageInfo.hasNextPage }">
							<li><a
								href="${path}/support/SupportInfo?pn=${pageInfo.pageNum+1}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a>
							</li>
						</c:if>
						<li><a
							href="${path}/support/SupportInfo?pn=${pageInfo.pages}">末页</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<div class="modifyMask" align="center">
		<div class="c" align="center">
			<div
				style="background-color:#173e65;height:20px;color:#fff;font-size:12px;padding-left:7px;">
				修改信息<font style="float:right;padding-right: 10px;"
					onclick="cancelEdit()">X</font>
			</div>

			<br> <br> <br>
			<form id="editForm" action="../support/editSupport" method="post"
				align="center">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赞助商: <input
					type="text" id="editName" name="editSupportname"
					style="width:120px" /> <br /> <br> 
					
				&nbsp;&nbsp;&nbsp;
				金额：<input type="text"
					id="editMoney" name="editMoney" style="width:120px" /> <br />
					<br> 
					广告内容：<input type="text" id="editText"
					name="editText" style="width:120px"  /><br />
				<br> 
				赞助商ID：<input type="text" id="editSupportId"
					name="editSupportId" style="width:120px" readonly="readonly" /><br />
				<br> <input type="submit" value="修改"
					style="background-color:#173e65;color:#ffffff;width:70px;" />
			</form>
		</div>
		
	</div>
	
	

	<div class="addMask" align="center">
		<div class="c" align="center">

			<div
				style="background-color:#173e65;height:20px;color:#fff;font-size:12px;padding-left:7px;">

			 添加赞助<font style="float:right;padding-right:10px;"
					onclick="showAddMask('false');">X</font> 
			</div>
			<br> <br> <br>

		 	<form id="addForm" action="addSupport" method="post"
				onsubmit="return check1();">
				赞助商：<input type="text" id="addName" name="SupportName"
					style="width:120px" /> <br /> <br>
				金&nbsp;&nbsp;&nbsp;&nbsp;额：<input type="text" id="addMoney"
					name="addMoney" style="width:120px" /> <br /> <br> 
					
								投放广告：<input type="text" id="addText"
					name="addText" style="width:120px" /> <br /> <br> 
					
					<input
					type="submit" value="添加"
					style="background-color:#173e65;color:#ffffff;width:70px;" />
			</form> 

		</div>
	</div> 

</body>
</html>