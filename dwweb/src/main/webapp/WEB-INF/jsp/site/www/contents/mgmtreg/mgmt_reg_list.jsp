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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//신호관리대장 추가
	$("#addDocument").click(function(){		
		$("#frm").attr("method","post");
		$("#frm").attr("action","${pageContext.request.contextPath}/mgmtreg/insertMgmtReg.do");
		$("#frm").submit();
	})
	
	//검색 조건 변경 처리
	$("#keyKind").change(function(){
		fnKeyKindChange();
	})
});

//검색
function fnSearch(){
	$("#pageNo").val('');
	$("#frm").attr("action","${pageContext.request.contextPath}/mgmtreg/listMgmtReg.do");
	$("#frm").attr("method","get");
	$("#frm").submit();
}

function fnQuickSearch(code){
	$("#searchDistrict").val(code).attr("selected","selected");
	fnSearch();
}

function fnUpdateMgmtReg(mgmtSeq){
	$("#mgmtSeq").val(mgmtSeq);
	$("#frm").attr("action","${pageContext.request.contextPath}/mgmtreg/updateMgmtReg.do");
	$("#frm").attr("method","post");
	$("#frm").submit();
}

//삭제
function fndeleteMgmtReg(mgmtSeq){
	//alert(mgmtSeq + " : 삭제 ");
	if(confirm('삭제 하시겠습니까?')){
		$("#mgmtSeq").val(mgmtSeq);
		$("#frm").attr("action","${pageContext.request.contextPath}/mgmtreg/deleteMgmtRegAct.do");
		$("#frm").attr("method","post");
		$("#frm").submit();
		
	}
}

</script>

</head>
<body onLoad="fnPreloadImages('${pageContext.request.contextPath}/images/img/icon_map_over.png','${pageContext.request.contextPath}/images/img/icon_signal_over.png','${pageContext.request.contextPath}/images/img/icon_chart_over.png')">
<form name="frm" id="frm">
<input type="hidden" name="pageNo" id="pageNo" value="${param.pageNo}"/>
<input type="hidden" name="menuSeq" id="menuSeq" value="${param.menuSeq}"/>
<input type="hidden" name="mgmtSeq" id="mgmtSeq" />

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
<!-- //contents -->
									<table  border="0" cellpadding="0" cellspacing="0">

										<tr>
											<th width="60px;"></th>
											<th class="h2_title_b center">신호관리대장</th>
											<th width="60px;"></th>
										</tr>										
										<tr>
											<th width="60px;"></th>
											<th class="right">
												<a href="javascript:;" id="addDocument" class="btn_whiteStyle02">신호관리대장 추가</a>
											</th>
											<th width="60px;"></th>
										</tr>									
																			
										<tr>
											<th></th>
											<td class="bbs_search">
												<select name="searchDistrict" id="searchDistrict">
													<option value="" <c:if test='${param.searchDistrict eq ""}'>selected</c:if> >::: 지구선택 :::</option>
													<%-- <option value="1001" <c:if test='${param.polDistrict eq "1001"}'>selected</c:if>>동부</option> --%>
													<option value="1002" <c:if test='${param.searchDistrict eq "1002"}'>selected</c:if>>서부</option>
													<option value="1003" <c:if test='${param.searchDistrict eq "1003"}'>selected</c:if>>남부</option>
													<option value="1004" <c:if test='${param.searchDistrict eq "1004"}'>selected</c:if>>북부</option>
												</select>
												<select name="keyKind" id="keyKind">
													<option value="" <c:if test='${param.keyKind eq ""}'>selected</c:if>>::::: 선택 :::::</option>
													<option value="routeNm" <c:if test='${param.keyKind eq "roadNm"}'>selected</c:if>>도로명</option>
													<option value="crossroadNm" <c:if test='${param.keyKind eq "crossroadNm"}'>selected</c:if>>설치위치</option>
												</select>
												<input type="text" name="keyWord" id="keyWord" size="60" maxlength="60" value="${param.keyWord}" />
											
												<a href="javascript:;" onclick="javascript:fnSearch();" class="btn_search">검색</a>
											</td>
											<td></td>
										</tr>
										<tr>
											<td colspan="3" height="10px"></td>
										</tr>

									<tr>
										<td width="60px"></td>
										<td>
											<table width="100%">
												<tr>
													<td>
													<c:choose>
														<c:when test='${param.searchDistrict eq null or param.searchDistrict eq ""}'>
															<span class="btn_status_select pointer" onclick="fnQuickSearch('');">전체</span>
														</c:when>
														<c:otherwise>
															<span class="btn_status_all pointer" onclick="fnQuickSearch('');">전체</span>
														</c:otherwise>
													</c:choose>
													<%-- <c:choose>
														<c:when test='${param.searchDistrict eq "1001"}'>
															<span class="btn_status_select pointer" onclick="fnQuickSearch('1001');">동부</span>
														</c:when>	
														<c:otherwise>
															<span class="btn_status_all pointer" onclick="fnQuickSearch('1001');">동부</span>
														</c:otherwise>
													</c:choose> --%>
													<c:choose>
														<c:when test='${param.searchDistrict eq "1002"}'>
															<span class="btn_status_select pointer" onclick="fnQuickSearch('1002');">서부</span>
														</c:when>	
														<c:otherwise>
															<span class="btn_status_all pointer" onclick="fnQuickSearch('1002');">서부</span>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test='${param.searchDistrict eq "1003"}'>
															<span class="btn_status_select pointer" onclick="fnQuickSearch('1003');">남부</span>
														</c:when>	
														<c:otherwise>
															<span class="btn_status_all pointer" onclick="fnQuickSearch('1003');">남부</span>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test='${param.searchDistrict eq "1004"}'>
															<span class="btn_status_select pointer" onclick="fnQuickSearch('1004');">북부</span>
														</c:when>	
														<c:otherwise>
															<span class="btn_status_all pointer" onclick="fnQuickSearch('1004');">북부</span>
														</c:otherwise>
													</c:choose>
													</td>
													<td width="200px" class="right">총 <strong>${totCnt}</strong>건 검색</td>
												</tr>
											</table>
										</td>
										<td width="60px"></td>
									</tr>
																			
										<tr align="left" valign="top">
											<td width="60px;"></td>
			<!-- //데이터 영역 -->								
											<td width="*" height="80%">
												<table width="100%" class="tb_list">
													<tr>
														<th width="5%" class="th">No</th>
														<th width="10%"  class="th">지구</th>
														<th width="30%"  class="th">도로(국도)명</th>
														<th width="30%"  class="th">설치위치(교차로)</th>
														<th width="10%"  class="th">설치일자</th>
														<th width="*"  class="th">기능</th>
													</tr>
												<c:forEach var="list" items="${listmgmt}" varStatus="status">
													<tr class="pointer" onclick="fnUpdateMgmtReg('${list.mgmtSeq}');">
														<td class="td center">${cntNo-status.index}</td>
														<td class="td">
															<c:choose>
																<c:when test='${list.polDistrict eq "1001" }'>동부</c:when>
																<c:when test='${list.polDistrict eq "1002" }'>서부</c:when>
																<c:when test='${list.polDistrict eq "1003" }'>남부</c:when>
																<c:when test='${list.polDistrict eq "1004" }'>북부</c:when>
															</c:choose>
														</td>
														<td class="td">${list.routeNm}</td>
														<td class="td">${list.crossroadNm}</td>
														<td class="td center">${list.installDate}</td>
														<td class="td center">
															<a href="javascript:;" onclick="fnUpdateMgmtReg('${list.mgmtSeq}');" class="btn_grayStyle01">수정</a>
															<a href="javascript:;" onclick="fndeleteMgmtReg('${list.mgmtSeq}');" class="btn_redStyle01">삭제</a>
														</td>
													</tr>
												</c:forEach>
												</table>
<!-- //데이터 영역 -->
											</td>			
											<td width="60px;"></td>
										</tr>
<!-- //페이징 -->							
									<tr>
										<td width="60px"></td>
										<td>
											<div class="paging">
												${pageing}
											</div>
										</td>
										<td width="60px"></td>
									</tr>
<!-- 페이징// -->

								</table>
<!-- contents// -->
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