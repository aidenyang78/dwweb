var contextPath = "/dwweb/";
var currMenuDepth1 = -1;
var currMenuDepth2 = -1;

/********************************
 * 초기 화면에 대한 공통이벤트 등록
*********************************/
//$(window).load(
$(document).ready(
	function(){

		//화면 입력항목에 대한 공통 설정
		setInputField(null);

		//화면 전체의 input 객체 중 comma가 들어가는 항목들에 모두 comma를 추가한다.
		setAllComma();

		/** gnb add class
		// when ajax page
		$("#gnbWrap .gnb li").click(function(){
			$(this).removeClass('on');
		    $(this).addClass('on');
		});
		 */
		/*
		$("#gnbWrap .gnb li").removeClass('on');
		var currentPath = window.location.pathname;
		var lastIndex = currentPath.lastIndexOf("/");
		var startIndex = currentPath.lastIndexOf("site/");
		var category =currentPath.substring(startIndex+5,lastIndex);
		switch (category) {
//		홈페이지관리
		case 'request':$("#gnbWrap .gnb li.menu_962").addClass('on');break;
//		프로젝트관리
		case 'project':$("#gnbWrap .gnb li.menu_103").addClass('on');break;
//		인력투입관리
		case 'manpower':$("#gnbWrap .gnb li.menu_104").addClass('on');break;
//		지출관리
		case 'expense':$("#gnbWrap .gnb li.menu_105").addClass('on');break;
//		연차관리
		case 'annual':$("#gnbWrap .gnb li.menu_106").addClass('on');break;
//		운영관리
		case 'member':$("#gnbWrap .gnb li.menu_102").addClass('on');break;
//		사이트관리
		case 'menu':$("#gnbWrap .gnb li.menu_101").addClass('on');break;
		default:break;
		}
		*/
		gfn_setbrowserTile();
		
		setCurrMenu();
	}
	
	
);

/**
 * IE8 에서의 trim 사용불가로 인한 설정
 */
if(typeof String.prototype.trim !== 'function') {
	String.prototype.trim = function(){
		return this.replace(/^\s+|\s+$/g, '');
	}
}

//트위터
fnTwitter = function(msg, url){
	var href = "http://twitter.com/home?status=" + encodeURIComponent(msg) + " : " + encodeURIComponent(url);
	var a = window.open(href, 'twitter', '');

	if(a){a.focus();}
};

// 페이스북
fnFacebook = function(msg, url){
	var isIE = (document.all)?true:false;

	if(isIE){
		if(confirm("내용을 클립보드에 복사하시겠습니까?")){
			window.clipboardData.setData('Text', msg);
		}else{
			return;
		}
	}else{
		var temp = prompt("페이스북으로 보내질 내용입니다. Ctrl+C를 눌러 클립보드에 복사하세요.", msg);
		if(temp == null || temp == undefined || temp == ""){
			return;
		}
	}

	var href = "http://www.facebook.com/sharer.php?s=100&p[url]=" + encodeURIComponent(url);
	var a = window.open(href, 'facebook', '');

	if(a){a.focus();}
};

/**
 * 화면 입력항목에 대한 설정
 * input 객체의 accesskey 속성에 따라 작동함
 * NUM : 정수
 * DBL : 실수
 */
function setInputField(gbn) {

	var commaYn = true;
	var periodYn = true;
	var hyphenYn = true;

	if(gbn != null && gbn.replace(/^\s+|\s+$/g, '') != ""){
		commaYn = false;
		periodYn = false;
		hyphenYn = false;

		var gbnList = gbn.split(",");
		for(var key in gbnList){
			if(gbnList[key] == 'COMMA')commaYn = true;//44
			if(gbnList[key] == 'PERIOD')periodYn = true;//46
			if(gbnList[key] == 'HYPHEN')hyphenYn = true;//45
		}
	}

	//숫자만 입력 가능한 항목에 대해 숫자(실수) 외 입력금지 이벤트 설정
	$("input[accesskey=DBL]").bind('keypress',
		function(e) {
			console.log("keyCode : " + e.keyCode);
			//숫자 및 .(콤마), -(마이너스), 백스페이스, 엔터 등만 입력 허용한다.
			if((e.keyCode >= 48 && e.keyCode <= 57)
				|| (e.keyCode == 8)
				|| (e.keyCode == 13)
				|| (commaYn && e.keyCode == 44)
				|| (hyphenYn && e.keyCode == 45)
				|| (periodYn && e.keyCode == 46)) {

				//첫번째 숫자 0 두개이상 입력금지
				if(e.keyCode == 48) {

					if($(e.target).val() == "0") {

						return false;

					}

				}

				//마이너스 기호는 앞에만 입력허용
				if(e.keyCode == 45) {

					if($(e.target).val().trim() != "") {

						return false;

					}

				}

				//소수점 하나이상 입력 금지
				if(e.keyCode == 46) {

					if($(e.target).val().indexOf(".") > -1) {

						return false;

					}

				}

			} else {

				return false;

			}

		}

	);

	//숫자만 입력 가능한 항목에 대해 숫자(정수) 외 입력금지 이벤트 설정
	$("input[accesskey=NUM]").bind('keydown',
		function(e) {

			//숫자만 입력 허용한다. (백스페이스, del, tab키도 입력허용)
			if((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 96 && e.keyCode <= 105) || e.keyCode == 46 || e.keyCode == 8 || e.keyCode == 9) {

				return true;

			} else {

				return false;

			}

		}

	);

	//숫자만 입력 가능한 항목에 대해 숫자(정수) 외 입력금지 이벤트 설정
	$("input[accesskey=COMMA]").bind('keydown',
		function(e) {

			//숫자만 입력 허용한다. (백스페이스, del, tab키도 입력허용)
			if((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 96 && e.keyCode <= 105) || e.keyCode == 46 || e.keyCode == 8 || e.keyCode == 9) {
				
				return true;

			} else {
				
				//마이너스 기호는 앞에만 입력허용
				if(e.keyCode == 109 || e.keyCode == 189) {

					if($(e.target).val().trim() == "") {

						return true;

					}

				}
				
				return false;

			}

		}

	);

	//돈 단위(1,000원) 입력시 구분자를 자동으로 제거한다.
	$("input[accesskey=COMMA]").bind('focus',
		function(e) {

			$(e.target).val(numberUtil.removeComma($(e.target).val()));

		}

	);

	//돈 단위(1,000원) 구분자를 자동으로 입력한다.
	$("input[accesskey=COMMA]").bind('blur',
		function(e) {

			//숫자만 입력 허용한다.
			if(e.keyCode < 48 || e.keyCode > 57) {

				return false;

			}

			$(e.target).val(numberUtil.isComma($(e.target).val()));

		}

	);

	//input객체의 maxlength 설정보다 긴 문자열이 입력되면 입력을 제한한다.
	$("input, textarea").bind('keyup',
		function(e) {

			//maxlength 속성이 없는 객체는 99999로 문자열제한길이 설정
			var intMaxLength = 0;
			if(typeof($(e.target).attr('maxlength')) != "undefined") {
				intMaxLength = parseInt($(e.target).attr('maxlength'));
			} else {
				intMaxLength = 99999;
			}

			if(stringUtil.isStringByte($(e.target).val()) > intMaxLength) {

				$(e.target).val(setLimitChar($(e.target).val(), intMaxLength));

				return false;

			}

		}
	);

}


/**
 * 지정된 길이 이상의 문자열은 길이를 제한하여 반환한다.
 * (2byte씩 계산하여 반환)
 * @param strText 자릿수를 검사할 문자열
 */
function setLimitChar(strText, intMaxLength) {

	var strReturnText = "";

	var tcount = 0;
	var tmpStr = strText;
	var temp = tmpStr.length;
	var onechar;
	for (var k=0; k<temp; k++ ) {
		onechar = tmpStr.charAt(k);
		if (escape(onechar).length > 4) {
			tcount += 2;
		} else {
			if(escape(onechar) == "%0A") {	//Enter키는 2byte 처리
				
				tcount += 2;
				
			} else {
				
				tcount += 1;
				
			}
		}

		if(tcount > intMaxLength) {
			break;
		}

		strReturnText += onechar;

	}

	alert("지정된 문자길이 최대 " + intMaxLength + "byte를 넘었습니다.");

	return strReturnText;

}

/**
 * 폼 전송시 전체 객체의 disabled 속성을 해제한다.
 */
function setSubmitAttr() {

	$("input, textarea, select").prop('disabled', false);

}

/**
 * 화면 전체의 input 객체 중 comma가 들어가는 항목들에 모두 comma를 추가한다.
 */
function setAllComma() {

	$("input[accesskey=COMMA").each(
		function() {

			$(this).val(numberUtil.isComma($(this).val()));

		}
	);

}


/**
 * 폼 전송시 input객체 중 comma가 들어간 숫자에서 comma를 모두 제거한다.
 */
function setRemoveAllComma() {

	$("input[accesskey=COMMA").each(
		function() {

			$(this).val(numberUtil.removeComma($(this).val()));

		}
	);

}


function fnStyleTab(obj, tagClass){
	var $ul = $(obj).parent("li").parent("ul");
	$ul.find("li").removeClass("on");
	$(obj).parent("li").addClass("on");
	var cnt = 0;
	$ul.find("li").each(function(){
		if($(this).hasClass("on")){
			return false;
		}
		cnt++;
	});
	$("."+tagClass).hide();
	$("."+tagClass).eq(cnt).show();
}

function fnStyleTab2(obj, tagClass){
	var $ul = $(obj).parent("li").parent("ul");
	$ul.find("li").find("a").removeClass("on");
	$(obj).addClass("on");
	var cnt = 0;
	$ul.find("li").find("a").each(function(){
		if($(this).hasClass("on")){
			return false;
		}
		cnt++;
	});
	$("."+tagClass).hide();
	$("."+tagClass).eq(cnt).show();
}

function alertChkMsg(message, gubun, length){
	var alertMsg = message + "를(을)" + " " + gubun + "해 주세요.";
	if(length != null && length != '' && length && length > 0){
		alertMsg += "\n" + length + "자 이상 " + gubun + "하셔야 합니다.";
	}

	alert(alertMsg);
}

function getCookie( name ){
	
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length ) {
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie ) {
			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) endOfCookie = document.cookie.length;
			return decodeURIComponent( document.cookie.substring( y, endOfCookie ) );
		}
		x = document.cookie.indexOf( " ", x ) + 1;
		if ( x == 0 ) break;
	}
	return "";
}

function setCookie( name, value, expiredays ) {
	
	/*var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	todayDate.setHours(0);
	todayDate.setMinutes(0);
	todayDate.setSeconds(0);
	document.cookie = name + "=" + encodeURIComponent( value ) + "; path=/; expires=" + todayDate.toGMTString() + "; httpOnly";*/
	
	var exdate = new Date();

	exdate.setDate(exdate.getDate() + expiredays);
	
	var c_value = escape(value) + ((expiredays==null) ? "" : "; path=/; expires="+exdate.toUTCString());
	
	document.cookie = name + "=" + c_value;
}

function windowOpen(url, name, pop_width, pop_height, pop_top, pop_left){
	if(typeof url == "undefined" || url == null || url == ""){
		return;
	}
	if(typeof name == "undefined" || name==null || name==""){
		name="popup";
	}
	if(typeof pop_width == "undefined" || pop_width==null || pop_width==""){
		pop_width = 0;
	}
	if(typeof pop_height == "undefined" || pop_height==null || pop_height==""){
		pop_height = 0;
	}
	if(typeof pop_top == "undefined" || pop_top==null || pop_top==""){
		pop_top = 0;
	}
	if(typeof pop_left == "undefined" || pop_left==null || pop_left==""){
		pop_left = 0;
	}
	var popup = window.open(url,name,'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width='+pop_width+',height='+pop_height+',top='+pop_top+',left='+pop_left);
	popup.focus();
}

/**
 * ajax setup
 */
$.ajaxSetup({
	type:"POST"
	,dataType: "json"
	,async : true
	,cache : false		// 캐시저장안함
});

/**
 * getJsonData
 * 요청하는 페이지를 JSON 형태로 리턴
 */
getJsonData = function(method, url, param, errorYn) {

	var returnJson = "";

	$.ajax({
		 type : method 		// 전송타입
		,url : url 			// 액션
		,data : param 		// 파라미터
		,dataType : "json"	// 데이타타입은 json으로 설정
		,async : false		// 동기형태로 실행
		,cache : false		// 캐시저장안함
		,success : function(data, textStatus) { //요청 성공하면


			returnJson = data; //return받은 결과를 json 객체로 parsing함.

		} //success end
		,error : function(xhr, textStatus, errorThrown) { //요청 실패하면

			if(errorYn == "Y") {
				var e = "xhr : " + xhr + "\ntextStatus : " + textStatus + "\nerrorThrown : " + errorThrown;
				alert(e);
			}
		} //error end
	}); //ajax end

	return returnJson;
}

/**
 * getHtmlData
 * 요청하는 페이지를 HTML 형태로 리턴
 */
getHtmlData = function(method, url, param, target, async, errorYn) {
	if(async == null ||  async == ''){
		async = false;
	}

	$.ajax({
		 type : method 		// 전송타입
		,url : url 			// 액션
		,data : param 		// 파라미터
		,dataType : "html"	// 데이타타입은 html으로 설정
		,async : async		// 동기형태로 실행
		,cache : false		// 캐시저장안함
		,success : function(data, textStatus) { //요청 성공하면

			if(data.replace(/\s+/g,"") != ""){
				$(target).html(data);
			}

		} //success end
		,error : function(xhr, textStatus, errorThrown) { //요청 실패하면

			if(errorYn == "Y") {
				var e = "xhr : " + xhr + "\ntextStatus : " + textStatus + "\nerrorThrown : " + errorThrown;
				alert(e);
			}
		} //error end
	}); //ajax end
}

//캘린더 설정
var datepickerSet = {
		changeMonth: true,	//월 셀렉트박스 선택
		changeYear: true,	//년 셀렉트박스 선택
		showMonthAfterYear: true,	//년, 월 순으로 표시
		showButtonPanel : false,
		closeText: '확인',	//닫기버튼 명칭 변경
		prevText: '<',	//이전달 버튼 명칭 변경
		nextText: '>',	//다음달 버튼 명칭 변경
		currentText: '오늘',	//오늘날짜 버튼 명칭 변경
		monthNames: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		weekHeader: 'Wk',
		dateFormat : 'yymmdd',
		firstDay: 1,
		isRTL: false,
		showOn:'focus',
		yearSuffix: ''
};

//** ---------------------------------------------------------------------------
//함 수 명 :
//인    자 : e			(event)
//결    과	: keycode
//목    적 : KeyCode 값을 준다
//플 로 우 :
//검    수 :
//생 성 일 :
//수    정 :
//사용예제 : uf_getKeyCode(e)
//주의사항 :
//** ---------------------------------------------------------------------------
function fnGetKeyCode(e)
{
	var result = "";

	if(window.event)
	{
		result	= window.event.keyCode;
	}
	else if(e)
	{
		result	= e.which;
	}

	return result;
}

//게시판 첨부 파일 다운로드
function fnFileDownAction(file_seq){
	location.href=contextPath+"board/boardFileDownAct.do?fileSeq=" + file_seq;
}

//페이징
function fnGoPage(pageNo, url){
	
	/*var frm = document.frm;

	if(url == "/") url = "";
	if(url == "") url = $(location).attr('pathname');

	frm.pageNo.value=pageNo;
	frm.action=url;
	frm.submit();*/

	if(url == "/") url = "";
	if(url == "") url = $(location).attr('pathname');

	
	$("#pageNo").val(pageNo);
	$("#frm").attr("method","post");
	$("#frm").attr("action",url);
	$("#frm").submit();
}

//공통코드 셀렉트 박스 생성
function selectBoxOption(list, id, str_yn){
	var selectId = document.getElementById(id);
	var selectVal = selectId.value;
	selectId.innerHTML="";

	if(str_yn){
		var option = document.createElement("option");
		option.value="";
		option.text="--선택--";
		selectId.options.add(option);
	}
	if(list.length > 0){
		for(var i=0; i < list.length; i++){
			var new_option = document.createElement("option");
			//TODO 코드 명에 맞게 수정
			new_option.value = list[i].codeCd;
			new_option.text = list[i].codeNm;
			if(selectVal == list[i].codeCd){new_option.selected=true;}
			selectId.options.add(new_option);
		}
	}
}

//------------------------------------------------------------------------------------
function fnTableNotData(table_id, table_nm, colspan){
	if(colspan == null || colspan == ''){
		colspan = $('#'+table_id+' th').length;
	}
	var $table = $("#" + table_id);
	if($table.length == 0){
		return;
	}

	var $tbody = $("#" + table_id + " tbody");
	if($tbody.length > 0){
		$tbody.append('<tr><td colspan="'+colspan+'" style="text-align: center;"><b>'+table_nm + '</b> 이/가 없습니다.</td></tr>');
	}else{
		var $tfoot = $("#" + table_id + " tfoot");
		if($tfoot.length > 0){
			$tfoot.append('<tr><td colspan="'+colspan+'" style="text-align: center;"><b>'+table_nm + '</b> 이/가 없습니다.</td></tr>');
		}else{
			var table = document.getElementById(table_id);
			var row = table.insertRow();
			var cell = row.insertCell();
			cell.colSpan = colspan;
			//cell.className = "last";
			cell.style.textAlign = "center";
			cell.innerHTML = '<b>'+table_nm + '</b> 이/가 없습니다.';
		}
	}
}

function fnLocationGo(message, type, url, script){
	if(message != null && message != ""){

		alert(message);

		if(script != null && script != "") {
			eval(script);
		}
	}
	if(type == "B"){
		history.go(-1);
	}else if(type == "L"){
		if(url != 'null' && url != '') {
			window.location.href=url;
		}
	}else{
		return;
	}
}

function fnLocationConfirmGo(message, type, url, script){
	if(message != null && message != ""){
		if(!confirm(message)){

			if(script != null && script != "") {
				eval(script);
			}

			return;
		}
	}
	if(type == "B"){
		history.go(-1);
	}else if(type == "L"){
		if(url != 'null' && url != '') {
			window.location.href=url;
		}
	}else{
		return;
	}
}

function fnCheckBoxAll(obj, name){
	var checkboxArry = document.getElementsByName(name);

	if(checkboxArry.length > 0){
		for(var i=0; i < checkboxArry.length; i++){
			checkboxArry[i].checked = obj.checked;
		}
	}
}

//문자열 관련
var stringUtil = {
		//바이트 구하기
		isStringByte : function(strValue){
			var nTotalByte;
			var cOneChar;

			nTotalByte			= 0;
			cOneChar			= "";

			if ( strValue.length == 0 ){return nTotalByte;}
			for( var i=0; i < strValue.length; i++ ){
				cOneChar = strValue.charAt(i);
				if( escape(cOneChar).length > 4 ){nTotalByte += 2;}
				else{nTotalByte ++;}
			}
			return nTotalByte;
		},
		//공백제거
		//strValue(문자열)
		//strTrimType(공백제거형식)
		//1. L	: 왼쪽공백제거
		//2. R	: 오른쪽공백제거
		//3. B	: 양쪽공백제거
		//3. A	: 전체공백제거
		isTrim : function(strValue,strTrimType){
			var strReturn;
			strReturn = "";

			switch ( strTrimType.toUpperCase() ){
				case "L" : strReturn = strValue.replace(/^\s+/g,"");
					break;
				case "R" : strReturn = strValue.replace(/\s+$/g,"");
					break;
				case "B" : strReturn = strValue.replace(/^\s+/g,"").replace(/\s+$/g,"");
					break;
				case "A" : strReturn = strValue.replace(/\s+/g,"");
					break;
				default : strReturn = strValue;
					break;
			}
			return strReturn;
		},
		//replaceAll ("111-111-111", "-", "") -> "111111111"
		replaceAll : function(str, target, replace){
			return str.split(target).join(replace);
		},
		lengthStr : function(value, length, str){
			if(value != null && value != '' && value.length > length){
				value = value.substring(0, length - 1);
				if(str != null && str != ""){
					value += str;
				}
			}
			return value;
		},
		//null 및 'null'를 체크
		isNull : function(str){
			if(str == null || str == 'null' || str == 'NULL'){
				return true;
			}
			return false;
		},
		//null 및 공백 체크
		isEmpty : function(str){
			str = String(str);
			if(str == null || str == '' || str.replace(/\s+/g, '') == '' || str == "null" || str == "NULL"){
				return true;
			}
			return false;
		},
		//null 및 'null'를 체크 하여 변경할 값 리턴
		nullToCustom : function(str, cha){
			if(str == null || str == 'null' || str == 'NULL' || str == '' || str.replace(/\s+/g, '') == ''){
				if(cha == null){
					return '';
				}
				return cha;
			}
			return str;
		},
		//null 및 'null'를 체크 하여 ''값으로 리턴
		nullToBlank : function(str){
			if(str == null || str == 'null' || str == 'NULL' || str == '' || str.replace(/\s+/g, '') == ''){
				return '';
			}
			return str;
		},
		//null 및 'null'를 체크 하여 0값으로 리턴
		nullToZero : function(str){
			if(str == null || str == 'null' || str == 'NULL' || str == '' || str.replace(/\s+/g, '') == ''){
				return 0;
			}
			return str;
		},
		htmlTagConvert : function(str){
			str = str.replace(/&amp;/g, "&");
			str = str.replace(/&lt;/g, "<");
			str = str.replace(/&gt;/g, ">");
			str = str.replace(/&#34;/g, "\"");
			str = str.replace(/&#39;/g, "\'");
			return str;
		},
		isLength : function(str){
			str = String(str);
			str = str.replace(/\s+/g, '');
			return str.length;
		}
	};

var numberUtil = {
		///숫자에 콤마를 붙여준다.
		isComma : function(str){
			var reg = /(^[+-]?\d+)(\d{3})/;
			str += '';
			while (reg.test(str))
			    str = str.replace(reg, '$1' + ',' + '$2');
			return str;
		},
		///숫자에서 콤마를 삭제한다.
		removeComma : function(str){
		    str = str.replace(/,/gi, "");
			return str;
		},
		isNumberCheck : function(val){
			if(val == null || val == ""){
				return true;
			}
			var number = "0123456789";
			var temp = null;
			for(var i=0; i < val.length; i++){
				temp = val.substring(i, i+1);
				if(number.indexOf(temp) == - 1){
					return false;
				}
			}
			return true;
		},
		isNumberCheck2 : function(obj){
			if(obj.value == null || obj.value == ""){
				return;
			}
			var number = "0123456789";
			var temp = null;
			for(var i=0; i < obj.value.length; i++){
				temp = obj.value.substring(i, i+1);
				if(number.indexOf(temp) == - 1){
					alert("숫자만 입력하세요.");
					obj.value = obj.value.substring(0, i);
					obj.focus();
					break;
				}
			}
		}
};

var dateUtil = {
		//시간에 : 를 붙여준다.
		//예) 1500 -> 15:00
		//4자리가 넘을 시 입력받은 값을 리턴한다.
		isTimeColon : function(num){
			var return_val = null;
			if(num.length != 4){
				return_val = num;
			}else{
				return_val = num.substring(0,2) + ":" + num.substring(2,4);
			}
			return return_val;
		},
		//날짜를 쪼개 날짜 타입을 변경
		//date : 날짜 8자가 넘거나 작을 경우 입력받은 값 리턴
		//ch : 구분자 '-', '.' 등
		//예) 20130501 - 2013-05-01
		isFormatDate : function(date, ch){
			var temp = String(date);

			var return_val = null;
			if(temp.length == 8 && ch != null && ch != ""){
				return_val = temp.substring(0 , 4) + ch + temp.substring(4 , 6) + ch + temp.substring(6 , 8);
			}else{
				return_val = temp;
			}
			return return_val;
		},
		isWeek : function(val){
			var date = String(val);
			var return_val = '';
			date = stringUtil.replaceAll(date, '[^0-9]', '');
			if(date.length == 8){
				var tempDate = new Date(date.substring(0, 4), parseInt(date.substring(4, 6))-1, date.substring(6, 8));
				var week = ['일', '월', '화', '수', '목', '금', '토'][tempDate.getDay()];
				return_val = week;
			}
			return return_val;
		},
		//입력받은 날짜를 Time으로 변환하여 반환한다.
		//date : 날짜 8자가 넘거나 작을 경우 입력받은 값 리턴
		getTime : function(date) {

			var temp = String(date);
			var return_val = null;

			if(temp.length != 8) {

				return_val = temp;

			} else {

				var objDate = new Date(temp.substring(0 , 4), temp.substring(4 , 6), temp.substring(6 , 8));
				return_val = objDate.getTime();

			}
			return return_val;

		},
		//시작일과 종료일의 일자 차이를 반환한다.
		//date_st : 시작일, date_ed : 종료일
		getDiffDay : function(date_st, date_ed) {

			//일자를 Time으로 변환 후 일자로 재변환
			var days = (dateUtil.getTime(date_ed) - dateUtil.getTime(date_st)) / 60 / 60/ 24 / 1000;
			return days;
		},
		//현재 날짜를 반환한다. (예 : 20150301)
		getCurrentDate : function() {

			var date = new Date();
			var todayDate = "";

			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();

			if(month < 10) {
				month = "0" + month;
			}
			if(day < 10) {
				day = "0" + day;
			}

			todayDate = year + "" + month + "" + day;
			return todayDate;

		},
		addYearMonthDay : function(date, year, month, day) {
			date = stringUtil.replaceAll(date, '[^0-9]', '');
			if(date.length == 8){
				year = Number(year);
				month = Number(month);
				day = Number(day);
				var tDate = new Date(parseInt(date.substring(0, 4)) + year, parseInt(date.substring(4, 6))-1 + month, parseInt(date.substring(6, 8)) + day);
				year = String(tDate.getFullYear());
				month = tDate.getMonth() + 1 < 10 ? "0" + String(tDate.getMonth() + 1) : tDate.getMonth() + 1;
				day = tDate.getDate() < 10 ? "0" + String(tDate.getDate()) : tDate.getDate();

				date = year + month + day;
			}
			return date;
		},
		addYear : function(date, year) {
			return dateUtil.addYearMonthDay(date, year, 0, 0);
		},
		addMonth : function(date, month) {
			return dateUtil.addYearMonthDay(date, 0, month, 0);
		},
		addDay : function(date, day) {
			return dateUtil.addYearMonthDay(date, 0, 0, day);
		},
		/**
		 * 텍스트가 날짜 형식인지 체크한다. 
		 * @param {Object} strDate 날짜형식의 문자열
		 */
		isDate : function(strDate){
			
			var strDateInt = stringUtil.replaceAll(strDate,"\-","");
			var blnDate = false;
			strDateInt = stringUtil.replaceAll(strDateInt,"\/","");
			strDateInt = stringUtil.replaceAll(strDateInt,"\:","");
			strDateInt = stringUtil.replaceAll(strDateInt," ","");
			
			if(numberUtil.isNumberCheck(strDateInt)) {
				
				switch (strDateInt.length) {
					
					case 8 : //MMDDYYYY YYYYMMDD
						
						blnDate = dateUtil.isDay(strDateInt.substring(0,4), strDateInt.substring(4,6), strDateInt.substring(6,8));
						break;
					
				}
				
			}
			
			return blnDate;
			
		},
		/**
		 * 2월 달의 마지막 날짜를 체크한다.
		 * @param {Object} strYear
		 * @param {Object} strMonth
		 * @param {Object} strDay
		 */
		isDay : function(strYear, strMonth, strDay){
			
			var intYear = parseInt(strYear,10);
			var intMonth = parseInt(strMonth,10) - 1;
			var intDay = parseInt(strDay,10);
			var objArrayEndDay = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
			
			if ((intYear % 4 === 0 && intYear % 100 !== 0) || intYear % 400 === 0) {
				objArrayEndDay[1] = 29;
			}
			
			return (intDay >= 1 && intDay <= objArrayEndDay[intMonth]);
			
		},
		test : function() {

		}


};
//첨부파일 확장자 유효성 검사
var fileUtil = {
	isFileExtsnCheck : function(ext, arry){
		var re_val = true;
		ext = ext.slice(ext.indexOf(".") + 1).toLowerCase();
		if(arry != null && arry.length > 0){
			for(var key in arry){
				if(ext == arry[key].toLowerCase()){
					re_val = false;
					break;
				}
			}
		}

		return re_val;
	}
};

var regUtil = {
	getTemplate: function(flag){
		switch(flag){
			case "email":
				return ["chol.com", "dreamwiz.com", "empal.com", "freechal.com", "gmail.com", "hanafos.com", "hanmail.net", "hanmir.com", "hitel.com", "hotmail.com", "korea.com", "lycos.co.kr", "nate.com", "naver.com", "netian.com", "paran.com", "yahoo.com", "yahoo.co.kr", "직접 입력"];
			break;
			case "domesticLinePhone":
				return ["02", "031", "032", "033", "041", "042", "043", "044", "051", "052", "053", "054", "055", "061", "062", "063", "064", "070"];
			break;
			case "domesticLineName":
				return ["서울특별시", "경기도", "인천광역시", "강원도", "충청남도", "대전광역시", "충청북도", "세종특별자치시", "부산광역시", "울산광역시", "대구광역시", "경상북도", "경상남도", "전라남도", "광주광역시", "전라북도", "제주특별자치도", "인터넷전화"];
			break;
			case "domesticMobilePhone":
				return ["010", "011", "016", "017", "018", "019"];
			break;
			default:break;
		}
	}
	, isPhoneNumber: function(str){ //올바른 전화번호 형태인지 boolean으로 return한다.
		var reg = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		return reg.test(str) ? true : false;
	} //method end
};


/******************************
 * 시간을 선택할 수 있는 콤보박스를 생성한다.
 ******************************/
function getTimeComboBox(objComboBox, strDefaultData) {

	if(typeof(strDefaultData) === "undefined"){strDefaultData = "";}

	for(var i=0; i<24; i++) {

		var strTime = "";

		if(i < 10) {

			strTime = "0" + i;

		} else {

			strTime = i;

		}

		var strSelected = "";
		if(strDefaultData == strTime) {
			strSelected = "selected";
		}

		var objOption = "<option value='" + strTime + "' " + strSelected + ">" + strTime + "시</option>";
		$(objComboBox).append(objOption);

	}

}

/******************************
 * 분을 선택할 수 있는 콤보박스를 생성한다.
 ******************************/
function getMinuteComboBox(objComboBox, strDefaultData) {

	if(typeof(strDefaultData) === "undefined"){strDefaultData = "";}

	for(var i=0; i<60; i++) {

		var strTime = "";

		if(i < 10) {

			strTime = "0" + i;

		} else {

			strTime = i;

		}

		var strSelected = "";
		if(strDefaultData == strTime) {
			strSelected = "selected";
		}

		var objOption = "<option value='" + strTime + "' " + strSelected + ">" + strTime + "분</option>";
		$(objComboBox).append(objOption);

	}

}


//년도 콤보박스를 생성한다.
/******************************
 * 년도를 선택할 수 있는 콤보박스를 생성한다.
 ******************************/
function getYearComboBox(objComboBox, strDefaultData, strStartYear) {

	var objOption = "";
	var strSelected = "";

	if(typeof(strStartYear) == "undefined") {

		strStartYear = 2015;

	}

	for(var i=strStartYear; i<=2020; i++) {

		if(strDefaultData == i) {

			strSelected = "selected";

		} else {

			strSelected = "";

		}

		objOption = "<option value='" + i + "' " + strSelected + ">" + i + "</option>";
		$(objComboBox).append(objOption);

	}

}

/******************************
 * 월을 선택할 수 있는 콤보박스를 생성한다.
 ******************************/
function getMonthComboBox(objComboBox, strDefaultData) {

	var objOption = "";
	var strSelected = "";

	var month = "";
	for(var i=1; i<=12; i++) {

		if(i < 10) {

			month = "0" + i;

		} else {

			month = i;

		}

		if(strDefaultData == i) {

			strSelected = "selected";

		} else {

			strSelected = "";

		}

		objOption = "<option value='" + month + "' " + strSelected + ">" + i + "</option>";
		$(objComboBox).append(objOption);

	}

}



/**
 * 같은 값을 table rowspanning
 */
function tableRowSpanning(tbObj, eleNm, spanning_row_index) {
	var rowspanTd = false;
	var rowspanText = false;
	var rowspanCount = 0;
	var rows = $('tbody tr', tbObj);

	$.each(rows, function() {
		var This = $(eleNm, this)[spanning_row_index];
		var text = $(This).text();

		if(rowspanTd == false)
		{
			rowspanTd = This;
			rowspanText = text;
			rowspanCount = 1;
		}
		else if(rowspanText != text)
		{
			$(rowspanTd).attr('rowspan', rowspanCount);

			rowspanTd = This;
			rowspanText = text;
			rowspanCount = 1;
		}
		else
		{
			$(This)
			.remove();
			rowspanCount++;
		}
	});

	$(rowspanTd).attr('rowspan', rowspanCount);
}

/**
 * PAR-Q 출력 레포트를 조회한다.
 * strParq_gbn :	1 - 예약화면 PAR-Q
 					2 - 체력측정화면 PAR-Q
 * strCenter_cd : 센터코드
 * strAge_gbn : 측정기구분
 * strMemb_seq : 회원순번
 * strTest_seq : 측정순번
 * strRes_ymd : 예약일
 * strTest_res_seq : 예약순번
**/
function openParqReport(strParq_gbn, strCenter_cd, strAge_gbn, strMemb_seq, strTest_seq, strRes_ymd, strTest_res_seq) {
	
	var url = "";
		url = "/admin/oz/oz_parq.do";
	
	//패러미터 설정
	url += "?parq_gbn=" + strParq_gbn;
	url += "&center_cd=" + strCenter_cd;
	url += "&age_gbn=" + strAge_gbn;
	url += "&memb_seq=" + strMemb_seq;
	url += "&test_seq=" + strTest_seq;
	url += "&res_ymd=" + strRes_ymd;
	url += "&test_res_seq=" + strTest_res_seq;
	
	//레포트를 팝업으로 호출한다.
	var pop = window.open(url, 'oz' + strParq_gbn, 'location=no,directions=no,resizable=yes,status=no,toolbar=no,menubar=no,width=1000,height=800,scrollbars=no,top=100,left=100');
	
	pop.focus();
	
}


//운동처방 가이드 이미지 팝업을 호출한다.
function openGuidePopup(strMovie_seq) {
	
	var strUrl = "/admin/movie/moviePresGuidePopup.do";
		strUrl += "?movie_seq=" + strMovie_seq;
	
	window.open(strUrl, 'guide', 'top=50px,left=50px,width=700px,height=800,resizable=0,status=0,scrollbars=1,menubar=0');
	
}

//운동처방 가이드 동영상 팝업을 호출한다.
function openGuideMoviePopup(strMovie_seq, strMovie_nm_kor) {
	
	var chk = "";
		chk += strMovie_seq;
		chk += "::";
		chk += "rtmp://nfastr.sports.re.kr/vod/mp4:/" + strMovie_seq + ".mp4";
		chk += "::";
		chk += "/common/site/www/front/images/movie_img/" + strMovie_seq + ".jpg";
		chk += "::";
		chk += strMovie_nm_kor;
	
	var strUrl = "/admin/movie/moviePresGuideMoviePopup.do";
		strUrl += "?chk=" + chk;
	
	window.open(strUrl, 'guideMovie', 'top=50px,left=50px,width=820px,height=600,resizable=0,status=0,scrollbars=1,menubar=0');
	
}

//비밀번호 유효성체크(pwd: 비밀번호Value, pwdChk:비밀번호확인Value, id: 아이디value)
function passwordValidateCheck(pwd, pwdChk, id){
	var chkReturn = false;
  	
  	var passwordCheck1 = 0; //동일문자 카운트
	var passwordCheck2 = 0; //연속성(+)카운트
	var passwordCheck3 = 0; //연속성(-)카운트
	var passwordCheck4 = 0; //아이디와 동일문자 카운트

	var pwdTxt1;
	var pwdTxt2;
	var pwdTxt3;
	var i=0;
	var j=0;
	
	for(i=0; i < pwd.length; i++){
		pwdTxt1 = pwd.charAt(i);
		pwdTxt2 = pwd.charAt(i+1);
		pwdTxt3 = pwd.charAt(i+2);
		
		if(pwdTxt1==pwdTxt2){
			passwordCheck1 += 1;
		}
		
		if(pwdTxt1.charCodeAt(0) - pwdTxt2.charCodeAt(0) == 1 && pwdTxt2.charCodeAt(0) - pwdTxt3.charCodeAt(0) == 1){
			passwordCheck2 += 1;
		}
		
		if(pwdTxt1.charCodeAt(0) - pwdTxt2.charCodeAt(0) == -1 && pwdTxt2.charCodeAt(0) - pwdTxt3.charCodeAt(0) == -1 ){
			passwordCheck3 += 1;
		}		
	}
	
	
	var tmp_pass_no = 0;
	var temp = "";
	var temp_id = "";
	var temp_pass = "";
	
	for(var k=0;k < id.length;k++){
		temp_id = id.charAt(k);
		for(j=0;j < pwd.length;j++){
			if (passwordCheck4 > 0){
				j = tmp_pass_no + 1;
			}
			if (temp == "r"){
				j=0;
				temp="";
			}

			temp_pass = pwd.charAt(j);

			if(temp_id == temp_pass){
				passwordCheck4 = passwordCheck4 + 1;
				tmp_pass_no = j;
				break;
			}else if(passwordCheck4 > 0 && j > 0){
				temp = "r";
				passwordCheck4 = 0;
			}else{
				passwordCheck4 = 0;
			}
		}

		if (passwordCheck4 > 2) break;
	}
	
	if(pwd.length < 9 || 20 < pwd.length || !pwd.match(/([a-zA-Z0-9].*[!,@,#,$,*,_,~])|([!,@,#,$,*,_,~].*[a-zA-Z0-9])/)){
    	alert("비밀번호는 영문,숫자,특수문자 조합 9~20자리로 입력 하십시오.");
    }else if(pwd != pwdChk){
    	alert("입력하신 비밀번호가 일치하지 않습니다. 다시 입력 하십시오.");
    }else if(passwordCheck1 > 2){
		alert("동일한 문자, 숫자 3자 이상 연속됩니다. 다시 입력 하십시오.");
	}else if(passwordCheck2 > 1 || passwordCheck3 > 1){
		alert("연속된 문자, 숫자 3자 이상 연속됩니다. 다시 입력 하십시오.");
	}else if(passwordCheck4 > 2){
		alert("아이디와 동일한 문자, 숫자 3자 이상 연속됩니다. 다시 입력 하십시오.");
	}else{
		chkReturn = true;
	}
  	
  	return chkReturn;
}
  	
  	/**
  	 * 레포트를 조회한다.
  	 * type :	1 - 분석보고서_개인
  	 * seq : 순번(분석보고서:분석순번, 체력측정카드:측정순번)
  	 * strMenuSeq : 메뉴순번(권한체크용)
  	**/
  	function openReport(type, seq) {
  		
  		var url = "";
  		
  		if(type == "1") {

  			url = "/front/report/analyzeReportIndPdf.do";
  			url += "?analSeq=" + seq;
  			
  		}else if(type == "8"){
  			url = "/front/report/analyzeReportPreIndPdf.do";
  			url += "?analSeq=" + seq;
  		}	
  		//레포트를 팝업으로 호출한다.
  		var pop = window.open(url, 'oz', 'location=no,directions=no,resizable=yes,status=no,toolbar=no,menubar=no,width=1000,height=800,scrollbars=no,top=100,left=100');
  		pop.focus();
  		
  	}

  	function setCurrMenu() {
  		var title = document.title;

		currMenuDepth1 = -1;
  		currMenuDepth2 = -1;
  			
  		if(title.indexOf("인사말") > -1) {
  			currMenuDepth1 = 0;
  			currMenuDepth2 = 0;	
  		}
  		else if(title.indexOf("사업소개") > -1) {
  			currMenuDepth1 = 0;
  			currMenuDepth2 = 1;	
  		}
  		else if(title.indexOf("사업배경") > -1) {
  			currMenuDepth1 = 0;
  			currMenuDepth2 = 2;	
  		}
  		else if(title.indexOf("연혁") > -1) {
  			currMenuDepth1 = 0;
  			currMenuDepth2 = 3;	
  		}
  		else if(title.indexOf("지역센터안내") > -1) {
  			currMenuDepth1 = 0;
  			currMenuDepth2 = 4;	
  		}
  		else if(title.indexOf("체력측정 이용안내") > -1) {
  			currMenuDepth1 = 1;
  			currMenuDepth2 = 0;	
  		}
  		else if(title.indexOf("체력측정 절차") > -1) {
  			currMenuDepth1 = 1;
  			currMenuDepth2 = 1;	
  		}
  		else if(title.indexOf("기자재") > -1) {
  			currMenuDepth1 = 1;
  			currMenuDepth2 = 2;	
  		}
  		else if(title.indexOf("체력측정 예약안내") > -1) {
  			currMenuDepth1 = 2;
  			currMenuDepth2 = 0;	
  		}
  		else if(title.indexOf("체력측정 예약신청") > -1) {
  			currMenuDepth1 = 2;
  			currMenuDepth2 = 1;	
  		}
  		else if(title.indexOf("훈련가이드 안내") > -1) {
  			currMenuDepth1 = 3;
  			currMenuDepth2 = 0;	
  		}
  		else if(title.indexOf("훈련 목록") > -1) {
  			currMenuDepth1 = 3;
  			currMenuDepth2 = 1;	
  		}
  		else if(title.indexOf("공지사항") > -1) {
  			currMenuDepth1 = 4;
  			currMenuDepth2 = 0;	
  		}
  		else if(title.indexOf("자주하는 질문") > -1) {
  			currMenuDepth1 = 4;
  			currMenuDepth2 = 1;	
  		}
  	}
	// 화면에 상에있는 location 영역에 현재페이지 정보를 타이틀로 변경처리
	// 웹접근성 처리사항
	function gfn_setbrowserTile(){		
		
		var _glocalTitle = "";
		var _glocalTleDlimter = "";
		$(".location_wrap .location > section > ul > li").each(function(index){	
			var locText = $(this).find(">span").html();
			if(index == 0){
				locText = "스포츠과학센터";
			}
			if(locText != ""){
				_glocalTitle = locText+" "+_glocalTleDlimter+" "+_glocalTitle;
				_glocalTleDlimter = "<";
			}
			
		});		
		
		if(_glocalTitle != ""){
			document.title = _glocalTitle;
		}
		
		
		// 화면에 상에있는 location 영역에 현재페이지 부모창 정보를 팝업창 타이틀로 변경처리
		var _glocalPopTitle = "";
		
		if($(opener).length != 0) {
			
			if(typeof opener.document != 'undefined' ){
				if(typeof opener.document.title != 'undefined' ){
					_glocalPopTitle = opener.document.title;
					
					var _gPopTitle = "";
					
					if(typeof $(".pop_header > h1 ").html() == 'undefined'){
						_gPopTitle = document.title;
					}else{
						_gPopTitle = $(".pop_header > h1 ").html();
					}
					if(_glocalPopTitle != ""){
						document.title = _gPopTitle + " < " + _glocalPopTitle;
					}
				}
			}
		}	
	}
	
	
	
function fnGoMyInfo(){
	document.location.href = contextPath + '/config/updateMyInfo.do?menuSeq=1005';
}

	