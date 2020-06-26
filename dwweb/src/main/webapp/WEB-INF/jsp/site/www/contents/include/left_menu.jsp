<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<script type="text/javascript">
function fnSwapImgRestore() { //v3.0
	var i, x, a = document.MM_sr;
	for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
		x.src = x.oSrc;
}
function fnPreloadImages() { //v3.0
	var d = document;
	if (d.images) {
		if (!d.MM_p)
			d.MM_p = new Array();
		var i, j = d.MM_p.length, a = fnPreloadImages.arguments;
		for (i = 0; i < a.length; i++)
			if (a[i].indexOf("#") != 0) {
				d.MM_p[j] = new Image;
				d.MM_p[j++].src = a[i];
			}
	}
}

function fnFindObj(n, d) { //v4.01
	var p, i, x;
	if (!d)
		d = document;
	if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
		d = parent.frames[n.substring(p + 1)].document;
		n = n.substring(0, p);
	}
	if (!(x = d[n]) && d.all)
		x = d.all[n];
	for (i = 0; !x && i < d.forms.length; i++)
		x = d.forms[i][n];
	for (i = 0; !x && d.layers && i < d.layers.length; i++)
		x = fnFindObj(n, d.layers[i].document);
	if (!x && d.getElementById)
		x = d.getElementById(n);
	return x;
}

function fnSwapImage() { //v3.0
	var i, j = 0, x, a = fnSwapImage.arguments;
	document.MM_sr = new Array;
	for (i = 0; i < (a.length - 2); i += 3)
		if ((x = fnFindObj(a[i])) != null) {
			document.MM_sr[j++] = x;
			if (!x.oSrc)
				x.oSrc = x.src;
			x.src = a[i + 2];
		}
}
</script>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr valign="top" height="96">
		<td><img
			src="${pageContext.request.contextPath}/images/img/logo.png"
			width="92" height="96"></td>
	</tr>

	<tr>
		<td height="20px"></td>
	</tr>

	<tr valign="top" height="96">
		<td>
		<c:choose>
			<c:when test='${param.menuSeq eq "1001" }'>
				<img src="${pageContext.request.contextPath}/images/img/icon_map_over.png" width="92" height="96">
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/main/main.do?menuSeq=1001" onMouseOut="fnSwapImgRestore()"
				onMouseOver="fnSwapImage('Image2','','${pageContext.request.contextPath}/images/img/icon_map_over.png',1)"><img
					src="${pageContext.request.contextPath}/images/img/icon_map_nor.png"
					name="Image2" width="92" height="96" border="0"></a>
			</c:otherwise>
		</c:choose>
		</td>
	</tr>

	<tr valign="top" height="96">
		<td>
		<c:choose>
			<c:when test='${param.menuSeq eq "1002" }'>
				<a href="${pageContext.request.contextPath}/mgmtreg/listMgmtReg.do?menuSeq=1002">
					<img src="${pageContext.request.contextPath}/images/img/icon_signal_over.png" width="92" height="96"></a>					
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/mgmtreg/listMgmtReg.do?menuSeq=1002" onMouseOut="fnSwapImgRestore()"
				onMouseOver="fnSwapImage('Image3','','${pageContext.request.contextPath}/images/img/icon_signal_over.png',1)"><img
					src="${pageContext.request.contextPath}/images/img/icon_signal_nor.png"
					name="Image3" width="92" height="96" border="0"></a>
			</c:otherwise>
		</c:choose>
		</td>
	</tr>

	<tr valign="top" height="96">
		<td>
		<c:choose>
			<c:when test='${param.menuSeq eq "1003" }'>
				<a href="${pageContext.request.contextPath}/status/listStatus.do?menuSeq=1003">
					<img src="${pageContext.request.contextPath}/images/img/icon_fclty_over.png" width="92" height="96"></a>
			</c:when>
			<c:otherwise>
			<a href="${pageContext.request.contextPath}/status/listStatus.do?menuSeq=1003" onMouseOut="fnSwapImgRestore()"
			onMouseOver="fnSwapImage('Image4','','${pageContext.request.contextPath}/images/img/icon_fclty_over.png',1)"><img
				src="${pageContext.request.contextPath}/images/img/icon_fclty_nor.png"
				name="Image4" width="92" height="96" border="0"></a>
			</c:otherwise>
		</c:choose>
		</td>
	</tr>

	<tr valign="top" height="96">
		<td>
		<c:choose>
			<c:when test='${param.menuSeq eq "1004" }'>
				<a href="${pageContext.request.contextPath}/statistics/listStatistics.do?menuSeq=1004&listType=txt">
				<img src="${pageContext.request.contextPath}/images/img/icon_chart_over.png" width="92" height="96"></a>
			</c:when>
			<c:otherwise>
			<a href="${pageContext.request.contextPath}/statistics/listStatistics.do?menuSeq=1004&listType=txt" onMouseOut="fnSwapImgRestore()"
			onMouseOver="fnSwapImage('Image5','','${pageContext.request.contextPath}/images/img/icon_chart_over.png',1)"><img
				src="${pageContext.request.contextPath}/images/img/icon_chart_nor.png"
				name="Image5" width="92" height="96" border="0"></a>
			</c:otherwise>
		</c:choose>
		</td>
	</tr>

	<tr valign="top" height="96">
		<td>
		<c:choose>
			<c:when test='${param.menuSeq eq "1005" }'>
				<a href="${pageContext.request.contextPath}/config/config.do?menuSeq=1005">
					<img name="Image6" src="${pageContext.request.contextPath}/images/img/icon_setting_over.png" width="92" height="96"></a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/config/config.do?menuSeq=1005"
			onMouseOut="fnSwapImgRestore()"
			onMouseOver="fnSwapImage('Image6','','${pageContext.request.contextPath}/images/img/icon_setting_over.png',1)"><img
				src="${pageContext.request.contextPath}/images/img/icon_setting_nor.png"
				name="Image6" width="92" height="96" border="0"></a>
			</c:otherwise>
		</c:choose>
		</td>
	</tr>
</table>