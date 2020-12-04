<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%> 
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
-->
    </style>
</head>
<body>
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
	  <li><a href="#">政治</a></li>
	  <li><a href="#">军事</a></li>
	  <li><a href="#">体育</a></li>
	  <li><a href="#">娱乐</a></li>
      <li><a href="#">科技</a></li>
  </ul>
</nav>
<!--------------Content--------------->
<section id="content">
<table align="center" width="70%"><tr><td colspan="3" align="center">搜索结果</td></tr>
<tr><td>标题</td><td>作者</td><td>时间</td></tr></table>
</section>
<!--------------Footer--------------->
<footer><a href="#"><img src=""></a>
</footer>

<div id="copyright">
	<p>24小时客户服务热线：4006900000 010-82623378 常见问题解答 互联网违法和不良信息举报</p>
	<p>违法和不良信息举报电话：010-62675637 举报邮箱：jubao@vip.sina.com</p>
	<p>Copyright © 1996-2018 SINA Corporation, All Rights Reserved</p>
</div>
</body>
</html>
