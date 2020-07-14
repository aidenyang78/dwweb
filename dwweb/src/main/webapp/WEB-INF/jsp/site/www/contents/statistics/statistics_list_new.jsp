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
	
	// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	$(".menu>a").click(function(){
	    var submenu = $(this).next("ul");
	
	    // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
	    if( submenu.is(":visible") ){
	        submenu.slideUp();
	    }else{
	        submenu.slideDown();
	    }
	});

	//처음 접속 시 메뉴 오픈
	$(".menu:eq(0)>a").click();
	
	//메뉴 색상
    /* $(".menu > ul > li").click(function(e){
    	var id = e.target.id;
    	$("li").each(function () {
    		$(this).siblings().removeClass("sub_list_on");
    	});
    	//내 색상 변경
    	$("#"+id).addClass("sub_list_on");
    }); */
     
});

function fnToggleMenu(dtCd, routeSeq){
	var id = "#"+dtCd+routeSeq;
	
	$("li").each(function () {
		$(this).siblings().removeClass("sub_list_on");
	});
	
	//내 색상 변경
	$(id).addClass("sub_list_on");
}

function fnCallStatistics(dtCd, routeSeq){
	//메뉴 처리	
	fnToggleMenu(dtCd, routeSeq);
	
	//기능처리
	fnCallAjaxData(dtCd, routeSeq);
}

function fnCallAjaxData(dtCd, routeSeq){
	
	
	
	alert((dtCd + " // "+ routeSeq));
	return;
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/statistics/selectFcStatisticsAjax.do";
	var strParam = "districtCd=" + dtCd +"&routeSeq="+routeSeq;
	
	var $json = getJsonData(strMethod, strUrl, strParam);
	var totCnt = $json.totCnt;
	
	if(totCnt > 0){
		
	}else{
		
	}
	
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
							<td width="11px"></td>
							<td>
<!-- //contents -->
								<table width="*" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="60px"></td>
										<th class="h2_title_b center">시설물 통계</th>
										<td width="60px"></td>
									</tr>
<!-- //data area -->									
									<tr>
										<td colspan="3" >
											<table width="*">
											<tr>
											<!-- //left route list -->	
												<td width="200px" style="vertical-align:top;">
													<div style="width:96%; height:98%; padding-left:6px; padding-top:6px;">
													    <ul>
													        <li class="menu">
													            <a><span class="top_list">평택시 서부</span></a>
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
													            <a><span class="top_list">평택시 남부</span></a>
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
													            <a><span class="top_list">평택시 북부</span></a>
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
											<!-- left route list// -->	
												<td width="*" style="vertical-align:top;padding:10px;">
													<!-- //right - data area -->
													<%-- <jsp:include page="/statistics/listStatisticsText.do" /> --%>
													<c:import url="/statistics/listStatisticsText.do">
														<c:param name="polDistrict" value="1004" />
													</c:import>
													<!-- right - data area// -->
												</td>
											</tr>	
											</table>
										</td>
									</tr>
<!-- data area// -->
								</table>
<!-- contents// -->
							</td>
							<td width="12px"></td>
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