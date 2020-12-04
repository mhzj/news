<%--
<%@ page language="java" import="java.util.*,com.news.entity.User" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    &lt;%&ndash;  <base href="<%=basePath%>"> &ndash;%&gt;
    <title>xinwenname</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="css/zerogrid.css">
    <link rel="stylesheet" href="css/style1.css">
    <link rel="stylesheet" href="css/responsiveslides.css"/>
    <link rel="stylesheet" href="css/responsive.css">

    <link href='./images/favicon.ico' rel='icon' type='image/x-icon'/>

    <script src="js/jquery.min.js"></script>
    <script src="js/responsiveslides.js"></script>
    <script>
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                pager: true,
                nav: true,
                speed: 500,
                maxwidth: 960,
                namespace: "centered-btns"
            });
        });
    </script>

    <style type="text/css">

        .STYLE1 {
            color: #0000FF
        }

        .STYLE3 {
            color: #FFFFFF;
            font-size: xx-large;
        }

        .STYLE6 {
            color: #000000
        }

        .STYLE7 {
            font-size: large;
            font-style: normal;
            color: #3b3b3b;
        }

        .beijing {
            background: #f6f6f6;
        }


        .content {
            height: 1500px;
        }

        .other {
            margin-top: 100px;

        }

        .review {
            margin-top: 50px;
        }

        .button1 {
            background-color: #555555; /* Green */
            border: none;
            color: white;
            padding: 10px 22px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 8px;
        }


    </style>
</head>
<body>

<%
    if (session.getAttribute("newsxinxi") == null) {
        pageContext.forward("xinwenchushihua");
    }%>
<!--------------Header--------------->
<div class="beijing">
    <header>
        <div class="zerogrid">
            <div class="row">
                <div class="col05">
                    <div id="logo"></div>
                </div>
                <div class="col06 offset05">
                    <div id='search-box'>
                        <form action='searchByTitle1' method='post' name="search-form" target='_top' id='search-form'>
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
        <a href="login.jsp" style="float:right;margin-right: 50px"><font color="#FFFFFF">用户登录|注册</font></a>


        <%} else { %>

        <a href="loginout" style="float:right;margin-right: 80px"><font color="#FFFFFF">注销</font></a>
        <a style="float:right;margin-right: 80px"><font color="#FFFFFF">欢迎${loginUser.uname }登录!</font></a>
        <%} %>

    </header>
    <div class="dz">

    </div>
    <!--------------Navigation--------------->

    <nav>
        <ul>
            <li><a href="index.jsp">主页</a></li>
            <c:forEach items="${sessionScope.newstypelist }" var="i"
                       varStatus="suoyin1">
                &lt;%&ndash; <li><a href="pageHandler?type=${i.ntid }&" id="${i.ntid}">${i.ntname }</a></li> &ndash;%&gt;
                <li><a href="NewsInfo?ntid=${i.ntid}" id="${i.ntid}">${i.ntname
                        }</a>
                </li>
            </c:forEach>
        </ul>
    </nav>


    <!--------------Content--------------->

    <div id="wen" align="center" class="content">
        <table width="70%">
            <tr align="center">
                <td>
                    <div class="STYLE3 STYLE6" id="titl">${sessionScope.newsxinxi.title }</div>
                </td>
            </tr>
            <tr align="center">
                <td>
                    <div class="STYLE6" id="zuozheshijian">${sessionScope.newsxinxi.author } <fmt:formatDate
                            value="${sessionScope.newsxinxi.ntime }" pattern="yyyy-MM-dd"/></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div align="left" class="STYLE6" id="neirong">
                        &nbsp;&nbsp;&nbsp;
                        <em>&nbsp;<span class="STYLE7">${sessionScope.newsxinxi.ntext }</span></em>
                        <c:if test="${sessionScope.size1>0}">
                            <c:forEach items="${sessionScope.slist}" var="z" varStatus="suoyin3">
                                <c:if test="${z.nid==sessionScope.newsxinxi.nid }">
                                    <div align="center">
                                        <img src="${z.src }" id="tu${suoyin2.index+1 }"/><br></div>
                                </c:if></c:forEach></c:if></div>
                </td>
            </tr>
        </table>
        <c:if test="${sessionScope.newsxinxi.isreview==1 }">
            <div id="pinglun" align="center" class="review">
                <table width="70%" border="1" style="border-collapse:separate; border-spacing:0px 10px;">
                    <h1><font color="#FF0000" style="font-size:19px;">热门评论</font></h1>
                    <tr>
                        <td width="17%"><span class="STYLE6">发布人</span></td>
                        <td width="58%"><span class="STYLE6">内容</span></td>
                        <td width="25%"><span class="STYLE6">时间</span></td>
                    </tr>
                    <div id="lishi">
                        <c:forEach items="${sessionScope.reviewlist }" var="i" varStatus="suoyin1">
                            <tr>
                                <td><span class="STYLE6">${i.uname }</span></td>
                                <td><span class="STYLE6">${i.rtext }</span></td>
                                <td><span class="STYLE6"><fmt:formatDate value="${i.rtime }"
                                                                         pattern="yyyy-MM-dd"/></span></td>
                            </tr>
                        </c:forEach></div>
                </table>
                <br>
                <div align="center">
                    <form id="pl" name="pl" method="post" action="tijisopinglun">
                        <input name="plxx" type="text" style="line-height: 24px;width:240px;"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="hidden" name="newid" value="${sessionScope.newsxinxi.nid }">
                        &nbsp;&nbsp;&nbsp;<input name="tijiao" type="submit" class="button1" id="tijiao" value="提交评论"/>
                    </form>
                </div>
            </div>
        </c:if>
        </section>
        <div align="center" class="other">
            <table align="center" width="70%" style="border-collapse:separate; border-spacing:0px 10px;">
                <tr>
                    <td><span class="STYLE6" style="font-size: 19px;">其他新闻</span></td>
                </tr>
                <c:forEach items="${sessionScope.tuijie }" var="i" varStatus="suoyin1" end="3">
                <tr>
                    <td><a href="xinwenchushihua?flag=${i.nid}" class="STYLE6" style="color: blue">${i.title}</a>
                </tr>
                </c:forEach>
        </div>
        </table>

    </div>
</div>
<!--------------Footer--------------->

</div>
</body>
</html>--%>


<%@ page language="java" import="java.util.*,com.news.entity.User" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <%--  <base href="<%=basePath%>"> --%>
    <title>xinwenname</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="css/zerogrid.css">
    <link rel="stylesheet" href="css/style1.css">
    <link rel="stylesheet" href="css/responsiveslides.css"/>
    <link rel="stylesheet" href="css/responsive.css">

    <link href='./images/favicon.ico' rel='icon' type='image/x-icon'/>

    <script src="js/jquery.min.js"></script>
    <script src="js/responsiveslides.js"></script>
    <script>
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                pager: true,
                nav: true,
                speed: 500,
                maxwidth: 960,
                namespace: "centered-btns"
            });
        });
    </script>

    <style type="text/css">

        .STYLE1 {
            color: #0000FF
        }

        .STYLE3 {
            color: #FFFFFF;
            font-size: xx-large;
        }

        .STYLE6 {
            color: #000000
        }

        .STYLE7 {
            font-size: 15px;
            font-style: normal;
            font-family: "Microsoft YaHei", Helvetica, Arial, sans-serif;
            /*color: #3b3b3b;*/
            color: #000000;
        }


        .content {
            height: 100%;
            width: 100%;
            /*height: 100%;*/
        }

        .other {
            margin-top: 100px;

        }

        .review {
            margin-top: 50px;
        }

        .button1 {
            background-color: #528fce; /* Green */
            border: none;
            color: white;
            padding: 6px 18px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 12px;
        }

        nav{
            margin-bottom: 50px;
        }
    </style>
</head>
<body>

<%
    if (session.getAttribute("newsxinxi") == null) {
        pageContext.forward("xinwenchushihua");
    }%>
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
                        <form action='searchByTitle1' method='post' name="search-form" target='_top' id='search-form'>
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
        <a href="register.jsp" style="float:right;margin-right: 50px;margin-top: -5px"><font
                color="#FFFFFF">注册</font></a>
        <a href="login.jsp" style="float:right;margin-right: 50px;margin-top: -5px"><font
                color="#FFFFFF">用户登录</font></a>


        <%} else { %>

        <a href="loginout" style="float:right;margin-right: 50px;margin-top: -5px"><font color="#FFFFFF">注销</font></a>
        <a style="float:right;margin-right: 50px;margin-top: -5px"><font color="#FFFFFF">欢迎${loginUser.uname }登录!</font></a>
        <%} %>

    </header>
    <div class="dz">

    </div>
    <!--------------Navigation--------------->

    <nav>
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


    <!--------------Content--------------->

    <div id="wen" align="center" class="content">
        <table width="70%">
            <tr align="center">
                <td>
                    <div class="STYLE3 STYLE6" id="titl">${sessionScope.newsxinxi.title }</div>
                </td>
            </tr>
            <tr align="center">
                <td>
                    <div class="STYLE6" id="zuozheshijian">${sessionScope.newsxinxi.author } <fmt:formatDate
                            value="${sessionScope.newsxinxi.ntime }" pattern="yyyy-MM-dd"/></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div align="left" class="STYLE6" id="neirong">
                        &nbsp;&nbsp;&nbsp;
                        <em>&nbsp;<span class="STYLE7">${sessionScope.newsxinxi.ntext }</span></em>
                        <c:if test="${sessionScope.size1>0}">
                            <c:forEach items="${sessionScope.slist}" var="z" varStatus="suoyin3">
                                <c:if test="${z.nid==sessionScope.newsxinxi.nid }">
                                    <div align="center">
                                        <video src="${z.src }" height="440" width="680" controls="controls" /><br></div>
                                </c:if></c:forEach></c:if></div>

                </td>
            </tr>
        </table>
        <c:if test="${sessionScope.newsxinxi.isreview==1 }">
            <div id="pinglun" align="center" class="review">
                <table width="70%" border="1" style="border-collapse:separate; border-spacing:0px 10px;">
                    <h1><font color="#FF0000" style="font-size:19px;">热门评论</font></h1>
                    <tr>
                        <td width="17%"><span class="STYLE6">发布人</span></td>
                        <td width="58%"><span class="STYLE6">内容</span></td>
                        <td width="25%"><span class="STYLE6">时间</span></td>
                    </tr>
                    <div id="lishi">
                        <c:forEach items="${sessionScope.reviewlist }" var="i" varStatus="suoyin1">
                            <tr>
                                <td><span class="STYLE6">${i.uname }</span></td>
                                <td><span class="STYLE6">${i.rtext }</span></td>
                                <td><span class="STYLE6"><fmt:formatDate value="${i.rtime }"
                                                                         pattern="yyyy-MM-dd"/></span></td>
                            </tr>
                        </c:forEach></div>
                </table>
                <br>
                <div align="center">
                    <form id="pl" name="pl" method="post" action="tijisopinglun">
                        <input name="plxx" type="text" style="line-height: 24px;width:240px;border: 3px solid #528fce;"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="hidden" name="newid" value="${sessionScope.newsxinxi.nid }">
                        &nbsp;&nbsp;&nbsp;<input name="tijiao" type="submit" class="button1" id="tijiao" value="提交评论"/>
                    </form>
                </div>
            </div>
        </c:if>
        </section>
        <div align="center" class="other">
            <table align="center" width="70%" style="border-collapse:separate; border-spacing:0px 10px;">
                <tr>
                    <td><span class="STYLE6" style="font-size: 19px;">其他新闻</span></td>
                </tr>
                <c:forEach items="${sessionScope.tuijie }" var="i" varStatus="suoyin1" end="3">
                <tr>
                    <td><a href="xinwenchushihua?flag=${i.nid}" class="STYLE6" style="color: blue">${i.title}</a>
                </tr>
                </c:forEach>
        </div>
        </table>
        <br>
        <br>
        <br>
        <br>
    </div>
</div>
<!--------------Footer--------------->

</div>
</body>
</html>