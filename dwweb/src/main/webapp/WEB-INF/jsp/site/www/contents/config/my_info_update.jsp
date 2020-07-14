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
	//사용자 등록 취소
	$("#userList").click(function(){
		document.location.href="${pageContext.request.contextPath}/main/main.do?menuSeq=1001";
	})
	
	//사용자 등록
	$("#userUpdate").click(function(){
	
		if(validateData()){
			if(confirm("수정하시겠습니까?")){
				$("#frm").attr("method","post");
				$("#frm").attr("action","${pageContext.request.contextPath}/config/updateMyInfoAct.do");
				$("#frm").submit();
			}
		}
	})
	
	//비밀번호 변경
	$("#passwordModify").click(function(){
		var disabled1 =$("form input[name=userPwd]").prop("disabled");
		var disabled2 =$("form input[name=userPwd2]").prop("disabled");
		
		if(disabled1){
			$("form input[name=userPwd]").prop("disabled",false);
			$("form input[name=userPwd2]").prop("disabled",false);
			$("#passwordModify").text("변경취소");
			$("#userPwd").focus();
		}else{
			$("form input[name=userPwd]").prop("disabled",true);
			$("form input[name=userPwd2]").prop("disabled",true);
			$("#passwordModify").text("비밀번호 변경");
			
		}
	})
});


function validateData(){
	
	blnReturn = true;
	
    var disabled1 =$("form input[name=userPwd]").prop("disabled");
	
	if(!disabled1){
	
		if(stringUtil.isEmpty($("#userPwd").val())){
			alert("비밀번호를 입력해 주세요.");
			$("#userPwd").focus();
			return false;
		}
		
		if($("#userPwd").val().length < 8){
			alert("비밀번호는 8자리 이상으로 입력해 주세요.");
			$("#userPwd").focus();
			return false;
		}
		
		if(stringUtil.isEmpty($("#userPwd2").val())){
			alert("비밀번호 확인을 입력해 주세요.");
			$("#userPwd2").focus();
			return false;
		}
		
		if($("#userPwd").val() != $("#userPwd2").val()){
			alert("입력하신 비밀번호가 일치하지 않습니다.");
			$("#userPwd").val('');
			$("#userPwd2").val('');
			$("#userPwd").focus();
			return false;
		}
	}
	
	return blnReturn;
}
</script>

</head>

<body onLoad="fnPreloadImages('${pageContext.request.contextPath}/images/img/icon_map_over.png','${pageContext.request.contextPath}/images/img/icon_signal_over.png','${pageContext.request.contextPath}/images/img/icon_setting_over.png')">
<form name="frm" id="frm">
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

									<tr>
										<td width="60px"></td>
										<th class="h2_title_b center">내정보 수정</th>
										<td width="60px"></td>
									</tr>
									<tr>
										<th colspan="3" style="height:10px;"></th>
									</tr>
							
									<tr align="left" valign="top">
										<td width="60px;"></td>
<!-- //데이터 영역 -->								
										<td width="*" height="80%">
											<table width="100%" class="tb_list">
												<caption>사용자 등록 정보 : 아이디, 비밀번호, 사용자명, 계정만료일, 부서, 권한</caption>
												<colgroup>
													<col width="30%"/>
													<col width="70%"/>
												</colgroup>
												<tbody>
													<tr>
														<th class="th">
															그룹
														</th>
														<td>${userVo.groupNm}</td>
													</tr>
													<tr>
														<th class="th">
															아이디
														</th>
														<td>
															${userVo.userId}
														</td>
													</tr>
													
													<tr>
														<th class="th">비밀번호</th>
														<td>
															<input type="password" name="userPwd" id="userPwd" size="20" maxlength="12" disabled="disabled" />
															8자리 이상 12자리 이하
														</td>
													</tr>
													<tr>
														<th class="th">비밀번호 확인</th>
														<td>
															<input type="password" name="userPwd2" id="userPwd2" size="20" maxlength="12" disabled="disabled" />
															<a href="javascript:;" id="passwordModify" class="btn_redStyle01">비밀번호 변경</a>
														</td>
													</tr>
													
													<tr>
														<th class="th">사용자명</th>
														<td>
															${userVo.name}<%-- <input type="text" name="name" id="name" size="20" value="${userVo.name}"/> --%>
														</td>
													</tr>
													
													<tr>
														<th class="th">계정만료일</th>
														<td>${userVo.validateDate}</td>
													</tr>
													
													<tr>
														<th class="th">부서</th>
														<td><input type="text" name="department" id="department" value="${userVo.department}"/></td>
													</tr>
													
													<tr>
														<th class="th">등록사유</th>
														<td>${userVo.regDesc}</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="60px;"></td>
									</tr>
									<tr>
										<th colspan="3" style="height:40px;"></th>
									</tr>
									<tr>
										<th colspan="3">
											<a id="userUpdate" href="javascript:;" class="btn_round_type_6">수정</a>
											<a id="userList" href="javascript:;" class="btn_round_type_red">취소</a>
										</th>
									</tr>
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