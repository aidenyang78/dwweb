<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<table>
<tr>
	<td><canvas id="chart1"></canvas></td>
	<td><canvas id="chart2"></canvas></td>
</tr>
<tr>
	<td><canvas id="chart3"></canvas></td>
</tr>
</table>
<script>
$(document).ready(function(){
	var color = Chart.helpers.color;
	var horizontalBarChartData1 = {
		labels: [
			//'도로명1', '도로명2', '도로명3', '도로명4', '도로명5', '도로명6', '도로명7'
			<c:forEach var="list" items="${listStatistics}" varStatus="st">
			'${list.routeNm}',
			</c:forEach>
			],
		datasets: [{
			label: '전자',
			backgroundColor: color(window.chartColors.red).alpha(1).rgbString(),	//alpha : 투명도 조절 -> 최대 1
			borderColor: window.chartColors.red,
			borderWidth: 0.5,
			data: [
			<c:forEach var="list" items="${listStatistics}" varStatus="st">
			'${list.cnt1}',
			</c:forEach>
			]
		}, {
			label: '일반',
			backgroundColor: color(window.chartColors.blue).alpha(1).rgbString(),
			borderColor: window.chartColors.blue,
			borderWidth:0.5,
			data: [
			<c:forEach var="list" items="${listStatistics}" varStatus="st">
			'${list.cnt2}',
			</c:forEach>
			]
		}]
	
	};
		
	var ctx = document.getElementById('chart1');//.getContext('2d');
	//canvas 사이즈 조절 : 또는 div의 width / height 를 수동으로 입력
	ctx.width = 500;
	ctx.height = 550;
	
	window.myHorizontalBar = new Chart(ctx, {
		type: 'horizontalBar',
		data: horizontalBarChartData1,
		options: {
			// Elements options apply to all of the options unless overridden in a dataset
			// In this case, we are setting the border of each horizontal bar to be 2px wide
			elements: {
				rectangle: {
					borderWidth: 2,
				}
			},
			responsive: false,	//크기 자동 조절 true/false
			legend: {
				position: 'right',	//범례 위치
			},
			title: {
				display: true,
				text: '신호등구분 - 제어방식',
				fontSize:14
			},
			scales: {	//x영역 -> y영역은 동일하게 yAxes 설정
				xAxes: [{
					ticks: {
						beginAtZero : true, // 0부터 시작하게 합니다.
						stepSize: 10   // 1 씩 증가하도록 설정합니다.
					}
				}]
			},
		}
	});
	
//#######################################################################	
	
	var horizontalBarChartData2 = {
			labels: [
				//'도로명1', '도로명2', '도로명3', '도로명4', '도로명5', '도로명6', '도로명7'
				<c:forEach var="list" items="${listStatistics}" varStatus="st">
				'${list.routeNm}',
				</c:forEach>
				],
			datasets: [{
				label: '전자',
				backgroundColor: color(window.chartColors.red).alpha(1).rgbString(),	//alpha : 투명도 조절 -> 최대 1
				borderColor: window.chartColors.red,
				borderWidth: 0.5,
				data: [
				<c:forEach var="list" items="${listStatistics}" varStatus="st">
				'${list.cnt3}',
				</c:forEach>
				]
			}, {
				label: '일반',
				backgroundColor: color(window.chartColors.blue).alpha(1).rgbString(),
				borderColor: window.chartColors.blue,
				borderWidth:0.5,
				data: [
				<c:forEach var="list" items="${listStatistics}" varStatus="st">
				'${list.cnt4}',
				</c:forEach>
				]
			}]
		
		};
	
	var ctx = document.getElementById('chart2');//.getContext('2d');
	//canvas 사이즈 조절 : 또는 div의 width / height 를 수동으로 입력
	ctx.width = 500;
	ctx.height = 550;
	
	window.myHorizontalBar = new Chart(ctx, {
		type: 'horizontalBar',
		data: horizontalBarChartData2,
		options: {
			// Elements options apply to all of the options unless overridden in a dataset
			// In this case, we are setting the border of each horizontal bar to be 2px wide
			elements: {
				rectangle: {
					borderWidth: 2,
				}
			},
			responsive: false,	//크기 자동 조절 true/false
			legend: {
				position: 'right',	//범례 위치
			},
			title: {
				display: true,
				text: '신호등구분 - 도로구분',
				fontSize:14
			},
			scales: {	//x영역 -> y영역은 동일하게 yAxes 설정
				xAxes: [{
					ticks: {
						beginAtZero : true, // 0부터 시작하게 합니다.
						stepSize: 10   // 1 씩 증가하도록 설정합니다.
					}
				}]
			},
		}
	});
	
//#######################################################################	
	
	var horizontalBarChartData3 = {
			labels: [
				//'도로명1', '도로명2', '도로명3', '도로명4', '도로명5', '도로명6', '도로명7'
				<c:forEach var="list" items="${listStatistics}" varStatus="st">
				'${list.routeNm}',
				</c:forEach>
				],
				datasets: [{
					label: '측주식',
					backgroundColor: color(window.chartColors.red).alpha(1).rgbString(),	//alpha : 투명도 조절 -> 최대 1
					borderColor: window.chartColors.red,
					borderWidth: 0.5,
					data: [
					<c:forEach var="list" items="${listStatistics}" varStatus="st">
					'${list.cnt5}',
					</c:forEach>
					]
				}, {
					label: '중앙주식',
					backgroundColor: color(window.chartColors.orange).alpha(1).rgbString(),
					borderColor: window.chartColors.orange,
					borderWidth:0.5,
					data: [
					<c:forEach var="list" items="${listStatistics}" varStatus="st">
					'${list.cnt6}',
					</c:forEach>
					]
				}, {
					label: '현중식',
					backgroundColor: color(window.chartColors.green).alpha(1).rgbString(),
					borderColor: window.chartColors.green,
					borderWidth:0.5,
					data: [
					<c:forEach var="list" items="${listStatistics}" varStatus="st">
					'${list.cnt7}',
					</c:forEach>
					]
				}, {
					label: '문형식',
					backgroundColor: color(window.chartColors.blue).alpha(1).rgbString(),
					borderColor: window.chartColors.blue,
					borderWidth:0.5,
					data: [
					<c:forEach var="list" items="${listStatistics}" varStatus="st">
					'${list.cnt8}',
					</c:forEach>
					]
				}
			]
		
		};
	
	var ctx = document.getElementById('chart3');//.getContext('2d');
	//canvas 사이즈 조절 : 또는 div의 width / height 를 수동으로 입력
	ctx.width = 500;
	ctx.height = 550;
	
	window.myHorizontalBar = new Chart(ctx, {
		type: 'horizontalBar',
		data: horizontalBarChartData3,
		options: {
			// Elements options apply to all of the options unless overridden in a dataset
			// In this case, we are setting the border of each horizontal bar to be 2px wide
			elements: {
				rectangle: {
					borderWidth: 2,
				}
			},
			responsive: false,	//크기 자동 조절 true/false
			legend: {
				position: 'right',	//범례 위치
			},
			title: {
				display: true,
				text: '공사일반 - 신호재식',
				fontSize:14
			},
			scales: {	//x영역 -> y영역은 동일하게 yAxes 설정
				xAxes: [{
					ticks: {
						beginAtZero : true, // 0부터 시작하게 합니다.
						stepSize: 10   // 1 씩 증가하도록 설정합니다.
					}
				}]
			},
		}
	});
	
})	
</script>
