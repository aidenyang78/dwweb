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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.accordion-menu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/datepicker-ko.js"></script>
<script type="text/javascript">

$(function() {
	/* lnbUI.click('#lnb li', 300) */
	lnbUI.click('#lnb li', 100)
});

var lnbUI = {
	click : function(target, speed) {
		var _self = this, $target = $(target);
		_self.speed = speed || 300;
		
		$target.each(function() {
			if (findChildren($(this))) {
				return;
			}
			$(this).addClass('noDepth');
		});
		
		
		function findChildren(obj) {
			return obj.find('> ul').length > 0;
		}
		
		$target.on('click', 'a',function(e) {
			e.stopPropagation();
			var $this = $(this), 
				$depthTarget = $this.next(), 
				$siblings = $this.parent().siblings();
				
			$this.parent('li').find('ul li').removeClass('on');
			$siblings.removeClass('on');
			$siblings.find('ul').slideUp(50);
			
			if ($depthTarget.css('display') == 'none') {
				_self.activeOn($this);
				$depthTarget.slideDown(_self.speed);
			} else {
				$depthTarget.slideUp(_self.speed);
				_self.activeOff($this);
			}
		})
	},
	activeOff : function($target) {
		$target.parent().removeClass('on');
	},
	activeOn : function($target) {
		$target.parent().addClass('on');
	}
}; // Call lnbUI 


function fnSelRoad(routeCd, crossroadSeq){
	
	//alert(routeCd + " : " + crossroadSeq)
	//$("#selRoadnm"+crossroadSeq).addClass('selcrossroad');
	
	$("#selRoadnm248").addClass('selcrossroad');
	
	
}



$(window).on('load',function(){
	$("#list_1002").click();
});
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
<!-- left 제목 입니다. -->
                                        </td>
                                        <td width="17" height="53" background="${pageContext.request.contextPath}/images/img/content_bg_crop_top_right.png"></td>
                                    </tr>
                                    
                                    <tr align="left" valign="top">
                                        <td width="21" background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_left.png" ></td>                                        
                                        
                                        <!--크기를 넣는다면 다음과 같이 넣어주세요
                                          <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="200">
                                        -->
<!-- //left drop down -->                                        
<td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="280px">
<div id="lnb">
	<ul>
	 <c:forEach var='district' begin="1002" end="1004">
		<li>
			<a href="#none" id="list_${district}">
				<c:choose>
	            	<c:when test='${district eq "1002" }'>
	            		평택시 서부
	            	</c:when>
	            	<c:when test='${district eq "1003" }'>
	            		평택시 남부
	            	</c:when>
	            	<c:when test='${district eq "1004" }'>
	            		평택시 북부
	            	</c:when>
	            	<c:otherwise>
	            		평택시
	            	</c:otherwise>
	            </c:choose>
			</a>
			<ul>
			<c:forEach var="route" items="${listroute}" varStatus="st1">
				<c:if test='${district eq route.polDistrict }'>
					<li><a href="#none">${route.routeNm}</a>
						<ul>
							<c:forEach var="crossroad" items="${listcrossroad}" varStatus="st2">
								<c:if test='${route.seq eq crossroad.routeCd}'>
									<li>
										<a id="selRoadnm${crossroad.crossroadSeq}"  href="#none" onclick="fnSelRoad('${crossroad.routeCd}','${crossroad.crossroadSeq}');">└ ${crossroad.crossroadNm}</a>
									</li>
								</c:if>
							</c:forEach>
							
						</ul>
					</li>
				</c:if>
			</c:forEach>
			</ul>
		</li>
	</c:forEach>
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
										<td height="53" background="${pageContext.request.contextPath}/images/img/content_bg_right_crop_top_center.png" valign="middle">
<!-- right 제목 입니다. -->
											<span id="listTitle" style="color:#ffffff;font-size:22px;font-weight:bold;"></span>
										</td>
                                        <td width="17" height="53" background="${pageContext.request.contextPath}/images/img/content_bg_crop_top_right.png"></td>
                                    </tr>
                                    
                                    <tr align="left" valign="top">
                                        <td width="21" background="${pageContext.request.contextPath}/images/img/content_bg_right_crop_middle_left.png"></td>
                                        
                                        <!--  크기를 넣는다면 다음과 같이 넣어주세요  <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" width="200"> -->
                                        <td background="${pageContext.request.contextPath}/images/img/content_bg_crop_middle_center.png" style="min-height: 800px; min-width: 1460px;">
<!-- contents -->
<div id="viewData" style="text-align:center;vertical-align:middle;">
<h1>샘플 이미지 입니다.</h1>
<br/><br/><br/>
	<img src="${pageContext.request.contextPath}/images/common/its_map.png"/>
</div>						
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


