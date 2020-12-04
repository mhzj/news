<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

     <div id="pinglun" align="center">
     <h2>实时新闻</h2>
     <table width="70%" border="1">
  	<tr>
   	 <td width="58%">标题</td>
   	 <td width="17%">类别</td>
   	 <td width="25%">时间</td>
 	 </tr>

 <%-- <%! --%>
<%--  <%
    public static final int PAGESIZE = 5;
    int pageCount;
    int curPage = 1;
%>
<%
    //一页放5个
    String user = null;
    String pass = null;
    try{
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL,USER,PASS);
        String sql = "SELECT * FROM department";
        PreparedStatement stat = con.prepareStatement(sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stat.executeQuery();
        rs.last();
        int size = rs.getRow();
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);
        String tmp = request.getParameter("curPage");
        if(tmp==null){
            tmp="1";
        }
        curPage = Integer.parseInt(tmp);
        if(curPage>=pageCount) curPage = pageCount;
        boolean flag = rs.absolute((curPage-1)*PAGESIZE+1);
        out.println(curPage);//输出到屏幕上
        int count = 0;
         
        do{
            if(count>=PAGESIZE)break;
            int departmentid = rs.getInt(1);
            String departmentname = rs.getString(2);
            count++;
            %>
        <tr>
            <td><%=departmentid%></td>
            <td><%=departmentname%></td>
             
        </tr>
            <%
        }while(rs.next());
        con.close();
    }
    catch(Exception e){
         
    }
%>

  </tr></div>
</table><a href = "fenye.jsp?curPage=1" >首页</a>
<a href = "fenye.jsp?curPage=<%=curPage-1%>" >上一页</a>
<a href = "fenye.jsp?curPage=<%=curPage+1%>" >下一页</a>
<a href = "fenye.jsp?curPage=<%=pageCount%>" >尾页</a>
第<%=curPage%>页/共<%=pageCount%>页


</div>
 --%>
</table>
</div>
</section>
<!--------------Footer--------------->
<footer></footer>

<div id="copyright">
	<p>&nbsp;</p>
</div>

</body></html>