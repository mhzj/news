<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
function queding() {
		if (window.confirm("你确定提交新建吗？")) {
		var tpname= document.getElementById("tpname").value
		window.location.href="<%=request.getContextPath()%>/insertnt?tpname="+tpname;
		}
	}
</script>
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
  <!--  <base href="<%=basePath%>">-->
<title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css"/>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="index.jsp">首页</a></li>
                <li><a href="#" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="#">管理员</a></li>
                <li><a href="#">修改密码</a></li>
                <li><a href="#">退出</a></li>
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
                    <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="<%=request.getContextPath()%>/xinwenguanli"><i class="icon-font">&#xe008;</i>新闻管理</a></li>
                        <li><a href="<%=request.getContextPath()%>/tpchshihua?flag=1"><i class="icon-font">&#xe006;</i>分类管理</a></li>
                         <li><a href="<%=request.getContextPath()%>/UserInfo"><i class="icon-font">&#xe008;</i>用户管理</a></li>
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
            <div class="crumb-list"><i class="icon-font"></i><a href="index.jsp">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="<%=request.getContextPath()%>/tpchshihua?flag=1">分类管理</a><span class="crumb-step">&gt;</span><span>新增分类</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
              <form action="insertnt" method="post" id="myform" name="myform">
            </form>
          </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post" action="insertnt">
                <div class="result-title">
                    <div class="result-list"></div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                          <th width="19%">分类名称</th>
                          <th width="15%">确定</th>
                          <th width="15%">清空</th>
                          <th width="15%">取消</th>
                      </tr>
                        <tr>
                            <td >
                            <input type="text" name="tpname" id="tpname"></td>
                          <td><input onclick="queding()" type="button" name="quedin" id="quedin" value="确定"></td>
                           <td><input type="reset" name="qingkong" id="qingkong" value="清空"></td>
                           <td><input type="button" onClick="history.go(-1)" name="qvxiao2" id="qvxiao2"  value="返回"></td>
                        </tr>
                    </table>
                    <div class="list-page"></div>
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