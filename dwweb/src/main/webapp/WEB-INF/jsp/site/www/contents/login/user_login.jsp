<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<title>교통 신호등 시설물 통합관리 시스템 || 로그인</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<style>
body {
color:#ffffff;
	background: #2c2f3e;
	background-size: cover;
	-webkit-background-size: cover;
	-moz-background-size: cover;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#userId").focus()
	
	//키이벤트 처리
	$("input").keydown(function(){
		var keycode = event.keyCode;
		var id = $(this).attr('id');
		
		//엔터처리시
		if(keycode == 13){
			loginAct();
		}
	});

	$("#btnLogin").click(function(){
		loginAct();
	})
	
	//로그인 처리
	function loginAct(){	
		if(stringUtil.isEmpty($("#userId").val())){
			alert('아이디를 입력하세요.');
			$("#userId").focus();
			return;
		}
		
		if(stringUtil.isEmpty($("#userPwd").val())){
			alert('비밀번호를 입력하세요.');
			$("#userPwd").focus();
			return;
		}
		
		$("#frm").attr("method","post");
		$("#frm").attr("action","${pageContext.request.contextPath}/login/loginAct.do");
		$("#frm").submit();
	}
	
});

$(window).on('load', function () {
	//전체화면 설정
});	
</script>

<script>
/* Get the element you want displayed in fullscreen */ 
var elem = document.documentElement;

/* Function to open fullscreen mode */
function openFullscreen() {
  if (elem.requestFullscreen) {
    elem.requestFullscreen();
  } else if (elem.mozRequestFullScreen) { /* Firefox */
    elem.mozRequestFullScreen();
  } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
    elem.webkitRequestFullscreen();
  } else if (elem.msRequestFullscreen) { /* IE/Edge */
    elem = window.top.document.body; //To break out of frame in IE
    elem.msRequestFullscreen();
  }
}

/* Function to close fullscreen mode */
function closeFullscreen() {
  if (document.exitFullscreen) {
    document.exitFullscreen();
  } else if (document.mozCancelFullScreen) {
    document.mozCancelFullScreen();
  } else if (document.webkitExitFullscreen) {
    document.webkitExitFullscreen();
  } else if (document.msExitFullscreen) {
    window.top.document.msExitFullscreen();
  }
}
</script>
</head>

<body text="black" link="blue" vlink="purple" alink="red">
<form name="frm" id="frm">
<input type="hidden" name="seq" id="seq" value="${userVo.seq}"/>
<div id="myP">

</div>
<table border="0" width="100%" cellpadding="0" cellspacing="0" height="100%">
    <tr>
        <td>
            <table border="0" width="379" height="412" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="392" background="${pageContext.request.contextPath}/images/img/login_bg_1.png" valign="top">
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" height="0%">
                            <tr>
                                <td width="56" height="267">&nbsp;</td>
                                <td width="166" height="267">&nbsp;</td>
                                <td width="34" height="267">&nbsp;</td>
                                <td width="123" height="267">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="56" height="29">&nbsp;</td>
                                <td width="166" height="29">
                                        <table border="1" width="156" height="29" bordercolor="#ececec" cellspacing="0">
                                    	<tr>
                                        	<td bordercolor="#ececec">
                                            	<input type="text" name="userId" id="userId" size="28" autocomplete="off" style="background-color:transparent;border:0;" placeholder="아이디">
                                            </td>
                                        </tr>    
                                    </table>  
								</td>
                                <td width="34" height="29">&nbsp;</td>
                                <td width="123" height="29">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="56" height="11"></td>
                                <td width="166" height="11"></td>
                                <td width="34" height="11"></td>
                                <td width="123" height="11"></td>
                            </tr>
                            <tr>
                                <td width="56" height="28">&nbsp;</td>
                                <td width="166" height="28">
                                         <table border="1" width="156" height="29" bordercolor="#ececec" cellspacing="0">
                                            <tr>
                                                <td bordercolor="#ececec">
                                                    <input type="password" onpaste="return false;" name="userPwd" id="userPwd" size="28" autocomplete="off" style="background-color:transparent;border:0;" placeholder="비밀번호">
                                                </td>
                                            </tr>    
                                        </table> 
								</td>
                                <td width="34" height="28">&nbsp;</td>
                                <td width="123" height="28">
                                	<a href="javascript:;" id="btnLogin">
                                	<img src="${pageContext.request.contextPath}/images/img/login.png" width="73" height="28" border="0" style="border-style:none;" /></a>
                                	<!-- <a href="javascript:openFullscreen();">full</a> -->
                                </td>
                            </tr>
                            <tr>
                                <td width="56">&nbsp;</td>
                                <td width="166">&nbsp;</td>
                                <td width="34">&nbsp;</td>
                                <td width="123">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="56">&nbsp;</td>
                                <td width="166">&nbsp;</td>
                                <td width="34">&nbsp;</td>
                                <td width="123">&nbsp;</td>
                            </tr>
                        </table>                        
                    </td>
                </tr>
                <tr>
                    <td height="20">&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</form>
</body>
</html>