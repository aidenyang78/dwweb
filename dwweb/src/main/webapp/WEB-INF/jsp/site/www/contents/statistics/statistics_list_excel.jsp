<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!-- //right - data area -->
<html>
<head>
<style>
table {
	width: 100%;
	cell-padding:0;
	border-collapse:collapse;
}

td {
	border: 1px solid #333333;
	padding: 0;
	border-spacing:0;
	border-collapse:collapse;
}

th {
	/* background-color:#efefef; */
	border: 1px solid #333333;
	padding: 0;
	border-spacing:0;
	border-collapse:collapse;
}
</style>
</head>
<body cellpadding="0" cellspacing="0">
<table>
<tr>
	<th colspan="25" bgcolor="#efefef">
	<c:if test='${statisticsVo.polDistrict eq "1002" }'>
		평택시 서부 시설물 통계
	</c:if>
	<c:if test='${statisticsVo.polDistrict eq "1003" }'>
		평택시 남부 시설물 통계
	</c:if>
	<c:if test='${statisticsVo.polDistrict eq "1004" }'>
		평택시 북부 시설물 통계
	</c:if>
	</th>
</tr>
<tr>
	<th rowspan="3" bgcolor="#efefef">도로명</th>
	<th colspan="4" bgcolor="#efefef">신호등구분</th>
	<th colspan="7" bgcolor="#efefef">공사일반</th>
	<th colspan="8" bgcolor="#efefef">교통신호등</th>
	<th colspan="5" bgcolor="#efefef">신호제어기</th>
</tr>
<tr>

	<th colspan="2" bgcolor="#efefef">제어방식</th>
	<th colspan="2" bgcolor="#efefef">도로구분</th>
	<th colspan="4" bgcolor="#efefef">신호 제식</th>
	<th colspan="3" bgcolor="#efefef">배선</th>
	<th colspan="2" bgcolor="#efefef">차량 신호등</th>
	<th colspan="2" bgcolor="#efefef">차량 경보등</th>
	<th colspan="2" bgcolor="#efefef">차량 가변등</th>
	<th colspan="2" bgcolor="#efefef">보행등</th>
	<th colspan="3" bgcolor="#efefef">전자제어기</th>
	<th colspan="2" bgcolor="#efefef">정주기제어기</th>
</tr>
<tr>

	<th bgcolor="#efefef">전자</th>
	<th bgcolor="#efefef">일반</th>
	<th bgcolor="#efefef">교차로</th>
	<th bgcolor="#efefef">단일로</th>
	<th bgcolor="#efefef">측주식</th>
	<th bgcolor="#efefef">중앙주식</th>
	<th bgcolor="#efefef">현중식</th>
	<th bgcolor="#efefef">문형식</th>
	<th bgcolor="#efefef">지하</th>
	<th bgcolor="#efefef">가공</th>
	<th bgcolor="#efefef">복합</th>
	<th bgcolor="#efefef">3색등	</th>
	<th bgcolor="#efefef">4색등</th>
	<th bgcolor="#efefef">2색등</th>
	<th bgcolor="#efefef">3색등</th>
	<th bgcolor="#efefef">2색등</th>
	<th bgcolor="#efefef">3색등</th>
	<th bgcolor="#efefef">2색등</th>
	<th bgcolor="#efefef">3색등</th>	
	<th bgcolor="#efefef">전자<br/>일반</th>
	<th bgcolor="#efefef">2004<br/>년식</th>
	<th bgcolor="#efefef">2010<br/>년식</th>
	<th bgcolor="#efefef">듀얼링</th>
	<th bgcolor="#efefef">싱글링</th>
</tr>

<c:set var="totCnt1" value="0"/>
<c:set var="totCnt2" value="0"/>
<c:set var="totCnt3" value="0"/>
<c:set var="totCnt4" value="0"/>
<c:set var="totCnt5" value="0"/>
<c:set var="totCnt6" value="0"/>
<c:set var="totCnt7" value="0"/>
<c:set var="totCnt8" value="0"/>
<c:set var="totCnt9" value="0"/>
<c:set var="totCnt10" value="0"/>
<c:set var="totCnt11" value="0"/>
<c:set var="totCnt12" value="0"/>
<c:set var="totCnt13" value="0"/>
<c:set var="totCnt14" value="0"/>
<c:set var="totCnt15" value="0"/>
<c:set var="totCnt16" value="0"/>
<c:set var="totCnt17" value="0"/>
<c:set var="totCnt18" value="0"/>
<c:set var="totCnt19" value="0"/>
<c:set var="totCnt20" value="0"/>
<c:set var="totCnt21" value="0"/>
<c:set var="totCnt22" value="0"/>
<c:set var="totCnt23" value="0"/>
<c:set var="totCnt24" value="0"/>
<c:set var="totCnt25" value="0"/>
<c:set var="totCnt26" value="0"/>
<c:set var="totCnt27" value="0"/>
<c:set var="totCnt28" value="0"/>
<c:set var="totCnt29" value="0"/>
<c:set var="totCnt30" value="0"/>
<c:set var="totCnt31" value="0"/>
<c:set var="totCnt32" value="0"/>

<c:forEach var="list" items="${listStatistics}" varStatus="st">
<c:set var="totCnt1" value="${totCnt1 + list.cnt1}"/>
<c:set var="totCnt2" value="${totCnt2 + list.cnt2}"/>
<c:set var="totCnt3" value="${totCnt3 + list.cnt3}"/>
<c:set var="totCnt4" value="${totCnt4 + list.cnt4}"/>
<c:set var="totCnt5" value="${totCnt5 + list.cnt5}"/>
<c:set var="totCnt6" value="${totCnt6 + list.cnt6}"/>
<c:set var="totCnt7" value="${totCnt7 + list.cnt7}"/>
<c:set var="totCnt8" value="${totCnt8 + list.cnt8}"/>
<c:set var="totCnt9" value="${totCnt9 + list.cnt9}"/>
<c:set var="totCnt10" value="${totCnt10 + list.cnt10}"/>

<c:set var="totCnt11" value="${totCnt11 + list.cnt11}"/>
<c:set var="totCnt12" value="${totCnt12 + list.cnt12}"/>
<c:set var="totCnt13" value="${totCnt13 + list.cnt13}"/>
<c:set var="totCnt14" value="${totCnt14 + list.cnt14}"/>
<c:set var="totCnt15" value="${totCnt15 + list.cnt15}"/>
<c:set var="totCnt16" value="${totCnt16 + list.cnt16}"/>
<c:set var="totCnt17" value="${totCnt17 + list.cnt17}"/>
<c:set var="totCnt18" value="${totCnt18 + list.cnt18}"/>
<c:set var="totCnt19" value="${totCnt19 + list.cnt19}"/>
<c:set var="totCnt20" value="${totCnt20 + list.cnt20}"/>

<c:set var="totCnt21" value="${totCnt21 + list.cnt21}"/>
<c:set var="totCnt22" value="${totCnt22 + list.cnt22}"/>
<c:set var="totCnt23" value="${totCnt23 + list.cnt23}"/>
<c:set var="totCnt24" value="${totCnt24 + list.cnt24}"/>
<c:set var="totCnt25" value="${totCnt25 + list.cnt25}"/>
<c:set var="totCnt26" value="${totCnt26 + list.cnt26}"/>
<c:set var="totCnt27" value="${totCnt27 + list.cnt27}"/>
<c:set var="totCnt28" value="${totCnt28 + list.cnt28}"/>
<c:set var="totCnt29" value="${totCnt29 + list.cnt29}"/>
<c:set var="totCnt30" value="${totCnt30 + list.cnt30}"/>
<c:set var="totCnt31" value="${totCnt31 + list.cnt31}"/>
<c:set var="totCnt32" value="${totCnt32 + list.cnt32}"/>
<tr>
	<th bgcolor="#efefef">${list.routeNm }</th>
	<td>${list.cnt1}</td>
	<td>${list.cnt2}</td>	
	<td>${list.cnt3}</td>
	<td>${list.cnt4}</td>	
	<td>${list.cnt5}</td>
	<td>${list.cnt6}</td>
	<td>${list.cnt7}</td>
	<td>${list.cnt8}</td>	
	<td>${list.cnt9}</td>
	<td>${list.cnt10}</td>
	<td>${list.cnt11}</td>	
	<td>${list.cnt12}</td>
	<td>${list.cnt13}</td>	
	<td>${list.cnt14}</td>
	<td>${list.cnt15}</td>	
	<td>${list.cnt16}</td>
	<td>${list.cnt17}</td>	
	<td>${list.cnt18}</td>
	<td>${list.cnt19}</td>
	<td>${list.cnt22}</td>
	<td>${list.cnt23}</td>
	<td>${list.cnt24}</td>	
	<td>${list.cnt25}</td>
	<td>${list.cnt26}</td>
</tr>
</c:forEach>
<tr>
	<th bgcolor="#efefef">합계</th>
	<td>${totCnt1}</td>
	<td>${totCnt2}</td>	
	<td>${totCnt3}</td>
	<td>${totCnt4}</td>	
	<td>${totCnt5}</td>
	<td>${totCnt6}</td>
	<td>${totCnt7}</td>
	<td>${totCnt8}</td>	
	<td>${totCnt9}</td>
	<td>${totCnt10}</td>	
	<td>${totCnt11}</td>
	<td>${totCnt12}</td>
	<td>${totCnt13}</td>	
	<td>${totCnt14}</td>
	<td>${totCnt15}</td>	
	<td>${totCnt16}</td>
	<td>${totCnt17}</td>	
	<td>${totCnt18}</td>
	<td>${totCnt19}</td>
	<td>${totCnt22}</td>
	<td>${totCnt23}</td>
	<td>${totCnt24}</td>	
	<td>${totCnt25}</td>
	<td>${totCnt26}</td>
</tr>
</tbody>
</table>
<!-- right - data area// -->
</body>
</html>



