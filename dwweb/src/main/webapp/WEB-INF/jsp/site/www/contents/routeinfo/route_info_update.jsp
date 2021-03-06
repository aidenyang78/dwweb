<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>교통 신호등 시설물 통합관리 시스템 || 도로(국도) 관리</title>

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
	//실행
});

//지구 변경
function fnPolDistrict(val){
	
	if(val != ""){
		$("#s_polDistrict").val(val);
	}else{
		$("#s_polDistrict").val('${param.s_polDistrict}');
	}
}

//도로명 중복 확인
function fnRouteNmCheck(){
	
	var polDistrict = $("#polDistrict").val();
	var routeNm = $("#routeNm").val();
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/routeinfo/routeNmCheckAjax.do";
	var strParam = "polDistrict=" + polDistrict + "&routeNm=" + routeNm;

	if('${routeInfo.routeNm}' != routeNm){
		
		var $json = getJsonData(strMethod, strUrl, strParam);
		
		$("#dupCnt").val($json.cnt);
	
	 	if ($json.cnt == 0) {
			$("#nmChkTxtSpan").html("사용가능");
			$("#nmChkTxtSpan").attr('class', 'color_point_1');
		} else {
			$("#nmChkTxtSpan").html("사용불가(중복)");
			$("#nmChkTxtSpan").attr('class', 'color_point_2');
		}
	}else{
		$("#dupCnt").val('0');
	}
}


//도로명 중복 확인
function fnDistrictChange(){
	
	var polDistrict = $("#polDistrict").val();
	var txtPolDistrict = $("#polDistrict option:selected").text();
	var routeNm = $("#routeNm").val();
	var rtnResult = false;
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/routeinfo/routeNmCheckAjax.do";
	var strParam = "polDistrict=" + polDistrict + "&routeNm=" + routeNm;
		
	var $json = getJsonData(strMethod, strUrl, strParam);
	
	if($json.cnt > 0){
		alert(txtPolDistrict + " 지구 " + routeNm +" 은(는) 이미 등록 된 도로명 입니다.");
	}else{
		rtnResult = true; 
	}
	
	return rtnResult;
}


//리스트
function fnGoList(){
	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}/crossroadinfo/listCrossroadInfo.do");
	$("#frm").submit();
}

function fnUpdateAct(){
	
	//지구가 변경 되었을 경우 처리
	if($("#polDistrict").val() != '${routeInfo.polDistrict}'){
		if(!fnDistrictChange()){
			return;
		}
	}
	
	if(stringUtil.isEmpty($("#polDistrict").val())){
		alert('지구를 선택 하세요.');
		return;
	}
	
	if(stringUtil.isEmpty($("#routeNm").val())){
		alert('도로(국도)명을 입력해 하세요.');
		return;
	}
	
	if($("#dupCnt").val() > 0){
		alert($("#routeNm").val() + ' 은(는) 이미 등록 된 도로명 입니다.');
		//$("#routeNm").val('');
		$("#routeNm").focus();
		return;
	}
	
	
	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}/routeinfo/updateRouteInfoAct.do");
	$("#frm").submit();
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
												도로(국도) 수정
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
																<select name="polDistrict" id="polDistrict" onchange="fnPolDistrict(this.value);">
																	<option value="" <c:if test='${routeInfo.polDistrict eq ""}'>selected</c:if>>::: 지구선택 :::</option>
																	<option value="1002" <c:if test='${routeInfo.polDistrict eq "1002"}'>selected</c:if>>서부</option>
																	<option value="1003" <c:if test='${routeInfo.polDistrict eq "1003"}'>selected</c:if>>남부</option>
																	<option value="1004" <c:if test='${routeInfo.polDistrict eq "1004"}'>selected</c:if>>북부</option>
																</select>
															</td>
															<th><strong class="icon_must">*</strong>도로(국도)명</th>
															<td>
																<input type="text" name="routeNm" id="routeNm" size="40" value="${routeInfo.routeNm}" onkeyup="fnRouteNmCheck();" onfocusout="fnRouteNmCheck();"/>
																<span id="nmChkTxtSpan" class="color_point_1">중복확인</span>
															</td>														
														</tr>
														
														
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
												<a href="javascript:fnUpdateAct();" class="btn_round_type_6">등록</a>
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
</body>
</html>