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
										<!-- <tr align="left" valign="top">
											<td width="10"></td>
											<td width="1746" height="45">left_top</td>
											<td width="7"></td>
										</tr> -->
										<tr>
											<th colspan="3" style="height:20px;"></th>
										</tr>
										<tr>
											<th width="60px;"></th>
											<th class="h2_title_b center">신호관리대장</th>
											<th width="60px;"></th>
										</tr>
										<tr align="left" valign="top">
											<td width="60px;"></td>
											<td width="*" height="80%">
<!-- contents -->

<!-- contents -->								
											</td>			
											<td width="60px;"></td>
										</tr>
										<tr>
											<td colspan="3" height="30px"></td>
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

