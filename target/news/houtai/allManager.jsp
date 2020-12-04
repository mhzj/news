<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    pageContext.setAttribute("path", request.getContextPath());
%>

<!DOCTYPE HTML>
<html>
<head>
    <title>管理员管理</title>
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
            margin: 4px 23px 0px 23px;
            border-radius: 5px;
            display: block;
            background: #fff;
            margin: 10% auto;
        }

        .modifyMask, .addMask {
            /*   width: 400px;
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
        function showAddMask(flag) {
            if (flag == "true") {
                $(".addMask").css("display", "block");//让.addMask元素显示
            } else {
                $(".addMask").css("display", "none");//让.addMask隐藏
            }
        }


        function del(mid) {
            var msg = "您真的确定要删除吗？\n\n请确认！";
            if (confirm(msg) == true) {

                window.location.href = "<%=request.getContextPath()%>/manager/delManager?id=" + mid;
            }
            else {
                window.location.href = "<%=request.getContextPath()%>/manager/ManagerInfo";
            }

        }


        //页面上添加按钮的提交验证,通过就提交
        function check1() {
            if ($("#addName").val() == null || $("#addName").val() == "") {
                alert("管理员名不能为空！");
                return false;
            }
            if ($("#addPwd").val() == null || $("#addPwd").val() == "") {
                alert("密码不能为空！");
                return false;
            }
            return true;
        }


        //页面的"编辑"按钮点击事件
        function editManager(id, name, pwd) {
            $("#editManagerId").val(id);
            $("#editName").val(name);
            $("#editPassword").val(pwd);
            //显示弹出框
            $(".modifyMask").css("display", "block");
        }

        //"编辑"窗体关闭按钮事件
        function cancelEdit() {
            $(".modifyMask").css("display", "none");
        }
    </script>
</head>

<body>

<div class="container">

    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>MANAGER INFO</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <a class="btn btn-primary" onclick="showAddMask('true')">新增</a>
            <a class="btn btn-primary" href="${path}/manager/index">返回首页</a>
        </div>
    </div>
    <!-- 表格  -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>id</th>
                    <th>管理员</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list }" var="manager">
                    <tr>
                        <td>${manager.mid}</td>
                        <td>${manager.mname }</td>
                        <td>
                            <a type="button"
                               onclick="editManager('${manager.mid}','${manager.mname }','${manager.pwd }')"
                               class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑</a>
                            <a type="button"
                               onclick="del(${manager.mid})"
                               class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <hr style="height:1px;border:none;border-top:1px solid #ccc;"/>
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
                    <li><a href="${path}/manager/ManagerInfo?pn=1">首页</a>
                    </li>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li><a
                                href="${path}/manager/ManagerInfo?pn=${pageInfo.pageNum-1}"
                                aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${ page_Num}</a>
                            </li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li><a href="${path}/manager/ManagerInfo?pn=${ page_Num}">${
                                    page_Num}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage }">
                        <li><a
                                href="${path}/manager/ManagerInfo?pn=${pageInfo.pageNum+1}"
                                aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a>
                        </li>
                    </c:if>
                    <li><a
                            href="${path}/manager/ManagerInfo?pn=${pageInfo.pages}">末页</a>
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
        <form id="editForm" action="../manager/editManager" method="post"
              align="center">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓&nbsp;&nbsp;&nbsp;&nbsp;名: <input
                type="text" id="editName" name="editManagername"
                style="width:120px"/> <br/> <br> &nbsp;
            &nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="text"
                                                          id="editPassword" name="editPassword" style="width:120px"/>
            <br/>
            <br>
            管理员ID：<input type="text" id="editManagerId"
                         name="editManagerid" style="width:120px" readonly="readonly"/><br/>
            <br> <input type="submit" value="修改"
                        style="background-color:#173e65;color:#ffffff;width:70px;"/>
        </form>
    </div>

</div>

<div class="addMask" align="center">
    <div class="c" align="center">

        <div
                style="background-color:#173e65;height:20px;color:#fff;font-size:12px;padding-left:7px;">

            添加管理员<font style="float:right;padding-right:10px;"
                       onclick="showAddMask('false');">X</font>
        </div>
        <br> <br> <br>

        <form id="addForm" action="addManager" method="post"
              onsubmit="return check1();">
            管理员：<input type="text" id="addName" name="managerName"
                       style="width:120px"/> <br/> <br>
            密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="text" id="addPwd"
                                              name="managerPassword" style="width:120px"/> <br/> <br> <input
                type="submit" value="添加"
                style="background-color:#173e65;color:#ffffff;width:70px;"/>
        </form>

    </div>
</div>

</body>
</html>