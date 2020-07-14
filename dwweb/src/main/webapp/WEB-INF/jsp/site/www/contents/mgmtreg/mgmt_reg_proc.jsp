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
	var url = "/mgmtreg/listMgmtReg.do";	//기본 url
	//등록
	if('${rtnCd}' == '1000'){
		msg = '등록 되었습니다.';
	}else if('${rtnCd}' == '2000'){		//수정
		msg = '수정 되었습니다.';
		url = '/mgmtreg/updateMgmtReg.do';
	}else if('${rtnCd}' == '3000'){		//수정
		msg = '삭제 되었습니다.';
	}else{
		alert('처리 중 오류가 발생 했습니다.');
		document.history.back();
		return;
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
<input type="hidden" name="mgmtSeq" id="mgmtSeq" value="${param.mgmtSeq}"/>
<input type="hidden" name="searchDistrict" id="searchDistrict" value="${param.searchDistrict}"/>
<input type="hidden" name="keyKind" id="keyKind" value="${param.keyKind}"/>
<input type="hidden" name="keyWord" id="keyWord" value="${param.keyWord}"/>
</form>
</body>

