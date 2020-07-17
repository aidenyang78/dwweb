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
<script src="${pageContext.request.contextPath}/common/plugins/printThis.js"></script>

<script type="text/javascript">
	
$(document).ready(function(){
	
	//listTitle 처리
	var districtNm = "평택시";
	var listTitle = "";
	var subTitle = "";
	
	if('${crossroadInfoVo.polDistrict}' == '1002'){
		districtNm += " 서부"; 
	}else if('${crossroadInfoVo.polDistrict}' == '1003'){
		districtNm += " 남부";
	}else if('${crossroadInfoVo.polDistrict}' == '1004'){
		districtNm += " 북부";
	}
	
	if('${crossroadInfoVo.routeCd}' == ''){
		listTitle = districtNm + " 전체 교차로 관리";
	}else{
		subTitle = $(".sub_list_on").find('span').text().replace("■",""); 
		listTitle = districtNm + subTitle + " 교차로 관리";
	}
	$("#listTitle").text(listTitle);
	
	$("#s_crossroadNm").keydown(function(e){
		//alert(e.keyCode);
		if(e.keyCode == '13'){
			fnSearch();
		}
	})
		
});


//도로(국도) 추가
function fnAddRouteInfo(){
	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}/routeinfo/insertRouteInfo.do");
	$("#frm").submit();
}

//도로(국도) 수정
function fnUpdateRouteInfo(){
	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}/routeinfo/updateRouteInfo.do");
	$("#frm").submit();
}

//도로(국도) 삭제
function fnDeleteRouteInfo(){
	var msg = "도로(국도) 삭제 시 해당 도로(국도)의 교차로의 정보도 함께 삭제 됩니다."
	if(confirm(msg)){
		$("#frm").attr("method","post");
		$("#frm").attr("action","${pageContext.request.contextPath}/routeinfo/deleteRouteInfoAct.do");
		$("#frm").submit();
	}
}

//교차로 추가
function fnAddCrossroadInfo(){
	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}/crossroadinfo/insertCrossroadInfo.do");
	$("#frm").submit();
}

//교차로 수정
function fnUpdate(seq){
	$("#crossroadSeq").val(seq);
	
	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}/crossroadinfo/updateCrossroadInfo.do");
	$("#frm").submit();
}

//교차로 삭제
function fnDelete(seq){
	if(confirm("삭제하시겠습니까?")){
	
		$("#crossroadSeq").val(seq);
		
		$("#frm").attr("method","post");
		$("#frm").attr("action","${pageContext.request.contextPath}/crossroadinfo/deleteCrossroadInfo.do");
		$("#frm").submit();
	}

	return;
}

function fnSearchRoute(districtCd,routeCd){
	$("#s_polDistrict").val(districtCd);
	$("#s_routeCd").val(routeCd);
	$("#s_crossroadNm").val('');
	$("#pageNo").val('');
	
	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}/crossroadinfo/listCrossroadInfo.do");
	$("#frm").submit();
}

function fnSearch(){

	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}/crossroadinfo/listCrossroadInfo.do");
	$("#frm").submit();
}

function fnUpdateLatlng(seq){
	
	alert('지도 연동');
	return;
	
	/* var lat = $("#lat"+seq).val();
	var lng = $("#lng"+seq).val();
	
	if(lat != "" && lng == ""){
		var latlng = lat.split(",");
		
		lat = latlng[0];
		lng = latlng[1];
	}
	
	
	$("#seq").val(seq);
	$("#lat").val(lat);
	$("#lng").val(lng);	
	
	
	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}/crossroadinfo/updateCrossroadInfoAct.do");
	$("#frm").submit(); */
}

</script>
<body onLoad="fnPreloadImages('${pageContext.request.contextPath}/images/img/icon_signal_over.png','${pageContext.request.contextPath}/images/img/icon_setting_over.png','${pageContext.request.contextPath}/images/img/icon_chart_over.png')">
<form name="frm" id="frm">
<input type="hidden" name="pageNo" id="pageNo" value="${param.pageNo}"/>
<input type="hidden" name="menuSeq" id="menuSeq" value="${param.menuSeq}"/>
<input type="hidden" name="s_polDistrict" id="s_polDistrict" value="${param.s_polDistrict}"/>
<input type="hidden" name="s_routeCd" id="s_routeCd" value="${param.s_routeCd}"/>
<input type="hidden" name="crossroadSeq" id="crossroadSeq" />
<input type="hidden" name="seq" id="seq" />
<input type="hidden" name="lat" id="lat"/>
<input type="hidden" name="lng" id="lng"/>
<input type="hidden" name="rtnUrl" id="rtnUrl" value="listCrossroadInfo.do"/>
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
                                                left 제목 입니다.
                                        </td>
                                        <td width="17" height="53" background="${pageContext.request.contextPath}/images/img/content_bg_crop_top_right.png"></td>
                                    </tr>
                                    
                                    <tr align="left" valign="top">
                                        <td width="21" background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_left.png" ></td>                                        
                                        
                                        <!--크기를 넣는다면 다음과 같이 넣어주세요
                                          <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="200">
                                        -->
<!-- //left drop down -->                                        
			                             <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="220px">
											<div  style="min-height:926px;">
											    <ul>
											        <li class="menu">
											            <a href="javascript:fnSearchRoute('1002','');"><span id="list1002" data-districtCd='1002' class="top_list<c:if test='${crossroadInfoVo.polDistrict eq "1002"}'>_on</c:if>">평택시 서부</span></a>
											            <ul <c:if test='${crossroadInfoVo.polDistrict ne "1002"}'>class="hide"</c:if>>
												            <c:forEach var="list1002" items="${listroute}" varStatus="st">
																<c:if test='${list1002.polDistrict eq "1002" }'>
																	<li id="${list1002.polDistrict}${list1002.seq}" class="sub_list<c:if test='${list1002.seq eq param.s_routeCd}'>_on</c:if> pointer" onclick="fnSearchRoute('${list1002.polDistrict}','${list1002.seq}');">
																		<span>■ ${list1002.routeNm}</span>
																	</li>
																</c:if>
															</c:forEach>
											            </ul>
											        </li>
											        <li class="menu">
											            <a href="javascript:fnSearchRoute('1003','');"><span id="list1003" data-districtCd='1003' class="top_list<c:if test='${crossroadInfoVo.polDistrict eq "1003"}'>_on</c:if>">평택시 남부</span></a>
											            <ul <c:if test='${crossroadInfoVo.polDistrict ne "1003"}'>class="hide"</c:if>>
											             <c:forEach var="list1003" items="${listroute}" varStatus="st">
															<c:if test='${list1003.polDistrict eq "1003" }'>
																<li id="${list1003.polDistrict}${list1003.seq}"  class="sub_list<c:if test='${list1003.seq eq param.s_routeCd}'>_on</c:if> pointer" onclick="fnSearchRoute('${list1003.polDistrict}','${list1003.seq}');">
																	<span>■ ${list1003.routeNm}</span>
																</li>
															</c:if>
														</c:forEach>
											            </ul>
											        </li>
											        
											         <li class="menu">
											            <a href="javascript:fnSearchRoute('1004','');"><span id="list1004" data-districtCd='1004' class="top_list<c:if test='${crossroadInfoVo.polDistrict eq "1004"}'>_on</c:if>">평택시 북부</span></a>
											            <ul <c:if test='${crossroadInfoVo.polDistrict ne "1004"}'>class="hide"</c:if>> 
														<c:forEach var="list1004" items="${listroute}" varStatus="st">
															<c:if test='${list1004.polDistrict eq "1004" }'>
																<li id="${list1004.polDistrict}${list1004.seq}"  class="sub_list<c:if test='${list1004.seq eq param.s_routeCd}'>_on</c:if> pointer" onclick="fnSearchRoute('${list1004.polDistrict}','${list1004.seq}');">
																	<span>■ ${list1004.routeNm}</span>
																</li>
															</c:if>
														</c:forEach>
											            </ul>
											        </li>
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
                                        <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="1480">
                                        
<!-- contents -->
<!-- 검색 영역 -->
											<table width="100%">
												<colgroup>
													<col width="280px" />
													<col width="*" />
													<col width="280px" />
												</colgroup>
												<tr>
													<th colspan="3"></th>
												</tr>
												<tr>
													<th colspan="3" class="h2_title_b center">
														<span id="listTitle">교차로 관리</span>
													</th>
												</tr>
												<tr>
													<td colspan="2" class="left">
														<a href="javascript:fnAddRouteInfo();" class="btn_whiteStyle02">도로(국도) 추가</a>
												<c:if test='${param.s_polDistrict ne null}'>
													<c:if test='${param.s_routeCd ne null and param.s_routeCd ne ""}'>
														<a href="javascript:fnUpdateRouteInfo();" class="btn_whiteStyle02">도로(국도) 수정</a>
														<a href="javascript:fnDeleteRouteInfo();" class="btn_redStyle03">도로(국도) 삭제</a>
													</c:if>
												</c:if>
													</td>
													<td class="right">
												<c:if test='${param.s_routeCd ne null and param.s_routeCd ne ""}'>
														<a href="javascript:fnAddCrossroadInfo();" class="btn_whiteStyle02">교차로 추가</a>
												</c:if>
													</td>
												</tr>
												<tr>
													<td class="bbs_search">
													<!-- 앞 영역 -->
													</td>
													<td class="bbs_search">
														<label for="s_crossroadNm">교차로명 : </label>
														<input type="text" name="s_crossroadNm" id="s_crossroadNm" value="${param.s_crossroadNm}" size="40"/>
														<a href="javascript:;" onclick="javascript:fnSearch();" class="btn_search">검색</a>
													</td>
													<td class="bbs_search right">
													</td>
												</tr>
												<tr>
													<th colspan="3" style="height:20px;"></th>
												</tr>
											</table>
<!-- 검색 영역 -->									
											<table class="tb_list">
												<colgroup>
													<col width="4%"/>
													<col width="15%"/>
													<col width="15%"/>
													<col width="*"/>
													<col width="15%"/>
													<!-- <col width="13%"/>
													<col width="13%"/> -->
													<!-- <col width="14%"/> -->
													<col width="20%"/>
												</colgroup>
												<tbody>
													<tr>
														<th>No</th>
														<th>지구</th>
														<th>도로명</th>
														<th>교차로명</th>
														<th>연계 교차로명</th>
														<!-- <th>위도</th>
														<th>경도</th> -->
														<th>기능</th>
													</tr>
												<c:forEach var="list" items="${listcrossroad}" varStatus="st">
													<tr>
														<td class="center">${cntNo-st.index}</td>
														<td>
															<a href="javascript:fnUpdate('${list.seq}');" >
															<c:choose>
																<c:when test='${list.polDistrict eq "1001"}'>평택시 동부</c:when>
																<c:when test='${list.polDistrict eq "1002"}'>평택시 서부</c:when>
																<c:when test='${list.polDistrict eq "1003"}'>평택시 남부</c:when>
																<c:when test='${list.polDistrict eq "1004"}'>평택시 북부</c:when>
																<c:otherwise>평택시</c:otherwise>
															</c:choose>
															</a>
														</td>
														<td>
															<a href="javascript:fnUpdate('${list.seq}');" >${list.routeNm}</a>
														</td>
														<td>
															<a href="javascript:fnUpdate('${list.seq}');" >${list.crossroadNm}</a>
														</td>
														<%-- <td>
															<input type="text" name="lat${list.seq}" id="lat${list.seq}" value="${list.lat}" />
														</td>
														<td>
															<input type="text" name="lng${list.seq}" id="lng${list.seq}" value="${list.lng}" />
														</td> --%>
														<td>
															${list.linkedNm}
														</td>
														<td>
															<a href="javascript:fnUpdateLatlng('${list.seq}');" class="btn_grayStyle01">좌표수정</a>
															<a href="javascript:fnUpdate('${list.seq}');" class="btn_grayStyle01">수정</a>
															<a href="javascript:fnDelete('${list.seq}');" class="btn_redStyle01">삭제</a>
														</td>
													</tr>
												</c:forEach>
													<tr>
														<td colspan="6" style="border:none;">
															<div class="paging" style="padding:10px !important;">
																${pageing}
															</div>
														</td>
													</tr>
												</tbody>
											</table>
											
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

