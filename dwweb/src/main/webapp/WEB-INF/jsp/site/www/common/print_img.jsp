<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>교통 신호등 시설물 통합관리 시스템 || 시설물 통계 || 통계 출력</title>

<style>
body {
	margin: 0;
	padding: 0;
	border: 0;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
 $(window).on('load', function () {
      
      var w = $("#img").width();
      var h = $("#img").height();
      
      resizeTo(w+20,h+70);
      
      window.print();
      
      setTimeout("window.close();", 500);      
      
 });
</script>
</head>
<body >
	<div id="printChart"><img id="img" src="${fData}"></div>
</body>
</html>