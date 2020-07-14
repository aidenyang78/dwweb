<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!-- //right - data area -->
<table class="tb_list" id="dtTable" style="max-width:1480px;">
<colgroup>
	<col width="200px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
	<col width="50px"/>
</colgroup>
<tbody>
<tr>
	<th rowspan="3">도로명</th>
	<th colspan="4">신호등구분</th>
	<th colspan="7">공사일반</th>
	<th colspan="8">교통신호등</th>
	<th colspan="5">신호제어기</th>
</tr>
<tr>
	<th colspan="2">제어방식</th>
	<th colspan="2">도로구분</th>
	<th colspan="4">신호 제식</th>
	<th colspan="3">배선</th>
	<th colspan="2">차량 신호등</th>
	<th colspan="2">차량 경보등</th>
	<th colspan="2">차량 가변등</th>
	<th colspan="2">보행등</th>
	<th colspan="3">전자제어기</th>
	<th colspan="2">정주기제어기</th>
</tr>
<tr>
	<th>전자</th>
	<th>일반</th>
	<th>교차로</th>
	<th>단일로</th>
	<th>측주식</th>
	<th>중앙주식</th>
	<th>현중식</th>
	<th>문형식</th>
	<th>지하</th>
	<th>가공</th>
	<th>복합</th>

	<th>3색등	</th>
	<th>4색등</th>
	<th>2색등</th>
	<th>3색등</th>
	<th>2색등</th>
	<th>3색등</th>
	<th>2색등</th>
	<th>3색등</th>
	
	<th>전자<br/>일반</th>
	<th>2004<br/>년식</th>
	<th>2010<br/>년식</th>
	<th>듀얼링</th>
	<th>싱글링</th>
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
	<th>${list.routeNm }</th>
	<td class="center white">${list.cnt1}</td>
	<td class="center white">${list.cnt2}</td>
	
	<td class="center white">${list.cnt3}</td>
	<td class="center white">${list.cnt4}</td>
	
	<td class="center white">${list.cnt5}</td>
	<td class="center white">${list.cnt6}</td>
	<td class="center white">${list.cnt7}</td>
	<td class="center white">${list.cnt8}</td>
	
	<td class="center white">${list.cnt9}</td>
	<td class="center white">${list.cnt10}</td>
	<td class="center white">${list.cnt11}</td>	

<!-- 교통신호등 -->
	<td class="center white">${list.cnt12}</td>
	<td class="center white">${list.cnt13}</td>
	
	<td class="center white">${list.cnt14}</td>
	<td class="center white">${list.cnt15}</td>
	
	<td class="center white">${list.cnt16}</td>
	<td class="center white">${list.cnt17}</td>
	
	<td class="center white">${list.cnt18}</td>
	<td class="center white">${list.cnt19}</td>
<!-- 교통신호등 -->
	
	<td class="center white">${list.cnt22}</td>
	<td class="center white">${list.cnt23}</td>
	<td class="center white">${list.cnt24}</td>
	
	<td class="center white">${list.cnt25}</td>
	<td class="center white">${list.cnt26}</td>
</tr>
</c:forEach>
<tr>
	<th>합계</th>
	<td class="center white">${totCnt1}</td>
	<td class="center white">${totCnt2}</td>
	
	<td class="center white">${totCnt3}</td>
	<td class="center white">${totCnt4}</td>
	
	<td class="center white">${totCnt5}</td>
	<td class="center white">${totCnt6}</td>
	<td class="center white">${totCnt7}</td>
	<td class="center white">${totCnt8}</td>
	
	<td class="center white">${totCnt9}</td>
	<td class="center white">${totCnt10}</td>	
	<td class="center white">${totCnt11}</td>

<!-- 교통신호등 -->
	<td class="center white">${totCnt12}</td>
	<td class="center white">${totCnt13}</td>
	
	<td class="center white">${totCnt14}</td>
	<td class="center white">${totCnt15}</td>
	
	<td class="center white">${totCnt16}</td>
	<td class="center white">${totCnt17}</td>
	
	<td class="center white">${totCnt18}</td>
	<td class="center white">${totCnt19}</td>
<!-- 교통신호등 -->

	<td class="center white">${totCnt22}</td>
	<td class="center white">${totCnt23}</td>
	<td class="center white">${totCnt24}</td>
	
	<td class="center white">${totCnt25}</td>
	<td class="center white">${totCnt26}</td>
</tr>
</tbody>
</table>
<!-- right - data area// -->