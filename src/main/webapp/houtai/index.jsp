<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <%--     <base href="<%=basePath%>"> --%>
    <title>系统后台管理</title>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>css/common.css"/>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css"/>
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
            if (flag == 'true') {
                $(".addMask").css("display", "block");//让.addMask元素显示
            } else {
                $(".addMask").css("display", "none");//让.addMask隐藏
            }
        }

    </script>

</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <%--<h1 class="topbar-logo none">
                <a href="index.html" class="navbar-brand">后台管理</a>
            </h1>
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
                        <li><a href="javascript:void(0)" onclick="showAddMask('true');"><i
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
                        <%--</li>--%>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
                <i class="icon-font">&#xe06b;</i><span>欢迎进入后台管理页面。</span>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>快捷操作</h1>
            </div>
            <div class="result-content">
                <div class="short-wrap">
                    <a href="insert.jsp"><i class="icon-font">&#xe001;</i>新增新闻</a> <a
                        href="xinzenfenlie.jsp"><i class="icon-font">&#xe048;</i>新增新闻分类</a>
                </div>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>系统基本信息</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li><label class="res-lab">操作系统</label><span class="res-info">WIN7 | 10</span>
                    </li>
                    <li><label class="res-lab">运行环境</label><span class="res-info">Apache/8.5.29
								(Win64) </span></li>
                    <li><label class="res-lab">运行方式</label><span
                            class="res-info">apache Tomcat</span></li>
                    <li><label class="res-lab">版本</label><span
                            class="res-info">V3.0</span></li>
                    <li><label class="res-lab">上传附件限制</label><span
                            class="res-info">200M</span></li>
                    <li><label class="res-lab">北京时间</label><span class="res-info">2019年6月</span></li>
                    <li><label class="res-lab">服务器域名/IP</label><span
                            class="res-info">localhost [ 127.0.0.1 ]</span></li>
                    <li><label class="res-lab">Host</label><span class="res-info">127.0.0.1</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
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
                        style="width:120px"/> <br/> <br> <input type="submit"
                                                                value="验证"
                                                                style="background-color:#173e65;color:#ffffff;width:70px;"/>
        </form>

    </div>
</div>
</body>
</html>