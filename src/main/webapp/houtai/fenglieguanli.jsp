<%@ page language="java" import="java.util.*,javax.swing.JOptionPane" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css" />
<style>
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
  <head><script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
function xuigai(num) {
		if (window.confirm("你确定要修改吗？")) {
		document.getElementById("tpname"+num).disabled=false;
		document.getElementById("que"+num).disabled=false;
		document.getElementById("qv"+num).disabled=false;
		document.getElementById("gai"+num).disabled=true;
		document.getElementById("shan"+num).disabled=true;
		}
	}
function qvxiao() {
			window.location.href="<%=request.getContextPath()%>/tpchshihua?flag=1";
	}
function queding(ntid,num) {
		if (window.confirm("你确定提交修改吗？")) {
		//document.getElementById("f1").submit();
		var ntname= document.getElementById("tpname"+num).value;
		window.location.href="<%=request.getContextPath()%>/gaitp?id="+ntid+"&tpname="+ntname;
		}
	}
	function dell(ntid) {
		if (window.confirm("你确定删除该类吗？")) {
		window.location.href="<%=request.getContextPath()%>/delnt?ntid="+ntid;
		}
	}
</script>
  <!--   <base href="<%=basePath%>"> -->
<title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css"/>
</head>
<body>
<%
	if(session.getAttribute("ntp")==null){
	pageContext.forward("../tpchshihua");
	}%>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <%--<h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="<%=path%>/houtai/index.jsp">首页</a>
                </li>
                <li><a href="<%=path%>/index.jsp" target="_blank">网站首页</a>
                </li>
            </ul>--%>
            <p>江西联微内容管理系统</p>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="<%=path%>/index.jsp" target="_blank">网站首页</a>
                </li>
                <li><a href="javascript:void(0)" onclick="showAddMask('true');">
                    管理员</a>
                </li>

                <li><a href="<%=path%>/houtai/admin_login.jsp">退出</a>
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
						
							 <%--<li><a
								href="<%=request.getContextPath()%>/support/SupportInfo"><i
									class="icon-font">&#xe033;</i>广告管理</a>
							</li> --%>
                            <li><a
                                    href="<%=request.getContextPath()%>/site/SiteInfo"><i
                                    class="icon-font">&#xe033;</i>站点管理</a>
                            </li>
						
							
							
							
						</ul></li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="index.jsp">首页</a><span class="crumb-step">&gt;</span>分类管理</div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
              <form action="#" method="post">
            </form>
          </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <a href="xinzenfenlie.jsp"><i class="icon-font"></i>增加分类</a>
                        <a id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th class="tc" width="16%"><input class="allChoose" name="" type="checkbox"></th>
                          <th width="15%">ID</th>
                          <th width="19%">分类名称</th>
                          <th width="15%">修改/删除</th>
                          <th width="15%">确定修改</th>
                      </tr>
                      <c:forEach items="${sessionScope.ntp }" var="i" varStatus="suoyin1">
                            <tr> 
                            <td class="tc"><input name="id[]" value="" type="checkbox"></td>
                            <!-- <td>
                                <input class="common-input sort-input" name="ord[]" value="0" type="text">
                                </td> -->
                            <td  id="id${suoyin1.index+1 }">${i.ntid}</td>
                            <td ><div id="ntpname">
                            <input type="text" name="tpname${suoyin1.index+1}" id="tpname${suoyin1.index+1}" value="${i.ntname }" disabled></div></td>
                          <td>
                                <a class="link-update" onclick="xuigai(${suoyin1.index+1})" name="gai${suoyin1.index+1}" id="gai${suoyin1.index+1}">修改</a>
                                <a class="link-del" onclick="dell(${i.ntid})" name="shan${suoyin1.index+1}" id="shan${suoyin1.index+1}">删除</a></td>
                           <td><input type="button" onclick="queding(${i.ntid},${suoyin1.index+1})" disabled value="确定" name="que${suoyin1.index+1}" id="que${suoyin1.index+1}" >
                           	   <input type="button" onclick="qvxiao()" disabled value="取消" name="qv${suoyin1.index+1}" id="qv${suoyin1.index+1}" ></td>
                         </tr>
                       </c:forEach>
                    </table>
                    <div class="list-page"> </div>
                </div>
            </form>
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