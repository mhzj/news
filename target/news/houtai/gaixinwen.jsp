<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head><script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
function quding() {
		if (window.confirm("你确定要修改新闻信息吗？")) {
			myform.submit();//提交表单
		}
	}
	function del(rid,nid){
		if (window.confirm("你确定要删除该条评论吗？")) {
			window.location.href="<%=request.getContextPath()%>/delre?rid="+rid+"&flag="+nid;
		}
	}
	function fan(){
	window.location.href="<%=request.getContextPath()%>/xinwenguanli";
	}
</script>
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

    <base href="<%=basePath%>">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>
<body>

<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
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
                <li>
                    <a href="yeswes"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                       <li><a href="xinwenguanli"><i class="icon-font">&#xe008;</i>新闻管理</a></li>
                        <li><a href="tpchshihua?flag=1"><i class="icon-font">&#xe006;</i>分类管理</a></li>
                         <li><a href="UserInfo"><i class="icon-font">&#xe008;</i>用户管理</a></li>
                       <li><a  href="javascript:void(0)"  onclick="showAddMask('true');" ><i
									class="icon-font">&#xe008;</i>管理员管理</a>
							</li>
                	 <li><a
								href="file.jsp"><i
									class="icon-font">&#xe033;</i>文件上传</a>
							</li> 
                       	 <li><a
								href="<%=request.getContextPath()%>/support/SupportInfo"><i
									class="icon-font">&#xe033;</i>广告管理</a>
							</li> 
                    </ul>
              </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="houtai/index.jsp">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="xinwenguanli">新闻管理</a><span class="crumb-step">&gt;</span><span>修改作品信息</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form action="yeswes?nid=${sessionScope.gainews.nid }" method="post" id="myform" name="myform">
                    <table class="insert-tab" width="100%">
                        <tr>
                            <th width="120"><i class="require-red">*</i>版块：</th>
                            <td>
                                <select name="typeid" class="required" id="typeid">
                                <option value="${sessionScope.gainews.ntid}">
                                <c:forEach items="${sessionScope.newstypelist2 }" var="pt" varStatus="suoyin2" >
                             <c:if  test="${pt.ntid ==sessionScope.gainews.ntid }">${pt.ntname}</c:if></c:forEach></option>
                               	<c:forEach items="${sessionScope.newstypelist1 }" var="i" varStatus="suoyin1">
                               	<c:if test="${i.ntid!=sessionScope.gainews.ntid }">
                                    <option value="${i.ntid }">${i.ntname}</option></c:if>
                                    </c:forEach>
                                    </select>
                            </td>
                        </tr>
                            <tr>
                                <th><i class="require-red">*</i>标题：</th>
                                <td>
                                    <input class="common-text required" id="title" name="title" size="50" value="${sessionScope.gainews.title}" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th>作者：</th>
                                <td><input class="common-text" name="author" size="50" value="${sessionScope.gainews.author}" type="text"></td>
                            </tr>
                            <tr>
                             <th width="120"><i class="require-red">*</i>分类：</th>
                             <td>
                            <select name="sourcetype" class="required" id="sourcetype">
                                <option selected="selected"  value="${sessionScope.gainews.sourcetype}">${sessionScope.gainews.sourcetype}</option>
                                <option value="图片新闻">图片新闻</option>
                                <option value="视频新闻">视频新闻</option>
                                <option  value="通用新闻">通用新闻</option>
                                <%--<option value="${sessionScope.gainews.sourcetype}">--%>
                                <%--<c:forEach items="${sessionScope.newslist }" var="pt" varStatus="suoyin2" >--%>
                                    <%--<c:if  test="${pt.sourcetype!=sessionScope.gainews.sourcetype }">${pt.sourcetype}</c:if></c:forEach></option>--%>


                                <%--<c:forEach items="${sessionScope.newslist}" var="i" varStatus="suoyin1">--%>
                                    <%--<option value="${i.sourcetype }">${i.sourcetype}</option>--%>
                            <%--</c:forEach>--%>
                            </select>
                             <td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>缩略图：</th>
                                <td><input name="smallimg" id="" type="file"><!--<input type="submit" onclick="submitForm('/jscss/admin/design/upload')" value="上传图片"/>--></td>
                            </tr>
                            <tr>
                                <th>内容：</th>
                                <td><textarea name="content" class="common-textarea" id="content" cols="30" style="width: 98%;" rows="10">${sessionScope.gainews.ntext}</textarea></td>
                            </tr>
                            <tr><td><input type="checkbox" name="hot" id="hot" value="0" <c:if test="${sessionScope.gainews.hot==0}">checked</c:if>>热门</td>
                            </tr>
                            <tr><td><input type="checkbox" name="isreview" id="isreview" value="1" <c:if test="${sessionScope.gainews.isreview==1}">checked</c:if>>评论</td>
                            </tr>
                            <tr>
                                <td>
                                
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="button" onclick="quding()">
                                    <input class="btn btn6" onClick="fan()" value="返回" type="button">
                                </td>
                            </tr>   
                        </table>
                </form>
                <c:if test="${sessionScope.gainews.isreview==1}"><table>
                <tr>
   	 			<td width="17%">发布人</td>
   				 <td width="40%">内容</td>
   				 <td width="25%">时间</td>
   				 <td width="20">操作</td>
 			</tr>
 			<c:forEach items="${sessionScope.pinglun }" var="i" varStatus="suoyin1">
    			<tr><td>${i.uname }</td>
    			<td>${i.rtext }</td>
   				 <td><fmt:formatDate value="${i.rtime }" pattern="yyyy-MM-dd" /></td>
   				 <td><input type="button" onclick="del(${i.rid},${sessionScope.gainews.nid})" value="删除">
   				  </td>
 			 </tr></c:forEach>
                </table></c:if>
                
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