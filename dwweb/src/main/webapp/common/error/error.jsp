<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!doctype html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>교통 신호등 시설물 통합관리 시스템</title>
	
<style>

/* 나눔 기본 */
@font-face {
  font-family: 'ng';
  font-style: normal;
  font-weight: normal;
  src: url("/common/site/www/front/webfont/NanumGothic.eot");
  src: url("/common/site/www/front/webfont/NanumGothic.eot?#iefix") format("embedded-opentype"), url("/common/site/www/front/webfont/NanumGothic.woff") format("woff"), url("/front/webfont/NanumGothic.ttf") format("truetype");
}
/* 나눔 Regular */
@font-face {
  font-family: 'ng-reg';
  font-style: normal;
  font-weight: 300;
  src: url("/common/site/www/front/webfont/NanumGothic-Regular.eot");
  src: url("/common/site/www/front/webfont/NanumGothic-Regular.eot?#iefix") format("embedded-opentype"), url("/common/site/www/front/webfont/NanumGothic-Regular.woff2") format("woff2"), url("/front/webfont/NanumGothic-Regular.woff") format("woff"), url("/front/webfont/NanumGothic-Regular.ttf") format("truetype");
}
/* 나눔 Bold */
@font-face {
  font-family: 'ng-bold';
  font-style: normal;
  font-weight: 400;
  src: url("/common/site/www/front/webfont/NanumGothic-Bold.eot");
  src: url("/common/site/www/front/webfont/NanumGothic-Bold.eot?#iefix") format("embedded-opentype"), url("/common/site/www/front/webfont/NanumGothic-Bold.woff2") format("woff2"), url("/front/webfont/NanumGothic-Bold.woff") format("woff"), url("/front/webfont/NanumGothic-Bold.ttf") format("truetype");
}
html {font-family: "ng";  font-size: 13px;  color: #333;}
* {margin: 0;  padding: 0;  -webkit-text-size-adjust: none;  word-break: break-all;}
*, *::before, *::after { -webkit-moz-box-sizing: border-box;  -ms-moz-box-sizing: border-box;  -o-moz-box-sizing: border-box;  box-sizing: border-box;}
a, a:hover, a:active, a:visited {text-decoration:none;}
.error {max-width:1180px; margin:110px auto 0 auto;}
h1 {width:100%; height:98px; padding-top:24px; border-bottom:2px solid #333;}
dl {width:100%; padding:186px 10px 80px 10px; text-align:center; border-bottom:1px solid #d9d9d9; background:url("/common/site/www/front/images/common/error.gif") center 54px no-repeat;}
dt {padding-bottom:15px; font-size:48px; color:#333;}
dd {font-size:16px; color:#666;  line-height:1.8em;}
.btn_c {width:100%; padding-top:35px; text-align:center;}
.btn_blueM {padding-left:30px; padding-right:30px; font-size:14px; color:#fff !important; text-align:center;  line-height:40px; background:#0073bd; display:inline-block; }
@media screen and (max-width:800px) {
.error {margin:0 auto 0 auto;}
dt {padding-bottom:15px; font-size:36px; color:#333;}
dd {font-size:14px; color:#666;  line-height:1.8em;}
}
@media screen and (max-width:520px) {
dt {padding-bottom:15px; font-size:24px; color:#333;}
dd {font-size:12px; color:#666;  line-height:1.8em;}
}
</style>
</head>
<body>
	<div class="error">
		<!-- <h1><img src="/common/site/www/front/images/common/logo.jpg" alt=""></h1> -->
		<h1></h1>
		<dl>
			<dt>페이지 오류 안내</dt>
			<dd>서비스 중 일시적인 오류가 발생하였습니다.<br/>
			인터넷 창을 닫고 다시 여시거나 잠시 후 다시 접속하여 주시기 바랍니다. <br/>이용에 불편을 드려 죄송합니다.</dd>
		</dl>
		<div class="btn_c">
			<a href="${pageContext.request.contextPath}" class="btn_blueM">메인으로 이동</a>
		</div>
	</div>
</body>
</html>