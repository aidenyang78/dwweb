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
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/datepicker-ko.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/printThis.js"></script>

<script src="${pageContext.request.contextPath}/common/plugins/html2canvas/bluebird.min.js"></script> 			<!-- ie에서 promise를 사용하기 위해 --> 
<script src="${pageContext.request.contextPath}/common/plugins/html2canvas/FileSaver.min.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/html2canvas/html2canvas.js"></script>


<!-- leaflet 지도 -->
<jsp:include page="/WEB-INF/jsp/site/www/contents/main/function/leaflet_include.jsp"/>

<script type="text/javascript" src="https://map.vworld.kr/js/vworldMapInit.js.do?version=2.0&apiKey=${VWORLDKEY}"></script>
<%-- 
#########################################################
# vWorld 키관리 정보 : http://www.vworld.kr/dev/v4api.do
# 발급 용도 	: 개인 테스트 용으로 발급
# 발급자 		: 양성진
# 발급 계정 	: passion97
# map.doowoninc.com 		: 63AEEE70-593D-3667-86FA-E6A14D2F0F5F
# map.doowoninc.com:8080 	: C3E057A5-1FD9-3842-B27D-ED83E5741C3F
# local 					: 970E88E0-2536-3A55-8216-0B675CBC5FCD
# 163 						: 2D33FC5A-6818-335A-BB3E-D2FB71AE04C5
# interceptor -> sessoin register
#########################################################
--%>
<!-- leaflet 지도 -->
<script type="text/javascript">
//global
var MAP_MODE		= '${MAP_MODE}';
var mapType 		= '${mainVo.mapType}';
var pageContextPath = '${pageContext.request.contextPath}';
var vworldKey 		= '${VWORLDKEY}';
var popViewMode 	= "show";
var mapBound		= '${mapBound}';
var neLat			= '${neLat}';
var neLng			= '${neLng}';
var swLat			= '${swLat}';
var swLng			= '${swLng}';


$(document).ready(function(){
	//on/off에 따라 검색창 설정
	
	//ONLINE_MAP
	
	if(MAP_MODE == "ONLINE_MAP"){
		$("#queryKeyLayer").show();
		$("#leafletmap").css("height"
						<c:choose>
							<c:when test="${USER_ID eq 'dwadmin'}">
								,"97%"
							</c:when>
							<c:otherwise>
								,"100%"
							</c:otherwise>
						</c:choose>
						);
	}else{
		$("#queryKeyLayer").hide();
		$("#leafletmap").css("height","100%");
	}
	
	//calendar
	$.datepicker.setDefaults(datepickerSet);
	$.datepicker.setDefaults({
		dateFormat: "yymmdd",
	    showMonthAfterYear:true,
	    changeMonth: true,
		changeYear: true,
		firstDay: 0,
	    showAnim: "slideDown", //show, fadeIn, slideDown
	    yearRange: "-100:+0", // last hundred years
	    duration: 300
	});
	//검색 시작일
	$('#stdDate').datepicker();
	
	$("#imgStdDate").click(function(){
		$('#stdDate').datepicker('show');	
	});
	 
	//검색 종료일
	$('#endDate').datepicker();
	
	$("#imgEndDate").click(function(){
		$('#endDate').datepicker('show');
	});
	
	//map type
	$("input[id=mapType]").click(function(e){
		var strParam = "menuSeq=${param.menuSeq}&mapType="+this.value+"&keyWord=${param.keyWord}&stdDate=${param.stdDate}&endDate=${param.endDate}";
		
		location.href="${pageContext.request.contextPath}/main/main.do?"+strParam;
	});

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

	//Activation Menu UI
	lnbUI.click('#lnb li', 150);
});

//window onload
$(window).on('load', function() {	
	
	//check from status list param
	var referer = '${param.referer}';
	var refPolDistrict = '${param.polDistrict}';
	var refRouteCd = '${param.routeCd}';
	var refCrossroadSeq = '${param.crossroadSeq}';
	var refLat = '${param.lat}';
	var refLng = '${param.lng}';
	
	//alert(referer + " // " + refPolDistrict  + " // " +refRouteCd  + " // " +refCrossroadSeq  + " // " +refLat  + " // " +refLng);
	
	if("status" == referer){
		//var ePolDistrict = $("#list_"+refPolDistrict).click();
		//var eRoute = $("#route_"+refRouteCd).click();
		//var eCrossroad = $("#selcrossroad"+refCrossroadSeq).click();
		
		//var ePolDistrict = $("#list_${param.polDistrict}").trigger('click');
		//var eRoute = $("#route_${param.routeCd}").trigger('click');
		//var eCrossroad = $("#selcrossroad${param.crossroadSeq}").trigger('click');
		if($("#list_"+refPolDistrict).click()){
			if($("#route_"+refRouteCd).click()){
				//if($("#selcrossroad"+refCrossroadSeq).click()){
					
					$("#selcrossroad"+refCrossroadSeq).addClass('selcrossroad');
					
					map.setView([refLat, refLng], 16);
					
					//map.panTo([refLat,refLng]).setZoom(16);
				//}
			}
		}		
	}else{
		$("#list_1002").click();
		
		fnDragList();
		
		console.log("center : " + map.getCenter());
	}
	
});

function fnSearch(){
	$("#frm").attr('method','post');
	$("#frm").attr('action','${pageContext.request.contextPath}/main/main.do');
	$("#frm").submit();
}
</script>
</head>
<body onLoad="fnPreloadImages('${pageContext.request.contextPath}/images/img/icon_signal_over.png','${pageContext.request.contextPath}/images/img/icon_setting_over.png','${pageContext.request.contextPath}/images/img/icon_chart_over.png')">
<!-- <form name="frm" id="frm" onsubmit="return fnSearch()"> -->
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
<input type="hidden" name="notRegSeq" id="notRegSeq"/>
<input type="hidden" name="mgmtSeq" id="mgmtSeq" />
<input type="hidden" name="Latitude" id="Latitude"/>
<input type="hidden" name="Longitude" id="Longitude"/>
<input type="hidden" name="resetLat" id="resetLat"/>
<input type="hidden" name="resetLng" id="resetLng"/>
<div id="contentWrapper">
	<div id="contentLeft">
       	<jsp:include page="/WEB-INF/jsp/site/www/contents/include/left_menu.jsp"/>
       	<%-- <c:import url="/WEB-INF/jsp/site/www/contents/include/left_menu.jsp" /> --%>
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
		                <colgroup>
							<col width="70"/>
							<col width="280"/>
							<col width="10"/>
							<col width="*"/>
						</colgroup>
						<tbody>
	                    <tr>
	                        <td>&nbsp;</td>
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
	<!-- //left drop down -->                                        
											<td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="280px">
									<c:choose>
										<c:when test='${(param.keyWord ne null and param.keyWord ne "") or (param.stdDate ne null and param.stdDate ne "") or (param.endDate ne null and param.endDate ne "") }'>
											<div id="lnb">
												<ul>
													<li class="on">
														<ul style="display: block;">
															<li class="on">
																<ul style="display: block;">
															<c:choose>
																<c:when test="${fn:length(listcrossroad) gt 0}">
																	<c:forEach var="crossroad" items="${listcrossroad}" varStatus="st2">
																		<li id="selcrossroad${crossroad.crossroadSeq}" <c:if test='${crossroad.lat eq null}'>class="noneLatLng"</c:if> >
																		<%-- <li id="selcrossroad${crossroad.crossroadSeq}" onclick="fnSelCrossroad('${crossroad.routeCd}','${crossroad.crossroadSeq}','${crossroad.lat}','${crossroad.lng}');" <c:if test='${crossroad.lat eq null}'>class="noneLatLng"</c:if> > --%>
																			<%-- <a href="#none" onclick="fnRouteListDataLoad('${crossroad.routeCd}');" id="selcrossroad_${crossroad.crossroadSeq}">${crossroad.crossroadNm}</a> --%>
																			<a href="#none" onclick="fnSelCrossroad('${crossroad.routeCd}','${crossroad.crossroadSeq}','${crossroad.lat}','${crossroad.lng}');" id="selcrossroad_${crossroad.crossroadSeq}">${crossroad.crossroadNm}</a>
																		</li>
																	</c:forEach>
																</c:when>
																<c:otherwise>
																	<li id="selcrossroadnone" class="center strong">
																			검색 결과 없음
																	</li>
																</c:otherwise>
															</c:choose>
																</ul>
															</li>
														</ul>
													</li>
												</ul>
											</div>	
										</c:when>
										
										<c:otherwise>
											<div id="lnb">
												
												<c:choose>
													<c:when test="${fn:length(listroute) > 0 }">
														<ul>												
														 <c:forEach var='district' begin="1002" end="1004">
															<li>
																<a href="#none" onclick='$("#polDistrict").val("${district}");' id="list_${district}">
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
																		<%-- <li onclick="fnRouteList('${route.seq}');"><a href="#none" id="route_${route.seq}" onclick="fnRouteListDataLoad('${route.seq}');">${route.routeNm}</a> --%>
																		<li onclick="fnRouteList('${route.seq}');"><a href="#none" id="route_${route.seq}">${route.routeNm}</a>
																			<ul>
																				<c:forEach var="crossroad" items="${listcrossroad}" varStatus="st2">
																					<c:if test='${route.seq eq crossroad.routeCd}'>
																						<li id="selcrossroad${crossroad.crossroadSeq}" onclick="fnSelCrossroad('${crossroad.routeCd}','${crossroad.crossroadSeq}','${crossroad.lat}','${crossroad.lng}');" <c:if test='${crossroad.lat eq null}'>class="noneLatLng"</c:if> >
																							<a href="#none" id="selcrossroad_${crossroad.crossroadSeq}">└ ${crossroad.crossroadNm}</a>
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
													</c:when>
													<c:otherwise>
														<span class="text_bold center">등록 된 교차로 정보가 없습니다.</span>
													</c:otherwise>
												</c:choose>
											</div>
										</c:otherwise>											
									</c:choose>											
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
		                        <td>&nbsp;</td>
		                        <td valign="top">
	                                <table border="0" cellpadding="0" cellspacing="0" style="width:100%;height:100%;">
	                                    <tr align="left" valign="top">
	                                        <td width="21" height="53" background="${pageContext.request.contextPath}/images/img/content_bg_right_crop_top_left.png"></td>
	                                        <td height="53" background="${pageContext.request.contextPath}/images/img/content_bg_right_crop_top_center.png" valign="middle">
<!-- 검색영역 -->	                                        
												<table style="width:100%;"">
													<colgroup>
														<col width="12%"/>
														<col width="10%"/>
														<col width="*"/>
														<col width="20%"/>
													</colgroup>
													<tbody>
														<tr>
															<td>
																<span class="main_search_title">드래그모드</span>
																<input type="radio" name="listMode" id="listMode" onclick="fnListMode('crossload',false);" value="drag" <c:if test="${mainVo.listMode eq 'drag'}">checked</c:if>/>
																<span class="main_search_title">도로모드</span>
																<input type="radio" name="listMode" id="listMode" onclick="fnListMode('drag',false);" value="crossload" <c:if test="${mainVo.listMode eq 'crossload'}">checked</c:if>/>
															</td>
															<td class="left">
																<span class="main_search_title">OSM</span>
																<input type="radio" name="mapType" id="mapType" value="osm" <c:if test="${mainVo.mapType eq 'osm'}">checked</c:if>/>
																<span class="main_search_title">&nbsp;VWORLD</span>
																<input type="radio" name="mapType" id="mapType" value="vworld" <c:if test="${mainVo.mapType eq 'vworld'}">checked</c:if>/>
															</td>
															<td class="left">
																<span class="main_search_title">교차로명 </span>
																<input type="text" name="keyWord" id="keyWord" size="40" value="${param.keyWord}" /*onkeydown="if(event.keyCode=='13'){fnSearch();}"*/ onkeypress="if(event.keyCode=='13'){fnSearch();}" placeholder="교차로명"/>
																
																<span class="main_search_title">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
																<span class="main_search_title">설치일 </span>
																<input type="text" name="stdDate" id="stdDate"  size="10" value="${param.stdDate}" readonly/>
																<img id="imgStdDate" src="${pageContext.request.contextPath}/images/common/calendar.gif" class="pointer cal_img_center"/>
																<span class="main_search_title">~</span>
																<input type="text" name="endDate" id="endDate"  size="10" value="${param.endDate}" readonly/>
																<img id="imgEndDate" src="${pageContext.request.contextPath}/images/common/calendar.gif" class="pointer cal_img_center"/>
																														
																<a href="javascript:;" id="search" class="btn_search_map" onclick="fnSearch();">검색</a>				
																<a href="${pageContext.request.contextPath}/main/main.do?menuSeq=1001&mapType=${mainVo.mapType}" id="search" class="btn_reset_map">초기화</a>
															</td>
															<td class="right">
																<a href="javascript:;" onclick="fnDownloadMap();" class=btn_attach_map><span>이미지</span></a>
																<a href="javascript:;" onclick="fnPrintMap();" class="btn_print_map"><span>인쇄</span></a>
															</td>
														</tr>
													</tbody>
												</table>
<!-- 검색영역 -->
	                                        </td>
	                                        <td width="17" height="53" background="${pageContext.request.contextPath}/images/img/content_bg_crop_top_right.png"></td>
	                                    </tr>
	                                    <tr align="left" valign="top">
	                                        <td width="21" background="${pageContext.request.contextPath}/images/img/content_bg_right_crop_middle_left.png"></td>
	                                        
	                                        <!--  크기를 넣는다면 다음과 같이 넣어주세요  <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="200"> -->
	                                        <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="1480" height="926">
<!-- contents --><!-- 지도 표출 영역 -->
											<c:if test="${USER_ID eq  'dwadmin'}">
												<div id="queryKeyLayer" style="padding-bottom:6px;display:none;">
													<input type="text" name="queryKey" id="queryKey" size="230" onkeyup="if(event.keyCode == 13){fnSearchPlace();};" placeholder="검색어"/>
													<span class="pointer btn_search_map" id="queryKeyBtn" onclick="fnSearchPlace();">위치검색</span>
												</div>
											</c:if>
												<textarea id="listSeqTxtArea" class="hide" cols="240" rows="5"></textarea>
												<div id="leafletmap" class="custom-popup" style="width:100%; height:97%"></div>
<!-- 지도 표출 영역 --><!-- contents -->
	                                        </td>
	                                        <td width="17" background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_right.png"></td>
	                                    </tr>
	                                    
	                                    <tr align="left" valign="top">
	                                        <td width="21" height="18" background="${pageContext.request.contextPath}/images/img/content_bg_crop_bottom_left.png" ></td>
	                                        <td height="18" background="${pageContext.request.contextPath}/images/img/content_bg_crop_bottom_center.png"></td>
	                                        <td width="17" height="18" background="${pageContext.request.contextPath}/images/img/content_bg_crop_bottom_right.png"></td>
	                                    </tr>
	                                </table>
	                        </td>
	                    </tr>
	                    </tbody>
	                </table>
	            </td>
	        
	        </tr>
		</table>
	</div>
</div>
</form>
<!-- 좌표 등록 -->
<!-- //function area -->
	<div id="rUpdateLatlng" class="hide">
	<jsp:include page="/WEB-INF/jsp/site/www/contents/main/function/matching_latlng_update.jsp">
		<jsp:param name="crdPolCd" value="${mainVo.polCd}"/>
		<jsp:param name="crdPolNm" value="${mainVo.polNm}"/>
	</jsp:include>
	</div>
	<!-- 교차로 등록 -->
	<div id="rInsertCrossroadLatlng" class="hide">
	<jsp:include page="/WEB-INF/jsp/site/www/contents/main/function/crossroad_latlng_insert.jsp">
		<jsp:param name="insPolCd" value="${mainVo.polCd}"/>
		<jsp:param name="insPolNm" value="${mainVo.polNm}"/>
	</jsp:include>
	</div>
	
	<!-- tool tip -->
	<div id="toolTipLayer" class="toolTipLayer">
		<table class="tb_list">
			<tr>
				<th class="right">
					<a href="javascript:fnHideToolTip();" style="margin-right:10px;">
						<img src="${pageContext.request.contextPath}/images/icons/close2.png" width="16px" height="16px" alt="닫기" title="닫기"/></a>
				</th>
			</tr>
			<tr>
				<td>
					<table width="100%" id="popData"></table>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- etc info tool tip -->
	<div id="etcToolTipLayer" class="etcToolTipLayer">
		<table class="tb_list">
			<tr>
				<th class="right">
					<a href="javascript:fnHideEtcToolTip();" style="margin-right:10px;">
						<img src="${pageContext.request.contextPath}/images/icons/close2.png" width="16px" height="16px" alt="닫기" title="닫기"/></a>
				</th>
			</tr>
			<tr>
				<td id="etcPopData"></td>
			</tr>
		</table>
	</div>
<!-- function area// -->	
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main_map_lf.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main_map_lf_func.js"></script>