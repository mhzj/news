<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
function quding() {
		if (window.confirm("你确定要提交该新闻信息吗？")) {
			myform.submit();//提交表单
		}
	}
</script>
    <base href="<%=basePath%>">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <style>
.c {
	border-style: solid;
	width: 400px;
	height: 260px;
	margin: 4px 23px 0px 23px;
	border-radius: 5px;
	display: block;
	background: #fff;
	margin: 10% auto;
}

.addMask {
	width: 50%;
	height: 50%;
	position: absolute;
	display: none;
	margin-top: -600px;
}
</style>
    	<script type="text/javascript" src="<%=basePath %>/js/jquery-1.12.4.min.js"></script>
	   <script type="text/javascript" src="<%=basePath %>/js/jquery-1.8.3.js"></script>  
<script type="text/javascript">
	//页面上添加按钮的提交验证,通过就提交
	function check1() {
		if ($("#addPwd").val() == null || $("#addPwd").val() == "") {
			alert("二级验证密码不能为空！");
			return false;
		}
		return true;
	}

	//页面上添加按钮的关闭按钮切换方法
	function showAddMask(flag) {
		if (flag== 'true') {
			$(".addMask").css("display", "block");//让.addMask元素显示
		} else {
			$(".addMask").css("display", "none");//让.addMask隐藏
		}
	}
	
</script>
</head>
<body>
<%
	if(session.getAttribute("newstypelist1")==null){
	pageContext.forward("../jia");
	}%>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="houtai/index.jsp" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
              <li><a class="on" href="<%=path%>/houtai/index.jsp">首页</a>
					</li>
					<li><a href="<%=path%>/index.jsp" target="_blank">网站首页</a>
					</li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
               	<li><a  href="javascript:void(0)"  onclick="showAddMask('true');" >
								管理员</a>
					</li>

					<li><a href="#">退出</a>
					</li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
            <li><a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
						<ul class="sub-menu">
							<li><a href="<%=request.getContextPath()%>/xinwenguanli"><i
									class="icon-font">&#xe052;</i>新闻管理</a>
							</li>
							<li><a
								href="<%=request.getContextPath()%>/tpchshihua?flag=1"><i
									class="icon-font">&#xe006;</i>分类管理</a>
							</li>
							<li><a href="<%=request.getContextPath()%>/UserInfo"><i
									class="icon-font">&#xe052;</i>用户管理</a>
							</li>
							<li><a  href="javascript:void(0)"  onclick="showAddMask('true');" ><i
									class="icon-font">&#xe006;</i>管理员管理</a>
							</li>
							
								 <li><a
								href="file.jsp"><i
									class="icon-font">&#xe052;</i>文件上传</a>
							</li>

                            <li><a
                                    href="<%=request.getContextPath()%>/site/SiteInfo"><i
                                    class="icon-font">&#xe033;</i>站点管理</a>
                            </li>
							 <%--<li><a--%>
								<%--href="<%=request.getContextPath()%>/support/SupportInfo"><i--%>
									<%--class="icon-font">&#xe033;</i>广告管理</a>--%>
							<%--</li> --%>
							
						
							
							
							
						</ul></li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="houtai/index.jsp">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="xinwenguanli">新闻管理</a><span class="crumb-step">&gt;</span><span>新增作品</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form action="insert" id="myform" name="myform">
                    <table class="insert-tab" width="100%">
                        <tbody><tr>
                            <th width="120"><i class="require-red">*</i>版块：</th>
                            <td>
                                <select name="type" class="required" id="type">
                                   <c:forEach items="${sessionScope.newstypelist1 }" var="i" varStatus="suoyin1">
                                    <option value="${i.ntid }">${i.ntname}</option></c:forEach>
                                    </select>
                            </td>
                        </tr>
                            <tr>
                                <th><i class="require-red">*</i>标题：</th>
                                <td>
                                    <input class="common-text required" id="title" name="title" size="50" value="" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th>作者：</th>
                                <td><input class="common-text" name="author" size="50"  type="text"></td>
                            </tr>
                        <tr>
                        <th width="120"><i class="require-red">*</i>类型：</th>
                        <td>
                            <select name="sourcetype">
                                <option selected="selected" value="图片新闻">图片新闻</option>
                                <option value="视频新闻">视频新闻</option>
                                <option  value="通用新闻">通用新闻</option>
                            </select>
                        </td>
                        </tr>

                        <%--<form action="<%=request.getContextPath()%>/uploadfiles"  method="post" enctype="multipart/form-data">--%>
                            <%--&lt;%&ndash;<td>nid:<input type="text" name="nid" style="height: 20px">  </td>&ndash;%&gt;--%>
                            <%--<td><input name="duofile" id="" type="file" multiple><input type="submit" value="上传"> </td></form>--%>
                        <%--<%--%>
                            <%--String url=(String)session.getAttribute("url");--%>
                            <%--if("".equals(url) || null==url){}--%>
                            <%--else{--%>
                        <%--%>--%>
                        <%--<h1>文件上传成功!</h1>--%>
                        <%--<%} %>--%>
                            <tr>
                                <th><i class="require-red">*</i>缩略图：</th>
                                 <td><input name="smallimg" id="" type="file"><input type="submit" onclick="submitForm('/jscss/admin/design/upload')" value="上传图片"/></td>
                              <!--   <form action="uploadfiles"  method="post" enctype="multipart/form-data">
                                <td><input name="duofile" id="" type="file" multiple><input type="submit" value="上传"> </td></form> -->
                            </tr>
                            <tr>
                                <th>内容：</th>
                                <td><textarea name="content" class="common-textarea" id="content" cols="30" style="width: 98%;" rows="10"></textarea></td>
                            </tr>
                            <tr><td><input type="checkbox" name="hot" id="hot" value="0" >热门</td>
                            </tr>
                            <tr><td><input type="checkbox" name="isreview" id="isreview" value="1" >评论</td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="button" onclick="quding()">
                                    <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>

    </div>
    <!--/main-->
</div>
	<div class="addMask" align="center">
		<div class="c" align="center">

			<div
				style="background-color:#173e65;height:20px;color:#fff;font-size:12px;padding-left:7px;">

				二级密码验证<font style="float:right;padding-right:10px;"
					onclick="showAddMask('false');">X</font>
			</div>
			<br> <br> <br>
			<form id="addForm" action="<%=path %>/manager/check" method="post"
				onsubmit="return check1();">
				二级密码：<input type="text" id="addPwd" name="managerPassword"
					style="width:120px" /> <br /> <br> <input type="submit"
					value="验证"
					style="background-color:#173e65;color:#ffffff;width:70px;" />
			</form>

		</div>
	</div>
</body>
</html>