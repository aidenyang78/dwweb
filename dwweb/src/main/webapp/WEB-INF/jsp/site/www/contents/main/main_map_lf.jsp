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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/datepicker-ko.js"></script>

<!-- leaflet 지도 -->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/leaflet/leaflet.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/leaflet/leaflet.measure.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/leaflet/leaflet.easybutton.css"/>
<script src="${pageContext.request.contextPath}/js/leaflet/leaflet.js"></script>
<script src="${pageContext.request.contextPath}/js/leaflet/leaflet.measure.js"></script>
<script src="${pageContext.request.contextPath}/js/leaflet/leaflet.easybutton.js"></script>
<script type="text/javascript" src="http://map.vworld.kr/js/vworldMapInit.js.do?version=2.0&apiKey=970E88E0-2536-3A55-8216-0B675CBC5FCD"></script>
<%-- <jsp:include page="/WEB-INF/jsp/site/www/contents/main/function/leaflet_include.jsp"/> --%>

<%-- 
#########################################################
# vWorld 키관리 정보 : http://www.vworld.kr/dev/v4api.do
# 발급 용도 : 개인 테스트 용으로 발급
# 발급자 : 양성진
# 발급 계정 : passion97
# local : 970E88E0-2536-3A55-8216-0B675CBC5FCD
# 163 : 2D33FC5A-6818-335A-BB3E-D2FB71AE04C5
#########################################################
--%>
<!-- leaflet 지도 -->
<script type="text/javascript">
var lnbUI = {
	click : function(target, speed) {
		var _self = this, $target = $(target);
		_self.speed = speed || 300;
		
		$target.each(function() {
			if (findChildren($(this))) {
				return;
			}
			$(this).addClass('noDepth');
		});
		
		
		function findChildren(obj) {
			return obj.find('> ul').length > 0;
		}
		
		$target.on('click', 'a',function(e) {
			e.stopPropagation();
			var $this = $(this), 
				$depthTarget = $this.next(), 
				$siblings = $this.parent().siblings();
				
			$this.parent('li').find('ul li').removeClass('on');
			$this.parent('li').find('ul li').removeClass('selcrossroad');
			$siblings.removeClass('on');
			$siblings.find('ul').slideUp(50);
			
			if ($depthTarget.css('display') == 'none') {
				_self.activeOn($this);
				$depthTarget.slideDown(_self.speed);
			} else {
				$depthTarget.slideUp(_self.speed);
				_self.activeOff($this);	
			}
		})
	},
	activeOff : function($target) {
		$target.parent().removeClass('on');
		$target.children().removeClass('on');
	},
	activeOn : function($target) {
		$target.parent().addClass('on');
	}
}; // Call lnbUI 

$(function() {
	/* lnbUI.click('#lnb li', 300) */
	lnbUI.click('#lnb li', 150);
	
	/* $("#calcDistance").on('click',function(obj){
		  
		var str = "";
		for ( var i in obj) {
			str += ", " + i + " : '" + obj[i] + "'";
		}
		str = str.substring(1, str.length);
		alert(str);
	}); */

});

$(window).on('load', function() {
	$("#list_1004").click();

	//기본 지도 생성 : 평택 시청
	leafletMaker(36.992232, 127.112551, 13);
});

$(window).keydown(function(e){
	if(e.keyCode == '27'){
		fnStopCalculationDistance();
	}
});

$(window).keyup(function(e){
	if(e.keyCode == '27'){
		fnStopCalculationDistance();
	}
});
</script>
</head>
<body onLoad="fnPreloadImages('${pageContext.request.contextPath}/images/img/icon_signal_over.png','${pageContext.request.contextPath}/images/img/icon_setting_over.png','${pageContext.request.contextPath}/images/img/icon_chart_over.png')">
<!-- <form name="frm" id="frm" onsubmit="return false"> -->
<form name="frm" id="frm">
<input type="hidden" name="fData" id="fData" />
<input type="hidden" name="fNm" id="fNm"/>
<input type="hidden" name="fExt" id="fExt"/>
<input type="hidden" name="pageNo" id="pageNo" value="${param.pageNo}"/>
<input type="hidden" name="menuSeq" id="menuSeq" value="${param.menuSeq}"/>
<input type="hidden" name="polDistrict" id="polDistrict" />
<input type="hidden" name="routeCd" id="routeCd" />
<input type="hidden" name="crossroadSeq" id="crossroadSeq"/>
<input type="hidden" name="crossroadLat" id="crossroadLat"/>
<input type="hidden" name="crossroadLng" id="crossroadLng"/>
<!-- <input type="text" name="Latitude" id="Latitude"/>
<input type="text" name="Longitude" id="Longitude"/> -->

<div id="contentWrapper">
	<div id="contentLeft">
       	<jsp:include page="/WEB-INF/jsp/site/www/contents/include/left_menu.jsp"/>
	</div>

	<div id="contentRight">
		<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
	  			<td colspan="4" align="center">
	      			<table border="0" width="582" height="53">
	          			<tr>
								<td valign="middle" colspan="2" width="90%" align="center" background="${pageContext.request.contextPath}/images/img/title_name.png" class="mainTotleText"></td>
	              			</tr>
	         			</table>
	     		</td>
			</tr>
	        
	        <tr height="35">
		        <td width="70"></td>
	       	  	<td colspan="3" class="naviText" valign="top">
					<jsp:include page="/WEB-INF/jsp/site/www/contents/include/top_navi.jsp"/>
				</td>
	        </tr>
	        
	        <tr valign="top" height="100%">
	        	<td colspan="5">
	                <table border="0">
	                    <tr>
	                        <td width="70"></td>
	                        
	                        <td valign="top">
	                        	<!-- <div id="contentFixed"> -->
	                                <table border="0" cellpadding="0" cellspacing="0" height="100%">
	                                    <tr align="left" valign="top">
	                                        <td width="21" height="53" background="${pageContext.request.contextPath}/images/img/content_bg_crop_top_left.png" ></td>
	                                        <td height="53" background="${pageContext.request.contextPath}/images/img/content_bg_crop_top_center.png">
	<!-- left 제목 입니다. -->
	                                        </td>
	                                        <td width="17" height="53" background="${pageContext.request.contextPath}/images/img/content_bg_crop_top_right.png"></td>
	                                    </tr>
	                                    
	                                    <tr align="left" valign="top">
	                                        <td width="21" background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_left.png" ></td>                                        
	                                        
	                                        <!--크기를 넣는다면 다음과 같이 넣어주세요
	                                          <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="200">
	                                        -->
	<!-- //left drop down -->                                        
											<td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="280px">
											<div id="lnb">
												<ul>
												 <c:forEach var='district' begin="1002" end="1004">
													<li>
														<a href="#none" id="list_${district}">
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
																<li onclick="fnSelRoute('${route.seq}');"><a href="#none" onclick="fnRouteDataLoad('${route.seq}');">${route.routeNm}</a>
																	<ul>
																		<c:forEach var="crossroad" items="${listcrossroad}" varStatus="st2">
																			<c:if test='${route.seq eq crossroad.routeCd}'>
																				<li id="selcrossroad${crossroad.crossroadSeq}" onclick="fnSelCrossroad('${crossroad.routeCd}','${crossroad.crossroadSeq}','${crossroad.lat}','${crossroad.lng}');" <c:if test='${crossroad.lat eq null}'>class="noneLatLng"</c:if> >
																					<a href="#none">└ ${crossroad.crossroadNm}</a>
																				</li>
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
											</td>
<!-- left drop down// -->
	                                        <td width="17" background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_right.png"></td>
	                                    </tr>
	                                    <tr align="left" valign="top">
	                                        <td width="21" height="18" background="${pageContext.request.contextPath}/images/img/content_bg_crop_bottom_left.png" ></td>
	                                        <td height="18" background="${pageContext.request.contextPath}/images/img/content_bg_crop_bottom_center.png">
	                                        </td>
	                                        <td width="17" height="18" background="${pageContext.request.contextPath}/images/img/content_bg_crop_bottom_right.png"></td>
	                                    </tr>
	                                </table>
	                              <!--  </div>  -->
		                        </td>    
		                        <td width="10"></td>
		                        <td valign="top">
	                                <table height="100%" border="0" cellpadding="0" cellspacing="0">
	                                    <tr align="left" valign="top">
	                                        <td width="21" height="53" background="${pageContext.request.contextPath}/images/img/content_bg_right_crop_top_left.png"></td>
	                                        <td height="53" background="${pageContext.request.contextPath}/images/img/content_bg_right_crop_top_center.png" valign="middle">
<!-- right 제목 입니다. -->
	                                               <h1 class="white"><a href='${pageContext.request.contextPath}/main/main.do?menuSeq=${param.menuSeq}&mapType=ol'>openLayers</a></h1>
	                                        </td>
	                                        <td width="17" height="53" background="${pageContext.request.contextPath}/images/img/content_bg_crop_top_right.png"></td>
	                                    </tr>
	                                    
	                                    <tr align="left" valign="top">
	                                        <td width="21" background="${pageContext.request.contextPath}/images/img/content_bg_right_crop_middle_left.png"></td>
	                                        
	                                        <!--  크기를 넣는다면 다음과 같이 넣어주세요  <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="200"> -->
	                                        <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="1480" height="926">
<!-- contents -->
<!-- 지도 표출 영역 -->
	                                       <div id="leafletmap" class="custom-popup" style="width:100%; height:100%"></div>
<!-- 지도 표출 영역 -->		
<!-- contents -->
	                                        </td>
	                                        <td width="17" background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_right.png"></td>
	                                    </tr>
	                                    
	                                    <tr align="left" valign="top">
	                                        <td width="21" height="18" background="${pageContext.request.contextPath}/images/img/content_bg_crop_bottom_left.png" ></td>
	                                        <td height="18" background="${pageContext.request.contextPath}/images/img/content_bg_crop_bottom_center.png">
	                                        </td>
	                                        <td width="17" height="18" background="${pageContext.request.contextPath}/images/img/content_bg_crop_bottom_right.png"></td>
	                                    </tr>
	                                </table>
	                        </td>
	                    </tr>
	                </table>
	            </td>
	        
	        </tr>
		</table>
	</div>
</div>
</form>
<div id="rUpdateLatlng" class="hide">
<jsp:include page="/WEB-INF/jsp/site/www/contents/main/function/matching_latlng_update.jsp">
	<jsp:param name="crdPolCd" value="${mainVo.polCd}"/>
	<jsp:param name="crdPolNm" value="${mainVo.polNm}"/>
</jsp:include>
</div>

<div id="rInsertCrossroadLatlng" class="hide">
<jsp:include page="/WEB-INF/jsp/site/www/contents/main/function/crossroad_latlng_insert.jsp">
	<jsp:param name="insPolCd" value="${mainVo.polCd}"/>
	<jsp:param name="insPolNm" value="${mainVo.polNm}"/>
</jsp:include>
</div>

</body>
</html>
<script type="text/javascript">
var map 	= L.map('leafletmap');
var mgroup 	= L.layerGroup();	//marker group
var cgroup 	= L.layerGroup();	//circle group
var popup 	= L.popup();
var url 	= 'http://api.vworld.kr/req/wmts/2.0.0/970E88E0-2536-3A55-8216-0B675CBC5FCD/Base/{z}/{y}/{x}.png';
var timer	= null;

//zoom level
var ZoomViewer = L.Control.extend({
	onAdd: function(){
		var zoomViewer= L.DomUtil.create('div');
		var zoomTxt = L.DomUtil.create('div');
		
		zoomViewer.style.width = '120px';
		zoomViewer.style.background = 'rgba(255,255,255,0.8)';
		zoomViewer.style.textAlign = 'center';
		
		map.on('zoomstart zoom zoomend', function(e){

			zoomTxt.innerHTML = 'Zoom level: ' + map.getZoom();
			
		})
		zoomViewer.appendChild(zoomTxt);

		return zoomViewer;
	}
});
(new ZoomViewer).addTo(map);

//pop all control
var markersBounds;
var markersDisplayed = false;
//moveend
map.on('zoomend', function(e){
	var getZoom = map.getZoom();
	var routeCd = $("#routeCd").val();
	
	markersBounds = map.getBounds();
	
	if(getZoom > 14){
		
		$(".pop_tb_list").css('min-width','150px');
		$(".custom-popup .leaflet-popup-content-wrapper").css('min-width','158px');
		$(".aa").removeClass('hide');
		
		
		mgroup.eachLayer(function (layer) {
			if (markersBounds.contains(layer.getLatLng())) {
				markersDisplayed = true;
				layer.openPopup();
	      	}
		});
		
	}else if(markersDisplayed){
		markersDisplayed = false;
		
		$(".pop_tb_list").css({'min-width':'50px','max-width':'73px'});
		$(".custom-popup .leaflet-popup-content-wrapper").css({'min-width':'50px','max-width':'80px','left':'100px'});
		$(".aa").addClass('hide');
		
		mgroup.eachLayer(function (layer) {
			if (markersBounds.contains(layer.getLatLng())) {
	    	    //layer.closePopup();
			}
		});
	}
	
	if(routeCd != ""){
		fnRealtimeDataLoad(routeCd);
	}
});

map.on('moveend', function(e){
	//alert(1);
	var getZoom = map.getZoom();
	markersBounds = map.getBounds();
	
	if(getZoom > 14){
		
		$(".pop_tb_list").css('min-width','150px');
		$(".custom-popup .leaflet-popup-content-wrapper").css('min-width','158px');
		$(".aa").removeClass('hide');
		
		mgroup.eachLayer(function (layer) {
			if (markersBounds.contains(layer.getLatLng())) {
				
	    	    markersDisplayed = true;
	    	    
	    	    if(!layer._popup.isOpen()){
					layer.openPopup();
	    	    }
			}
		});
	}else if(markersDisplayed){
		markersDisplayed = false;
		
		$(".pop_tb_list").css({'min-width':'50px','max-width':'73px'});
		$(".custom-popup .leaflet-popup-content-wrapper").css({'min-width':'50px','max-width':'80px','left':'100px'});
		$(".aa").addClass('hide');
		
		mgroup.eachLayer(function (layer) {
			if (markersBounds.contains(layer.getLatLng())) {
				if(layer._popup.isOpen()){
	    	    	//layer.closePopup();
				}
			}
		});
	}
});
	

//user right mouse click function
var contextmenu;
map.on('contextmenu', function(e){	
	var rMenuContent = '';
		rMenuContent = '<context-menu>'
			+'<div class="context-menu active" style="top: 0px; left: 0px;" id="contextMenu">'
			+'	<ul class="list_context">'
			+'		<li class="item_context">'
			+'			<button class="btn btn_context1" type="button" onclick="fnInsertCrossroadLatlng('+e.latlng.lat+','+e.latlng.lng+');">이 위치에 교차로 등록</button>'
			+'		</li>'
			+'		<li class="item_context">'
			+'			<button class="btn btn_context2" type="button" onclick="fnMatchingCrossroadLatlng('+e.latlng.lat+','+e.latlng.lng+');">이 위치에 교차로 좌표 매칭</button>'
			+'		</li>'
			+'		<li class="item_context">'
			+'			<button class="btn btn_context3" type="button" onclick="fnCalculationDistance();">거리측정</button>'
			+'		</li>'
			+'		<li class="item_context">'
			+'			<button class="btn btn_context4" type="button">면적측정</button>'
			+'		</li>'
			+'		<li class="item_context">'
			+'			<button class="btn btn_context5" type="button">반경측정</button>'
			+'		</li>'
			+'	</ul>'
			+'</div>'
			+'</context-menu>';
		
	contextmenu = L.popup({offset: [90, 174], autoClose:true, closeButton:false } ).setLatLng(e.latlng).setContent(rMenuContent);
	contextmenu.openOn(map);
});

//close contextmenu
function fnCloseContextmenu(){
	if(contextmenu.isOpen()){
		contextmenu.remove();
	}
}


//distance calculation
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
	lineWeight: 2,
	//  line dash
	lineDashArray: '6, 6',
	//  line opacity
	lineOpacity: 1,
	//  distance formatter
	// formatDistance: function (val) {
	//   return Math.round(1000 * val / 1609.344) / 1000 + 'mile';
	// }
}).addTo(map)

//call measure plugin
function fnCalculationDistance(){
	fnCloseContextmenu();
	plugin._startMeasuring();
}

//stop measure plugin
function fnStopCalculationDistance(){
	plugin._stopMeasuring();
}

//custom button
L.easyButton( '<strong>X</strong>', function(e){
	//&odash;
	markersBounds = map.getBounds();
	markersDisplayed = false;
	
	mgroup.eachLayer(function (layer) {
		if (markersBounds.contains(layer.getLatLng())) {
    	    layer.closePopup();
		}
	});
}).addTo(map);

L.easyButton( '<strong>O</strong>', function(e){
	
	markersBounds = map.getBounds();
	mgroup.eachLayer(function (layer) {
		if (markersBounds.contains(layer.getLatLng())) {
			markersDisplayed = true;
			layer.openPopup();
      	}
	});
    
}).addTo(map);



//insert Crossroad with Latlng
function fnInsertCrossroadLatlng(lat,lng){
	var latlng = map.getCenter();
	$("#crossroadLat").val(lat);
	$("#crossroadLng").val(lng);
	
	fnCloseContextmenu();
	
	var rMenuContent = $("#rInsertCrossroadLatlng").html();
	
	var rMenu = L.popup({autoClose:true, closeButton:true, minWidth:340} ).setLatLng(latlng).setContent(rMenuContent).openOn(map);
}

//Matching Crossroad with Latlng
function fnMatchingCrossroadLatlng(lat,lng){
	//교차로 목록 표출 후 좌표 등록 하도록 처리 ajax 처리
	var latlng = map.getCenter();
	$("#crossroadLat").val(lat);
	$("#crossroadLng").val(lng);

	fnCloseContextmenu();
	
	var rMenuContent = $("#rUpdateLatlng").html();
	
	var rMenu = L.popup({autoClose:true, closeButton:true, minWidth:340} ).setLatLng(latlng).setContent(rMenuContent).openOn(map);
}

//make Leaflet vWorld Map
function leafletMaker(lat,lng,zLevel){
	
	map.setView([lat, lng], zLevel);
	L.tileLayer(url, {
		maxZoom: 19,
		minZoom: 7,
		attribution : '<a href="http://www.vworld.kr/" target="_blank">vWrold</a>',
		id: 'mapbox/streets-v11'
		//tileSize: 512
		//zoomOffset: -1
	}).addTo(map);
	
	mgroup.clearLayers();	//클리어
	
	map.addLayer(mgroup);	//map에 layer 생성
	map.addLayer(cgroup);	//circle group;
	
	mgroup.addLayer( marker = new L.marker([lat,lng], {draggable: false, riseOnHover: false}) );		//기본 marker 설정
	
	marker.bindPopup("<h1>[ 평택시 ]</h1>", {autoClose:false, closeButton:false }).openPopup();			//정보 표출	

	marker.on('dragend', function(event) {
	    var position = marker.getLatLng();
		
		fnChangeLatLng(position.lat,position.lng);	//좌표 변경
		
	    /* $("#Latitude").val(position.lat);
	    $("#Longitude").val(position.lng).keyup(); */
	});
}

//select crossroad
function fnSelCrossroad(crossroadRouteCd, crossroadSeq,crossroadLat,crossroadLng){
	var crossroadLat = crossroadLat;
	var crossroadLng = crossroadLng;
	var $result;
	
	$("#crossroadSeq").val(crossroadSeq);
	
	$("#selcrossroad"+crossroadSeq).siblings('li').removeClass('selcrossroad');
	$("#selcrossroad"+crossroadSeq).addClass('selcrossroad');
	
	//실시간 좌표 조회
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/main/selectCrossroadLatLngAjax.do";
	var strParam = "crossroadSeq=" + crossroadSeq;
	
	var $json = getJsonData(strMethod, strUrl, strParam);
	
	$result = $json.result;
	
	if($result.lat != "" && $result.lng != ""){
		crossroadLat = $result.lat
		crossroadLng = $result.lng
	}
	
	if(crossroadLat == "" || crossroadLng == ""){		
		//make crossroad info pop
		$result.seq = crossroadSeq;
		$result.callType = 'none';
		$result.lat = map.getCenter().lat;
		$result.lng = map.getCenter().lng;
		$result.zLevel = 15;
		$result.crossroadNm = $("#selcrossroad"+crossroadSeq+" > a").text().replace('└ ','');
		
		fnMakeCrossroadInfo($result);		
	}else{		
		
		fnSelRoute(crossroadRouteCd,crossroadLat,crossroadLng,16);
		
	} 
	
//20200715 : 선택 된 마커 처리 수정 진행 -> 해당 마커만 표시에서 도로전체 마커 중 해당 마커 줌인
/* 
	$("#crossroadSeq").val(crossroadSeq);
	
	$("#selcrossroad"+crossroadSeq).siblings('li').removeClass('selcrossroad');
	$("#selcrossroad"+crossroadSeq).addClass('selcrossroad');
	
	//실시간 좌표 조회
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/main/selectCrossroadLatLngAjax.do";
	var strParam = "crossroadSeq=" + crossroadSeq;

	var $json = getJsonData(strMethod, strUrl, strParam);
	
	$result = $json.result;
	
	if($result.lat != "" && $result.lng != ""){
		crossroadLat = $result.lat
		crossroadLng = $result.lng
	}
	
	if(crossroadLat == "" || crossroadLng == ""){		
		//make crossroad info pop
		$result.seq = crossroadSeq;
		$result.callType = 'none';
		$result.lat = map.getCenter().lat;
		$result.lng = map.getCenter().lng;
		$result.zLevel = 15;
		$result.crossroadNm = $("#selcrossroad"+crossroadSeq+" > a").text().replace('└ ','');
		
		fnMakeCrossroadInfo($result);		
	}else{		
		$result.callType = 'info';
		$result.zLevel = 16;
		fnMakeCrossroadInfo($result);
	} 
*/	
}	

//move marker realtime update latlng
function fnChangeLatLng(crossroadLat,crossroadLng){
	var $result;
	var crossroadSeq = $("#crossroadSeq").val();
	var zLevel = map.getZoom();
	
	$("#crossroadLat").val(crossroadLat);
	$("#crossroadLng").val(crossroadLng);
	
	if(crossroadSeq == ""){
		alert('교차로를 선택해 주세요.');
		return;
	}
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/main/updateCrossroadLatLngAjax.do";
	var strParam = "crossroadSeq=" + crossroadSeq + "&crossroadLat=" + crossroadLat + "&crossroadLng="+crossroadLng;

	var $json = getJsonData(strMethod, strUrl, strParam);
	
	$result = $json.result;
	if($result != 0){
		//2020.07.15 : 좌표 변경 된 마커만 표출 -> 도로의 전체 표출 후 좌표 변경 마커 줌인
		/* 
		$result.callType = 'info';
		$result.zLevel = zLevel;
		fnMakeCrossroadInfo($result); 
		map.setView([$result.lat,$result.lng],15);
		*/
		var routeCd = $result.routeCd;
		var routeLat = $result.lat;
		var routeLng = $result.lng;
		var zLevel = 15;
		
		fnSelRoute(routeCd,routeLat,routeLng,zLevel);
		
		$("#selcrossroad"+crossroadSeq).removeClass('noneLatLng');
	}else{
		alert('좌표 수정에 실패 했습니다.');
	}
}

//crossroad information : select crossroad
function fnMakeCrossroadInfo($result){
	
		var callType 		= $result.callType;
		var crossroadNm 	= $result.crossroadNm;
		var installDate 	= $result.installDate;
		var crossroadLat 	= $result.lat;
		var crossroadLng 	= $result.lng;
		var zLevel			= $result.zLevel
		var popContent		= "";

		if(callType == "info"){
			popContent = "<table class='pop_tb_list' style='min-width:200px;' id='crossroadInfoDiv'>"
				+"<colgroup>"
				+"	<col width='40%'/>"
				+"	<col width='60%'/>"
		       	+"</colgroup>"
				+"<tr><th colspan='2' class='center'>"+crossroadNm+"</th>"
				+"<tr>"
				+"	<th class='center'>설치일</th>"
				+"	<td>"+installDate+"</td>"
				+"</tr>"
				+"<tr>"
				+"	<th class='center'>정보3</th>"
				+"	<td>-</td>"
				+"</tr>"
			+"</table>";
		}else if(callType == "none"){
			popContent = "<div class='center red strong'>["+crossroadNm+"] 좌표 미등록</div><div class='center strong'>마커를 이동하면 좌표가 자동 등록 됩니다.</div>";
		}
		
		mgroup.clearLayers();	//클리어
		
		mgroup.addLayer( marker = new L.marker([crossroadLat,crossroadLng], {draggable: 'true',riseOnHover: 'true'}) );			//기본 marker 설정
	
		marker.bindPopup(popContent, {autoClose:false, closeButton:false }).openPopup();
		
		map.setView([crossroadLat, crossroadLng], zLevel);
	
		marker.on('dragend', function(event) {
		    var position = marker.getLatLng();
		    
			fnChangeLatLng(position.lat,position.lng);	//좌표 변경
		    
		    //$("#Latitude").val(position.lat);
		    //$("#Longitude").val(position.lng).keyup();
		});
}

//crossroad list of route : select all crossroad info
function fnSelRoute(routeCd, routeLat, routeLng, zLevel){
	//실시간 교차로 좌표 조회
	var $result;
	
	//reset
	$("#crossroadLat").val('');
	$("#crossroadLng").val('');
	$("#crossroadSeq").val('');
	$("#routeCd").val(routeCd);	
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/main/selectCrossroadListAjax.do";
	var strParam = "routeCd=" + routeCd;
	var $json = getJsonData(strMethod, strUrl, strParam);
	
	$result = $json.result;

	mgroup.clearLayers();	//클리어
	
	var arrLatLngs="";	
	$result.forEach(function(result,index){
		var markerSeq = result.seq;
		var markerRouteCd = result.routeCd;
		var markerLat = result.lat;
		var markerLng = result.lng;
		var popContent = fnSelMarker(markerSeq);
		var marker = marker+"_"+markerSeq;
	
		mgroup.addLayer(  
					marker = new L.marker([markerLat, markerLng], {draggable: 'true',riseOnHover: 'true'})
					//.bindPopup(popContent, {autoClose:false, closeOnClick: true, closeButton:true }).openPopup()
					//.setLatLng([markerLat,markerLng])
		);
		 marker.bindPopup(popContent, {autoClose:false, closeOnClick: false, closeButton:true });
		 marker.setLatLng([markerLat,markerLng]);
		 //marker.openPopup(); 
		 
		 //$('.leaflet-popup').addClass('hide');
		 
		//arrLatLngs		
		if(index == 0){
			arrLatLngs += "["+markerLat+","+markerLng+"]";
		}else{
			arrLatLngs += ",["+markerLat+","+markerLng+"]";	
		}
		
		
		//marker hidden
		//$(".leaflet-popup-content").addClass('hide');
		//$(".leaflet-popup").addClass('hide');
		
		marker.on('click', function(e) {
			
			$("#crossroadLat").val('');
			$("#crossroadLng").val('');
			$("#crossroadSeq").val(markerSeq);
			$("#routeCd").val(markerRouteCd);
			
			//$(".leaflet-popup").removeClass('hide');
			//$(".leaflet-popup").removeClass('hide');
			//alert(e);
			//$(".leaflet-popup").removeClass('hide');
			//this.openPopup();
		});
		
		marker.on('dragend', function(e) {
			var marker = e.target;
		    var position = marker.getLatLng();
		 
		    $("#crossroadLat").val('');
			$("#crossroadLng").val('');
			$("#crossroadSeq").val(markerSeq);
			$("#routeCd").val(markerRouteCd);
			
			fnChangeLatLng(position.lat,position.lng);
		});
		
		/*
		marker.on('mouseover', function (e) {
			//$(".leaflet-popup-content").removeClass('hide');
			//this.removeClass('hide');
            this.openPopup();
        });
		
        marker.on('mouseout', function (e) {
            this.closePopup();
        });
		*/
	});
	
	//$(".leaflet-popup-close-button").click();

	
	//check params
	if(stringUtil.isNull(routeLat) && stringUtil.isNull(routeLng) && stringUtil.isNull(zLevel)){
		map.fitBounds(JSON.parse("["+arrLatLngs+"]"));
	}else{
		//$('.leaflet-popup').removeClass('hide');
		map.setView([routeLat,routeLng], zLevel);
		 
	}
}

//matching linkedSeq
function fnMatchingLinkedSeq(seq){
	//alert(seq);
	
	$("#crossroadSeq").val(seq);
	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}/crossroadinfo/updateCrossroadInfo.do");
	$("#frm").submit();
}

//make popContents for fnSelRoute
function fnSelMarker(seq){
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/main/selectCrossroadLatLngAjax.do";
	var strParam = "crossroadSeq=" + seq;

	var $json = getJsonData(strMethod, strUrl, strParam);
	$result = $json.result;
	$list = $json.list;
	
	
	var facStatus = $result.facStatus;
	var facStatusTxt = "";
	
	switch(facStatus){
		case "1": facStatusTxt = "온라인"; break;
		case "2": facStatusTxt = "트랜스"; break;
		case "3": facStatusTxt = "오프라인"; break;
		case "4": facStatusTxt = "수동제어"; break;
		case "5": facStatusTxt = "통신두절"; break;
		case "6": facStatusTxt = "점멸"; break;
		case "7": facStatusTxt = "소등"; break;
		/* default : facStatusTxt = "<button onclick='fnMatchingLinkedSeq("+seq+")'>시설물 상태 매칭</button>"; */
		default : facStatusTxt = "-";
	}
	
	//real-time data lookup
	var popContent = "";
		popContent = "<table class='pop_tb_list' id='crossroadInfoDiv_"+seq+"'>"
			+"<colgroup>"
			+"	<col width='40%'/>"
			+"	<col width='60%'/>"
	       	+"</colgroup>"
			+"<tr class='aa'><th colspan='2' class='center'>"+$result.crossroadNm+"</th>"
			+"<tr class='aa'>"
			+"	<th class='center'>설치일</th>"
			+"	<td id='install_"+seq+"'>"+$result.installDate+"</td>"
			+"</tr>"
			+"<tr>"
			+"	<td colspan='2' id='status_"+seq+"' class='center tb_status_"+facStatus+"'>"+facStatusTxt+"</td>"
			+"</tr>"
		+"</table>";
	
	return popContent;
}

//너무 위험해.....
function fnRouteDataLoad(routeCd){
	var repeatCnt = 0;
	var interval = 5000;
	
	console.log(">>>>>>>>>>>>> start route data load >>> fnSelRouteCd() : " + routeCd);
	
	if(timer){
		clearInterval(timer);
	}
	
	timer = setInterval(function(){
		fnRealtimeDataLoad(routeCd);
	},interval);
}

var repeatCnt = 0;
function fnRealtimeDataLoad(routeCd){
	
	var today = new Date();
	var latlng = map.getCenter();
	var zLevel = map.getZoom();
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/main/selectCrossroadListAjax.do";
	var strParam = "routeCd=" + routeCd;
	var $json = getJsonData(strMethod, strUrl, strParam);
	
	$result = $json.result;	
	
	//var arrLatLngs="";	
	$result.forEach(function(result,index){
		var seq = result.seq;
		var installDate = result.installDate;				
		var facStatus = result.facStatus;
		var facStatusTxt = "";
		
		switch(facStatus){
			case "1": facStatusTxt = "온라인"; break;
			case "2": facStatusTxt = "트랜스"; break;
			case "3": facStatusTxt = "오프라인"; break;
			case "4": facStatusTxt = "수동제어"; break;
			case "5": facStatusTxt = "통신두절"; break;
			case "6": facStatusTxt = "점멸"; break;
			case "7": facStatusTxt = "소등"; break;
			/* default : facStatusTxt = "<button onclick='fnMatchingLinkedSeq("+seq+")'>시설물 상태 매칭</button>"; */
			default : facStatusTxt = "-";
		}
		
		$("#install_"+seq).html(installDate);
		
		$("#status_"+seq).removeClass();
		$("#status_"+seq).addClass('center  tb_status_'+facStatus);
		$("#status_"+seq).html(facStatusTxt);
		
		console.log(today.toLocaleString() + " >> seq : " + seq + " >> status : " + facStatus);
		
	});	
	
	repeatCnt += 1;
	console.log(today.toLocaleString() + ">>>>>>>>>>>>> "+routeCd + " >> "+latlng+" >> " + zLevel +" >> repeat times : " + repeatCnt);
}
</script>



