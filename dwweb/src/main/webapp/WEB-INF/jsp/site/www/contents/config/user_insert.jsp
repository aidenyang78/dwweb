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
	
	//만료일 화면 생성
	setValidate();
	
	//그룹 설정
	setGroup();
	
	$("#idCheck").click(function(){
		if(stringUtil.isEmpty($("#userId").val())){
			alert("아이디를 입력해 주세요.");
			$("#userId").focus();
			return;
		}
	})
	
	//사용자 등록 취소
	$("#userList").click(function(){
		$("#frm").attr("method","get");
		$("#frm").attr("action","${pageContext.request.contextPath}/config/listUser.do");
		$("#frm").submit();
	})
	
	//사용자 등록
	$("#userInsert").click(function(){
		var groupCode = $("input[name='groupCode']:checked").attr("data-seq");
		//var groupCode = $("input[name='groupCode']:checked"). val();
		//var groupNm = $("label[for=groupCode"+groupCode+"]").text();
		var groupNm = $("#label"+groupCode).text();
		
	
		if(validateData()){
			if(confirm(groupNm + "으로 등록 하시겠습니까?")){
				$("#frm").attr("method","post");
				$("#frm").attr("action","${pageContext.request.contextPath}/config/insertUserAct.do");
				$("#frm").submit();
			}
		}
	})
	
	//만료일자 선택
	$("#validateDateYear,#validateDateMonth").change(function(){
		setValidate();
	})
	
});

//그룹 설정
function setGroup(){
	$("#groupCode2").attr("checked",true);
}

//아이디 중복체크
function userIdCheckJs() {
	var chkReturn = false;

	if(stringUtil.isEmpty($("#userId").val()) || 4 > $("#userId").val().length
			|| 12 < $("#userId").val().length
			/* || !$("#userId").val().match(/([a-zA-Z].*[0-9])|([0-9].*[a-zA-Z])/) */
			|| !/^[A-Za-z0-9]+$/.test($("#userId").val())
	){
		$("#idChkTxtSpan").html("사용불가");
		$("#idChkTxtSpan").attr('class', 'color_point_2');
	} else {
		
		var strMethod = "post";
		var strUrl = "${pageContext.request.contextPath}/config/userIdCheckJs.do";
		var strParam = "userId=" + $("#userId").val();

		var $json = getJsonData(strMethod, strUrl, strParam);

		if ($json.userIdCheck == 0) {
			//중복개수  = 0
			chkReturn = true;
			$("#idChkTxtSpan").html("사용가능");
			$("#idChkTxtSpan").attr('class', 'color_point_1');
		} else {
			$("#idChkTxtSpan").html("사용불가(중복)");
			$("#idChkTxtSpan").attr('class', 'color_point_2');
		}
	}
	
	return chkReturn;
}

function validateData(){
	
	blnReturn = true;
	
	if(stringUtil.isEmpty($("#userId").val())){
		alert("아이디를 입력해 주세요.");
		$("#userId").focus();
		return false;
	}
	
	if($("#userId").val().length < 4 || 12 < $("#userId").val().length){
		alert("아이디는 4자리 이상 12자리 이하로 입력해 주세요.");
		$("#userId").focus();
		return false;
	}
	
	if(!userIdCheckJs()) {	
    	alert("이미 사용중인 아이디 입니다.");
    	$("#userId").focus();
		 return false;
    }
	
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
	
	if(stringUtil.isEmpty($("#name").val())){
		alert("사용자명을 입력해 주세요.");
		$("#name").focus();
		return false;
	}
	
	return blnReturn;
}

function setValidate(){
	
	var validateDateYear = $("#validateDateYear").val();
	var validateDateMonth = $("#validateDateMonth").val();
	var validateDateDay = $("#validateDateDay").val();
	
	var validateDate = validateDateYear + validateDateMonth + '01';
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/common/selectLastDate.do";
	var strParam = "strDate=" + validateDate;

	var $json = getJsonData(strMethod, strUrl, strParam);
	
	if($json.strLastDate != ""){
		var endDay = $json.strLastDay;
		var inputHtml = "";
		var val = "";
		
		inputHtml = "<select name='validateDateDay' id='validateDateDay'>";
		
		for(var i=1;i<=endDay;i++){
			if(i<10){
				val = "0" + i;
			}else{
				val = i;
			}
			
			if(val == "${nextDay}"){
				inputHtml += "<option value='"+val+"' selected>"+val+"</option>";
			}else{
				inputHtml += "<option value='"+val+"'>"+val+"</option>";
			}
		}
		
		inputHtml += "</select>";
		$("#inputHtml").html(inputHtml);
		
	}else{
		alert('lastDate load error');
	}
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
										<th class="h2_title_b center">사용자 등록</th>
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
															<strong class="icon_must">*</strong>권한
														</th>
														<td>
															<ul>
																<c:forEach var="list" items="${listGroup}" varStatus="status">
																<li>
																	<input type="radio" name="groupCode" id="groupCode${status.count}" value="${list.groupCode}" data-seq="${list.seq}" />
																	<label id="label${status.count}" for="groupCode${status.count}">${list.regDesc}</label>
																</li>
																</c:forEach>
															</ul>
														</td>
													</tr>
													<tr>
														<th class="th">
															<strong class="icon_must">*</strong>아이디
														</th>
														<td>
															<input type="text" name="userId" id="userId" size="20" onkeyup="userIdCheckJs()"/>
															<span id="idChkTxtSpan" class="color_point_2"></span>
															<strong class="icon_must">*</strong>한글 제외 4자리 이상 12자리 이하
														</td>
													</tr>
													
													<tr>
														<th  class="th"><strong class="icon_must">*</strong>비밀번호</th>
														<td>
															<input type="password" name="userPwd" id="userPwd" size="20" maxlength="12"/>
															<strong class="icon_must">*</strong>8자리 이상 12자리 이하
														</td>
													</tr>
													<tr>
														<th  class="th"><strong class="icon_must">*</strong>비밀번호 확인</th>
														<td><input type="password" name="userPwd2" id="userPwd2" size="20" maxlength="12"/></td>
													</tr>
													
													<tr>
														<th  class="th"><strong class="icon_must">*</strong>사용자명</th>
														<td><input type="text" name="name" id="name" size="20"/></td>
													</tr>
													
													<tr>
														<th  class="th"><strong class="icon_must">*</strong>계정만료일</th>
														<td>
															<select name="validateDateYear" id="validateDateYear">
																<c:forEach var="year" begin="2020" end="${strEndYear}" varStatus="status">
																	<option value="${year}" <c:if test='${year eq nextYear}'>selected</c:if>>${year}</option>
																</c:forEach>
															</select>
															
															<select name="validateDateMonth" id="validateDateMonth">
																<c:forEach var="month" begin="1" end="12" varStatus="status">
																	<c:choose>
																		<c:when test='${month lt 10}'>
																			<option value="0${month}" <c:if test='${month eq nextMonth}'>selected</c:if>>0${month}</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${month}" <c:if test='${month eq nextMonth}'>selected</c:if>>${month}</option>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</select>
															
															<span id="inputHtml"></span>
															
														</td>
													</tr>
													
													<tr>
														<th class="th">부서</th>
														<td><input type="text" name="department" id="department" value=""/></td>
													</tr>
													<tr>
														<th class="th">등록사유</th>
														<td><input type="text" name="regDesc" id="regDesc" value=""/></td>
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
											<a id="userInsert" href="javascript:;" class="btn_round_type_6">등록</a>
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
