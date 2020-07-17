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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/leaflet/leaflet.easybutton.css"/>
<script src="${pageContext.request.contextPath}/js/leaflet/leaflet.js"></script>
<script src="${pageContext.request.contextPath}/js/leaflet/leaflet.measure.js"></script>
<script type="text/javascript" src="http://map.vworld.kr/js/vworldMapInit.js.do?version=2.0&apiKey=970E88E0-2536-3A55-8216-0B675CBC5FCD"></script>
<script src="${pageContext.request.contextPath}/js/leaflet/leaflet.easybutton.js"></script>


<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet-easybutton@2/src/easy-button.css">
<script src="https://cdn.jsdelivr.net/npm/leaflet-easybutton@2/src/easy-button.js"></script> -->

</head>
<body>
<form name="frm" id="frm" method="post" onsubmit="return false">
<div class="container-fluid">
	<div class="row content">
		<div class="col-sm-6" style="border-left: 1px solid; height:700px;">
			<h1>leaflet</h1>
			<div id="mapid" style="width:100%; height:100%"></div>
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

var url 	= 'http://api.vworld.kr/req/wmts/2.0.0/970E88E0-2536-3A55-8216-0B675CBC5FCD/Base/{z}/{y}/{x}.png';
var mymap = L.map('mapid').setView([36.98844600000000, 126.97461600000000], 13);

L.tileLayer(url, {
    maxZoom: 19,
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
        '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        'Imagery © <a href="http://mapbox.com">Mapbox</a>',
    id: 'mapbox.streets'
}).addTo(mymap);

 var markers = [
    {pos: [36.98844600000000, 126.97461600000000], popup: "This is the popup for marker #1"},
    {pos: [37.01644000000000, 127.01172700000000], popup: "This is the popup for marker #2"},
    {pos: [36.98210200000000, 127.02934100000000], popup: "This is the popup for marker #3"}];
    
markers.forEach(function (obj) {
    var m = L.marker(obj.pos).addTo(mymap),
        p = new L.Popup({ autoClose: false, closeOnClick: false })
                .setContent(obj.popup)
                .setLatLng(obj.pos);
    m.bindPopup(p);
});
 
var popContent = "aaaaaa";

var marker1 = new L.marker([36.98844600000000, 126.97461600000000], {draggable: 'true',riseOnHover: 'true'});
var marker2 = new L.marker([37.01644000000000, 127.01172700000000], {draggable: 'true',riseOnHover: 'true'});
var markers = "";
markers += marker1
markers += "," + marker2;
//markers = JSON.parse("["+markers+"]");

//alert(markers);


//L.featureGroup([marker1,marker2]).bindPopup('Hello world!').on('click', function() { alert('Clicked on a member of the group!'); }).addTo(mymap);


L.easyButton( '<strong>&telrec;</strong>', function(){
	  alert('you just clicked a font awesome icon');
	}).addTo(mymap);
</script>