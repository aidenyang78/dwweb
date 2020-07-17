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
function fnKeywordSearch(){
	$("#keywordSearch").removeClass('hide');
	$('#crdPolDistrict').val('');
	$('#crdRouteCd').val('');
	$('#crdSeq').val('');
	
	if($("#popKeyword").val() == ""){
		alert("교차로명을 입력하세요.");
		$("#popKeyword").focus();
		return;
	}

	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/main/selectMatchingLatlngAjax.do";
	var strParam = "keyWord="+$("#popKeyword").val();
	
	var $json = getJsonData(strMethod, strUrl, strParam);
	var totCnt = Object.keys($json.result).length;

	resultHtml = ""
		+"<table class='pop_tb_list'>"
		+"<colgroup>"
		+"	<col width='*'/>"
		+"	<col width='68px'/>"
		+"</colgroup>"
		+"<tbody>";
		
	if(totCnt > 0 ){
		for(var i=0;i<totCnt;i++){
			resultHtml += "<tr>";
			
			if($json.result[i].lat == "" || $json.result[i].lng == ""){
				resultHtml += "	<th class='left pointer red' onclick='fnUpdateLatlng("+$json.result[i].seq+");'>"+$json.result[i].crossroadNm+"</th>";
			}else{
				resultHtml += "	<th class='left pointer' onclick='fnUpdateLatlng("+$json.result[i].seq+");'>"+$json.result[i].crossroadNm+"</th>";
			}
			
			resultHtml += "	<td class='center'>";
			resultHtml += "		<span class='btn_whiteStyle05 pointer' onclick='fnUpdateLatlng("+$json.result[i].seq+");'>적용</span>";
			resultHtml += "	</td>";
			resultHtml += "</tr>";
		}
	}else{
		resultHtml += "<tr>";
		resultHtml += "	<th colspan='2' class='center'>결과 없음.</th>";
		resultHtml += "</tr>";
	}
		
		resultHtml += "</table>";
				
	$("#keywordSearch").html(resultHtml);
	//$("#crossloadApplyBtn").html('');
	$("#crossloadApplyBtn").addClass('hide');
}

function fnChangeDistrict(){
	$("#popKeyword").val('');
	$("#keywordSearch").addClass('hide');
	
	fnSetRouteList();
}

//도로(국도)명 조회
function fnSetRouteList(){
	var crdPolCd = $("#crdPolCd").val();
	var crdPolDistrict = $("#crdPolDistrict").val();
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/routeinfo/selectRouteListAjax.do";
	var strParam = "polCd=" + crdPolCd +"&polDistrict="+crdPolDistrict;
	
	var $json = getJsonData(strMethod, strUrl, strParam);
	var totCnt = $json.totCnt;
	
	if(totCnt > 0){
		inHtml = "&nbsp;<select name='crdRouteCd' id='crdRouteCd' onchange='fnSetCrossroadList()' style='min-width:240px;'>";
		inHtml += "<option value=''>:: 선택 ::</option>";
		for(var i=0;i<totCnt;i++){
			var seq = $json.listRoute[i].seq;
			var routeNm = $json.listRoute[i].routeNm;
			
			inHtml += "<option value='"+seq+"'>"+routeNm+"</option>";
		}
		inHtml += "</select>";
	}else{
		inHtml = "&nbsp;<select name='crdRouteCd' id='crdRouteCd' onchange='fnSetCrossroadList()' style='min-width:240px;'>";
		inHtml += "<option value=''>:: 검색된 도로명이 없음 ::</option>";
		inHtml += "</select>";
		
		alert('조회가능한 도로명이 없습니다.');
	}
	
	$("#crossloadApplyBtn").removeClass('hide');
	$("#routeList").html(inHtml);
}

//교차로명
function fnSetCrossroadList(){
	var inHtml = "";
	var inBtHtml = "";
	
	var crdPolCd = $("#crdPolCd").val();
	var crdPolDistrict = $("#crdPolDistrict").val();
	var crdRouteCd = $("#crdRouteCd").val();
	
	//선택된 도로명 초기화 
	$("#crossroadNm").val('');
	$("#lat").val('');
	$("#lng").val('');
	
	//도로명 리스트 생성
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/crossroadinfo/selectCrossroadListAjax.do";
	var strParam = "polCd=" + crdPolCd +"&polDistrict="+crdPolDistrict+"&routeCd="+crdRouteCd;
	
	var $json = getJsonData(strMethod, strUrl, strParam);
	var totCnt = $json.totCnt;
	
	if(totCnt > 0){
		inHtml = "&nbsp;<select name='crdSeq' id='crdSeq' style='min-width:240px;'>";
		inHtml += "<option value=''>:: 선택 ::</option>";
		
		for(var i=0;i<totCnt;i++){
			var seq = $json.listCrossroad[i].seq;
			var crossroadNm = $json.listCrossroad[i].crossroadNm;
			var lat = $json.listCrossroad[i].lat;
			var lng = $json.listCrossroad[i].lng;
			
			inHtml += "<option value='"+seq+"' data-lat='"+lat+"' data-lng='"+lng+"'>"+crossroadNm+"</option>";
		}
		inHtml += "</select>";
	}else{
		inHtml = " <select name='crdSeq' id='crdSeq' style='min-width:240px;'>";
		inHtml += "<option value=''>:: 검색된 도로명이 없음 ::</option>";
		inHtml += "</select>";
		
		alert('조회가능한 도로명이 없습니다.');
	}
	
	$("#crossloadApplyBtn").removeClass('hide');
	$("#crossroadList").html(inHtml);
}


function fnUpdateLatlng(seq){
	var crdSeq = seq;
	var $result;
	
	var crossroadLat = $("#crossroadLat").val();
	var crossroadLng = $("#crossroadLng").val();

	if(crdSeq == "" || crdSeq == "0"){
		crdSeq = $("#crdSeq option:selected").val();
	}
	
	if(crdSeq == ""){
		alert('교차로를 선택 하세요');
		return;
	}
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/main/updateCrossroadLatLngAjax.do";
	var strParam = "crossroadSeq=" + crdSeq + "&crossroadLat=" + crossroadLat + "&crossroadLng="+crossroadLng;

	var $json = getJsonData(strMethod, strUrl, strParam);
	
	$result = $json.result;
	if($result != 0){
		//make crossroad info pop
		$(".leaflet-popup").addClass('hide');
		
		$("#routeCd").val($result.routeCd);
		$("#crossroadSeq").val($result.seq);
		
		fnSelRoute($result.routeCd, $result.lat, $result.lng, 15);
		
	}else{
		alert('좌표 수정에 실패 했습니다.');
	}
}

</script>
</head>
<body>
<form name="crdfrm" id="crdfrm" method="post" onsubmit="return false">
<input type="hidden" name="crdPolCd" id="crdPolCd" value="${param.crdPolCd}"/>
<input type="hidden" name="crdPolNm" id="crdPolNm" value="${param.crdPolNm}"/>
<div id="LatlngUpdateContent" >
	<div id="selectSearch">
		<table class="pop_tb_list">
			<colgroup>
				<col width="80px"/>
				<col width="*"/>
			</colgroup>
			<tbody>
			<tr>
				<td colspan="2" class="left">
					<input type="text" name="popKeyword" id="popKeyword" value="${param.popKeyword}" size="41" onkeyup="if(event.keyCode == '13'){fnKeywordSearch();}"/>
					<span onclick="fnKeywordSearch();" class="btn_blueStyle02 pointer">검색</span>
				</td>
			</tr>
			<tr>
				<th class="center">지구</th>
				<td>&nbsp;<select name="crdPolDistrict" id="crdPolDistrict" style='min-width:240px;' onchange='fnChangeDistrict();'>
						<option value="" <c:if test='${param.crdPolDistrict eq ""}'>selected</c:if>>선택</option>
						<!-- <option value="1001">동부</option> -->
						<option value="1002" <c:if test='${param.crdPolDistrict eq "1002"}'>selected</c:if>>서부</option>
						<option value="1003" <c:if test='${param.crdPolDistrict eq "1003"}'>selected</c:if>>남부</option>
						<option value="1004" <c:if test='${param.crdPolDistrict eq "1004"}'>selected</c:if>>북부</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="center">도로(국도)</th>
				<td>
					<span id="routeList">&nbsp;<select name="crdRouteCd" id="crdRouteCd" style='min-width:240px;'>
							<option value="">지구를 선택 하세요.</option>
						</select>
					</span>
				</td>
			</tr>
			<tr>
				<th class="center">교차로</th>
				<td>
					<span id="crossroadList">&nbsp;<select name="crdSeq" id="crdSeq" style='min-width:240px;'>
							<option value="">도로(국도)를 선택 하세요.</option>
						</select>
					</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="center" style="border:none;">
					<span id="crossloadApplyBtn">
						&nbsp;<span class='btn_whiteStyle05 pointer' style='vertical-align:bottom;' onclick='fnUpdateLatlng(0);'>적용</span>
					</span>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	<div id="keywordSearch"></div>
</div>
</form>
</body>
</html>