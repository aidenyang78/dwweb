<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/Base.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/ui-lightness/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/jquery-ui.min.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<!-- leaflet 지도 -->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/leaflet/leaflet.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/leaflet/leaflet.measure.css"/>
<script src="${pageContext.request.contextPath}/js/leaflet/leaflet.js"></script>
<script src="${pageContext.request.contextPath}/js/leaflet/leaflet.measure.js"></script>
<script type="text/javascript" src="http://map.vworld.kr/js/vworldMapInit.js.do?version=2.0&apiKey=970E88E0-2536-3A55-8216-0B675CBC5FCD"></script>
</head>
<body>
<form name="frm" id="frm" method="post" onsubmit="return false">
<div class="container-fluid">
	<div class="row content">
		<div class="col-sm-6" style="border-left: 1px solid; height:700px;">
			<h1>leaflet</h1>
			<div id="letMap7" style="width:100%; height:100%"></div>
		</div>
	</div>
</div>
</form>
</body>
</html>
<style>
/* 거리재기 _leaflet */
#leafletDt{
	text-align: center;
	padding-left: 283;
}
</style>

<script type="text/javascript">
//var map 	= L.map('leafletmap');
//var url = 'http://api.vworld.kr/req/wmts/2.0.0/970E88E0-2536-3A55-8216-0B675CBC5FCD/Base/{z}/{y}/{x}.png';

	//leaflet 지도 띄우기
	var letMap7 = L.map('letMap7').setView([37.52470308242787, 14129046.928310394],14)
	//Vworld Tile 변경
	L.tileLayer('http://xdworld.vworld.kr:8080/2d/Base/201802/{z}/{x}/{y}.png').addTo(letMap7);

	var plugin = L.control.measure({
		//  control position
		position: 'topleft',
		//  weather to use keyboard control for this plugin
		keyboard: true,
		//  shortcut to activate measure
		activeKeyCode: 'M'.charCodeAt(0),
		//거리재기 초기화 코드(esc버튼 코드 :27)  //shortcut to cancel measure, defaults to 'Esc'
		cancelKeyCode: 27,
		//  line color
		lineColor: 'red',
		//  line weight
		lineWeight: 5,
		//  line dash
		lineDashArray: '6, 6',
		//  line opacity
		lineOpacity: 1,
		//  distance formatter
		// formatDistance: function (val) {
		//   return Math.round(1000 * val / 1609.344) / 1000 + 'mile';
		// }
	}).addTo(letMap7)
</script>