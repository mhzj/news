<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.news.entity.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    pageContext.setAttribute("path", request.getContextPath());
%>

<!DOCTYPE HTML>
<html>
<head>
    <title>新闻概览</title>
    <link href="${path}/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="css/zerogrid.css">
    <link rel="stylesheet" href="css/style1.css">
    <link rel="stylesheet" href="css/responsiveslides.css"/>
    <link rel="stylesheet" href="css/responsive.css">

    <script type="text/javascript" src="${path}/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${path}/js/bootstrap.min.js"></script>
    <style type="text/css">
        a {
            text-decoration: none;
            color: black;
            /*font-size: 18px;*/
            font-family: 微软雅黑;
        }

        a:hover {
            color: blue;
            /*font-size: 19px;*/
        }

        #searchNav{
            background: #FFFFFF;
            border: #FFFFFF;
        }

        nav ul li a{
            margin-top: -16px;
        }
    </style>
</head>

<body>
<%
    String ntid = request.getParameter("ntid");
%>
<!--------------Header--------------->
<div class="beijing">
    <header>
        <div class="zerogrid">
            <div class="row">
                <div class="col05">
                    <div id="logo">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/123.png"></div>
                </div>
                <div class="col06 offset05">
                    <div id='search-box'>
                        <form action='searchByTitle1' method='post' name="search-form" target='_top' id='search-form' style="height: 30px">
                            <input id='search-text' name="title" placeholder='search here' type='text'/>
                            <button id='search-button' type='submit' name="title"><span>搜索</span></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%
            User loginUser = (User) request.getSession().getAttribute("loginUser");
            if (loginUser == null) {
        %>
        <a href="register.jsp" style="float:right;margin-right: 50px;margin-top: -8px"><font
                color="#FFFFFF">注册</font></a>
        <a href="login.jsp" style="float:right;margin-right: 50px;margin-top: -8px"><font
                color="#FFFFFF">用户登录</font></a>


        <%} else { %>

        <a href="loginout" style="float:right;margin-right: 50px;margin-top: -5px"><font color="#FFFFFF">注销</font></a>
        <a style="float:right;margin-right: 50px;margin-top: -5px"><font color="#FFFFFF">欢迎${loginUser.uname }登录!</font></a>
        <%} %>

    </header>
    <div class="dz">

    </div>
    <!--------------Navigation--------------->

    <nav style="height: 37px">
        <ul>
            <li><a href="index.jsp">主页</a></li>
            <c:forEach items="${sessionScope.newstypelist }" var="i"
                       varStatus="suoyin1">
                <%-- <li><a href="pageHandler?type=${i.ntid }&" id="${i.ntid}">${i.ntname }</a></li> --%>
                <li><a href="NewsInfo?ntid=${i.ntid}" id="${i.ntid}">${i.ntname
                        }</a>
                </li>
            </c:forEach>
        </ul>
    </nav>
</div>

<div class="container">

    <!-- 标题 -->
    <%--<div class="row">
        <div class="col-md-12">
            <h1>NEWS SCAN</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <a class="btn btn-primary" href="home">返回首页</a>
        </div>
    </div>--%>
    <!-- 表格  -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <%--<tr>
                    &lt;%&ndash;<th>编号</th>
                    <th>作者</th>&ndash;%&gt;
                    <th>标题</th>
                </tr>--%>
                <c:forEach items="${pageInfo.list }" var="news">
                    <tr>
                        <%--<td>${news.nid}</td>
                        <td>${news.author}</td>--%>
                        <td><a a href="xinwenchushihua?flag=${news.nid}">${news.title }</a></td>
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
            <nav aria-label="Page navigation" id="searchNav">
                <ul class="pagination">
                    <li><a href="${path}/NewsInfo?pn=1&ntid='<%=ntid%>'">首页</a>
                    </li>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li><a
                                href="${path}/NewsInfo?pn=${pageInfo.pageNum-1}&ntid='<%=ntid%>'"
                                aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${ page_Num}</a>
                            </li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li><a href="${path}/NewsInfo?pn=${ page_Num}&ntid='<%=ntid%>'">${
                                    page_Num}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage }">
                        <li><a
                                href="${path}/NewsInfo?pn=${pageInfo.pageNum+1}&ntid='<%=ntid%>'"
                                aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a>
                        </li>
                    </c:if>
                    <li><a
                            href="${path}/NewsInfo?pn=${pageInfo.pages}&ntid='<%=ntid%>'">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>