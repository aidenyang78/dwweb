<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>교통 신호등 시설물 통합관리 시스템 || 설정</title>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/Base.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/ui-lightness/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#addUser, #addUser2").click(function(){
		$("#frm").attr("method","post");
		$("#frm").attr("action","${pageContext.request.contextPath}/config/insertUser.do");
		$("#frm").submit();
	})
	
	//검색 조건 변경 처리
	$("#keyKind").change(function(){
		fnKeyKindChange();
	})
});

//사용자 삭제
function deleteUser(seq,userId){
	
	$("#seq").val(seq);
	$("#userId").val(userId);
	
	if(confirm("사용자를 삭제 하시겠습니까?")){
		$("#frm").attr("method","post");
		$("#frm").attr("action","${pageContext.request.contextPath}/config/deleteUserAct.do");
		$("#frm").submit();
	}
}

//사용자 업데이트
function updateUser(seq,userId){
	
	$("#seq").val(seq);
	$("#userId").val(userId);
	
	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}/config/updateUser.do");
	$("#frm").submit();
}

function userDetail(seq,userId){
	updateUser(seq,userId);
}

//검색
function fnSearch(){
	$("#pageNo").val('');
	$("#frm").attr("actoin","${pageContext.request.contextPath}/config/listUser.do");
	$("#frm").attr("method","get");
	$("#frm").submit();
}

</script>

</head>

<body onLoad="fnPreloadImages('${pageContext.request.contextPath}/images/img/icon_map_over.png','${pageContext.request.contextPath}/images/img/icon_signal_over.png','${pageContext.request.contextPath}/images/img/icon_chart_over.png')">
<form name="frm" id="frm">
<input type="hidden" name="pageNo" id="pageNo" value="${param.pageNo}"/>
<input type="hidden" name="menuSeq" id="menuSeq" value="${param.menuSeq}"/>
<input type="hidden" name="userId" id="userId"/>
<input type="hidden" name="seq" id="seq"/>
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
										<td width="60px"></td>
										<th class="h2_title_b center">사용자 관리</th>
										<td width="60px"></td>
									</tr>
									<tr>
										<th width="60px;"></th>
										<th class="right">
											<a href="javascript:;" id="addUser" class="btn_whiteStyle02">사용자 추가</a>
										</th>
										<th width="60px;"></th>
									</tr>
									<tr>
										<th></th>
										<td class="bbs_search">
											<select name="sGroupCode" id="sGroupCode">
												<option value="" <c:if test="${param.sGroupCode eq '' or param.sGroupCode eq null }">selected</c:if>>::::::: 그룹선택 :::::::</option>
												<c:forEach var="listG" items="${listGroup}" varStatus="gStatus">
												<option value="${listG.groupCode}" <c:if test="${param.sGroupCode eq listG.groupCode}">selected</c:if>>${listG.regDesc}</option>
												</c:forEach>
											</select>
											
											<select name="keyKind" id="keyKind">
												<option value="" <c:if test="${param.keyKind eq '' }">selected</c:if>>::선택::</option>
												<option value="user_id" <c:if test="${param.keyKind eq 'user_id' }">selected</c:if>>아이디</option>
												<option value="user_name" <c:if test="${param.keyKind eq 'user_name' }">selected</c:if>>이름</option>
											</select>
											
											<input type="text" name="keyWord" id="keyWord" size="60" maxlength="60" value="${param.keyWord}" />
										
											<a href="javascript:;" onclick="javascript:fnSearch();" class="btn_search">검색</a>
										</td>
										<td></td>
									</tr>
									<tr>
										<td colspan="3" height="10px"></td>
									</tr>
									<tr align="left" valign="top">
										<td width="60px;"></td>
		<!-- //데이터 영역 -->								
										<td width="*" height="80%">
											<table width="100%" class="tb_list">
												<tr>
													<th width="4%" class="th">No</th>
													<th width="13%"  class="th">관리자그룹</th>
													<th width="13%"  class="th">아이디</th>
													<th width="13%"  class="th">사용자명</th>
													<th width="13%"  class="th">등록일</th>
													<th width="13%"  class="th">만료일</th>
													<th width="13%"  class="th">등록사유</th>
													<th width="*"  class="th">기능</th>
												</tr>
											<c:forEach var="list" items="${listUser}" varStatus="status">
												<tr>
													<td class="td center">${cntNo-status.index}</td>
													<td class="td">${list.groupNm}</td>
													<td class="td" >
														<a href="javascript:;" onclick="userDetail('${list.seq}','${list.userId}');">${list.userId}</a>
													</td>
													<td class="td">
														<a href="javascript:;" onclick="userDetail('${list.seq}','${list.userId}');">${list.name}</a>
													</td>
													<td class="td">${list.regDate}</td>
													<td class="td">${list.validateDate}</td>
													<td class="td">${list.regDesc}</td>
													<td class="td center">
														<a href="javascript:;" onclick="updateUser('${list.seq}','${list.userId}');" class="btn_grayStyle01">수정</a>
														<a href="javascript:;" onclick="deleteUser('${list.seq}','${list.userId}');" class="btn_redStyle01">삭제</a>
													</td>
												</tr>
											</c:forEach>
											</table>
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