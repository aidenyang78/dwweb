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
<script src="${pageContext.request.contextPath}/js/leaflet/leaflet.js"></script>
<script type="text/javascript" src="http://map.vworld.kr/js/vworldMapInit.js.do?version=2.0&apiKey=970E88E0-2536-3A55-8216-0B675CBC5FCD"></script>
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
	lnbUI.click('#lnb li', 150)
});

$(window).on('load',function(){
	$("#list_1004").click();
	
	//기본 지도 생성 : 평택 시청
	leafletMaker(36.992232, 127.112551, 13);
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
<input type="hidden" name="crossroadSeq" id="crossroadSeq"/>
<input type="hidden" name="crossroadLat" id="crossroadLat"/>
<input type="hidden" name="crossroadLng" id="crossroadLng"/>
<input type="hidden" name="Latitude" id="Latitude"/>
<input type="hidden" name="Longitude" id="Longitude"/>

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
															<li onclick="fnSelRoute('${route.seq}')"><a href="#none">${route.routeNm}</a>
																<ul>
																	<c:forEach var="crossroad" items="${listcrossroad}" varStatus="st2">
																		<c:if test='${route.seq eq crossroad.routeCd}'>
																			<li id="selcrossroad${crossroad.crossroadSeq}" onclick="fnSelCrossroad('${crossroad.crossroadSeq}','${crossroad.lat}','${crossroad.lng}');" <c:if test='${crossroad.lat eq null}'>class="noneLatLng"</c:if> >
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
</body>
</html>
<script type="text/javascript">
var map 	= L.map('leafletmap');
var mgroup 	= L.layerGroup();	//marker group
var cgroup 	= L.layerGroup();	//circle group
var popup 	= L.popup();
var url 	= 'http://api.vworld.kr/req/wmts/2.0.0/970E88E0-2536-3A55-8216-0B675CBC5FCD/Base/{z}/{y}/{x}.png';

//zoom level
var ZoomViewer = L.Control.extend({
	onAdd: function(){
		var container= L.DomUtil.create('div');
		var gauge = L.DomUtil.create('div');
		
		container.style.width = '120px';
		container.style.background = 'rgba(255,255,255,0.8)';
		container.style.textAlign = 'center';
		map.on('zoomstart zoom zoomend', function(ev){

			gauge.innerHTML = 'Zoom level: ' + map.getZoom();
			
		})
		container.appendChild(gauge);

		return container;
	}
});
(new ZoomViewer).addTo(map);

//pop all control
map.on('zoomend', function(){
	var getZoom = map.getZoom();
	
	if(getZoom < 15){
		$('.leaflet-popup-content-wrapper').addClass('hide');
		$('.leaflet-popup-tip-container').addClass('hide');
	}else{
		$('.leaflet-popup-content-wrapper').removeClass('hide');
		$('.leaflet-popup-tip-container').removeClass('hide');
	}
});

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
	
	mgroup.addLayer( marker = new L.marker([lat,lng], {draggable: true, riseOnHover: true}) );		//기본 marker 설정
	
	marker.bindPopup("<h1>[ 평택시 ]</h1>", {autoClose:false, closeButton:false }).openPopup();			//정보 표출	

	marker.on('dragend', function(event) {
	    var position = marker.getLatLng();
		
		fnChangeLatLng(position.lat,position.lng);	//좌표 변경
		
	    $("#Latitude").val(position.lat);
	    $("#Longitude").val(position.lng).keyup();
	});
}

//select crossroad
function fnSelCrossroad(crossroadSeq,crossroadLat,crossroadLng){
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
		$result.callType = 'info';
		$result.zLevel = 16;
		fnMakeCrossroadInfo($result);
	} 
}	

//move latlng >> update
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
		//make crossroad info pop
		$result.callType = 'info';
		$result.zLevel = zLevel;
		fnMakeCrossroadInfo($result);	
		
		$("#selcrossroad"+crossroadSeq).removeClass('noneLatLng');
	}else{
		alert('좌표 수정에 실패 했습니다.');
	}
}

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
				+"	<th class='center'>위/경도</th>"
				+"	<td>"+crossroadLat+"<br/>"+crossroadLng+"</td>"
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
		    
		    $("#Latitude").val(position.lat);
		    $("#Longitude").val(position.lng).keyup();
		});
}


function fnSelRoute(seq){
	//실시간 교차로 좌표 조회
	var $result;
	var maxLat, maxLng;
	var minLat, minLng;
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/main/selectCrossroadListAjax.do";
	var strParam = "routeCd=" + seq;
	var $json = getJsonData(strMethod, strUrl, strParam);
	
	$result = $json.result;
	
	if($result.length > 0){
		maxLat = $result[1].maxLat;
		minLng = $result[1].minLng;
	}
	
	mgroup.clearLayers();	//클리어
	
	$.each($result, function(key) {
		mgroup.addLayer( marker = new L.marker([$result[key].lat, $result[key].lng], {draggable: 'true',riseOnHover: 'true'}) );
		
		marker.on('click', function(e) {			//marker click event
			var latlng = e.latlng.toString().split(',');
			var lat = latlng[0].split('(');
			var lng = latlng[1].split(')');
			var position = marker.getLatLng();
			
			//set crossroadSeq
			$("#crossroadSeq").val($result[key].seq);
			
			var popContent = fnSelMarker($result[key].seq);
			marker.bindPopup(popContent, {autoClose:false, closeButton:true }).openPopup().setLatLng(e.latlng);
		});
		
		marker.on('dragend', function(event) {
		    var position = marker.getLatLng();
		    
			fnChangeLatLng(position.lat,position.lng);	//좌표 변경
		    
		    $("#Latitude").val(position.lat);
		    $("#Longitude").val(position.lng).keyup();
		});
		
	});
	
	//set center position
	map.setView([maxLat,minLng], 13);
}

//make popContents for fnSelRoute
function fnSelMarker(seq){
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/main/selectCrossroadLatLngAjax.do";
	var strParam = "crossroadSeq=" + seq;

	var $json = getJsonData(strMethod, strUrl, strParam);
	$result = $json.result;
	
	//real-time data lookup
	var popContent = "<table class='pop_tb_list' style='min-width:200px;' id='crossroadInfoDiv'>"
		+"<colgroup>"
		+"	<col width='40%'/>"
		+"	<col width='60%'/>"
       	+"</colgroup>"
		+"<tr><th colspan='2' class='center'>"+$result.crossroadNm+"</th>"
		+"<tr>"
		+"	<th class='center'>설치일</th>"
		+"	<td>"+$result.installDate+"</td>"
		+"</tr>"
		+"<tr>"
		+"	<th class='center'>위/경도</th>"
		+"	<td>"+$result.lat+"<br/>"+$result.lng+"</td>"
		+"</tr>"
		+"<tr>"
		+"	<th class='center'>정보3</th>"
		+"	<td>-</td>"
		+"</tr>"
	+"</table>";
	
	return popContent;
}
</script>