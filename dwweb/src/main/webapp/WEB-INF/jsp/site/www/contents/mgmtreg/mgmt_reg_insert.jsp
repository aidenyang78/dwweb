<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>교통 신호등 시설물 통합관리 시스템 || 신호관리대장</title>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/Base.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/ui-lightness/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/jquery-ui.min.css"/>



<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/datepicker-ko.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$.datepicker.setDefaults(datepickerSet);
	$.datepicker.setDefaults({
		dateFormat: "yymmdd",
	    showMonthAfterYear:true,
	    changeMonth: true,
		changeYear: true,
		firstDay: 0,
	    showAnim: "slideDown", //show, fadeIn, slideDown
	    yearRange: "-100:+0", // last hundred years
	    duration: 200
	});
	
	//설치 년월일
	$('#installDate').datepicker();
	
	$("#imgInstallDate").click(function(){
		$('#installDate').datepicker('show');	
	});
	 
	//UPS BAT 교체일
	$('#upsBatExchangeDate').datepicker();
	
	$("#imgUpsBatExchangeDate").click(function(){
		$('#upsBatExchangeDate').datepicker('show');
	})
	
	//목록으로 돌아가기
	$("#mgmtList").click(function(){
		window.history.back();
	})
	

	//등록 하기
	$("#insertMgmtReg, #insertMgmtReg2").click(function(){
		if(stringUtil.isEmpty($("#polDistrict").val())){
			alert('지구를 선택해 주세요.');
			$("#polDistrict").focus();
			return;
		}
		
		$("#frm").attr("method","post");
		$("#frm").attr("action","${pageContext.request.contextPath}/mgmtreg/insertMgmtRegAct.do");
		$("#frm").submit();
	})

	//지구 선택 시 도로명 조회
	$("#polDistrict").change(function(obj){ 
		
		fnSetRouteList();
		
		$("#lat").val('');
		$("#lng").val('');
		$("#crossroadNm").val('');
		var inputHtml = "<select name='crossroadCd' id='crossroadCd' onchange='fnChangeCrossroadCd()' style='min-width:452px;'>"
						+ "<option value=''>::::::: 지구와 도로명을 선택해 주세요 :::::::</option>"
						+ "</select>";
		
		$("#crossroadList").html(inputHtml);		
	});
})

//도로명 변경 정보 기록 및 교차로 정보 조회 호출
function fnChangeRouteCd(){
	var routeNm = $("#routeCd option:checked").text();
	
	if($("#routeCd").val() != ''){
		
		$("#routeNm").val(routeNm);
		fnSetCrossroadList();
		
	}else{
		
		$("#routeNm").val('');
		$("#lat").val('');
		$("#lng").val('');
		$("#crossroadNm").val('');
		
		var inputHtml = "<select name='crossroadCd' id='crossroadCd' onchange='fnChangeCrossroadCd()' style='min-width:452px;'>"
			+ "<option value=''>::::::: 지구와 도로명을 선택해 주세요 :::::::</option>"
			+ "</select>";

		$("#crossroadList").html(inputHtml);
		
	}
}

//도로(국도)명 조회
function fnSetRouteList(){
	var polCd = $("#polCd").val();
	var polDistrict = $("#polDistrict").val();
	
	//선택된 도로명 초기화 
	$("#routeNm").val('');
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/routeinfo/selectRouteListAjax.do";
	var strParam = "polCd=" + polCd +"&polDistrict="+polDistrict;
	
	var $json = getJsonData(strMethod, strUrl, strParam);
	var totCnt = $json.totCnt;
	
	if(totCnt > 0){
		inputHtml = "<select name='routeCd' id='routeCd' onchange='fnChangeRouteCd()' style='min-width:452px;'>";
		inputHtml += "<option value=''>:::::::::: 선택 ::::::::::</option>";
		for(var i=0;i<totCnt;i++){
			var seq = $json.listRoute[i].seq;
			var routeNm = $json.listRoute[i].routeNm;
			
			inputHtml += "<option value='"+seq+"'>"+routeNm+"</option>";
		}
		inputHtml += "</select>";
	}else{
		inputHtml = "<select name='routeCd' id='routeCd' onchange='fnChangeRouteCd()' style='min-width:452px;'>";
		inputHtml += "<option value=''>::::: 검색된 도로명이 없음 :::::</option>";
		inputHtml += "</select>";
		
		alert('조회가능한 도로명이 없습니다.');
	}
	
	$("#routeList").html(inputHtml);
}

function fnChangeCrossroadCd(){
	var crossroad = $("#crossroadCd option:checked").text();
	var lat = $("#crossroadCd option:checked").attr("data-lat");
	var lng = $("#crossroadCd option:checked").attr("data-lng");
	
	$("#crossroadNm").val(crossroad);
	
	if(lat != "" || lng != ""){
		$("#lat").val(lat);
		$("#lng").val(lng);	
	}
}

//교차로명
function fnSetCrossroadList(){

	var polCd = $("#polCd").val();
	var polDistrict = $("#polDistrict").val();
	var routeCd = $("#routeCd").val();
	
	//선택된 도로명 초기화 
	$("#crossroadNm").val('');
	$("#lat").val('');
	$("#lng").val('');
	
	//도로명 리스트 생성
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/crossroadinfo/selectCrossroadListAjax.do";
	var strParam = "polCd=" + polCd +"&polDistrict="+polDistrict+"&routeCd="+routeCd;
	
	var $json = getJsonData(strMethod, strUrl, strParam);
	var totCnt = $json.totCnt;
	
	if(totCnt > 0){
		inputHtml = "<select name='crossroadCd' id='crossroadCd' onchange='fnChangeCrossroadCd()' style='min-width:452px;'>";
		inputHtml += "<option value=''>:::::::::: 선택 ::::::::::</option>";
		
		for(var i=0;i<totCnt;i++){
			var seq = $json.listCrossroad[i].seq;
			var crossroadNm = $json.listCrossroad[i].crossroadNm;
			var lat = $json.listCrossroad[i].lat;
			var lng = $json.listCrossroad[i].lng;
			
			inputHtml += "<option value='"+seq+"' data-lat='"+lat+"' data-lng='"+lng+"'>"+crossroadNm+"</option>";
		}
		inputHtml += "</select>";
		
	}else{
		inputHtml = "<select name='crossroadCd' id='crossroadCd' onchange='fnChangeCrossroadCd()' style='min-width:452px;'>";
		inputHtml += "<option value=''>::::: 검색된 도로명이 없음 :::::</option>";
		inputHtml += "</select>";
		
		alert('조회가능한 도로명이 없습니다.');
	}
	
	$("#crossroadList").html(inputHtml);
}

//위/경도 선택
function fnSelGeoCode(){
	alert('위/경도 선택');
}

//신호주기 합계 구하기
function fnSecSum(){
	var secTot = 0;
	
	for(var i=1;i<=6;i++){
		secTot += parseInt(stringUtil.nullToZero($("#signalSec"+i).val()));
	}
	
	$("#signalSecTot").val(secTot);
}
</script>

</head>
<body onLoad="fnPreloadImages('${pageContext.request.contextPath}/images/img/icon_map_over.png','${pageContext.request.contextPath}/images/img/icon_signal_over.png','${pageContext.request.contextPath}/images/img/icon_chart_over.png')">
<form name="frm" id="frm">
<input type="hidden" name="pageNo" id="pageNo" value="${param.pageNo}"/>
<input type="hidden" name="menuSeq" id="menuSeq" value="${param.menuSeq}"/>
<input type="hidden" name="searchDistrict" id="searchDistrict" value="${param.searchDistrict}"/>
<input type="hidden" name="keyKind" id="keyKind" value="${param.keyKind}"/>
<input type="hidden" name="keyWord" id="keyWord" value="${param.keyWord}"/>

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
												신호관리대장
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
																<select name="polDistrict" id="polDistrict">
																	<option value="">::: 지구선택 :::</option>
																	<!-- <option value="1001">동부</option> -->
																	<option value="1002">서부</option>
																	<option value="1003">남부</option>
																	<option value="1004">북부</option>
																</select>
																<input type="text" name="polNm" id="polNm" size="46" value="${polNm}" readonly/>
															</td>
															<th>
																<strong class="icon_must">*</strong>경찰서코드
															</th>
															<td><input type="text" name="polCd" id="polCd" size="60" value="${polCd}" readonly/></td>
														</tr>
														<tr>
															<th class="th">도로명</th>
															<td colspan="3">
																<span id="routeList">
																	<select name="routeCd" id="routeCd" style='min-width:452px;'>
																		<option value="">::::::: 지구를 선택해 주세요::::::: </option>
																	</select>
																</span>
																<input type="text" name="routeNm" id="routeNm" size="62"/>
																
															</td>
														</tr>
														
														<tr>
															<th class="th">신호등번호</th>
															<td>
																<input type="text" name="lightNo1" id="lightNo1" size="6" maxlength="2" accesskey="NUM"/>
																<input type="text" name="lightNo2" id="lightNo2" size="6" maxlength="2" accesskey="NUM"/>
																<input type="text" name="lightNo3" id="lightNo3" size="9" maxlength="3" accesskey="NUM"/>
															</td>
															<th class="th">설치 년월일</th>
															<td>
																<input type="text" name="installDate" id="installDate" size="10"/>
																<img id="imgInstallDate" src="${pageContext.request.contextPath}/images/common/calendar.gif" style="height:20px;align:absmiddle;" class="pointer"/>
															</td>
														</tr>
														
														<tr>
															<th class="th">설치 위치</th>
															<td colspan="3">
																<ul>
																	<li>
																		<span id="crossroadList">
																			<select name="crossroadCd" id="crossroadCd" onchange='fnChangeCrossroadCd()' style='min-width:452px;'>
																				<option value="">::::::: 지구와 도로명을 선택해 주세요 :::::::</option>
																			</select>
																		</span>
																		<input type="text" name="crossroadNm" id="crossroadNm"/>
																		
																		<span style="margin-left:40px;">
																		<label for="lat">위도</label>
																		<input type="text" name="lat" id="lat" size="14" accesskey="DCM"/>
																		
																		<label for="lng">X 경도</label>
																		<input type="text" name="lng" id="lng" size="14" accesskey="DCM"/>
																		<a href="javascript:;" onclick="fnSelGeoCode();" class="btn_grayStyle02">좌표선택</a>
																		</span>
																	</li>
																</ul>
																<ul><li>&nbsp;</li></ul>
																<ul>
																	<li>
																		<input type="text" name="installAddrDtl1" id="installAddrDtl1" size="20"/>
																		<label for="installAddrDtl1">동</label>
																	</li>
																</ul>
																<ul>
																	<li>
																		<input type="text" name="installAddrDtl2" id="installAddrDtl2" size="20"/>
																		<label for="installAddrDtl2">읍</label>
																		<input type="text" name="installAddrDtl4" id="installAddrDtl4" size="20"/>
																		<label for="installAddrDtl4">가</label>
																	</li>
																</ul>																
																<ul>
																	<li>
																		<input type="text" name="installAddrDtl3" id="installAddrDtl3" size="20"/>
																		<label for="installAddrDtl3">면</label>
																		<input type="text" name="installAddrDtl5" id="installAddrDtl5" size="20"/>
																		<label for="installAddrDtl5">리</label>
																		<input type="text" name="installAddrDtl6" id="installAddrDtl6" size="20"/>
																		<label for="installAddrDtl6">번지</label>
																	</li>
																</ul>
															</td>
															<!-- <th class="th"></th>
															<td></td> -->
														</tr>
														
														<tr>
															<th class="th">신호등 구분  [제어방식]</th>
															<td>
																<ul>
																	<li>
																		<input type="radio" name="typeControll" id="typeControll1" value="1" />
																		<label for="typeControll1">전자</label>

																		<input type="radio" name="typeControll" id="typeControll2" value="2" />
																		<label for="typeControll2">일반</label>
																	</li>
																</ul>
															</td>
															<th class="th">신호등 구분 [도로구분]</th>
															<td>
																<ul>
																	<li>
																		<input type="radio" name="typeRoad" id="typeRoad5" value="5" />
																		<label for="typeRoad5">교차로</label>
																
																		<input type="radio" name="typeRoad" id="typeRoad6" value="6" />
																		<label for="typeRoad6">단일로</label>
																	</li>
																</ul>
															</td>
														</tr>
													</tbody>
												</table>
											</td>			
											<td width="60px;"></td>
										</tr>
<!-- 설치 기본 -->										
										<tr>
											<td colspan="3" height="30px"></td>
										</tr>
<!-- 공사일반 -->										
										<tr>
											<th width="60px;"></th>
											<th class="h2_title_b left">공사일반</th>
											<th width="60px;"></th>
										</tr>
										<tr>
											<td width="60px;"></td>
											<td width="*" height="80%">
											<!-- //데이터 영역 -->
												<table width="100%" class="tb_list">
													<caption>공사일반 : 신호기 제식 , 배선, ups 형식, upb 배터리 교체일, 신호기 시공자, 제어기 시공자, 토목 시공자, 공사비용</caption>
													<colgroup>
														<col width="20%"/>
														<col width="30%"/>
														<col width="20%"/>
														<col width="30%"/>
													</colgroup>
													<tbody>
														<tr>
															<th class="th">신호기 제식</th>
															<td>
																<ul>
																	<li>
																		<input type="radio" name="signalRules" id="signalRules1" value="1" />
																		<label for="signalRules1">측주식</label>
															
																		<input type="radio" name="signalRules" id="signalRules2" value="2" />
																		<label for="signalRules2">중앙주식</label>
																
																		<input type="radio" name="signalRules" id="signalRules3" value="3" />
																		<label for="signalRules3">현중식</label>
																	</li>
																</ul>
															</td>
															<th class="th">배선</th>
															<td>
																<ul>
																	<li>
																		<input type="radio" name="signalWiring" id="signalWiring1" value="1" />
																		<label for="signalWiring1">지하</label>
																
																		<input type="radio" name="signalWiring" id="signalWiring2" value="2" />
																		<label for="signalWiring2">가공</label>
																
																		<input type="radio" name="signalWiring" id="signalWiring3" value="3" />
																		<label for="signalWiring3">복합</label>
																	</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th class="th">UPS 형식</th>
															<td>
																<ul>
																	<li>
																		<input type="radio" name="upsType" id="upsType1" value="1" />
																		<label for="upsType1">내장형</label>
																		<input type="radio" name="upsType" id="upsType2" value="2" />
																		<label for="upsType2">외장형</label>
																	</li>
																</ul>
															</td>
															<th class="th">UPS BAT 교체일</th>
															<td>
																<input type="text" name="upsBatExchangeDate" id="upsBatExchangeDate" size="10"/>
																<img id="imgUpsBatExchangeDate" src="${pageContext.request.contextPath}/images/common/calendar.gif" style="height:20px;align:absmiddle;" class="pointer"/>
															</td>
														</tr>
														<tr>
															<th class="th">시공자 신호기</th>
															<td>
																<ul>
																	<li>
																		<input type="text" name="constructorSignal1" id="constructorSignal1" />
																	</li>
																	<li>
																		<input type="text" name="constructorSignal2" id="constructorSignal2" />
																	</li>
																</ul>
															</td>
															<th class="th">시공자 제어기</th>
															<td>
																<ul>
																	<li>
																		<input type="text" name="constructorCtrl1" id="constructorCtrl1" />
																	</li>
																	<li>
																		<input type="text" name="constructorCtrl2" id="constructorCtrl2" />
																	</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th class="th">시공자 토목</th>
															<td>
																<ul>
																	<li>
																		<input type="text" name="constructorEng1" id="constructorEng1" />
																	</li>
																	<li>
																		<input type="text" name="constructorEng2" id="constructorEng2" />
																	</li>
																</ul>
															</td>
															<th class="th">공사비용</th>
															<td>
																<input type="text" name="constructionExpenses" id="constructionExpenses" accesskey="COMMA"/>천원
															</td>
														</tr>
													</tbody>
												</table>
											</td>
											<td width="60px;"></td>
										</tr>
<!-- 공사일반 -->
										<tr>
											<td colspan="3" height="30px"></td>
										</tr>
<!-- //교통신호등 -->							
										<tr>
											<th width="60px;"></th>
											<th class="h2_title_b left">교통신호등</th>
											<th width="60px;"></th>
										</tr>
										<tr>
											<td width="60px;"></td>
											<td width="*" height="80%">
											<!-- //데이터 영역 -->
												<table width="100%" class="tb_list">
													<caption>교통 신호등 : 차량신호등 설정 값, 차량경보등 설정 값, 차량가변등 설정 값, 보행등(자동차) 설정 값</caption>
													<colgroup>
														<col width="20%"/>
														<col width="30%"/>
														<col width="20%"/>
														<col width="30%"/>
													</colgroup>
													<tbody>
														<tr>
															<th class="th">차량신호등</th>
															<td>
																<ul>
																	<li>
																		<input type="text" name="kindTrafficLight1" id="kindTrafficLight1" size="4" accesskey="NUM"/>
																		<input type="text" name="kindTrafficLight2" id="kindTrafficLight2" size="4" accesskey="NUM"/>
																		<input type="text" name="kindTrafficLight3" id="kindTrafficLight3" size="4" accesskey="NUM"/>
																		<input type="text" name="kindTrafficLight4" id="kindTrafficLight4" size="4" accesskey="NUM"/>
																	</li>
																</ul>
																<ul>
																	<li>
																		<input type="text" name="kindTrafficLight5" id="kindTrafficLight5" size="4" accesskey="NUM"/>
																		<input type="text" name="kindTrafficLight6" id="kindTrafficLight6" size="4" accesskey="NUM"/>
																		<input type="text" name="kindTrafficLight7" id="kindTrafficLight7" size="4" accesskey="NUM"/>
																		<input type="text" name="kindTrafficLight8" id="kindTrafficLight8" size="4" accesskey="NUM"/>
																	</li>
																</ul>
																
																<ul>
																	<li>
																		<input type="text" name="kindTrafficLight9" id="kindTrafficLight9" size="4" accesskey="NUM"/>
																		<input type="text" name="kindTrafficLight10" id="kindTrafficLight10" size="4" accesskey="NUM"/>
																		<input type="text" name="kindTrafficLight11" id="kindTrafficLight11" size="4" accesskey="NUM"/>
																		<input type="text" name="kindTrafficLight12" id="kindTrafficLight12" size="4" accesskey="NUM"/>
																	</li>
																</ul>
																
																<ul>
																	<li>
																		<input type="text" name="kindTrafficLight13" id="kindTrafficLight13" size="4" accesskey="NUM"/>
																		<input type="text" name="kindTrafficLight14" id="kindTrafficLight14" size="4" accesskey="NUM"/>
																		<input type="text" name="kindTrafficLight15" id="kindTrafficLight15" size="4" accesskey="NUM"/>
																		<input type="text" name="kindTrafficLight16" id="kindTrafficLight16" size="4" accesskey="NUM"/>
																	</li>
																</ul>
															</td>
															<td colspan="2" rowspan="4" valign="top">
																<p>&nbsp;</p>
																<h3><strong class="icon_must">*</strong>수량은 그대로 기입</h3>
																<p>&nbsp;</p>
																<table class="tb_list" style="width:400px !important; ">
																	<tr>
																		<th class="th center">재질</th><th class="th center">종류</th>
																	</tr>
																	<tr>
																		<td>1.폴리카보넬(백열등)</td><td>1.1색등</td>
																	</tr>
																	<tr>
																		<td>2.폴리카보넬(LED)</td><td>2.2색등</td>
																	</tr>
																	<tr>
																		<td>3.알미늄</td><td>3.3색등</td>
																	</tr>
																	<tr>
																		<td>4.기타</td><td>4.4색등</td>
																	</tr>
																</table>
															</td>
														</tr>
														<tr>
															<th class="th">차량 경보등</th>
															<td>
																<ul>
																	<li>
																		<input type="text" name="kindLampWarning1" id="kindLampWarning1" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWarning2" id="kindLampWarning2" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWarning3" id="kindLampWarning3" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWarning4" id="kindLampWarning4" size="4" accesskey="NUM"/>
																	</li>
																</ul>
																<ul>
																	<li>
																		<input type="text" name="kindLampWarning5" id="kindLampWarning5" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWarning6" id="kindLampWarning6" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWarning7" id="kindLampWarning7" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWarning8" id="kindLampWarning8" size="4" accesskey="NUM"/>
																	</li>
																</ul>
																
																<ul>
																	<li>
																		<input type="text" name="kindLampWarning9" id="kindLampWarning9" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWarning10" id="kindLampWarning10" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWarning11" id="kindLampWarning11" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWarning12" id="kindLampWarning12" size="4" accesskey="NUM"/>
																	</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th class="th">차량 가변등</th>
															<td>
																<ul>
																	<li>
																		<input type="text" name="kindLampVariable1" id="kindLampVariable1" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampVariable2" id="kindLampVariable2" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampVariable3" id="kindLampVariable3" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampVariable4" id="kindLampVariable4" size="4" accesskey="NUM"/>
																	</li>
																</ul>
																<ul>
																	<li>
																		<input type="text" name="kindLampVariable5" id="kindLampVariable5" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampVariable6" id="kindLampVariable6" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampVariable7" id="kindLampVariable7" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampVariable8" id="kindLampVariable8" size="4" accesskey="NUM"/>
																	</li>
																</ul>
																
																<ul>
																	<li>
																		<input type="text" name="kindLampVariable9" id="kindLampVariable9" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampVariable10" id="kindLampVariable10" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampVariable11" id="kindLampVariable11" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampVariable12" id="kindLampVariable12" size="4" accesskey="NUM"/>
																	</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th class="th">보행자등(자동차)</th>
															<td>
																<ul>
																	<li>
																		<input type="text" name="kindLampWalking1" id="kindLampWalking1" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWalking2" id="kindLampWalking2" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWalking3" id="kindLampWalking3" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWalking4" id="kindLampWalking4" size="4" accesskey="NUM"/>
																	</li>
																</ul>
																<ul>
																	<li>
																		<input type="text" name="kindLampWalking5" id="kindLampWalking5" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWalking6" id="kindLampWalking6" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWalking7" id="kindLampWalking7" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWalking8" id="kindLampWalking8" size="4" accesskey="NUM"/>
																	</li>
																</ul>
																
																<ul>
																	<li>
																		<input type="text" name="kindLampWalking9" id="kindLampWalking9" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWalking10" id="kindLampWalking10" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWalking11" id="kindLampWalking11" size="4" accesskey="NUM"/>
																		<input type="text" name="kindLampWalking12" id="kindLampWalking12" size="4" accesskey="NUM"/>
																	</li>
																</ul>
															</td>
														</tr>
															
													</tbody>
												</table>
											</td>
											<td width="60px;"></td>
										</tr>
			<!-- 교통신호등// -->
										<tr>
											<td colspan="3" height="30px"></td>
										</tr>
			
			<!-- //신호등 지주 -->							
										<tr>
											<th width="60px;"></th>
											<th class="h2_title_b left">신호등 지주</th>
											<th width="60px;"></th>
										</tr>
										<tr>
											<td width="60px;"></td>
											<td width="*" height="80%">
												<table width="100%" class="tb_list">
													<caption>신호등 지주 : 차량등 지주 규격, 보행등 지주 규격, 신호등 부착대 규격, 통합폴 가로등 규격, 기타 부착물 규격 입력</caption>
													<colgroup>
														<col width="20%"/>
														<col width="30%"/>
														<col width="20%"/>
														<col width="30%"/>
													</colgroup>
													<tbody>
														<tr>
															<th class="th">차량등 지주</th>
															<td>
																<ul>
																	<li>
																		<label for="pillarVehicleLamp1">철주  Φ 300 X 10m</label>
																		<input type="text" name="pillarVehicleLamp1" id="pillarVehicleLamp1" accesskey="NUM"/>
																	</li>
																	<li>
																		<label for="pillarVehicleLamp2">철주  Φ 250 X 10m</label>
																		<input type="text" name="pillarVehicleLamp2" id="pillarVehicleLamp2" accesskey="NUM"/>
																	</li>
																	<li>
																		<label for="pillarVehicleLamp3">철주  Φ 250 X 8m</label>
																		<input type="text" name="pillarVehicleLamp3" id="pillarVehicleLamp3" accesskey="NUM"/>
																	</li>
																	<li>
																		<label for="pillarVehicleLamp4">철주  Φ 200 X 8m</label>
																		<input type="text" name="pillarVehicleLamp4" id="pillarVehicleLamp4" accesskey="NUM"/>
																	</li>
																	<li>
																		<label for="pillarVehicleLamp5">철주  Φ 150 X 8m</label>
																		<input type="text" name="pillarVehicleLamp5" id="pillarVehicleLamp5" accesskey="NUM"/>
																	</li>
																</ul>
															</td>
															<th class="th">보행등 지주</th>
															<td>
																<ul>
																	<li>
																		<label for="pillarWalkingLamp1">철주  Φ 125 X 4m</label>
																		<input type="text" name="pillarWalkingLamp1" id="pillarWalkingLamp1" accesskey="NUM"/>
																	</li>
																	<li>
																		<label for="pillarWalkingLamp2">철주  Φ 125 X 6m</label>
																		<input type="text" name="pillarWalkingLamp2" id="pillarWalkingLamp2" accesskey="NUM"/>
																	</li>
																</ul>	
															</td>
														</tr>
														
														<tr>
															<th class="th">신호등 부착대</th>
															<td>
																<ul>
																	<li>
																		<label for="pillarTrafficLight1">13m</label>
																		<input type="text" name="pillarTrafficLight1" id="pillarTrafficLight1" accesskey="NUM"/>
																	</li>
																	<li>
																		<label for="pillarTrafficLight2">11m</label>
																		<input type="text" name="pillarTrafficLight2" id="pillarTrafficLight2" accesskey="NUM"/>
																	</li>
																	<li>
																		<label for="pillarTrafficLight3">9m</label>
																		<input type="text" name="pillarTrafficLight3" id="pillarTrafficLight3" accesskey="NUM"/>
																	</li>
																	<li>
																		<label for="pillarTrafficLight4">7m</label>
																		<input type="text" name="pillarTrafficLight4" id="pillarTrafficLight4" accesskey="NUM"/>
																	</li>
																	<li>
																		<label for="pillarTrafficLight5">5m</label>
																		<input type="text" name="pillarTrafficLight5" id="pillarTrafficLight5" accesskey="NUM"/>
																	</li>
																</ul>
															</td>
															<th class="th">통합폴 가로등</th>
															<td>
																<ul>
																	<li>
																		<label for="pillarIntegration1">Φ250</label>
																		<input type="text" name="pillarIntegration1" id="pillarIntegration1" accesskey="NUM"/>
																	</li>
																	<li>
																		<label for="pillarIntegration2">Φ200</label>
																		<input type="text" name="pillarIntegration2" id="pillarIntegration2" accesskey="NUM"/>
																	</li>
																</ul>
															</td>
														</tr>
														
														<tr>
															<th class="th">기타 부착물</th>
															<td colspan="3">
																<ul>
																	<li>
																		<label for="attachEtc1">맹인용부착물</label>
																		<input type="text" name="attachEtc1" id="attachEtc1" accesskey="NUM"/>
																	</li>
																	<li>
																		<label for="attachEtc2">교통안전표식</label>
																		<input type="text" name="attachEtc2" id="attachEtc2" accesskey="NUM"/>
																	</li>
																</ul>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
											<td width="60px;"></td>
										</tr>
			<!-- 신호등 지주// -->
										<tr>
											<td colspan="3" height="30px"></td>
										</tr>
			<!-- //신호 제어기 -->
										<tr>
											<th width="60px;"></th>
											<th class="h2_title_b left">신호 제어기</th>
											<th width="60px;"></th>
										</tr>
										<tr>
											<td width="60px;"></td>
											<td width="*" height="80%">
												<table width="100%" class="tb_list">
													<caption>신호제어기 : 전자 제어기, 정주기 제어기, 교통감응 제어기, 신호 주기및 시간, 현시시간초, 황생, 올레드, 횡단보도</caption>
													<colgroup>
														<col width="20%"/>
														<col width="30%"/>
														<col width="20%"/>
														<col width="30%"/>
													</colgroup>
													<tbody>
														<tr>
															<th class="th">전자 제어기</th>
															<td>
																<ul>
																	<li>
																		<input type="radio" name="ctrlElectron" id="ctrlElectron1" value="1"/>
																		<label for="ctrlElectron1">전자/일반</label>
																	
																		<input type="radio" name="ctrlElectron" id="ctrlElectron2" value="2"/>
																		<label for="ctrlElectron2">2004년식 표준</label>
																	
																		<input type="radio" name="ctrlElectron" id="ctrlElectron3" value="3"/>
																		<label for="ctrlElectron3">2010년식 표준</label>
																	</li>	
																</ul>
															</td>
															<th class="th">정주기 제어기</th>
															<td>
																<ul>
																	<li>
																		<input type="radio" name="ctrlCycle" id="ctrlCycle1" value="1"/>
																		<label for="ctrlCycle1">싱글링</label>
																
																		<input type="radio" name="ctrlCycle" id="ctrlCycle2" value="2"/>
																		<label for="ctrlCycle2">듀얼링</label>
																	</li>
																</ul>
															</td>
														</tr>
														
														<tr>
															<th class="th">교통감응 제어기</th>
															<td colspan="3">
																<ul>
																	<li>
																		<input type="radio" name="ctrlSensitive" id="ctrlSensitive1" value="1"/>
																		<label for="ctrlSensitive1">온라인 TOD</label>
																
																		<input type="radio" name="ctrlSensitive" id="ctrlSensitive2" value="2"/>
																		<label for="ctrlSensitive2">온라인 실시간</label>
																	</li>
																	<li>
																		<input type="radio" name="ctrlSensitive" id="ctrlSensitive3" value="3"/>
																		<label for="ctrlSensitive3">좌회전 감응</label>
																	
																		<input type="radio" name="ctrlSensitive" id="ctrlSensitive4" value="4"/>
																		<label for="ctrlSensitive4">좌회전/직진감응</label>
																	</li>
																	<li>
																		<input type="radio" name="ctrlSensitive" id="ctrlSensitive5" value="5"/>
																		<label for="ctrlSensitive5">보행자 감응</label>
																	
																		<input type="radio" name="ctrlSensitive" id="ctrlSensitive6" value="6"/>
																		<label for="ctrlSensitive6">전감응(3+4+5)</label>
																	</li>
																</ul>
															</td>
														</tr>
														<tr>
															<th class="th">신호주기</th>
															<td colspan="3">
																<table class="tb_list" style="width:74%">
																<colgroup>
																	<col width="*"/>
																	<col width="14%"/>
																	<col width="14%"/>
																	<col width="14%"/>
																	<col width="14%"/>
																	<col width="14%"/>
																	<col width="14%"/>
																</colgroup>
																<tbody>
																	<tr>
																		<th class="center" rowspan="2">&nbsp;</th>
																		<th class="center">1현시</th>
																		<th class="center">2현시</th>
																		<th class="center">3현시</th>
																		<th class="center">4현시</th>
																		<th class="center">5현시</th>
																		<th class="center">6현시</th>
																	</tr>
																	<tr>
																		<td>
																			<input type="text" name="signalCycle1" id="signalCycle1" size="12" onclick="fnSignalMapShow(this.id);"  />
																		</td>
																		<td>
																			<input type="text" name="signalCycle2" id="signalCycle2" size="12" onclick="fnSignalMapShow(this.id);"  />
																		</td>
																		<td>
																			<input type="text" name="signalCycle3" id="signalCycle3" size="12" onclick="fnSignalMapShow(this.id);"  />
																		</td>
																		<td>
																			<input type="text" name="signalCycle4" id="signalCycle4" size="12" onclick="fnSignalMapShow(this.id);"  />
																		</td>
																		<td>
																			<input type="text" name="signalCycle5" id="signalCycle5" size="12" onclick="fnSignalMapShow(this.id);"  />
																		</td>
																		<td>
																			<input type="text" name="signalCycle6" id="signalCycle6" size="12" onclick="fnSignalMapShow(this.id);"  />
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<input type="text" name="signalSecTot" id="signalSecTot" size="10" accesskey="NUM" readonly/>
																			<label for="signalSecTot">초</label>
																		</td>
																		<td>
																			<input type="text" name="signalSec1" id="signalSec1" size="10" accesskey="NUM" onkeyup="fnSecSum();" />
																			<label for="signalSec1">초</label>
																		</td>
																		<td>
																			<input type="text" name="signalSec2" id="signalSec2" size="10" accesskey="NUM" onkeyup="fnSecSum();"/>
																			<label for="signalSec2">초</label>
																		</td>
																		<td>
																			<input type="text" name="signalSec3" id="signalSec3" size="10" accesskey="NUM" onkeyup="fnSecSum();"/>
																			<label for="signalSec3">초</label>
																		</td>
																		<td>
																			<input type="text" name="signalSec4" id="signalSec4" size="10" accesskey="NUM" onkeyup="fnSecSum();"/>
																			<label for="signalSec4">초</label>
																		</td>
																		<td>
																			<input type="text" name="signalSec5" id="signalSec5" size="10" accesskey="NUM" onkeyup="fnSecSum();"/>
																			<label for="signalSec5">초</label>
																		</td>
																		<td>
																			<input type="text" name="signalSec6" id="signalSec6" size="10" accesskey="NUM" onkeyup="fnSecSum();"/>
																			<label for="signalSec6">초</label>
																		</td>
																	</tr>
																</tbody>
																</table>
															</td>
														</tr>
														<tr>
															<th class="th">현시시간초</th>
															<td colspan="3">
																<table class="tb_list" style="width:74%">
																	<caption>현시시간초 정보 : 1현시, 2현시, 3현시, 4현시, 5현시, 6현시</caption>
																	<colgroup>
																		<col width="*"/>
																		<col width="14%"/>
																		<col width="14%"/>
																		<col width="14%"/>
																		<col width="14%"/>
																		<col width="14%"/>
																		<col width="14%"/>
																	</colgroup>
																	<tbody>
																	<tr>
																		<th class="center" width="100px">시간</th>
																		<th class="center">1현시</th>
																		<th class="center">2현시</th>
																		<th class="center">3현시</th>
																		<th class="center">4현시</th>
																		<th class="center">5현시</th>
																		<th class="center">6현시</th>
																	</tr>
																	<tr>
																		<td class="center">
																			<select name="currentSelTime1" id="currentSelTime1">
																				<option value="">:::선택::::</option>
																				<c:forEach var="index" begin="1" end="24">
																					<c:choose>
																						<c:when test="${index lt 10 }">
																							<option value="${index}">0${index}시</option>
																						</c:when>
																						<c:otherwise>
																							<option value="${index}">${index}시</option>
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
																			</select>
																		</td>
																		<td class="center"><input type="text" name="currentTime11" id="currentTime11" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime12" id="currentTime12" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime13" id="currentTime13" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime14" id="currentTime14" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime15" id="currentTime15" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime16" id="currentTime16" size="10" accesskey="NUM"/></td>
																	</tr>
																	
																	<tr>
																		<td class="center">
																			<select name="currentSelTime2" id="currentSelTime2">
																				<option value="">:::선택::::</option>
																				<c:forEach var="index" begin="1" end="24">
																					<c:choose>
																						<c:when test="${index lt 10 }">
																							<option value="${index}">0${index}시</option>
																						</c:when>
																						<c:otherwise>
																							<option value="${index}">${index}시</option>
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
																			</select>
																		</td>
																		<td class="center"><input type="text" name="currentTime21" id="currentTime21" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime22" id="currentTime22" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime23" id="currentTime23" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime24" id="currentTime24" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime25" id="currentTime25" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime26" id="currentTime26" size="10" accesskey="NUM"/></td>
																	</tr>
																	
																	<tr>
																		<td class="center">
																			<select name="currentSelTime3" id="currentSelTime3">
																				<option value="">:::선택::::</option>
																				<c:forEach var="index" begin="1" end="24">
																					<c:choose>
																						<c:when test="${index lt 10 }">
																							<option value="${index}">0${index}시</option>
																						</c:when>
																						<c:otherwise>
																							<option value="${index}">${index}시</option>
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
																			</select>
																		</td>
																		<td class="center"><input type="text" name="currentTime31" id="currentTime31" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime32" id="currentTime32" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime33" id="currentTime33" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime34" id="currentTime34" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime35" id="currentTime35" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime36" id="currentTime36" size="10" accesskey="NUM"/></td>
																	</tr>
																	
																	<tr>
																		<td class="center">
																			<select name="currentSelTime4" id="currentSelTime4">
																				<option value="">:::선택::::</option>
																				<c:forEach var="index" begin="1" end="24">
																					<c:choose>
																						<c:when test="${index lt 10 }">
																							<option value="${index}">0${index}시</option>
																						</c:when>
																						<c:otherwise>
																							<option value="${index}">${index}시</option>
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
																			</select>
																		</td>
																		<td class="center"><input type="text" name="currentTime41" id="currentTime41" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime42" id="currentTime42" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime43" id="currentTime43" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime44" id="currentTime44" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime45" id="currentTime45" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime46" id="currentTime46" size="10" accesskey="NUM"/></td>
																	</tr>
																	
																	<tr>
																		<td class="center">
																			<select name="currentSelTime5" id="currentSelTime5">
																				<option value="">:::선택::::</option>
																				<c:forEach var="index" begin="1" end="24">
																					<c:choose>
																						<c:when test="${index lt 10 }">
																							<option value="${index}">0${index}시</option>
																						</c:when>
																						<c:otherwise>
																							<option value="${index}">${index}시</option>
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
																			</select>
																		</td>
																		<td class="center"><input type="text" name="currentTime51" id="currentTime51" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime52" id="currentTime52" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime53" id="currentTime53" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime54" id="currentTime54" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime55" id="currentTime55" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime56" id="currentTime56" size="10" accesskey="NUM"/></td>
																	</tr>
																	
																	<tr>
																		<td class="center">
																			<select name="currentSelTime6" id="currentSelTime6">
																				<option value="">:::선택::::</option>
																				<c:forEach var="index" begin="1" end="24">
																					<c:choose>
																						<c:when test="${index lt 10 }">
																							<option value="${index}">0${index}시</option>
																						</c:when>
																						<c:otherwise>
																							<option value="${index}">${index}시</option>
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
																			</select>
																		</td>
																		<td class="center"><input type="text" name="currentTime61" id="currentTime61" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime62" id="currentTime62" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime63" id="currentTime63" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime64" id="currentTime64" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime65" id="currentTime65" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime66" id="currentTime66" size="10" accesskey="NUM"/></td>
																	</tr>
																	
																	<tr>
																		<td class="center">
																			<select name="currentSelTime7" id="currentSelTime7">
																				<option value="">:::선택::::</option>
																				<c:forEach var="index" begin="1" end="24">
																					<c:choose>
																						<c:when test="${index lt 10 }">
																							<option value="${index}">0${index}시</option>
																						</c:when>
																						<c:otherwise>
																							<option value="${index}">${index}시</option>
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
																			</select>
																		</td>
																		<td class="center"><input type="text" name="currentTime71" id="currentTime71" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime72" id="currentTime72" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime73" id="currentTime73" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime74" id="currentTime74" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime75" id="currentTime75" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="currentTime76" id="currentTime76" size="10" accesskey="NUM"/></td>
																	</tr>
																	
																	</tbody>
																</table>
															</td>
														</tr>
														
														<tr>
															<th class="th">황색</th>
															<td colspan="3">
																<table class="tb_list" style="width:74%">
																	<caption>황색 신호 : 1현시, 2현시, 3현시, 4현시, 5현시, 6현시</caption>
																	<colgroup>
																		<col width="14%"/>
																		<col width="14%"/>
																		<col width="14%"/>
																		<col width="14%"/>
																		<col width="14%"/>
																		<col width="14%"/>
																	</colgroup>
																	<tbody>
																	<tr>
																		<th class="center">1현시</th>
																		<th class="center">2현시</th>
																		<th class="center">3현시</th>
																		<th class="center">4현시</th>
																		<th class="center">5현시</th>
																		<th class="center">6현시</th>
																	</tr>
																	<tr>
																		<td class="center"><input type="text" name="signalYellow1" id="signalYellow1" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="signalYellow2" id="signalYellow2" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="signalYellow3" id="signalYellow3" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="signalYellow4" id="signalYellow4" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="signalYellow5" id="signalYellow5" size="10" accesskey="NUM"/></td>
																		<td class="center"><input type="text" name="signalYellow6" id="signalYellow6" size="10" accesskey="NUM"/></td>
																	</tr>
																	</tbody>
																</table>
															</td>
														</tr>
														<tr>
															<th class="th">올레드</th>
															<td colspan="3">
																<table class="tb_list" style="width:74%">
																	<caption>올레드 신호 : 1현시, 2현시, 3현시, 4현시, 5현시, 6현시</caption>
																	<colgroup>
																		<col width="14%"/>
																		<col width="14%"/>
																		<col width="14%"/>
																		<col width="14%"/>
																		<col width="14%"/>
																		<col width="14%"/>
																	</colgroup>
																	<tbody>
																	<tr>
																		<th class="center">1현시</th>
																		<th class="center">2현시</th>
																		<th class="center">3현시</th>
																		<th class="center">4현시</th>
																		<th class="center">5현시</th>
																		<th class="center">6현시</th>
																	</tr>
																	<tr>
																		<td class="center">
																			<input type="text" name="signalAllRed11" id="signalAllRed11" size="6" accesskey="NUM"/>
																			/
																			<input type="text" name="signalAllRed12" id="signalAllRed12" size="6" accesskey="NUM"/>
																		</td>
																		<td class="center">
																			<input type="text" name="signalAllRed21" id="signalAllRed21" size="6" accesskey="NUM"/>
																			/
																			<input type="text" name="signalAllRed22" id="signalAllRed22" size="6" accesskey="NUM"/>
																		</td>
																		<td class="center">
																			<input type="text" name="signalAllRed31" id="signalAllRed31" size="6" accesskey="NUM"/>
																			/
																			<input type="text" name="signalAllRed32" id="signalAllRed32" size="6" accesskey="NUM"/>
																		</td>
																		<td class="center">
																			<input type="text" name="signalAllRed41" id="signalAllRed41" size="6" accesskey="NUM"/>
																			/
																			<input type="text" name="signalAllRed42" id="signalAllRed42" size="6" accesskey="NUM"/>
																		</td>
																		<td class="center">
																			<input type="text" name="signalAllRed51" id="signalAllRed51" size="6" accesskey="NUM"/>
																			/
																			<input type="text" name="signalAllRed52" id="signalAllRed52" size="6" accesskey="NUM"/>
																		</td>
																		<td class="center">
																			<input type="text" name="signalAllRed61" id="signalAllRed61" size="6" accesskey="NUM"/>
																			/
																			<input type="text" name="signalAllRed62" id="signalAllRed62" size="6" accesskey="NUM"/>
																		</td>
																	</tr>
																</tbody>
																</table>
															</td>
														</tr>
														<tr>
															<th class="th">횡단보도</th>
															<td colspan="3">
																<table class="tb_list" style="width:74%">
																		<caption>횡단보도 신호 : 1현시, 2현시, 3현시, 4현시, 5현시, 6현시</caption>
																		<colgroup>
																			<col width="14%"/>
																			<col width="14%"/>
																			<col width="14%"/>
																			<col width="14%"/>
																			<col width="14%"/>
																			<col width="14%"/>
																		</colgroup>
																		<tbody>
																		<tr>
																			<th class="center">1현시</th>
																			<th class="center">2현시</th>
																			<th class="center">3현시</th>
																			<th class="center">4현시</th>
																			<th class="center">5현시</th>
																			<th class="center">6현시</th>
																		</tr>
																		<tr>
																			<td class="center">
																				<input type="text" name="signalCrosswalk11" id="signalCrosswalk11" size="6" accesskey="NUM"/>
																				/
																				<input type="text" name="signalCrosswalk12" id="signalCrosswalk12" size="6" accesskey="NUM"/>
																			</td>
																			<td class="center">
																				<input type="text" name="signalCrosswalk21" id="signalCrosswalk21" size="6" accesskey="NUM"/>
																				/
																				<input type="text" name="signalCrosswalk22" id="signalCrosswalk22" size="6" accesskey="NUM"/>
																			</td>
																			<td class="center">
																				<input type="text" name="signalCrosswalk31" id="signalCrosswalk31" size="6" accesskey="NUM"/>
																				/
																				<input type="text" name="signalCrosswalk32" id="signalCrosswalk32" size="6" accesskey="NUM"/>
																			</td>
																			<td class="center">
																				<input type="text" name="signalCrosswalk41" id="signalCrosswalk41" size="6" accesskey="NUM"/>
																				/
																				<input type="text" name="signalCrosswalk42" id="signalCrosswalk42" size="6" accesskey="NUM"/>
																			</td>
																			<td class="center">
																				<input type="text" name="signalCrosswalk51" id="signalCrosswalk51" size="6" accesskey="NUM"/>
																				/
																				<input type="text" name="signalCrosswalk52" id="signalCrosswalk52" size="6" accesskey="NUM"/>
																			</td>
																			<td class="center">
																				<input type="text" name="signalCrosswalk61" id="signalCrosswalk61" size="6" accesskey="NUM"/>
																				/
																				<input type="text" name="signalCrosswalk62" id="signalCrosswalk62" size="6" accesskey="NUM"/>
																			</td>
																			
																		</tr>
																		</tbody>
																	</table>
															</td>
														</tr>
														
													</tbody>
												</table>
											</td>
											<td width="60px;"></td>
										</tr>
<!-- 신호 제어기// -->
										<tr>
											<th colspan="3" style="height:40px;"></th>
										</tr>
										<tr>
											<th colspan="3">
												<a id="insertMgmtReg" href="javascript:;" class="btn_round_type_6">등록</a>
												<a id="mgmtList" href="javascript:;" class="btn_round_type_red">취소</a>
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
</body>
</html>

<script type="text/javascript">
//신호주기 선택 화면 호출
function fnSignalMapShow(selId){
	var lay_pop = $('#signalMap');
	var selTop = $("#"+selId).offset().top - 150;
	var selLeft = $("#"+selId).offset().left - 100;
	
 	lay_pop.css('top', (selTop) + 'px');    // 레이어 위치 지정
	lay_pop.css('left', (selLeft) + 'px');

 	$("#rtnId").val(selId);
 	
 	if(!stringUtil.isEmpty($("#"+selId).val())){
 		$("#rtnVal").val($("#"+selId).val());	
 	}
 	
 	lay_pop.draggable();
 	lay_pop.fadeIn();
	lay_pop.focus();
}

//신호주기 선택 닫기
function fnSignalMapClose(){
	$('#signalMap').fadeOut(350,function(){
		$('#signalMap').hide();
	});
	
	$("#rtnVal").val('');
	$("#rtnId").val('');
}

//선택 신호주시 값 설정
function fnSelData(strVal){
	var rtnVal = $("#rtnVal").val();
	
		if(stringUtil.isEmpty(rtnVal)){
			rtnVal = strVal;
		}else{
			rtnVal = rtnVal + "," + strVal;
		}
	 $("#rtnVal").val(rtnVal);
}

//신호주기 선택
function fnResetSignal(){
	$("#rtnVal").val('');
}

//신호주기 다시 선택
function fnSetSignal(){
	var rtnId = $("#"+$("#rtnId").val());
	var rtnVal =  $("#rtnVal").val();
	
	rtnId.val(rtnVal);
	
	fnSignalMapClose();
}
</script>
<div id="signalMap" style="display:none; position:absolute; cursor:move;">
<table class="tb_list7" style="width:500px;height:200px;">
	<tr>
		<th colspan="7" class="right">
			<a href="javascript:fnSignalMapClose();" style="margin-right:10px;">
			<img src="${pageContext.request.contextPath}/images/icons/close2.png" width="24px" height="24px" alt="닫기"/></a>
		</th>
	</tr>
	<tr>
		<th rowspan="2" class="center">RING A</th>
		<td class="center">8</td>
		<td class="center">7</td>
		<td class="center">6</td>
		<td class="center">5</td>
		<td class="center">17</td>
		<td class="center">18</td>
	</tr>
	<tr class="pointer">
		<td onclick="fnSelData('8');">
			<img src="${pageContext.request.contextPath}/images/icons/8.png" class="center" alt="위"/>
		</td>
		<td onclick="fnSelData('7');">
			<img src="${pageContext.request.contextPath}/images/icons/7.png" class="center" alt="아래 오른쪽"/>
		</td>
		<td onclick="fnSelData('6');">
			<img src="${pageContext.request.contextPath}/images/icons/6.png" class="center" alt="왼쪽"/>
		</td>
		<td onclick="fnSelData('5');">
			<img src="${pageContext.request.contextPath}/images/icons/5.png" class="center" alt="오른쪽 위"/>
		</td>
		<td onclick="fnSelData('17');">
			<img src="${pageContext.request.contextPath}/images/icons/17.png" class="center" alt="양방향 점선"/>
		</td>
		<td onclick="fnSelData('18');">
			<img src="${pageContext.request.contextPath}/images/icons/18.png" class="center" alt="양방향 점선"/>
		</td>
	</tr>
	<tr>
		<th rowspan="2" class="center">RING B</th>
		<td class="center">4</td>
		<td class="center">3</td>
		<td class="center">2</td>
		<td class="center">1</td>
		<td class="center">17</td>
		<td class="center">18</td>
	</tr>
	<tr class="pointer">
		<td onclick="fnSelData('4');">
			<img src="${pageContext.request.contextPath}/images/icons/4.png" class="center" alt="아래"/>
		</td>
		<td onclick="fnSelData('3');">
			<img src="${pageContext.request.contextPath}/images/icons/3.png" class="center" alt="위 왼쪽"/>
		</td>
		<td onclick="fnSelData('2');">
			<img src="${pageContext.request.contextPath}/images/icons/2.png" class="center" alt="오른쪽"/>
		</td>
		<td onclick="fnSelData('1');">
			<img src="${pageContext.request.contextPath}/images/icons/1.png" class="center" alt="왼쪽 아래"/>
		</td>
		<td onclick="fnSelData('17');">
			<img src="${pageContext.request.contextPath}/images/icons/17.png" class="center" alt="양방향 점선"/>
		</td>
		<td onclick="fnSelData('18');">
			<img src="${pageContext.request.contextPath}/images/icons/18.png" class="center" alt="양방향 점선"/>
		</td>
	</tr>
	<tr>
		<td colspan="7" class="center">
			<input type="text" name="rtnVal" id="rtnVal" size="60" readonly/>
			<input type="hidden" name="rtnId" id="rtnId" size="20"/>
		</td>
	</tr>
	<tr>
		<td colspan="7">
		<strong class="icon_must">*</strong>이동류 번호 중,<br/>
		차량신호 없이 보행신호만 나올 경우 17번으로 사용하고<br/>
		차량신호와 보행신호가 함께 표출될 경우 18번으로 사용<br/>
		(보행신호의 방향과 이동류 번호는 상관이 없음)
		</td>
	</tr>
	<tr>
		<td colspan="7" class="center">
			<a href="javascript:fnResetSignal();" id="resetSignal" class="btn_redStyle02">다시</a>
			<a href="javascript:fnSetSignal();" id="setSignal" class="btn_grayStyle02">적용</a>
		</td>
	</tr>
</table>
</div>
