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
<script src="${pageContext.request.contextPath}/common/plugins/printThis.js"></script>

<%-- <script src="${pageContext.request.contextPath}/common/plugins/html2canvas/canvas-toBlob.js"></script> --%>
<script src="${pageContext.request.contextPath}/common/plugins/html2canvas/bluebird.min.js"></script> 			<!-- ie에서 promise를 사용하기 위해 --> 
<script src="${pageContext.request.contextPath}/common/plugins/html2canvas/FileSaver.min.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/html2canvas/html2canvas.js"></script>

<script src="${pageContext.request.contextPath}/common/plugins/charts/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/charts/utils.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/charts/Chart.plugin.labels.js"></script>


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
	    yearRange: "-100:+0", // last hundred years
	    duration: 300
	});
	
	//검색 시작일
	$('#stdDate').datepicker();

	$("#imgStdDate").click(function(){
		$('#stdDate').datepicker('show');	
	});
	 
	//검색 종료일
	$('#endDate').datepicker();
	
	$("#imgEndDate").click(function(){
		$('#endDate').datepicker('show');
	})
	
	// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	$(".menu>a").click(function(){		
		$(".menu>a").not(this).next().slideUp(300);
		$(this).next().slideToggle(300);
	});

	//대메뉴 클릭시 셀렉 처리
	$("#list1002, #list1003 ,#list1004").click(function(obj){		
		//fnToggleTopMenu(obj);
		fnToggleTopMenu(this.id);

		fnCallAjaxDistrictData(this.id);
	});
	
	
	//처음 접속 시 메뉴 오픈
	//$(".menu:eq(0)>a").click();
	$("#list1004").click();
	//fnCallAjaxDistrictData('list1002');
	
});

$(window).ready(function(){
	/* if("txt" == "${param.listType}"){
		var tbWidth = $("#dtTable").width();
		var tbHeight = $("#dtTable").height();
		
		//alert(tbWidth + " // " + tbHeight);
		
		$("#viewData").width(tbWidth);
		$("#viewData").height(tbHeight+20);
		
		$("#dtTable").width(tbWidth - 20);
		$("#dtTable").height(tbHeight - 20);
	} */
	
});

//대메뉴 토클
function fnToggleTopMenu(objId){
	$(".menu > a > span").each(function(e){
		$(this).removeClass('top_list_on');
		$(this).addClass('top_list');
	});
	
	//$("#"+obj.target.id).addClass("top_list_on");
	$('#'+objId).addClass("top_list_on");	
}

//서브메뉴 토글
function fnToggleSubMenu(dtCd, routeSeq){
	var id = "#"+dtCd+routeSeq;
	
	$("li").each(function () {
		$(this).siblings().removeClass("sub_list_on");
	});
	
	//내 색상 변경
	$(id).addClass("sub_list_on");
}

//데이터 처리
function fnCallAjaxRouteData(polDistrict, routeCd){
	var listType = stringUtil.nullToCustom('${param.listType}','txt');
	var keyKind = $("#keyKind").val();
	var stdDate = $("#stdDate").val();
	var endDate = $("#endDate").val();
	var districtNm = "시설물 통계";
	
	$("#polDistrict").val(polDistrict);
	$("#routeCd").val(routeCd);
	
	
	if("${param.listType}" != ""){
		listType = "${param.listType}"; 
	}
	
	if(polDistrict == '1002'){
		districtNm = "평택시 서부 시설물 통계";
	}else if(polDistrict == '1003'){
		districtNm = "평택시 남부 시설물 통계";
	}else if(polDistrict == '1004'){
		districtNm = "평택시 북부 시설물 통계";
	}
	
	$("#districtTxt").text(districtNm);
	
	var strMethod = "post";
	var strUrl = "${pageContext.request.contextPath}/statistics/selectFcStatisticsHtml.do";
	var strParam = "listType="+listType+"&polDistrict="+polDistrict+"&routeCd="+routeCd+"&keyKind="+keyKind+"&stdDate="+stdDate+"&endDate="+endDate;
	
	var $json = getHtmlData(strMethod, strUrl, strParam, $("#viewData"));	
}

/* 대메뉴 클릭 시 데이터 처리 */
function fnCallAjaxDistrictData(objId){
	//var objId = obj.target.id;
	var polDistrict = $("#" + objId).attr('data-districtCd');
	
	fnCallAjaxRouteData(polDistrict,'');
}

//서브메뉴 클릭 이벤트
function fnCallStatistics(polDistrict, routeCd){
	//메뉴 처리	
	fnToggleSubMenu(polDistrict, routeCd);
	
	//데이터 처리
	fnCallAjaxRouteData(polDistrict, routeCd);
}

//검색 버튼 클릭
function fnSearch(){
	var polDistrict = $("#polDistrict").val();
	var routeCd = $("#routeCd").val();
	
	fnCallAjaxRouteData(polDistrict, routeCd)
}

function fnExcelDownload(){
	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}/statistics/selectFcStatisticsExcel.do");
	$("#frm").submit();
}

/* function fnImgDownload(){
	var polDistrict = $("#polDistrict").val();
	var fNm = "시설물_통계";
	var fExt = ".jpg";
	
	if("1002" == polDistrict){
		fNm = "평택시_서부_시설물통계";
	}else if("1003" == polDistrict){
		fNm = "평택시_남부_시설물통계";
	}if("1004" == polDistrict){
		fNm = "평택시_북부_시설물통계";
	}
	
	html2canvas($("#viewData"), {
    	onrendered: function(canvas) {
        	canvas.toBlob(function(blob) {
            	saveAs(blob, fNm + fExt);
            });
       	 }
    });
} */

function fnImgDownload(){
	var polDistrict = $("#polDistrict").val();
	var fNm = "시설물_통계";
	var fExt = ".png";
	
	if("1002" == polDistrict){
		fNm = "평택시_서부_시설물통계";
	}else if("1003" == polDistrict){
		fNm = "평택시_남부_시설물통계";
	}if("1004" == polDistrict){
		fNm = "평택시_북부_시설물통계";
	}

	$("#fNm").val(fNm);
	$("#fExt").val(fExt);
	
	//이미지 잘림 방지
	window.scrollTo(0,0);
	
	
	//html2canvas(document.body).then(function(canvas) {
	//html2canvas(document.getElementById("viewData")).then(function(canvas) {
	html2canvas($('#viewData')[0]).then(function(canvas) {
	    //document.body.appendChild(canvas);
	    if (typeof FlashCanvas != "undefined") {
        	FlashCanvas.initElement(canvas);
        }
	    
		var fData = canvas.toDataURL("images/png");
	    
	    $("#fData").val(fData);
	    
	    
	    //location.href = canvas.toDataURL('image/png').replace(/^data:image\/png/, 'data:application/octet-stream');
	    
	    
	    $("#frm").attr("method","post");
		$("#frm").attr("action","${pageContext.request.contextPath}/common/downloadHtmlToImg.do");
		$("#frm").submit();
	    
		/* var a=document.createElement('a');
	    a.href = canvas.toDataURL("image/png").replace("image/png","image/octest-stream");
	    a.download = fNm + ".png";
	    a.click(); */
	    
	    /* canvas.toBlob(function(blob){
	    		saveAs(blob, fNm + fExt);
	    }, 'image/jpeg', 0.95); */
	    
	    /* canvas.toBlob(function(blob){
    		saveAs(blob, fNm + fExt);
    	}, 'image/png', 1); */
	});	
}
	
function fnPrint(type){
	alert(type);
	
	//if("txt" == type){
		$("#viewData").printThis();
	//}
}
</script>
<body onLoad="fnPreloadImages('${pageContext.request.contextPath}/images/img/icon_signal_over.png','${pageContext.request.contextPath}/images/img/icon_setting_over.png','${pageContext.request.contextPath}/images/img/icon_chart_over.png')">
<form name="frm" id="frm">
<input type="hidden" name="pageNo" id="pageNo" value="${param.pageNo}"/>
<input type="hidden" name="menuSeq" id="menuSeq" value="${param.menuSeq}"/>
<input type="hidden" name="polDistrict" id="polDistrict" />
<input type="hidden" name="routeCd" id="routeCd" />
<input type="hidden" name="fData" id="fData" />
<input type="hidden" name="fNm" id="fNm"/>
<input type="hidden" name="fExt" id="fExt"/>

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
											<div  style="min-height:900px;">
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
				<th colspan="3" class="h2_title_b center"><span id="districtTxt">시설물 통계</span></th>
			</tr>
			<tr>
				<th colspan="3" style="height:20px;"></th>
			</tr>
			<tr>
				<td colspan="3" class="right">
				<c:if test='${param.listType eq  "txt"}'>
					<a href="${pageContext.request.contextPath}/statistics/listStatistics.do?menuSeq=1004&listType=gui" id="txtType" class="btn_round_type_1">그래프</a>
				</c:if>
				<c:if test='${param.listType eq  "gui"}'>
					<a href="${pageContext.request.contextPath}/statistics/listStatistics.do?menuSeq=1004&listType=txt" id="guiType" class="btn_round_type_1">텍스트</a>
				</c:if>
				</td>
			</tr>
			<tr>
				<td class="bbs_search">
				<!-- 앞 영역 -->
				</td>
				<td class="bbs_search">
					<select name="keyKind" id="keyKind" >			
						<option value='' <c:if test='${statisticsVo.keyKind eq "" }'>selected</c:if>>:::::::::: 선택 ::::::::::</option>
						<option value='installDate' <c:if test='${statisticsVo.keyKind eq "installDate" }'>selected</c:if>>설치일</option>
						<option value='upsBatExchangeDate' <c:if test='${statisticsVo.keyKind eq "upsBatExchangeDate" }'>selected</c:if>>UPS BAT 교체일</option>
					</select>
					<input type="text" name="stdDate" id="stdDate"  size="10" value="${statisticsVo.stdDate}"/>
					<img id="imgStdDate" src="${pageContext.request.contextPath}/images/common/calendar.gif" class="pointer cal_img_center"/>
					~<input type="text" name="endDate" id="endDate"  size="10" value="${statisticsVo.endDate}"/>
					<img id="imgEndDate" src="${pageContext.request.contextPath}/images/common/calendar.gif" class="pointer cal_img_center"/>
					<a href="javascript:;" onclick="javascript:fnSearch();" class="btn_search">검색</a>
				</td>
				<td class="bbs_search right">
				<!-- 건 조회 -->
				<a href="javascript:;" onclick="fnExcelDownload();" class="btn_excel"><span>엑셀</span></a>
				<a href="javascript:;" onclick="fnImgDownload();" class="btn_attach"><span>이미지</span></a>
				<a href="javascript:;" onclick="fnPrint('${param.listType}');" class="btn_print"><span>인쇄</span></a>
				</td>
			</tr>
			<tr>
				<th colspan="3" style="height:20px;"></th>
			</tr>
		</table>
		<!-- 검색 영역 -->

									<!-- <div id="viewData" style="max-width:1500px;min-height:860px"></div> -->
									
								<c:if test='${param.listType eq "txt"}'>
									<div id="viewData"></div>
								</c:if>
								<c:if test='${param.listType eq "gui"}'>
									<div id="viewData" style="min-width:1460px;min-height:700px"></div>
								</c:if>
									<div id="downloadExcel"></div>
<!-- contents -->
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

