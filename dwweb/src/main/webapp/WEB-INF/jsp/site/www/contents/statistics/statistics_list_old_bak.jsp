<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>교통 신호등 시설물 통합관리 시스템 || 시설물 통계</title>

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
	//달력 처리
	$.datepicker.setDefaults(datepickerSet);
	$.datepicker.setDefaults({
		dateFormat: "yymmdd",
	    showMonthAfterYear:true,
	    changeMonth: true,
		changeYear: true,
		firstDay: 0,
	    showAnim: "slideDown", //show, fadeIn, slideDown
	    duration: 200
	});
	
	//설치 년월일
	$('#stDate').datepicker();
	
	$("#imgStDate").click(function(){
		$('#imgStDate').datepicker('show');	
	});
	 
	//UPS BAT 교체일
	$('#endDate').datepicker();
	
	$("#imgEndDate").click(function(){
		$('#imgEndDate').datepicker('show');
	})
	
	
	// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	$(".menu>a").click(function(){		
		$(".menu>a").not(this).next().slideUp(300);
		$(this).next().slideToggle(300);
	});

	//처음 접속 시 메뉴 오픈
	//$(".menu:eq(0)>a").click();
	$("#list1002").click();
	
	//대메뉴 클릭시 셀렉 처리
	$("#list1002, #list1003 ,#list1004").click(function(obj){
		fnToggleTopMenu(obj);
	});
	
});

//대메뉴 토클
function fnToggleTopMenu(obj){

	$(".menu > a > span").each(function(e){
		$(this).removeClass('top_list_on');
		$(this).addClass('top_list');
	});
	
	$("#"+obj.target.id).addClass("top_list_on");
	
	//데이터 처리 요청 
	fnCallStatisticsTop(obj);
}

function fnToggleSubMenu(dtCd, routeSeq){
	var id = "#"+dtCd+routeSeq;
	
	$("li").each(function () {
		$(this).siblings().removeClass("sub_list_on");
	});
	
	//내 색상 변경
	$(id).addClass("sub_list_on");
}


/* 대메뉴 클릭 시 데이터 처리 */
function fnCallStatisticsTop(obj){
	var objId = obj.target.id;
	var districtCd = $("#" + objId).attr('data-districtCd');
	
	$("#polDistrict").val(districtCd);
	
	$("#frm").attr("method","get");
	$("#frm").attr("action","${pageContext.request.contextPath}/statistics/listStatistics.do");
	$("#frm").submit();	
}

/* 서브메뉴 클릭 시 데이터 처리 */
function fnCallStatistics(dtCd, routeSeq){
	//메뉴 처리	
	fnToggleSubMenu(dtCd, routeSeq);
	
	
	$("#polDistrict").val(dtCd);
	$("#routeCd").val(routeSeq);
	
	$("#frm").attr("method","get");
	$("#frm").attr("action","${pageContext.request.contextPath}/statistics/listStatistics.do");
	$("#frm").submit();	
	
}




	
</script>
</head>
<body onLoad="fnPreloadImages('${pageContext.request.contextPath}/images/img/icon_signal_over.png','${pageContext.request.contextPath}/images/img/icon_setting_over.png','${pageContext.request.contextPath}/images/img/icon_chart_over.png')">
<form name="frm" id="frm">
<input type="text" name="aa" id="aa" size="20"/>
<input type="text" name="polDistrict" id="polDistrict" value="${param.polDistrict}"/>
<input type="text" name="routeCd" id="routeCd" value="${param.routeCd}"/>
<input type="text" name="menuSeq" id="menuSeq" value="${param.menuSeq}"/>
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
				<tr valign="middle" height="100%">

					<td width="70"></td>

					<td width="371" valign="top">
						<table width="371" height="864" border="0" cellpadding="0" cellspacing="0" background="${pageContext.request.contextPath}/images/img/content_bg_left.png">
							<tr align="left" valign="top">
								<td width="10"></td>
								<td width="318" height="48">&nbsp;</td>
								<td width="7"></td>
							</tr>

							<tr align="left" valign="top">
								<td width="10"></td>
								<td width="318" height="819">
									<div style="overflow:auto; width:96%; height:98%; padding-left:6px; padding-top:6px;">
										<!-- <ul>
											<li class="hide" style="height:10px;">&nbsp;</li>
										</ul> -->
									    <ul>
									        <li class="menu">
									            <a><span id="list1002" data-districtCd='1002' class="top_list_on">평택시 서부</span></a>
									            <ul class="hide">
									            <c:forEach var="list1002" items="${listroute}" varStatus="st">
													<c:if test='${list1002.polDistrict eq "1002" }'>
														<li id="${list1002.polDistrict}${list1002.seq}" class="sub_list pointer" onclick="fnCallStatistics('${list1002.polDistrict}','${list1002.seq}');">
															<span>■ ${list1002.routeNm}</span>
														</li>
													</c:if>
												</c:forEach>
									            </ul>
									        </li>
									        <li class="menu">
									            <a><span id="list1003" data-districtCd='1003' class="top_list">평택시 남부</span></a>
									            <ul class="hide">
									             <c:forEach var="list1003" items="${listroute}" varStatus="st">
													<c:if test='${list1003.polDistrict eq "1003" }'>
														<li id="${list1003.polDistrict}${list1003.seq}" class="sub_list pointer" onclick="fnCallStatistics('${list1003.polDistrict}','${list1003.seq}');">
															<span>■ ${list1003.routeNm}</span>
														</li>
													</c:if>
												</c:forEach>
									            </ul>
									        </li>
									        
									         <li class="menu">
									            <a><span id="list1004" data-districtCd='1004' class="top_list">평택시 북부</span></a>
									            <ul class="hide"> 
												<c:forEach var="list1004" items="${listroute}" varStatus="st">
													<c:if test='${list1004.polDistrict eq "1004" }'>
														<li id="${list1004.polDistrict}${list1004.seq}" class="sub_list pointer" onclick="fnCallStatistics('${list1004.polDistrict}','${list1004.seq}');">
															<span>■ ${list1004.routeNm}</span>
														</li>
													</c:if>
												</c:forEach>
									            </ul>
									        </li>
									    </ul>
									</div>
								</td>
								<td width="7"></td>
							</tr>
						</table>
					</td>


					<td width="10"></td>

					<td width="1361" valign="top">
						<table width="1361" height="863" border="0" cellpadding="0" cellspacing="0" background="${pageContext.request.contextPath}/images/img/content_bg_right.png">
							<tr align="left" valign="top">
								<td width="12"></td>
								<td width="1342" height="45">
								&nbsp;<!-- right_top -->
								</td>
								<td width="7"></td>
							</tr>

							<tr align="left" valign="top">
								<td width="14"></td>
								<td width="1342" height="818">
									<div id="viewPage">
<c:import url="/statistics/selectFcStatisticsHtml.do">
	<c:param name="polDistrict" value="${param.polDistrict}" />
	<c:param name="routeCd" value="${param.routeCd}" />
</c:import>

									</div>
								</td>
								<td width="11"></td>
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

