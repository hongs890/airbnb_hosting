<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="context" value="<%=request.getContextPath()%>" />
<c:set var="img" value="${context}/resources/img" />
<c:set var="css" value="${context}/resources/css"/>
<c:set var="js" value="${context}/resources/js"/>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${css}/hosting.css" />
<link rel="stylesheet" href="${css}/hosting_clndr.css" />
<link rel="stylesheet" href="${css}/hosting_style.css" />
<script src="${js}/hosting_clndr.js"></script>
<script src="${js}/hosting_jquery-1.11.1.min.js"></script>
<script src="${js}/hosting_moment-2.2.1.js"></script>
<script src="${js}/hosting_responsiveslides.min.js"></script>
<script src="${js}/hosting_site.js"></script>
<script src="${js}/hosting_underscore-min.js"></script>
<div id="host_manage_detail_left1">
	<h5>호스팅</h5>
	<h6><a href="${context}/hosting/manage_2">달력</a></h6>
	<h6><a href="${context}/hosting/manage_3">요금 설정</a></h6>
	<h6><a href="${context}/hosting/manage_4">예약</a></h6>
	<h6><a href="${context}/hosting/manage_5">체크인</a></h6>
	<h6><a href="${context}/hosting/manage_6">예약취소내역</a></h6><br>
	<h5>숙소</h5>
	<h6><a href="${context}/hosting/manage_7">기본 설정</a></h6>
	<h6><a href="${context}/hosting/manage_8">설명</a></h6>
	<h6><a href="${context}/hosting/manage_9">위치</a></h6>
	<h6><a href="${context}/hosting/manage_10">편의시설</a></h6>
	<h6><a href="${context}/hosting/manage_11">사진</a></h6>
	<h6><a href="${context}/hosting/manage_12">숙소 안전</a></h6><br>
	<h5>게스트 자료</h5>
	<h6><a href="${context}/hosting/manage_13">가이드북</a></h6><br>	
</div>
<div id="host_manage_detail_right1">
	<!DOCTYPE HTML>
<html>
<head>
<title>Free Material HTML5 CSS3 Calendar Template | Designmaz</title>
<!-- jQuery (necessary JavaScript plugins) -->
<script src="${js}/bootstrap.js"></script>
<!-- Custom Theme files -->
<link href="${css}/hosting_style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="${js}/hosting_jquery-1.11.1.min.js"></script>
<script src="${js}/hosting_jQuery-plugin-progressbar.js"></script>
<link href='//fonts.googleapis.com/css?family=Maven+Pro:700,400' rel='stylesheet' type='text/css'>
<!--//theme-style-->
 <!--Calender-->
	  <link rel="stylesheet" href="${css}/hosting_clndr.css" type="text/css" />
	  <script src="${js}/hosting_underscore-min.js"></script>
	  <script src= "${js}/hosting_moment-2.2.1.js"></script>
	  <script src="${js}/hosting_clndr.js"></script>
	  <script src="${js}/hosting_site.js"></script>
	<!--End Calender-->
	
	<!---Google Analytics Designmaz.net-->
	<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-35751449-15', 'auto');ga('send', 'pageview');</script>
</head>
<body>
             <h1>Material HTML5 CSS3 Calendar Template</h1>
        <div class="main  hvr-float-shadow">
		    <div class="slide">
			 	<div id="dd1" class="wrapper-dropdown-3" tabindex="1"><span><img src="images/nav.png" alt=""/></span>
										<ul class="dropdown">
												<li><a href="#">View Profile </a></li>
												<li><a href="#">Lists</a></li>
												<li><a href="#">Help</a></li>
												<li><a href="#">Activity log</a></li>
												<li><a href="#">Report a problem</a></li>
												<li><a href="#">Log Out</a></li>
										</ul>
											<script type="text/javascript">
													function DropDown(el) {
														this.dd = el;
														this.initEvents();
													}
													DropDown.prototype = {
														initEvents : function() {
															var obj = this;
										
															obj.dd.on('click', function(event){
																$(this).toggleClass('active');
																event.stopPropagation();
															});	
														}
													}
													$(function() {
										
														var dd = new DropDown( $('#dd1') );
										
														$(document).click(function() {
															// all dropdowns
															$('.wrapper-dropdown-3').removeClass('active');
														});
										
													});
									</script>
								</div>
								
			      <div class="callbacks_container">
						<ul class="rslides callbacks callbacks1" id="slider4">
							<li>
								<div class="banner-info">
								   <h3>Fri Day</h3>
								    <p>April 3rd</p>
									<img src="images/1.jpg" alt=""/>
								</div>
							</li>
							<li>
								<div class="banner-info">
								   <h3>Sat Day</h3>
									<p>April 3rd</p>
									<img src="images/2.jpg" alt=""/>
								</div>
							</li>
							<li>
								<div class="banner-info">
								   <h3>Sun Day</h3>
								    <p>April 3rd</p>
									<img src="images/1.jpg" alt=""/>
								</div>
							</li>
						</ul>
						</div>
						<!--banner-Slider-->
						<script src="${js}/hosting_responsiveslides.min.js"></script>
						 <script>
						// You can also use "$(window).load(function() {"
						$(function () {
						  // Slideshow 4
						  $("#slider4").responsiveSlides({
						auto: true,
						pager: true,
						nav:false,
						speed: 500,
						namespace: "callbacks",
						before: function () {
						  $('.events').append("<li>before event fired.</li>");
						},
						after: function () {
						  $('.events').append("<li>after event fired.</li>");
						}
						  });

						});
						  </script>
						  	<div class="clear"></div>
						<ul class=" side-icons">
							<li><a class="fb" href="#"></a></li>
							<li><a class="twitt" href="#"></a></li>
							<li><a class="goog" href="#"></a></li>
					   </ul>

					</div>
					 <div class="mini-cal">
			<div class="calender">
					<div class="column_right_grid calender">
                      <div class="cal1"><div class="clndr"><div class="clndr-controls"><div class="clndr-control-button"><p class="clndr-previous-button">previous</p></div><div class="month">September 2015</div><div class="clndr-control-button rightalign"><p class="clndr-next-button">next</p></div></div><table class="clndr-table" border="0" cellspacing="0" cellpadding="0"><thead><tr class="header-days"><td class="header-day">S</td><td class="header-day">M</td><td class="header-day">T</td><td class="header-day">W</td><td class="header-day">T</td><td class="header-day">F</td><td class="header-day">S</td></tr></thead><tbody><tr><td class="day past adjacent-month last-month calendar-day-2015-08-30"><div class="day-contents">30</div></td><td class="day past adjacent-month last-month calendar-day-2015-08-31"><div class="day-contents">31</div></td><td class="day past calendar-day-2015-09-01"><div class="day-contents">1</div></td><td class="day past calendar-day-2015-09-02"><div class="day-contents">2</div></td><td class="day past calendar-day-2015-09-03"><div class="day-contents">3</div></td><td class="day past calendar-day-2015-09-04"><div class="day-contents">4</div></td><td class="day past calendar-day-2015-09-05"><div class="day-contents">5</div></td></tr><tr><td class="day past calendar-day-2015-09-06"><div class="day-contents">6</div></td><td class="day past calendar-day-2015-09-07"><div class="day-contents">7</div></td><td class="day past calendar-day-2015-09-08"><div class="day-contents">8</div></td><td class="day past calendar-day-2015-09-09"><div class="day-contents">9</div></td><td class="day past event calendar-day-2015-09-10"><div class="day-contents">10</div></td><td class="day past event calendar-day-2015-09-11"><div class="day-contents">11</div></td><td class="day past event calendar-day-2015-09-12"><div class="day-contents">12</div></td></tr><tr><td class="day past event calendar-day-2015-09-13"><div class="day-contents">13</div></td><td class="day past event calendar-day-2015-09-14"><div class="day-contents">14</div></td><td class="day past calendar-day-2015-09-15"><div class="day-contents">15</div></td><td class="day past calendar-day-2015-09-16"><div class="day-contents">16</div></td><td class="day past calendar-day-2015-09-17"><div class="day-contents">17</div></td><td class="day past calendar-day-2015-09-18"><div class="day-contents">18</div></td><td class="day past calendar-day-2015-09-19"><div class="day-contents">19</div></td></tr><tr><td class="day past calendar-day-2015-09-20"><div class="day-contents">20</div></td><td class="day past event calendar-day-2015-09-21"><div class="day-contents">21</div></td><td class="day past event calendar-day-2015-09-22"><div class="day-contents">22</div></td><td class="day past event calendar-day-2015-09-23"><div class="day-contents">23</div></td><td class="day past calendar-day-2015-09-24"><div class="day-contents">24</div></td><td class="day past calendar-day-2015-09-25"><div class="day-contents">25</div></td><td class="day today calendar-day-2015-09-26"><div class="day-contents">26</div></td></tr><tr><td class="day calendar-day-2015-09-27"><div class="day-contents">27</div></td><td class="day calendar-day-2015-09-28"><div class="day-contents">28</div></td><td class="day calendar-day-2015-09-29"><div class="day-contents">29</div></td><td class="day calendar-day-2015-09-30"><div class="day-contents">30</div></td><td class="day adjacent-month next-month calendar-day-2015-10-01"><div class="day-contents">1</div></td><td class="day adjacent-month next-month calendar-day-2015-10-02"><div class="day-contents">2</div></td><td class="day adjacent-month next-month calendar-day-2015-10-03"><div class="day-contents">3</div></td></tr></tbody></table></div></div>
				    </div>
					<div class="cal-pos a">
						<ul>
							<li></li>
							<li></li>
						</ul>
					</div>
					<div class="cal-pos">
						<ul>
							<li></li>
							<li></li>
						</ul>
					</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
		<div class="clear"></div>
		<!--End Calender-->
<div class="copy-right">
		 <p>HTML Template by <a href="https://www.designmaz.net">https://www.designmaz.net</a></p>
</div>
</body>
</html>
</div>