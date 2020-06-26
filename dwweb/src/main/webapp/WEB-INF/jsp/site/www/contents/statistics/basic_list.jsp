<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>교통 신호등 시설물 통합관리 시스템 || 시설물 장애</title>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/Base.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/ui-lightness/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){

});
//검색
function fnSearch(){
	$("#pageNo").val('');
	$("#frm").attr("actoin","${pageContext.request.contextPath}/management/listUser.do");
	$("#frm").attr("method","get");
	$("#frm").submit();
}

function fnQuickSearch(stat){
	//$("#fStatus > option[@value="+stat+"]").attr("selected","true");
	$("#fStatus").val(stat).attr("selected","selected");
	fnSearch();
}

//GIS맵 이동
function fnGoMap(strRoadNm){
	
	alert('연동 가능 할 경우  map으로 이동');	
}

</script>

</head>

<body onLoad="fnPreloadImages('${pageContext.request.contextPath}/images/img/icon_map_over.png','${pageContext.request.contextPath}/images/img/icon_signal_over.png','${pageContext.request.contextPath}/images/img/icon_chart_over.png')">
<form name="frm" id="frm">
<input type="hidden" name="pageNo" id="pageNo" value="${param.pageNo}"/>
<input type="hidden" name="menuSeq" id="menuSeq" value="${param.menuSeq}"/>
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
									<!-- <tr align="left" valign="top">
										<td width="10"></td>
										<td width="1746" height="45">left_top</td>
										<td width="7"></td>
									</tr> -->
									<tr>
										<th colspan="3" style="height:20px;"></th>
									</tr>
									<tr>
										<td width="60px"></td>
										<th class="h2_title_b center">시설물 장애</th>
										<td width="60px"></td>
									</tr>
									<tr>
										<th colspan="3" style="height:20px;"></th>
									</tr>
									<tr>
										<td width="60px"></td>
										<td class="bbs_search">
											<select name="fStatus" id="fStatus">
												<option value='' <c:if test="${param.fStatus eq '' }">selected</c:if>>::장애코드::</option>
											<c:forEach var="statusList" items="${listStatusGroup}" varStatus="st">
												<option value='${statusList.status}' <c:if test="${statusList.status eq param.fStatus}">selected</c:if>>${statusList.name}</option>
											</c:forEach>
											
											</select>
											<select name="keyKind" id="keyKind">
												<option value="" <c:if test="${param.keyKind eq '' }">selected</c:if>>::선택::</option>
												<option value="name" <c:if test="${param.keyKind eq 'name' }">selected</c:if>>교차로명</option>
											</select>
											
											<input type="text" name="keyWord" id="keyWord" size="60" maxlength="60" value="${param.keyWord}" />
										
											<a href="javascript:;" onclick="javascript:fnSearch();" class="btn_grayStyle01">검색</a>
											
											<!-- <a href="/dwweb/status/makeStatusData.do">데이터 생성</a> -->
										</td>
										<td width="60px"></td>
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
														<span class="btn_status_all pointer" onclick="fnQuickSearch('');">전체</span>
														<c:forEach var="liststatus" items="${listStatusGroup}" varStatus="st">
															<span class="btn_status_${liststatus.status} pointer" onclick="fnQuickSearch('${liststatus.status}');">
																${liststatus.name}
															</span>
														</c:forEach>
													</td>
													<td width="200px" class="right">총 <strong>${totErrCnt}</strong>건의 장애 발생 중</td>
												</tr>
											</table>
										</td>
										<td width="60px"></td>
									</tr>
									
									<tr align="left" valign="top">
										<td width="60px"></td>
										<td>
										
											<table width="100%" class="tb_list">
												<tr>
													<th width="4%" class="th">No</th>
													<th width="6%"  class="th">장애상태</th>
													<th width="*"  class="th">교차로명</th>
												</tr>
											<c:forEach var="list" items="${listStatus}" varStatus="status">
												<tr>
													<td class="td center">${cntNo-status.index}</td>
													<td class="center tb_status_${list.status}">${list.statusNm}</td>
													<td class="td">
														<a href="javascript:;" onclick="fnGoMap('${list.name}');">${list.name}</a></td>
												</tr>
											</c:forEach>
											</table>
										</td>			
										<td width="60px"></td>
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