<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
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
	<div id="wen" align="center" >
    <table width="70%">
		<tr align="center"><td><div id="titl">adf</div></td></tr>
        <tr align="center"><td><div id="zuozheshijian">adfaadf</div></td></tr>
        <tr>
          <td><div id="neirong" align="left">&nbsp;&nbsp;&nbsp;&nbsp;afd</div></td>
        </tr>
       </table>
     </div>
     <div id="pinglun" align="center">
     <table width="70%" border="1">
  	<tr>
   	 <td width="17%">发布人</td>
   	 <td width="58%">内容</td>
   	 <td width="25%">时间</td>
 	 </tr>
  <div id="lishi"><tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr></div>
</table><div align="center">
        <form id="pl" name="pl" method="post" action=""><input name="plxx" type="text"/> 
           &nbsp;&nbsp;&nbsp;&nbsp;
           <input name="tijiao" type="submit" id="tijiao" value="确定"/>
        </form></div>
     </div>
</section>
<!--------------Footer--------------->
<footer></footer>

<div id="copyright">
	<p>&nbsp;</p>
</div>

</body></html>