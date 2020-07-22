<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/Base.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/ui-lightness/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/jquery-ui.min.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script> --%>
<script type="text/javascript">
function fnInsChangeDistrict(){
	$("#popKeyword").val('');
	$("#keywordSearch").addClass('hide');
	
	$("#insCrossroadNm").removeClass('input_red');
	
	fnInsSetRouteList();
}

//도로(국도)명 조회
function fnInsSetRouteList(){
	var insPolCd = $("#insPolCd").val();
	var insPolDistrict = $("#insPolDistrict").val();
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/routeinfo/selectRouteListAjax.do";
	var strParam = "polCd=" + insPolCd +"&polDistrict="+insPolDistrict;
	
	var $json = getJsonData(strMethod, strUrl, strParam);
	var totCnt = $json.totCnt;
	
	if(totCnt > 0){
		inHtml = "&nbsp;<select name='insRouteCd' id='insRouteCd' style='min-width:240px;'>";
		inHtml += "<option value=''>:: 선택 ::</option>";
		for(var i=0;i<totCnt;i++){
			var seq = $json.listRoute[i].seq;
			var routeNm = $json.listRoute[i].routeNm;
			
			inHtml += "<option value='"+seq+"'>"+routeNm+"</option>";
		}
		inHtml += "</select>";
	}else{
		inHtml = "&nbsp;<select name='insRouteCd' id='insRouteCd' style='min-width:240px;'>";
		inHtml += "<option value=''>:: 검색된 도로명 없음 ::</option>";
		inHtml += "</select>";
		
		alert('조회가능한 도로명이 없습니다.');
	}
	
	$("#routeList").html(inHtml);
	
	$("#insCrossroadNm").removeClass('input_red');
}

function fnInsCrossroadLatlng(seq){
	var $result;
	var polCd = $("#insPolCd").val();
	var polDistrict = $("#insPolDistrict").val();
	var routeCd = $("#insRouteCd").val();
	var crossroadNm = $("#insCrossroadNm").val();
	var lat = $("#crossroadLat").val();
	var lng = $("#crossroadLng").val();
	
	if($("#insPolDistrict").val() == ""){
		alert('지구를 선택 하세요.');
		$("#insPolDistrict").focus();
		return;
	}
	if($("#insRouteCd").val() == ""){
		alert('도로(국도)를 선택 하세요.');
		$("#insRouteCd").focus();
		return;
	}
	if($("#insCrossroadNm").val() == ""){
		alert('교차로명을 입력하세요.');
		$("#insCrossroadNm").focus();
		return;
	}
	
	if($("#insDupCnt").val() > 0){
		alert($("#insCrossroadNm").val() + ' 은(는) 이미 등록 된 교차로 입니다.');
		$("#insCrossroadNm").val('');
		$("#insCrossroadNm").focus();
		$("#insCrossroadNm").removeClass('input_red');
		return;
	}
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/main/insertCrossroadLaglngAjax.do";
	var strParam = "polCd=" + polCd + "&polDistrict=" + polDistrict + "&routeCd="+routeCd+"&crossroadNm="+crossroadNm+"&lat="+lat+"&lng="+lng;
	
	var $json = getJsonData(strMethod, strUrl, strParam);
	
	$result = $json.result;
	if($result != 0){
		//make crossroad info pop
		$(".leaflet-popup").addClass('hide');
		
		$("#routeCd").val($result.routeCd);
		$("#crossroadSeq").val($result.seq);
		
		fnSelRoute($result.routeCd, $result.lat, $result.lng, 15);
		
		/* 등록이 완료 되었을 때 도로리스트 실시간 반영 필요 */
	}else{
		alert('교차로 등록 실패.');
	}
}

//교차로명 중복 확인
function fnInsCrossroadNmCheck(){
	var polDistrict = $("#insPolDistrict").val();
	var routeCd = $("#insRouteCd").val();
	var crossroadNm = $("#insCrossroadNm").val();
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/crossroadinfo/crossroadNmCheckAjax.do";
	var strParam = "polDistrict=" + polDistrict + "&routeCd=" + routeCd + "&crossroadNm=" + crossroadNm;

	var $json = getJsonData(strMethod, strUrl, strParam);
	
	$("#insDupCnt").val($json.cnt);

 	if ($json.cnt == 0) {
		/* $("#nmChkTxtSpan").html("사용가능");
		$("#nmChkTxtSpan").attr('class', 'color_point_1'); */
 		$("#insCrossroadNm").removeClass('input_red');
	} else {
		/* $("#nmChkTxtSpan").html("사용불가(중복)");
		$("#nmChkTxtSpan").attr('class', 'color_point_2 strong'); */
		$("#insCrossroadNm").addClass('input_red');
	}
}

</script>
</head>
<body>
<form name="insfrm" id="insfrm" method="post" onsubmit="return false">
<%-- <input type="text" name="insPolCd" id="insPolCd" value="${insPolCd}"/>
<input type="text" name="insPolNm" id="insPolNm" value="${insPolNm}"/> --%>
<input type="hidden" name="insPolCd" id="insPolCd" value="${param.insPolCd}"/>
<input type="hidden" name="insPolNm" id="insPolNm" value="${param.insPolNm}"/>
<input type="hidden" name="insDupCnt" id="insDupCnt" />

<div id="insertCrossroadContent" >
	<div id="selectSearch">
		<table class="pop_reg_tb_list">
			<colgroup>
				<col width="80px"/>
				<col width="*"/>
			</colgroup>
			<tbody>
			<tr>
				<th class="center">지구</th>
				<td>&nbsp;<select name="insPolDistrict" id="insPolDistrict" style='min-width:240px;' onchange='fnInsChangeDistrict();'>
						<option value="" <c:if test='${param.insPolDistrict eq ""}'>selected</c:if>>선택</option>
						<!-- <option value="1001">동부</option> -->
						<option value="1002" <c:if test='${param.insPolDistrict eq "1002"}'>selected</c:if>>서부</option>
						<option value="1003" <c:if test='${param.insPolDistrict eq "1003"}'>selected</c:if>>남부</option>
						<option value="1004" <c:if test='${param.insPolDistrict eq "1004"}'>selected</c:if>>북부</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="center">도로(국도)</th>
				<td>
					<span id="routeList">&nbsp;<select name="insRouteCd" id="insRouteCd" style='min-width:240px;'>
							<option value="">지구를 선택 하세요.</option>
						</select>
					</span>
				</td>
			</tr>
			<tr>
				<th class="center">교차로</th>
				<td>
					&nbsp;<input type="text" name="insCrossroadNm" id="insCrossroadNm" style='min-width:228px;' onkeyup="fnInsCrossroadNmCheck(this)"/>
					<!-- <span id="nmChkTxtSpan" class="color_point_1">중복확인</span> -->
				</td>
			</tr>
			<tr>
				<td colspan="2" class="center" style="border:none;">
					<span class='btn_whiteStyle05 pointer' style='vertical-align:bottom;' onclick='fnInsCrossroadLatlng();'>적용</span>					
				</td>
			</tr>
			</tbody>
		</table>
	</div>
</div>
</form>
</body>
</html>