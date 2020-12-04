<%@ page language="java" import="java.util.*,com.news.entity.User"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <%-- <base href="<%=basePath%>"> --%>
    <title>Home</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Mobile Specific Metas
      ================================================== -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">

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

        .line-ll {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            white-space: pre-wrap;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 4;
        }

        .login {
            margin-left: 210px;
            marin-top: -30px;
        }

        .copyright {
            display: inline-block;
            width: 100%;
            text-align: center;
            background: #528fce;
            padding: 8px 0px;
            color: #ffffff;
        }

        #footerBody {
            text-align: center;
            background: #f1f1f1;
            min-width: 500px;
            font-size: 14px;
            font-weight: normal;
            font-family: "宋体", Arial, Helvetica, sans-serif;
            padding-top: 15px;
            padding-bottom: 10px;
        }

    </style>
</head>
<body>
    <%
        if (session.getAttribute("newshotlist1") == null) {
            pageContext.forward("chushihuanewstype");
        }
    %>
    <!--------------Header--------------->
    <header>
        <div class="zerogrid">
        <div class="row">
            <div class="col05">
                <div id="logo">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/123.png"></div>
            </div>
            <div class="col06 offset05">

                <div id='search-box'>
                    <form action='searchByTitle1' method='post' name="search-form"
                          target='_top' id='search-form'>
                        <input id='search-text' name="title" placeholder='search here'
                               type='text'/>
                        <button id='search-button' type='submit' name="title">
                            <span>搜索</span>
                        </button>
                    </form>

                </div>
            </div>
        </div>
    </div>
            <%
                User loginUser = (User) request.getSession().getAttribute(
                        "loginUser");
                if (loginUser == null) {
            %>
            <a href="register.jsp" style="float:right;margin-right: 50px;margin-top: -5px"><font color="#FFFFFF">注册</font></a>
            <a href="login.jsp" style="float:right;margin-right: 50px;margin-top: -5px"><font color="#FFFFFF">用户登录</font></a>
            <%}
            else {
            %>
                <a href="loginout" style="float:right;margin-right: 50px;margin-top: -5px"><font color="#FFFFFF">注销</font></a>
                <a style="float:right;margin-right: 80px">
                    <a href="modifyUserInfo.jsp" style="color: white;float:right;margin-top: -5px">欢迎 ${loginUser.uname} 登录!&nbsp;&nbsp;</a>
                </a>
            <%
            }
            %>
    </header>
    <div class="dz"></div>
    <!--------------Navigation--------------->
    <nav>
        <ul>
            <li><a href="index.jsp">主页</a></li>
            <c:forEach items="${sessionScope.newstypelist }" var="i"
                       varStatus="suoyin1">
                <%-- <li><a href="pageHandler?type=${i.ntid }&" id="${i.ntid}">${i.ntname }</a></li> --%>
                <li>
                    <a href="NewsInfo?ntid=${i.ntid}" id="${i.ntid}">${i.ntname}</a>
                </li>
            </c:forEach>
        </ul>
    </nav>

    <!--------------Content--------------->
    <div align="center">
        <section id="content">
            <div class="zerogrid">
                <div class="row block">
                    <div class="featured col16">
                        <div class="rslides_container">
                            <ul class="rslides" id="slider">
                                <li>
                                    <a href="xinwenchushihua?flag=22"><img src="images/war.jpg"/></a>
                                </li>
                                <!-- 对应新闻id   22 -->
                                <li>
                                    <a href="xinwenchushihua?flag=39"><img src="images/James.jpg"/></a>
                                </li>
                                <!-- 对应新闻id   39 -->
                                <li>
                                    <a href="xinwenchushihua?flag=48"><img src="images/ofo.jpg"/></a>
                                </li>
                                <!-- 对应新闻id   48 -->
                                <li>
                                    <a href="xinwenchushihua?flag=42"><img src="images/liyanhong.jpg"/></a>
                                </li>
                                <!-- 对应新闻id   42 -->
                            </ul>
                        </div>
                    </div>
                    <div class="sidebar col05">
                        <section>
                            <div class="heading">热点新闻</div>
                            <div class="content">
                                <ul class="list">
                                    <c:forEach items="${sessionScope.newshotlistx }" var="i"
                                               varStatus="suoyin1" end="2">
                                        <li><a href="xinwenchushihua?flag=${i.nid }"
                                               id="redian${i}" name="redian${i}">${i.title}</a>
                                        </li>
                                    </c:forEach>
                                    <div class="footer">
                                        <p class="more" align="right">
                                            <a class="button" href="#">more >></a>
                                        </p>
                                    </div>
                                </ul>
                            </div>
                        </section>
                        <section> <!-- <div class="heading"><a href="pageHandler.jsp">政治</a></div> -->
                            <div class="heading">政治</div>
                            <div class="content">
                                <ul class="list">
                                    <c:forEach items="${sessionScope.newszhenzhihotlist }" var="i"
                                               varStatus="suoyin1" end="2">
                                        <li><a href="xinwenchushihua?flag=${i.nid }"
                                               id="zhenzhi${i}" name="zhenzhi${i}">${i.title}</a>
                                        </li>
                                    </c:forEach>
                                    <div class="footer">
                                        <p class="more" align="right">
                                            <a class="button" href="NewsInfo?ntid=1">more >></a>
                                        </p>
                                    </div>
                                </ul>
                            </div>
                        </section>
                        <section>
                            <div class="heading">军事</div>
                            <div class="content">
                                <ul class="list">
                                    <c:forEach items="${sessionScope.newsjunshihotlist }" var="i"
                                               varStatus="suoyin1" end="2">
                                        <li><a href="xinwenchushihua?flag=${i.nid }"
                                               id="junshi${i}" name="junshi${i}">${i.title}</a>
                                        </li>
                                    </c:forEach>
                                    <div class="footer">
                                        <p class="more" align="right">
                                            <a class="button" href="NewsInfo?ntid=2">more >></a>
                                        </p>
                                    </div>
                                </ul>
                            </div>
                        </section>
                        <section>
                            <div class="heading">体育</div>
                            <div class="content">
                                <ul class="list">
                                    <c:forEach items="${sessionScope.newstiyuhotlist }" var="i"
                                               varStatus="suoyin1" end="2">
                                        <li><a href="xinwenchushihua?flag=${i.nid }" id="tiyu${i}"
                                               name="tiyu${i}">${i.title}</a>
                                        </li>
                                    </c:forEach>
                                    <div class="footer">
                                        <p class="more" align="right">
                                            <a class="button" href="NewsInfo?ntid=3">more >></a>
                                        </p>
                                    </div>
                                </ul>
                            </div>
                        </section>
                        <section>
                            <div class="heading">娱乐</div>
                            <div class="content">
                                <ul class="list">
                                    <c:forEach items="${sessionScope.newsyulehotlist }" var="i"
                                               varStatus="suoyin1" end="2">
                                        <li><a href="xinwenchushihua?flag=${i.nid }" id="yule${i}"
                                               name="yule${i}">${i.title}</a>
                                        </li>
                                    </c:forEach>
                                    <div class="footer">
                                        <p class="more" align="right">
                                            <a class="button" href="NewsInfo?ntid=4">more >></a>
                                        </p>
                                    </div>
                                </ul>
                            </div>
                        </section>
                    </div>

                    <div class="main-content col11">
                        <c:forEach items="${sessionScope.newshotlist1}" var="p"
                                   varStatus="suoyin2" end="4">
                            <article>
                                <div class="heading">
                                    <h2 id="titl${p}">${p.title }</h2>
                                    <p class="info" id="xiaobiao${p }">
                                            ${p.author } /&nbsp;&nbsp;
                                        <fmt:formatDate value="${p.ntime }" pattern="yyyy-MM-dd"/>
                                    </p>
                                </div>
                                <div class="content">
                                    <c:if test="${sessionScope.size1>0}">
                                        <c:forEach items="${sessionScope.slist}" var="z" varStatus="suoyin3">
                                            <c:if test="${z.nid==p.nid }">
                                            <c:if test="${z.type==1}">
                                                <img src="${z.src }" id="tu${suoyin2.index+1 }" width="70 px" style="border:1px;" /></c:if>
                                            </c:if></c:forEach>
                                    </c:if><p id="neirong${p }" class="line-ll">&nbsp;&nbsp;&nbsp;&nbsp;${p.ntext}...</p>
                                </div>
                                <div class="footer">
                                    <p class="more">
                                        <br>
                                        <a class="button" href="xinwenchushihua?flag=${p.nid }">
                                            more >></a><br>
                                        <br>
                                    </p>
                                </div>
                            </article>
                            <br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
    </div>
<!--------------Footer--------------->
<footer id="footerBody">
    <div align="center">友情链接:
        <c:forEach items="${sessionScope.zhandian }" var="i" varStatus="suoyin1" end="10">
            <a href="${i.surl }" target="_blank">&nbsp;&nbsp;${i.sname }&nbsp;&nbsp;</a>
        </c:forEach>
    </div>
</footer>

<div id="copyright" align="center" class="copyright">
    <p>24小时客户服务热线：4006900000 010-82623378 常见问题解答 互联网违法和不良信息举报</p>
    <p>违法和不良信息举报电话：010-62675637 举报邮箱：jubao@vip.sina.com</p>
    <p>Copyright © 1996-2018 SINA Corporation, All Rights Reserved <a href="toHoutai">admin</a></p>
</div>

</body>
</html>