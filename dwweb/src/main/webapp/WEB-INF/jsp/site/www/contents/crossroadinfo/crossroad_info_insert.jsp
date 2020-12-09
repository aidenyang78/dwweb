<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>교통 신호등 시설물 통합관리 시스템 || 교차로 관리</title>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/Base.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/ui-lightness/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/jquery-ui.min.css"/>



<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/datepicker-ko.js"></script>

<script type="text/javascript">
var positionMapOpen = false;

$(document).ready(function(){
	fnSetRouteList();
	
	//fnPositionMapClose
	$(this).keydown(function(e){
		//alert(e.keyCode);
		if(positionMapOpen && e.keyCode == "27"){
			fnPositionMapClose();
		}
		
	});
	
	$("#moveHeader").mouseover(function(){
		var lay_pop = $('#positionMap');
		lay_pop.draggable({disabled:false});
	});


	$("#moveHeader").mouseleave(function(){
		var lay_pop = $('#positionMap');
		lay_pop.draggable({disabled:true});
	});
	
	$("input:radio[id=mapType]").click(function(e){
		var mapType = $("input:radio[id=mapType]:checked").val();
		var lat = stringUtil.nullToBlank($("#lat").val());
		var lng = stringUtil.nullToBlank($("#lng").val());
		
		if(lat == "" && lng == ""){
			lat = 37.001138915620714;
			lng = 127.12219655513765;	
		}

		//기본 지도 생성 : 평택시 스마트도시통합센터
		var ifrm = document.getElementById('latlngIfrm').contentWindow; 
     	ifrm.fnMakeLeafletMap(lat,lng,15,mapType);		
	});
});

//도로(국도)명 조회 생성
function fnSetRouteList(){
	var polCd = $("#polCd").val();
	var polDistrict = $("#polDistrict").val();
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/routeinfo/selectRouteListAjax.do";
	var strParam = "polCd=" + polCd +"&polDistrict="+polDistrict;
	
	var $json = getJsonData(strMethod, strUrl, strParam);
	var totCnt = $json.totCnt;
	
	var inputHtml = "<select name='selRouteCd' id='selRouteCd' style='min-width:316px;' disabled>";
	if(totCnt > 0){
		inputHtml += "<option value=''>:::::::::: 선택 ::::::::::</option>";
		for(var i=0;i<totCnt;i++){
			var seq = $json.listRoute[i].seq;
			var routeNm = $json.listRoute[i].routeNm;
			
			if('${param.s_routeCd}' == seq){
				inputHtml += "<option value='"+seq+"' selected>"+routeNm+"</option>";	
			}else{
				inputHtml += "<option value='"+seq+"'>"+routeNm+"</option>";	
			}
		}
	}else{
		inputHtml += "<option value=''>::::: 검색된 도로명이 없음 :::::</option>";
	}
	inputHtml += "</select>";
	
	$("#routeList").html(inputHtml);
}

//교차로명 중복 확인
function crossroadNmCheck(){
	var polDistrict = $("#polDistrict").val();
	var routeCd = $("#routeCd").val();
	var crossroadNm = $("#crossroadNm").val();
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/crossroadinfo/crossroadNmCheckAjax.do";
	var strParam = "polDistrict=" + polDistrict + "&routeCd=" + routeCd + "&crossroadNm=" + crossroadNm;

	var $json = getJsonData(strMethod, strUrl, strParam);
	
	$("#dupCnt").val($json.cnt);

 	if ($json.cnt == 0) {
		$("#nmChkTxtSpan").html("사용가능");
		$("#nmChkTxtSpan").attr('class', 'color_point_1');
	} else {
		$("#nmChkTxtSpan").html("사용불가(중복)");
		$("#nmChkTxtSpan").attr('class', 'color_point_2 strong');
	}
}

function fnGoList(){
	history.back();
}

function fnInsertAct(){
	if(stringUtil.isEmpty($("#crossroadNm").val())){
		alert('교차로명을 입력하세요.');
		$("#crossroadNm").focus();
		return;
	}
	
	if($("#dupCnt").val() > 0){
		alert($("#crossroadNm").val() + ' 은(는) 이미 등록 된 교차로 입니다.');
		$("#crossroadNm").val('');
		$("#crossroadNm").focus();
		return;
	}
	
	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}/crossroadinfo/insertCrossroadInfoAct.do");
	$("#frm").submit();
}

//linked check
function fnLinkedCheck(){
	var linkedCnt = $("#linkedSeq option:selected").attr('data-linked');
	var linkedNm = $("#linkedSeq option:selected").text();

	if(linkedCnt > 0 ){
		alert(linkedNm+'은(는) 이미 연계 된 교차로 입니다.');
		$("#linkedSeq").val('');
		return;
	}
}


function fnPositionMapOpen(){
	
	var ifrm 	= document.getElementById('latlngIfrm').contentWindow;
	var lay_pop = $('#positionMap');
	var selTop 	= 100;
	var selLeft = 510;
	var mapType = "osm";
	var zLevel 	= 14;
	var lat = $("#lat").val();
	var lng = $("#lng").val();
	
	positionMapOpen = true;
	
	$("#crossroadSeq").val(seq);
	
	if(stringUtil.nullToBlank(lat) == "" && stringUtil.nullToBlank(lng) == ""){
		lat = 37.001138915620714;
		lng = 127.12219655513765;	
	}

	//기본 지도 생성 : 평택시 스마트도시통합센터	 
 	ifrm.fnMakeLeafletMap(lat,lng,zLevel,mapType); 
 	
 	
 	lay_pop.css('top', (selTop) + 'px');
	lay_pop.css('left', (selLeft) + 'px');

 	lay_pop.fadeIn();
	lay_pop.focus();
}

function fnPositionMapClose(){
	
	$('#positionMap').fadeOut(350,function(){
		$('#positionMap').hide();
		
		positionMapOpen = false;
	});
}

function fnSetPosition(lat,lng){

	$("#mapLat").val(lat);
	$("#mapLng").val(lng);
}

function fnUpdateLatlngAct(){
	var lat = $("#mapLat").val();
	var lng = $("#mapLng").val();
	
	if(lat == "" || lng == ""){
		alert('마커를 이동하여 변경할 위치를 지정해 주세요.');
		return;
	}
	
	$("#lat").val(lat);
	$("#lng").val(lng);
	
	fnPositionMapClose();
}
</script>

</head>
<body onLoad="fnPreloadImages('${pageContext.request.contextPath}/images/img/icon_map_over.png','${pageContext.request.contextPath}/images/img/icon_signal_over.png','${pageContext.request.contextPath}/images/img/icon_chart_over.png')">
<form name="frm" id="frm">
<input type="hidden" name="menuSeq" id="menuSeq" value="${param.menuSeq}"/>
<input type="hidden" name="pageNo" id="pageNo" value="${param.pageNo}"/>
<input type="hidden" name="seq" id="seq" value="${crossroadInfo.seq }"/>
<input type="hidden" name="s_polDistrict" id="s_polDistrict" value="${param.s_polDistrict}"/>
<input type="hidden" name="s_routeCd" id="s_routeCd" value="${param.s_routeCd}"/>
<input type="hidden" name="s_crossroadNm" id="s_crossroadNm" value="${param.s_crossroadNm}"/>
<input type="hidden" name="dupCnt" id="dupCnt" />
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

				<tr valign="middle">

					<td width="70"></td>

					<td width="371" valign="top">
						<table width="1763" height="69" border="0" cellpadding="0" cellspacing="0" background="${pageContext.request.contextPath}/images/img/content_bg_all_01.png">
							<tr align="left" valign="top">
								<td width="10"></td>
								<td width="7"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr valign="middle" height="100%">
					<td width="70"></td>
					<td width="371" valign="top">
						<table width="1763" height="100%" border="0" cellpadding="0" cellspacing="0" background="${pageContext.request.contextPath}/images/img/content_bg_all_02.png">
							<tr align="left" valign="top">
								<td width="11"></td>
								<td width="1746">
									<table  border="0" cellpadding="0" cellspacing="0">
<!-- 설치 기본 -->										
										<tr>
											<th width="60px;"></th>
											<th class="h2_title_b center">
												교차로 등록
											</th>
											<th width="60px;"></th>
										</tr>
										<tr align="left" valign="top">
											<td width="60px;"></td>
											<td width="*" height="80%">
												<table width="100%" class="tb_list">
													<caption>신호관리대장 설치 정보 : 경찰서명, 경찰서 코드, 도로명, 굴도명, 신호등번호, 설치 년월일, 설치위치 읍면동, 설치 위/경도, 신호등 제어방식, 신호등 도로구분</caption>
													<colgroup>
														<col width="20%"/>
														<col width="30%"/>
														<col width="20%"/>
														<col width="30%"/>
													</colgroup>
													<tbody>
														<tr>
															<th class="th">
																<strong class="icon_must">*</strong>경찰서명</th>
															<td>
																${polNm}
																<input type="hidden" name="polNm" id="polNm" size="60" value="${polNm}"/>
															</td>
															<th>
																<strong class="icon_must">*</strong>경찰서코드
															</th>
															<td>
																${polCd}
																<input type="hidden" name="polCd" id="polCd" size="60" value="${polCd}"/>
															</td>
														</tr>
														<tr>
															<th><strong class="icon_must">*</strong>지구</th>
															<td>
																<select name="selPolDistrict" id="selPolDistrict" disabled>
																	<option value="" <c:if test='${param.s_polDistrict eq ""}'>selected</c:if>>::: 지구선택 :::</option>
																	<option value="1002" <c:if test='${param.s_polDistrict eq "1002"}'>selected</c:if>>서부</option>
																	<option value="1003" <c:if test='${param.s_polDistrict eq "1003"}'>selected</c:if>>남부</option>
																	<option value="1004" <c:if test='${param.s_polDistrict eq "1004"}'>selected</c:if>>북부</option>
																</select>
																<input type="hidden" name="polDistrict" id="polDistrict" value="${param.s_polDistrict}"/>
															</td>
															<th><strong class="icon_must">*</strong>도로(국도)</th>
															<td>
																<span id="routeList" class="red">지구를 선택 하세요.</span>
																<input type="hidden" name="routeCd" id="routeCd" value="${param.s_routeCd }"/>
															</td>															
														</tr>
														<tr>
															<th><strong class="icon_must">*</strong>교차로명</th>
															<td>
																<input type="text" name="crossroadNm" id="crossroadNm" value="${crossroadInfo.crossroadNm}" size="40" onkeyup="crossroadNmCheck();" onfocusout="crossroadNmCheck();"/>
																<span id="nmChkTxtSpan" class="color_point_1">중복확인</span>
															</td>
															<th>위/경도</th>
															<td>
																<label for="lat">위도</label>
																<input type="text" name="lat" id="lat" size="14" value="${crossroadInfo.lat}" accesskey="DCM"/>
																
																<label for="lng">X 경도</label>
																<input type="text" name="lng" id="lng" size="14" value="${crossroadInfo.lng}" accesskey="DCM"/>
																<a href="javascript:;" onclick="fnPositionMapOpen();" class="btn_grayStyle02">좌표선택</a>
															</td>
														</tr>
														<%-- <tr>
															<th>외부 연계(SEQ)</th>
															<td colspan="3">
																<select name="linkedSeq" id="linkedSeq" onchange="fnLinkedCheck();">
																	<option value="">:: 선택 ::</option>
																	<c:forEach var="listSt" items="${listStatus}" varStatus="st">
																		<option value="${listSt.no}" 
																			<c:if test='${crossroadInfo.linkedSeq eq listSt.no}'>selected</c:if>
																			<c:if test='${listSt.linkedCnt gt 0}'>class="used"</c:if>
																			data-linked="${listSt.linkedCnt}" >${listSt.name}</option>
																	</c:forEach>
																</select>
															</td>
														</tr> --%>
													</tbody>
												</table>
											</td>			
											<td width="60px;"></td>
										</tr>
<!-- 설치 기본 -->										

										<tr>
											<th colspan="3" style="height:40px;"></th>
										</tr>
										<tr>
											<th colspan="3">
												<a href="javascript:fnInsertAct();" class="btn_round_type_6">등록</a>
												<a href="javascript:fnGoList();" class="btn_round_type_red">취소</a>
											</th>
										</tr>
									</table>
								</td>
								<td width="9"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr valign="middle">
					<td width="70"></td>
					<td width="371" valign="top">
						<table width="1763" height="56" border="0" cellpadding="0" cellspacing="0" background="${pageContext.request.contextPath}/images/img/content_bg_all_03.png">
							<tr align="left" valign="top">
								<td width="10"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>

	</div>
</form>
<!-- 교차로 좌표 수정 -->
<div id="positionMap" style="background:#ffffff; display:none; position:absolute; cursor:move;">
<table id="positionMap2" class="tb_list" style="width:820px; height: 600px; border:0;">
<colgroup>
	<col width="*"/>
	<col width="5%"/>
</colgroup>
<tbody>
	<tr id="moveHeader">
		<th class="left">
			<span class="" style="padding-left:10px;">OSM</span>
			<input type="radio" name="mapType" id="mapType" value="osm" checked/>
			<span class="">&nbsp;VWORLD</span>
			<input type="radio" name="mapType" id="mapType" value="vworld"/>
			<input type="text" name="mapLat" id="mapLat" size="20" value="${crossroadInfo.lat}" readonly/>
			<input type="text" name="mapLng" id="mapLng" size="20" value="${crossroadInfo.lng}" readonly/>
			<span class="pointer btn_copy_latlng" onclick="fnUpdateLatlngAct();">적용</span>
		</th>
		<th class="right">
			<a href="javascript:fnPositionMapClose();" style="margin-right:10px;"><img src="${pageContext.request.contextPath}/images/icons/close2.png" width="16px" height="16px" alt="닫기"/></a>
		</th>
	</tr>
	<tr>
		<td colspan="2">
		<iframe name="latlngIfrm" id="latlngIfrm" src="${pageContext.request.contextPath}/common/commonPositionMap.do?lat=${crossroadInfo.lat}&lng=${crossroadInfo.lng}&mapWidth=800&mapHeight=600" title="position map" style="width:800px;height:600px;border:0;margin:0;padding:0;"></iframe>
		</td>
	</tr>
</tbody>	
</table>
</div>
<!-- 교차로 좌표 수정 -->
</body>
</html>