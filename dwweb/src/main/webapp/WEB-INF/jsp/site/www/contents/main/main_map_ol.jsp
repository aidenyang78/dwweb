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

<!-- ol 지도 -->
<link href="${pageContext.request.contextPath}/common/plugins/openlayers/ol.css"rel="stylesheet"/>
<script type="text/javascript" src="http://map.vworld.kr/js/vworldMapInit.js.do?version=2.0&apiKey=970E88E0-2536-3A55-8216-0B675CBC5FCD"></script>
<script src="${pageContext.request.contextPath}/common/plugins/openlayers/ol.js"></script>
<script src="${pageContext.request.contextPath}/js/openlayers/proj4.js"></script>
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
<!-- ol 지도 -->

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
                                        <td height="53" background="${pageContext.request.contextPath}/images/img/content_bg_right_crop_top_center.png" valign="middle">
<!-- right 제목 입니다. -->
                                               <h1 class="white"><a href='${pageContext.request.contextPath}/main/main.do?menuSeq=${param.menuSeq}&mapType=lf'>leaflet</a></h1>
                                        </td>
                                        <td width="17" height="53" background="${pageContext.request.contextPath}/images/img/content_bg_crop_top_right.png"></td>
                                    </tr>
                                    
                                    <tr align="left" valign="top">
                                        <td width="21" background="${pageContext.request.contextPath}/images/img/content_bg_right_crop_middle_left.png"></td>
                                        
                                        <!--  크기를 넣는다면 다음과 같이 넣어주세요  <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="200"> -->
                                        <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="1480" height="920">
<!-- contents -->
<!-- 지도 표출 영역 -->   
 <div id="olmap" style="width:100%; height:100%"></div>
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
<script>

/* var map = new ol.Map({
  target: 'map',
  layers: [
    new ol.layer.Tile({
      source: new ol.source.XYZ({
                      //Vworld Tile 변경
                      url: url//'http://xdworld.vworld.kr:8080/2d/Base/201802/{z}/{x}/{y}.png'
                  })
    })
  ],
  view: new ol.View({
          //center: [14126669.41589247, 4493404.190498611], //4326 좌표계
          center: ol.proj.fromLonLat([lng, lat]),				//proj4.js
          zoom: zlevel,
          minZoom: 8,
          maxZoom: 19
      })
}); */
</script>
<script type="text/javascript">
var url = 'http://api.vworld.kr/req/wmts/2.0.0/970E88E0-2536-3A55-8216-0B675CBC5FCD/Base/{z}/{y}/{x}.png';
var lat = 36.992232;
var lng = 127.112551;
var zlevel = 13;
var key = "970E88E0-2536-3A55-8216-0B675CBC5FCD";

//var olCenter = ol.proj.fromLonLat([lng, lat]);

// 지도 중심 좌표 (강남역)
var olCenter = ol.proj.fromLonLat([127.027583,37.497928]);


var map = new ol.Map({
  target: 'olmap',
  layers: [
    new ol.layer.Tile({
      source: new ol.source.XYZ({
                      //Vworld Tile 변경
                      url: url//'http://xdworld.vworld.kr:8080/2d/Base/201802/{z}/{x}/{y}.png'
                  })
    })
  ],
  view: new ol.View({
          //center: [14126669.41589247, 4493404.190498611], //4326 좌표계
          center: ol.proj.fromLonLat([lng, lat]),				//proj4.js
          zoom: zlevel,
          minZoom: 7,
          maxZoom: 19
      })
});


map.addOverlay(new ol.Overlay({
  position: ol.proj.transform(
    [lng, lat],
    'EPSG:4326',
    'EPSG:3857'
  ),
  element: $('<img src="/dwweb/common/plugins/openlayers/marker_blue.png">')
}));





// 지도 클릭 이벤트
map.on('singleclick', function(event) {

    // 마우스 커서 아래의 좌표값 구하기
    var coordinate = event.coordinate;
    lon = coordinate[0];
    lat = coordinate[1];
    
    alert(lat + " : " + lon);

    if (olMap.hasFeatureAtPixel(event.pixel) === true) {                                        // 마커를 클릭할 경우
        overlay.setPosition([lon,lat]);                                     // 해당 좌표로 팝업 이동
    }else{
        
        if(checkRoadView){                                                                      // checkRoadView가 true라면 로드뷰 실행 fales라면 마커 생성
            var tansform = ol.proj.transform([lon,lat], 'EPSG:3857', 'EPSG:4326')               // 브이월드 좌표계에서 다음 지도 좌표계로 변환 EPSG:3857=>EPSG:4326
            location.href="https://map.kakao.com/link/roadview/"+tansform[1]+","+tansform[0];   // 로드뷰 불러오기
        }else{
            FindAddress(lon, lat);                                                              // FindAddress 위경도 변수 넘기고 실행
        }
    }
});



/* /////////////////////////////////////////////////////////////////// */
//지정 위치로 이동
function fnSelCrossroad(crossroadSeq,crossroadLat,crossroadLng){
	var crossroadLat = crossroadLat;
	var crossroadLng = crossroadLng;
	
	$("#crossroadSeq").val(crossroadSeq);
	
	$("#selcrossroad"+crossroadSeq).siblings('li').removeClass('selcrossroad');
	$("#selcrossroad"+crossroadSeq).addClass('selcrossroad');
	
	//실시간 좌표 조회
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/main/selectCrossroadLatLngAjax.do";
	var strParam = "crossroadSeq=" + crossroadSeq;

	var $json = getJsonData(strMethod, strUrl, strParam);
	
	if($json.result.lat != "" && $json.result.lng != ""){
		crossroadLat = $json.result.lat
		crossroadLng = $json.result.lng
	}
	if(crossroadLat == "" || crossroadLng == ""){
		//alert('위/경도 정보가 등록 되어있지 않습니다.');
		alert('평택시 북부 - 1번 국도 확인 하세요.')
		return;
	}else{
		var pt = ol.proj.fromLonLat([crossroadLng, crossroadLat]);		//위치이동
		map.getView().setCenter(pt);
		map.getView().setZoom(17);
		
	}
	
}	
</script>