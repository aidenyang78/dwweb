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
	//alert($(this).id);
	$(this).addClass('selcrossroad');
	
}



$(window).on('load',function(){
	$("#list_1002").click();
});
</script>
</head>
<body>
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
</body>
</html>						