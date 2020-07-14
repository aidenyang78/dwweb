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
	lnbUI.click('#lnb li', 150)
});

$(window).on('load',function(){
	$("#list_1004").click();
	
	//기본 지도 생성
	leafletMaker(37.1097753, 127.0601533, 13);
});
</script>
<body onLoad="fnPreloadImages('${pageContext.request.contextPath}/images/img/icon_signal_over.png','${pageContext.request.contextPath}/images/img/icon_setting_over.png','${pageContext.request.contextPath}/images/img/icon_chart_over.png')">
<form name="frm" id="frm">
<input type="hidden" name="pageNo" id="pageNo" value="${param.pageNo}"/>
<input type="hidden" name="menuSeq" id="menuSeq" value="${param.menuSeq}"/>
<input type="hidden" name="polDistrict" id="polDistrict" />
<input type="hidden" name="routeCd" id="routeCd" />
<input type="hidden" name="fData" id="fData" />
<input type="hidden" name="fNm" id="fNm"/>
<input type="hidden" name="fExt" id="fExt"/>
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
															<li><a href="#none">${route.routeNm}</a>
																<ul>
																	<c:forEach var="crossroad" items="${listcrossroad}" varStatus="st2">
																		<c:if test='${route.seq eq crossroad.routeCd}'>
																			<li id="selcrossroad${crossroad.crossroadSeq}" onclick="fnSelCrossroad('${crossroad.crossroadSeq}','${crossroad.lat}','${crossroad.lng}');" >
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
                                        <td height="53" background="${pageContext.request.contextPath}/images/img/content_bg_right_crop_top_center.png">
                                                right 제목 입니다.
                                        </td>
                                        <td width="17" height="53" background="${pageContext.request.contextPath}/images/img/content_bg_crop_top_right.png"></td>
                                    </tr>
                                    
                                    <tr align="left" valign="top">
                                        <td width="21" background="${pageContext.request.contextPath}/images/img/content_bg_right_crop_middle_left.png"></td>
                                        
                                        <!--  크기를 넣는다면 다음과 같이 넣어주세요  <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="200"> -->
                                        <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="1480" height="940">
<!-- contents -->
<!-- 지도 표출 영역 -->                                        
                                        <div id="mapid" style="width:100%; height:100%"></div>
<!-- 지도 표출 영역 -->
                                        

<!-- <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin=""/> -->
<!-- <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js" integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew==" crossorigin=""></script> -->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/leaflet/leaflet.css"/>
<script src="${pageContext.request.contextPath}/js/leaflet/leaflet.js"></script>
<%-- 키관리 : 양성진 개인 : http://www.vworld.kr/dev/v4dv_apikey_s002.do --%>
<script type="text/javascript" src="http://map.vworld.kr/js/vworldMapInit.js.do?version=2.0&apiKey=970E88E0-2536-3A55-8216-0B675CBC5FCD"></script>


<script>
var map = L.map('mapid');
var lgroup = L.layerGroup();

function leafletMaker(lat,lng,zlevel){
	
	map.setView([lat, lng], zlevel);
	//L.tileLayer('${pageContext.request.contextPath}/images/map/01.가재동.png', {
	L.tileLayer('http://xdworld.vworld.kr:8080/2d/Base/201612/{z}/{x}/{y}.png', {
		maxZoom: 18,
		/* attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
			'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
			'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>', */
		id: 'mapbox/streets-v11',
		tileSize: 512,
		zoomOffset: -1
	}).addTo(map);

/*
	L.marker([37.1097753, 127.0601533]).addTo(map)
		.bindPopup("<b>Hello world!</b><br />I am a popup.").openPopup();

	L.circle([37.131993, 127.052422], 500, {
		color: 'red',
		fillColor: '#f03',
		fillOpacity: 0.5
	}).addTo(map).bindPopup("I am a circle.");

	L.polygon([
		[37.138561, 127.114906],	//top : 다각형 툴 
		[37.111872, 127.133961],	
		[37.109819, 127.097397],	
		[37.127887, 127.097397]
	]).addTo(map).bindPopup("I am a polygon.");

*/


	
	map.addLayer(lgroup);
	
	
	lgroup.addLayer(L.marker([37.1097753, 127.0601533]));
	
	//기본 marker 설정
	//L.marker([37.1097753, 127.0601533]).addTo(map)

	//위경도 팝업
	var popup = L.popup();

	function onMapClick(e) {
		popup
			.setLatLng(e.latlng)
			.setContent("You clicked the map at " + e.latlng.toString())
			.openOn(map);
	}

	map.on('click', onMapClick);
}
	
//지정 위치로 이동
function fnSelCrossroad(crossroadSeq,crossroadLat,crossroadLng){
	//on 처리
	$("#selcrossroad"+crossroadSeq).siblings('li').removeClass('selcrossroad');
	$("#selcrossroad"+crossroadSeq).addClass('selcrossroad');
	
	
	
	if(crossroadLat == "" || crossroadLng == ""){
		alert('위/경도 정보가 등록 되어있지 않습니다.');
		 return;
	}else{
		//선택한 위치로 변경 
		//leafletMaker(37.1097753, 127.0601533, 14);
		map.panTo([crossroadLat,crossroadLng]);
		
		//기존 마커 클리어
		//clearMarkers(map)
		//clearLayers();
		
		lgroup.clearLayers();	//화면에 뿌려진 레이어 초기화
		
		//마커 설정
		//L.marker([crossroadLat,crossroadLng]).addTo(map);		//기본 마커 설정
		lgroup.addLayer(L.marker([crossroadLat,crossroadLng]));	//레이어에 설정 하여 클리어 한다.
	}

 
}	
</script>


<%-- <div id="viewData" style="text-align:center;vertical-align:middle;">
	<img src="${pageContext.request.contextPath}/images/map/full01.png" width="100%" style="position: relative;"/>
</div> --%>						
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
</body>
</html>