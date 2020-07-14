<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>교통 신호등 시설물 통합관리 시스템 || 시설물 통계</title>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/Base.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/ui-lightness/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/jquery-ui.min.css"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.accordion-menu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/datepicker-ko.js"></script>
<style>
@import url(http://fonts.googleapis.com/css?family=Raleway:400,200);

#cssmenu, #cssmenu ul, #cssmenu ul li, #cssmenu ul li a {
	margin: 0;
	padding: 0;
	border: 0;
	list-style: none;
	line-height: 1;
	display: block;
	position: relative;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

#cssmenu {
	width: 220px;
	font-family: Raleway, sans-serif;
	color: #ffffff;
}

#cssmenu ul ul {
	display: none;
}

#cssmenu>ul>li.active>ul {
	display: block;
}

.align-right {
	float: right;
}

#cssmenu>ul>li>a {
	padding: 16px 22px;
	cursor: pointer;
	z-index: 2;
	font-size: 16px;
	text-decoration: none;
	color: #ffffff;
	background: #3ab4a6;
	-webkit-transition: color .2s ease;
	-o-transition: color .2s ease;
	transition: color .2s ease;
}

#cssmenu>ul>li>a:hover {
	color: #d8f3f0;
}

#cssmenu ul>li.has-sub>a:after {
	position: absolute;
	right: 26px;
	top: 19px;
	z-index: 5;
	display: block;
	height: 10px;
	width: 2px;
	background: #ffffff;
	content: "";
	-webkit-transition: all 0.1s ease-out;
	-moz-transition: all 0.1s ease-out;
	-ms-transition: all 0.1s ease-out;
	-o-transition: all 0.1s ease-out;
	transition: all 0.1s ease-out;
}

#cssmenu ul>li.has-sub>a:before {
	position: absolute;
	right: 22px;
	top: 23px;
	display: block;
	width: 10px;
	height: 2px;
	background: #ffffff;
	content: "";
	-webkit-transition: all 0.1s ease-out;
	-moz-transition: all 0.1s ease-out;
	-ms-transition: all 0.1s ease-out;
	-o-transition: all 0.1s ease-out;
	transition: all 0.1s ease-out;
}

#cssmenu ul>li.has-sub.open>a:after, #cssmenu ul>li.has-sub.open>a:before
	{
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	transform: rotate(45deg);
}

#cssmenu ul ul li a {
	padding: 14px 22px;
	cursor: pointer;
	z-index: 2;
	font-size: 14px;
	text-decoration: none;
	color: #dddddd;
	background: #49505a;
	-webkit-transition: color .2s ease;
	-o-transition: color .2s ease;
	transition: color .2s ease;
}

#cssmenu ul ul ul li a {
	padding-left: 32px;
}

#cssmenu ul ul li a:hover {
	color: #ffffff;
}

#cssmenu ul ul>li.has-sub>a:after {
	top: 16px;
	right: 26px;
	background: #dddddd;
}

#cssmenu ul ul>li.has-sub>a:before {
	top: 20px;
	background: #dddddd;
}
</style>
<script>

(function($) {
	$(document).ready(function() {

		//$('#cssmenu li.active').addClass('open').children('ul').show();
		
		$('#cssmenu li.has-sub>a').on('click', function() {
			$(this).removeAttr('href');
			var element = $(this).parent('li');
			if (element.hasClass('open')) {
				element.removeClass('open');
				element.find('li').removeClass('open');
				element.find('ul').slideUp(200);
			} else {
				element.addClass('open');
				element.children('ul').slideDown(200);
				element.siblings('li').children('ul').slideUp(200);
				element.siblings('li').removeClass('open');
				element.siblings('li').find('li').removeClass('open');
				element.siblings('li').find('ul').slideUp(200);
			}
		});

	});
})(jQuery);
</script>
<div id='cssmenu'>
<ul>
	<c:forEach var='district' begin="1002" end="1004">
	<!-- <li class='active has-sub'> -->
	<li class='has-sub'>
		<a href='#'>
		<c:choose>
           	<c:when test='${district eq "1002" }'>
           		평택시 서부
           	</c:when>
           	<c:when test='${district eq "1003" }'>
           		평택시 남부
           	</c:when>
           	<c:when test='${district eq "1004" }'>
           		평택시 북부
           	</c:when>
           	<c:otherwise>
           		평택시
           	</c:otherwise>
           </c:choose>
		</a>
		<ul>
		<c:forEach var="route" items="${listroute}" varStatus="st1">
			<c:if test='${district eq route.polDistrict }'>
		         <li class='has-sub'>
		         	<a href='#'>${route.routeNm}</a>
		            <ul>
		            	<c:forEach var="crossroad" items="${listcrossroad}" varStatus="st2">
							<c:if test='${route.seq eq crossroad.routeCd}'>
		               			<li><a href='#'>${crossroad.crossroadNm}</a></li>
		               		</c:if>
		               </c:forEach>
		            </ul>
		         </li>
         	</c:if>
		</c:forEach>
		</ul>
	</li>
	</c:forEach>
</ul>
</div>
