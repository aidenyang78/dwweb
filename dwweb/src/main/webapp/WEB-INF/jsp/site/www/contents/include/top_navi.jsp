<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<c:choose>
	<c:when test='${param.menuSeq eq "1001" }'>
		<c:set var="naviText" value="지도 검색"/>
	</c:when>
	<c:when test='${param.menuSeq eq "1002" }'>
		<c:set var="naviText" value="신호관리대장"/>
	</c:when>
	<c:when test='${param.menuSeq eq "1003" }'>
		<c:set var="naviText" value="시설물 장애"/>
	</c:when>
	<c:when test='${param.menuSeq eq "1004" }'>
		<c:set var="naviText" value="시설물 통계"/>
	</c:when>
	<c:when test='${param.menuSeq eq "1005" }'>
		<c:set var="naviText" value="설정"/>
	</c:when>
	<c:when test='${param.menuSeq eq "1006" }'>
		<c:set var="naviText" value="교차로 관리"/>
	</c:when>
</c:choose>
<table border="0" width="100%">
	<tr>
		<td class="naviText" align="left">교통신호 시설물 관리시스템 > ${naviText}</td>
                 <td width="60" align="right" class="authorityText" >
                 	<span class="pointer" onclick="fnGoMyInfo();">${NAME}</span> | </td>
		<td width="60" class="naviText" align="right">
			<a href="${pageContext.request.contextPath}/logout/logout.do" onMouseOut="MM_swapImgRestore()" onMouseOver="fnSwapImage('Image7','','${pageContext.request.contextPath}/images/img/logout_over.png',1)">
				<img src="${pageContext.request.contextPath}/images/img/logout_nor.png" name="Image7" width="66" height="22" border="0"></a>
		</td>
		<td width="30"></td>
	</tr>
</table>