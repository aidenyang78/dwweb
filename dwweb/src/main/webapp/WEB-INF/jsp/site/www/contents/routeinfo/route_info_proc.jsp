<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
/* 
rtnCd
1000 : 등록 성공
2000 : 수정 성공
3000 : 삭제 성공
9999 : 처리 오류
*/
$(document).ready(function(){
	var msg = "";
	var url = "/crossroadinfo/listCrossroadInfo.do";	//기본 url
	//등록
	if('${rtnCd}' == '1000'){
		msg = '등록 되었습니다.';
	}else if('${rtnCd}' == '2000'){		//수정
		msg = '수정 되었습니다.';
		url = '/routeinfo/updateRouteInfo.do';
	}else if('${rtnCd}' == '3000'){		//수정
		msg = '삭제 되었습니다.';
	}else{
		alert('처리 중 오류가 발생 했습니다.');
		history.back();
	}
	
	//등록/수정 시 해당 도로(국도) 이동 처리
	if("${rtnRouteCd}" != ""){
		$("#s_routeCd").val('${rtnRouteCd}');
	}else{
		if('${rtnCd}' == '3000'){
			$("#s_routeCd").val('');
		}else{
			$("#s_routeCd").val('${param.s_routeCd}');	
		}
	}
		
	alert(msg);
	$("#frm").attr("method","post");
	$("#frm").attr("action","${pageContext.request.contextPath}" + url);
	$("#frm").submit();
})
</script>
</head>
<body>
<form name="frm" id="frm">
<input type="hidden" name="pageNo" id="pageNo" value="${param.pageNo}"/>
<input type="hidden" name="menuSeq" id="menuSeq" value="${param.menuSeq}"/>
<input type="hidden" name="s_polDistrict" id="s_polDistrict" value="${param.s_polDistrict}"/>
<input type="hidden" name="s_routeCd" id="s_routeCd" />
<input type="hidden" name="s_crossroadNm" id="s_crossroadNm" value="${param.s_crossroadNm}"/>
<input type="hidden" name="crossroadSeq" id="crossroadSeq" value="${param.seq}" />
</form>
</body>

