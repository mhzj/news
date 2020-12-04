<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <base href="<%=basePath%>">
	<title>Home</title>
	<meta name="description" content="">
	<meta name="author" content="">
	
    <!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <!-- CSS
  ================================================== -->
	<link rel="stylesheet" href="css/zerogrid.css">
	<link rel="stylesheet" href="css/style1.css">
	<link rel="stylesheet" href="css/responsiveslides.css" />
	<link rel="stylesheet" href="css/responsive.css">
	
	<!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
		<script src="js/html5.js"></script>
		<script src="js/css3-mediaqueries.js"></script>
	<![endif]-->
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
<!--
.STYLE1 {
	color: #0000FF
}

.line-ll{
	overflow:hidden;
	text-overflow:ellipsis;
	display:-webkit-box;
	white-space:per-wrap;
	-webkit-box-orient:vertical;
	-webkit-line-clamp:4;
	
}-->
    </style>
</head>
<body>
<%
	if(session.getAttribute("newstypelist")==null){
	pageContext.forward("chushihuanewstype");
	}%>
<!--------------Header--------------->
<header> 
	<div class="zerogrid">
		<div class="row">
			<div class="col05">
				<div id="logo"></div>
		  </div>
			<div class="col06 offset05">
			   <div id='search-box'>
				  <form action='' method='get' name="search-form" target='_top' id='search-form'>
					<input id='search-text' name='q' placeholder='type here' type='text'/>
					<button id='search-button' type='submit'><span>搜索</span></button>
				  </form>
			  </div>
		  </div>
		</div>
	</div>
</header>
<div class="dz">
<a href="#" class="STYLE1" >用户登录/注册</a></div>
<!--------------Navigation--------------->
<nav>
	<ul>
		<li><a href="#">主页</a></li>
		<c:forEach items="${sessionScope.newstypelist }" var="i" varStatus="suoyin1">
				<li><a href="" id="${i.ntid}">${i.ntname }</a></li>
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
						<li><img src="images/1.jpg"/></li>
						<li><img src="images/2.jpg"/></li>
						<li><img src="images/3.jpg"/></li>
						<li><img src="images/4.jpg"/></li>
					</ul>
				</div>
			</div>
			<div class="sidebar col05">
				<section>
					<div class="heading">热点新闻</div>
					<div class="content">
<ul class="list">
						<c:forEach items="${sessionScope.newshotlist }" var="i" varStatus="suoyin1" end="2">
				<li><a href="" id="redian${i}" name="redian${i}">${i.title}</a></li>
		</c:forEach>
                         <div class="footer">
						<p class="more" align="right"><a class="button" href="#">more >></a></p>
						</div
				  ></ul>
                  </div>
				</section>
				<section>
					<div class="heading">政治</div>
					<div class="content">
						<ul class="list">
							<c:forEach items="${sessionScope.newszhenzhihotlist }" var="i" varStatus="suoyin1" end="2">
				<li><a href="" id="zhenzhi${i}" name="zhenzhi${i}">${i.title}</a></li>
		</c:forEach>
                            <div class="footer">
						<p class="more" align="right"><a class="button" href="#">more >></a></p>
						</div
						></ul>
					</div>
				</section>
				<section>
					<div class="heading">军事</div>
					<div class="content">
					<ul class="list">
						<c:forEach items="${sessionScope.newsjunshihotlist }" var="i" varStatus="suoyin1" end="2">
				<li><a href="" id="junshi${i}" name="junshi${i}">${i.title}</a></li>
		</c:forEach>
                            <div class="footer">
						<p class="more" align="right"><a class="button" href="#">more >></a></p>
						</div
					></ul>
					</div>
				</section>
                <section>
					<div class="heading">体育</div>
					<div class="content">
					<ul class="list">
						<c:forEach items="${sessionScope.newstiyuhotlist }" var="i" varStatus="suoyin1" end="2">
				<li><a href="" id="tiyu${i}" name="tiyu${i}">${i.title}</a></li>
		</c:forEach>
                            <div class="footer">
						<p class="more" align="right"><a class="button" href="#">more >></a></p>
						</div
					></ul>
					</div>
				</section>
                <section>
					<div class="heading">娱乐</div>
					<div class="content">
					<ul class="list">
							<c:forEach items="${sessionScope.newsyulehotlist }" var="i" varStatus="suoyin1" end="2">
				<li><a href="" id="yule${i}" name="yule${i}">${i.title}</a></li>
		</c:forEach>
                            <div class="footer">
						<p class="more" align="right"><a class="button" href="#">more >></a></p>
						</div
					></ul>
					</div>
				</section>
			</div>
		
<div class="main-content col11">
				<c:forEach items="${sessionScope.newshotlist1}" var="p" varStatus="suoyin2" end="2">
				<article>
					<div class="heading">
						<h2 id="titl${p}">${p.title }</h2>
					  <p class="info" id="xiaobiao${p }">${i.author }&nbsp;&nbsp;&nbsp;&nbsp;${p.ntime}</p>
				  </div>
					<div class="content" >
						<img src="" id="tu${p }"/>
						<p id="neirong${p }" class="line-ll">&nbsp;&nbsp;&nbsp;&nbsp;${p.ntext}...</p>
				  </div>
					<div class="footer">
						<p class="more"><br><a class="button" href="#"> more >></a><br><br></p>
				  </div>
				</article><br>
				</c:forEach>
			</div>
			
		</div>
	</div>
</section>
</div>
<!--------------Footer--------------->
<footer></footer>

<div id="copyright">
	<p>&nbsp;</p>
</div>

</body></html>