<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<style>
<!--
.td{
	border:solid 1px #ddd;
	background-color:#efefef;
	text-align:center;
	vertical-align:top;
}
-->
</style>
<div id="printChart">
	<div id="chartPie">
		<table class="tb_list">
			<tr>
				<td class="td"><canvas id="chart1"></canvas></td>
				<td class="td"><canvas id="chart2"></canvas></td>
				<td class="td"><canvas id="chart3"></canvas></td>
				<td class="td"><canvas id="chart4"></canvas></td>
				<td class="td"><canvas id="chart5"></canvas></td>
			</tr>
			<tr>
				<td class="td"><canvas id="chart6"></canvas></td>
				<td class="td"><canvas id="chart7"></canvas></td>
				<td class="td"><canvas id="chart8"></canvas></td>
				<td class="td"><canvas id="chart9"></canvas></td>
				<td class="td"><canvas id="chart10"></canvas></td>
			</tr>
		</table>
	</div>
	
	<div id="hr" class="hidden">
		<div style="height:10px;"></div>
	</div>
	
	<div id="chartBar" class="hidden">
		<table class="tb_list">
			<tr>
				<td  class="td"><canvas id="chart11"></canvas></td>
				<td  class="td"><canvas id="chart12"></canvas></td>
				<td  class="td"><canvas id="chart13"></canvas></td>
				<td  class="td"><canvas id="chart14"></canvas></td>
				<td  class="td"><canvas id="chart15"></canvas></td>
			</tr>
			<tr>
				<td  class="td"><canvas id="chart16"></canvas></td>
				<td  class="td"><canvas id="chart17"></canvas></td>
				<td  class="td"><canvas id="chart18"></canvas></td>
				<td  class="td"><canvas id="chart19"></canvas></td>
				<td  class="td"><canvas id="chart20"></canvas></td>
			</tr>
		</table>
	</div>
</div>
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
</c:forEach>
<script src="${pageContext.request.contextPath}/common/plugins/charts/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/charts/utils.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/charts/chartjs-plugin-labels.min.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/charts/chartjs-plugin-datalabels.min.js"></script>

<script type="text/javascript">
	var config1 = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
					${totCnt1},${totCnt2}
				],
				backgroundColor: [
					window.chartColors.red, window.chartColors.blue
				],
				label: 'Dataset 1',
			}],
			labels: [
				'전자','일반'
			]
		},
		options: {
			responsive: true,	//크기 자동 조절 true/false
			title: {
	            display: true,
	            text: '신호등 구분 - 제어방식',
	            fontSize : 14
	        },
	        legend: {
	            display: true,
	            labels: {
	        		usePointStyle: true
	        	}
	        },
	        plugins: {
	        	labels :{
	        		render: 'value'
	        	}
	        	,datalabels: {
	        		anchor:'end',		//포지션 start, center, end
					backgroundColor:'#eaf1f3',
					borderColor:'#808080',
					borderWidth:1,
					font: {
						size: 11,
						color: '#000000',
						weight: 'bold',
					},
					formatter: function(value, ctx) {						
						let sum = 0;
						let dataArr = ctx.chart.data.datasets[0].data;
						
						dataArr.map(function(data){
							sum += data;
						});
						
						let percentage = (value*100 / sum).toFixed(1)+"%";
						
						return percentage;
					}
	        	}
	        }
		},
	};

	var chart1 = document.getElementById('chart1');//.getContext('2d');
	
	chart1.height = 240;
	window.myPie = new Chart(chart1, config1);
	
	
	var myPieChart = new Chart(chart1, config1);
	
	$("#chart1").click(function(e){
		
		var firstPoint = myPieChart.getElementAtEvent(e)[0];
		
		if (firstPoint) {
	        var label = myPieChart.data.labels[firstPoint._index];
	        var value = myPieChart.data.datasets[firstPoint._datasetIndex].data[firstPoint._index];
	        
	        alert(label + " : " + value);
	    }
		
	});
	
	
	
	//##########################################################
	var config2 = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
					${totCnt3},${totCnt4}
				],
				backgroundColor: [
					window.chartColors.red, window.chartColors.blue
				],
				label: 'Dataset 1'
			}],
			labels: [
				'교차로','단일로'
			]
		},
		options: {
			responsive: true,	//크기 자동 조절 true/false
			title: {
	            display: true,
	            text: '신호등 구분 - 도로구분',
	            fontSize : 14
	        },
	        legend: {
	            display: true,
	            labels: {
	        		usePointStyle: true
	        	}
	        },
	        plugins: {
	        	labels :{
	        		render: 'value'
	        	},
				datalabels: {
					anchor:'end',		//포지션 start, center, end
					backgroundColor:'#eaf1f3',
					borderColor:'#808080',
					borderWidth:1,
					font: {
						size: 11,
						color: '#000000',
						weight: 'bold',
					},
					formatter: function(value, ctx) {						
						let sum = 0;
						let dataArr = ctx.chart.data.datasets[0].data;
						
						dataArr.map(function(data){
							sum += data;
						});
						
						let percentage = (value*100 / sum).toFixed(1)+"%";
						
						return percentage;
					}
				}
	        }
		},
	};

	var chart2 = document.getElementById('chart2');//.getContext('2d');
	//chart2.width = 260;
	chart2.height = 240;
	window.myPie = new Chart(chart2, config2);
	
//##########################################################
	var config3 = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
					${totCnt5},${totCnt6},${totCnt7},${totCnt8}
				],
				backgroundColor: [
					window.chartColors.red, window.chartColors.blue, window.chartColors.orange, window.chartColors.green
				],
				label: 'Dataset 1'
			}],
			labels: [
				'측주식', '중앙주식', '현중식', '문형식'
			]
		},
		options: {
			responsive: true,	//크기 자동 조절 true/false
			title: {
	            display: true,
	            text: '공사일반 - 신호재식',
	            fontSize : 14
	        },
	        legend: {
	            display: true,
	            labels: {
	            	boxWidth : 11,			//default : 40
	            	usePointStyle: true
	            }
	        },	        
	        plugins: {
	        	labels :{
	        		render: 'value'
	        	},
	        	datalabels: {
					anchor:'end',		//포지션 start, center, end
					backgroundColor:'#eaf1f3',
					borderColor:'#808080',
					borderWidth:1,
					font: {
						size: 11,
						color: '#000000',
						weight: 'bold',
					},
					formatter: function(value, ctx) {						
						let sum = 0;
						let dataArr = ctx.chart.data.datasets[0].data;
						
						dataArr.map(function(data){
							sum += data;
						});
						
						let percentage = (value*100 / sum).toFixed(1)+"%";
						
						return percentage;
					}
				}
	        }
		},
	};

	var chart3 = document.getElementById('chart3');//.getContext('2d');
	//chart3.width = 280;
	chart3.height = 240;
	window.myPie = new Chart(chart3, config3);
	
//##########################################################
	var config4 = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
					${totCnt9},${totCnt10},${totCnt11}
				],
				backgroundColor: [
					window.chartColors.red, window.chartColors.blue, window.chartColors.orange
				],
				label: 'Dataset 1'
			}],
			labels: [
				'지하', '가공', '복합'
			]
		},
		options: {
			responsive: true,	//크기 자동 조절 true/false
			title: {
	            display: true,
	            text: '공사일반 - 배선',
	            fontSize : 14
	        },
	        legend: {
	            display: true,
	            labels: {
	        		usePointStyle: true
	        	}
	        },
	        plugins: {
	        	labels :{
	        		render: 'value'
	        	},
	        	datalabels: {
					anchor:'end',		//포지션 start, center, end
					backgroundColor:'#eaf1f3',
					borderColor:'#808080',
					borderWidth:1,
					font: {
						size: 11,
						color: '#000000',
						weight: 'bold',
					},
					formatter: function(value, ctx) {						
						let sum = 0;
						let dataArr = ctx.chart.data.datasets[0].data;
						
						dataArr.map(function(data){
							sum += data;
						});
						
						let percentage = (value*100 / sum).toFixed(1)+"%";
						
						return percentage;
					}
				}
	        }
		},
	};

	var chart4 = document.getElementById('chart4');//.getContext('2d');
	//chart4.width = 260;
	chart4.height = 240;
	window.myPie = new Chart(chart4, config4);
	//##########################################################
	var config5 = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
					${totCnt12},${totCnt13}
				],
				backgroundColor: [
					window.chartColors.red, window.chartColors.blue
				],
				label: 'Dataset 1'
			}],
			labels: [
				'3색등', '4색등'
			]
		},
		options: {
			responsive: true,	//크기 자동 조절 true/false
			title: {
	            display: true,
	            text: '교통신호 - 차량신호',
	            fontSize : 14
	        },
	        legend: {
	            display: true,
	            labels: {
	        		usePointStyle: true
	        	}
	        },
	        plugins: {
	        	labels :{
	        		render: 'value'
	        	},
	        	datalabels: {
					anchor:'end',		//포지션 start, center, end
					backgroundColor:'#eaf1f3',
					borderColor:'#808080',
					borderWidth:1,
					font: {
						size: 11,
						color: '#000000',
						weight: 'bold',
					},
					formatter: function(value, ctx) {						
						let sum = 0;
						let dataArr = ctx.chart.data.datasets[0].data;
						
						dataArr.map(function(data){
							sum += data;
						});
						
						let percentage = (value*100 / sum).toFixed(1)+"%";
						
						return percentage;
					}
				}
	        }
		},
	};

	var chart5 = document.getElementById('chart5');//.getContext('2d');
	//chart5.width = 260;
	chart5.height = 240;
	window.myPie = new Chart(chart5, config5);
	//##########################################################
	var config6 = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
					${totCnt14},${totCnt15}
				],
				backgroundColor: [
					window.chartColors.red, window.chartColors.blue
				],
				label: 'Dataset 1'
			}],
			labels: [
				'2색등', '3색등'
			]
		},
		options: {
			responsive: true,	//크기 자동 조절 true/false
			title: {
	            display: true,
	            text: '교통신호 - 차량 경보등',
	            fontSize : 14
	        },
	        legend: {
	            display: true,
	            labels: {
	        		usePointStyle: true
	        	}
	        },
	        plugins: {
	        	labels :{
	        		render: 'value'
	        	},
	        	datalabels: {
					anchor:'end',		//포지션 start, center, end
					backgroundColor:'#eaf1f3',
					borderColor:'#808080',
					borderWidth:1,
					font: {
						size: 11,
						color: '#000000',
						weight: 'bold',
					},
					formatter: function(value, ctx) {						
						let sum = 0;
						let dataArr = ctx.chart.data.datasets[0].data;
						
						dataArr.map(function(data){
							sum += data;
						});
						
						let percentage = (value*100 / sum).toFixed(1)+"%";
						
						return percentage;
					}
				}
	        }
		},
	};

	var chart6 = document.getElementById('chart6');//.getContext('2d');
	//chart6.width = 260;
	chart6.height = 240;
	window.myPie = new Chart(chart6, config6);
	//##########################################################
	var config7 = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
					${totCnt16},${totCnt17}
				],
				backgroundColor: [
					window.chartColors.red, window.chartColors.blue
				],
				label: 'Dataset 1'
			}],
			labels: [
				'2색등', '3색등'
			]
		},
		options: {
			responsive: true,	//크기 자동 조절 true/false
			title: {
	            display: true,
	            text: '교통신호 - 차량 가변등',
	            fontSize : 14
	        },
	        legend: {
	            display: true,
	            labels: {
	        		usePointStyle: true
	        	}
	        },
	        plugins: {
	        	labels :{
	        		render: 'value'
	        	},
	        	datalabels: {
					anchor:'end',		//포지션 start, center, end
					backgroundColor:'#eaf1f3',
					borderColor:'#808080',
					borderWidth:1,
					font: {
						size: 11,
						color: '#000000',
						weight: 'bold',
					},
					formatter: function(value, ctx) {						
						let sum = 0;
						let dataArr = ctx.chart.data.datasets[0].data;
						
						dataArr.map(function(data){
							sum += data;
						});
						
						let percentage = (value*100 / sum).toFixed(1)+"%";
						
						return percentage;
					}
				}
	        }
		},
	};

	var chart7 = document.getElementById('chart7');//.getContext('2d');
	//chart7.width = 260;
	chart7.height = 240;
	window.myPie = new Chart(chart7, config7);	
	//##########################################################
	var config8 = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
					${totCnt18},${totCnt19}
				],
				backgroundColor: [
					window.chartColors.red, window.chartColors.blue
				],
				label: 'Dataset 1'
			}],
			labels: [
				'2색등', '3색등'
			]
		},
		options: {
			responsive: true,	//크기 자동 조절 true/false
			title: {
	            display: true,
	            text: '교통신호 - 보행등',
	            fontSize : 14
	        },
	        legend: {
	            display: true,
	            labels: {
	        		usePointStyle: true
	        	}
	        },
	        plugins: {
	        	labels :{
	        		render: 'value'
	        	},
	        	datalabels: {
					anchor:'end',		//포지션 start, center, end
					backgroundColor:'#eaf1f3',
					borderColor:'#808080',
					borderWidth:1,
					font: {
						size: 11,
						color: '#000000',
						weight: 'bold',
					},
					formatter: function(value, ctx) {						
						let sum = 0;
						let dataArr = ctx.chart.data.datasets[0].data;
						
						dataArr.map(function(data){
							sum += data;
						});
						
						let percentage = (value*100 / sum).toFixed(1)+"%";
						
						return percentage;
					}
				}
	        }
		},
	};

	var chart8 = document.getElementById('chart8');//.getContext('2d');
	//chart8.width = 260;
	chart8.height = 240;
	window.myPie = new Chart(chart8, config8);
	//##########################################################
	var config9 = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
					${totCnt22},${totCnt23},${totCnt24}
				],
				backgroundColor: [
					window.chartColors.red, window.chartColors.blue, window.chartColors.orange
				],
				label: 'Dataset 1'
			}],
			labels: [
				'전자일반', '2004년식', '2010년식'
			]
		},
		options: {
			responsive: true,	//크기 자동 조절 true/false
			title: {
	            display: true,
	            text: '신호제어기 - 전자제어기',
	            fontSize : 14
	        },
	        legend: {
	            display: true,
	            labels: {
	        		usePointStyle: true
	        	}
	        },
	        plugins: {
	        	labels :{
	        		render: 'value'
	        	},
	        	datalabels: {
					anchor:'end',		//포지션 start, center, end
					backgroundColor:'#eaf1f3',
					borderColor:'#808080',
					borderWidth:1,
					font: {
						size: 11,
						color: '#000000',
						weight: 'bold',
					},
					formatter: function(value, ctx) {						
						let sum = 0;
						let dataArr = ctx.chart.data.datasets[0].data;
						
						dataArr.map(function(data){
							sum += data;
						});
						
						let percentage = (value*100 / sum).toFixed(1)+"%";
						
						return percentage;
					}
				}
	        }
		},
	};

	var chart9 = document.getElementById('chart9');//.getContext('2d');
	//chart9.width = 260;
	chart9.height = 240;
	window.myPie = new Chart(chart9, config9);
	//##########################################################
	var config10 = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
					${totCnt25},${totCnt26}
				],
				backgroundColor: [
					window.chartColors.red, window.chartColors.blue
				],
				label: 'Dataset 1'
			}],
			labels: [
				'듀얼링', '싱글링'
			]
		},
		options: {
			responsive: true,	//크기 자동 조절 true/false
			title: {
	            display: true,
	            text: '신호제어기 - 정주기 제어기',
	            fontSize : 14
	        },
	        legend: {
	            display: true,
	            labels: {
	        		usePointStyle: true
	        	}
	        },
	        plugins: {
	        	labels :{
	        		render: 'value'
	        	},
	        	datalabels: {
					anchor:'end',		//포지션 start, center, end
					backgroundColor:'#eaf1f3',
					borderColor:'#808080',
					borderWidth:1,
					font: {
						size: 11,
						color: '#000000',
						weight: 'bold',
					},
					formatter: function(value, ctx) {						
						let sum = 0;
						let dataArr = ctx.chart.data.datasets[0].data;
						
						dataArr.map(function(data){
							sum += data;
						});
						
						let percentage = (value*100 / sum).toFixed(1)+"%";
						
						return percentage;
					}
				}
	        }
		},
	};

	var chart10 = document.getElementById('chart10');//.getContext('2d');
	//chart10.width = 260;
	chart10.height = 240;
	window.myPie = new Chart(chart10, config10);
</script>

<script>
//bar차트 시작
var color = Chart.helpers.color;
var config11 ={
	type: 'bar',
	data: {
		labels: ['제어방식'],
		datasets: [
			{
				label: '전자',
				backgroundColor: color(window.chartColors.red).rgbString(),
				borderColor: "#ffffff",//window.chartColors.white,
				borderWidth: 2,
				data: [
					${totCnt1}
				]
			}, {
				label: '일반',
				backgroundColor: color(window.chartColors.blue).rgbString(),
				borderColor:  "#ffffff",//window.chartColors.white,
				borderWidth: 2,
				data: [
					${totCnt2}
				]
			}
		]
	},
	options: {
		responsive: true,
		legend: {
			position: 'top'	//default:top // left, top, bottom, right
		},
		title: {
			display: true,
			text: '신호등 구분 - 제어방식',
			fontSize:14
		},
		scales: {	//x영역 -> y영역은 동일하게 yAxes 설정
			xAxes: [{
				categoryPercentage: 1.0,	//x축 전체 %
				barPercentage: 0.3,			//막대의 width %
			}],
			yAxes: [{
				ticks: {
					beginAtZero : true, // 0부터 시작하게 합니다.
					stepSize: 100   // 1 씩 증가하도록 설정합니다.
				}
			}]
		},
		plugins: {
			labels :{
				render: 'percentage',
        		precision: 1,
        		fontSize: 12	//default : 12
        	},
        	bars :{
        		render: 'percentage'
        	}
			
        }
	}				
}

var chart11 = document.getElementById('chart11');//.getContext('2d');

//chart11.width = 120;
chart11.height = 360;

window.myPie = new Chart(chart11, config11);

var myBarChart = new Chart(chart11, config11);

$("#chart11").click(function(e){
	
	var firstPoint = myBarChart.getElementAtEvent(e)[0];
	
	if (firstPoint) {
        var label = myBarChart.data.labels[firstPoint._index];
        var value = myBarChart.data.datasets[firstPoint._datasetIndex].data[firstPoint._index];
        
        alert(label + " : " + value);
    }
	
});
//##########################################################
var config12 ={
	type: 'bar',
	data: {
		labels: ['도로구분'],
		datasets: [{
			label: '교차로',
			backgroundColor: color(window.chartColors.red).rgbString(),
			borderColor:  "#ffffff",
			borderWidth: 2,
			data: [
				${totCnt3}
			]
		}, {
			label: '단일로',
			backgroundColor: color(window.chartColors.blue).rgbString(),
			borderColor:  "#ffffff",
			borderWidth: 2,
			data: [
				${totCnt4}
			]
		}]
	},
	options: {
		responsive: true,
		legend: {
			position: 'top',
		},
		title: {
			display: true,
			text: '신호등 구분 - 도로구분',
			fontSize:14
		},
		scales: {	//x영역 -> y영역은 동일하게 yAxes 설정
			xAxes: [{
					categoryPercentage: 1.0,
					barPercentage: 0.3,
					/* gridLines: {
		                offsetGridLines: false
		            } */
			}],
			yAxes: [{
				ticks: {
					beginAtZero : true, // 0부터 시작하게 합니다.
					stepSize: 100,   // 1 씩 증가하도록 설정합니다.
				}
			}]
		},
		plugins: {
			labels :{
				render: 'percentage',
        		precision: 1,
        		fontSize: 12	//default : 12
        	}
        }
	}				
}

var chart12 = document.getElementById('chart12');//.getContext('2d');

//chart12.width = 120;
chart12.height = 360;

window.myPie = new Chart(chart12, config12);
//##########################################################
var config13 ={
	type: 'bar',
	data: {
		labels: ['신호재식'],
		datasets: [
			{
				label: '측주식',
				backgroundColor: color(window.chartColors.red).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt5}
				]
			}, {
				label: '중앙식',
				backgroundColor: color(window.chartColors.blue).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt6}
				]
			}
			, {
				label: '현중식',
				backgroundColor: color(window.chartColors.orange).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt7}
				]
			}
			, {
				label: '문형식',
				backgroundColor: color(window.chartColors.green).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt8}
				]
			}
		]
	},
	options: {
		responsive: true,
		legend: {
			position: 'top',
		},
		title: {
			display: true,
			text: '공사일반 - 신호재식',
			fontSize:14
		},
		legend: {
            display: true,
            labels: {
            	boxWidth : 14			//default : 40
            }
        },
		scales: {	//x영역 -> y영역은 동일하게 yAxes 설정
			xAxes: [{
				categoryPercentage: 1.0,
				barPercentage: 0.6,
				/* gridLines: {
	                offsetGridLines: false
	            } */
			}],
			yAxes: [{
				ticks: {
					beginAtZero : true, // 0부터 시작하게 합니다.
					stepSize: 100   // 1 씩 증가하도록 설정합니다.
				}
			}]
		},
		plugins: {
			labels :{
				render: 'percentage',
        		precision: 1,
        		fontSize: 12	//default : 12
        	}
        }
	}				
}

var chart13 = document.getElementById('chart13');//.getContext('2d');

//chart13.width = 120;
chart13.height = 360;

window.myPie = new Chart(chart13, config13);
//##########################################################
var config14 ={
	type: 'bar',
	data: {
		labels: ['배선'],
		datasets: [
			{
				label: '지하',
				backgroundColor: color(window.chartColors.red).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt9}
				]
			}, {
				label: '가공',
				backgroundColor: color(window.chartColors.blue).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt10}
				]
			}
			, {
				label: '복합',
				backgroundColor: color(window.chartColors.orange).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt11}
				]
			}
		]
	},
	options: {
		responsive: true,
		legend: {
			position: 'top',
		},
		title: {
			display: true,
			text: '공사일반 - 배선',
			fontSize:14
		},
		scales: {	//x영역 -> y영역은 동일하게 yAxes 설정
			xAxes: [{
				categoryPercentage: 1.0,
				barPercentage: 0.4,
				/* gridLines: {
	                offsetGridLines: false
	            } */
			}],
			yAxes: [{
				ticks: {
					beginAtZero : true, // 0부터 시작하게 합니다.
					stepSize: 100   // 1 씩 증가하도록 설정합니다.
				}
			}]
		},
		plugins: {
			labels :{
				render: 'percentage',
        		precision: 1,
        		fontSize: 12	//default : 12
        	}
        }
	}				
}

var chart14 = document.getElementById('chart14');//.getContext('2d');

//chart14.width = 120;
chart14.height = 360;

window.myPie = new Chart(chart14, config14);
//##########################################################
var config15 ={
	type: 'bar',
	data: {
		labels: ['차량신호'],
		datasets: [
			{
				label: '3색등',
				backgroundColor: color(window.chartColors.red).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt12}
				]
			}, {
				label: '4색등',
				backgroundColor: color(window.chartColors.blue).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt13}
				]
			}
		]
	},
	options: {
		responsive: true,
		legend: {
			position: 'top',
		},
		title: {
			display: true,
			text: '교통신호 - 차량신호',
			fontSize:14
		},
		scales: {	//x영역 -> y영역은 동일하게 yAxes 설정
			xAxes: [{
				categoryPercentage: 1.0,
				barPercentage: 0.3,
				/* gridLines: {
	                offsetGridLines: false
	            } */
			}],
			yAxes: [{
				ticks: {
					beginAtZero : true, // 0부터 시작하게 합니다.
					stepSize: 100   // 1 씩 증가하도록 설정합니다.
				}
			}]
		},
		plugins: {
			labels :{
				render: 'percentage',
        		precision: 1,
        		fontSize: 12	//default : 12
        	}
        }
	}				
}

var chart15 = document.getElementById('chart15');//.getContext('2d');

//chart15.width = 120;
chart15.height = 360;

window.myPie = new Chart(chart15, config15);
//##########################################################
var config16 ={
	type: 'bar',
	data: {
		labels: ['차량 경보등'],
		datasets: [
			{
				label: '2색등',
				backgroundColor: color(window.chartColors.red).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt14}
				]
			}, {
				label: '3색등',
				backgroundColor: color(window.chartColors.blue).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt15}
				]
			}
		]
	},
	options: {
		responsive: true,
		legend: {
			position: 'top',
		},
		title: {
			display: true,
			text: '교통신호 - 차량 경보등',
			fontSize:14
		},
		scales: {	//x영역 -> y영역은 동일하게 yAxes 설정
			xAxes: [{
				categoryPercentage: 1.0,
				barPercentage: 0.3,
				/* gridLines: {
	                offsetGridLines: false
	            } */
			}],
			yAxes: [{
				ticks: {
					beginAtZero : true, // 0부터 시작하게 합니다.
					stepSize: 100   // 1 씩 증가하도록 설정합니다.
				}
			}]
		},
		plugins: {
			labels :{
				render: 'percentage',
        		precision: 1,
        		fontSize: 12	//default : 12
        	}
        }
	}				
}

var chart16 = document.getElementById('chart16');//.getContext('2d');

//chart16.width = 120;
chart16.height = 360;

window.myPie = new Chart(chart16, config16);
//##########################################################
var config17 ={
	type: 'bar',
	data: {
		labels: ['차량 가변등'],
		datasets: [
			{
				label: '2색등',
				backgroundColor: color(window.chartColors.red).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt16}
				]
			}, {
				label: '3색등',
				backgroundColor: color(window.chartColors.blue).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt17}
				]
			}
		]
	},
	options: {
		responsive: true,
		legend: {
			position: 'top',
		},
		title: {
			display: true,
			text: '교통신호 - 차량경보등',
			fontSize:14
		},
		scales: {	//x영역 -> y영역은 동일하게 yAxes 설정
			xAxes: [{
				categoryPercentage: 1.0,
				barPercentage: 0.3,
				/* gridLines: {
	                offsetGridLines: false
	            } */
			}],
			yAxes: [{
				ticks: {
					beginAtZero : true, // 0부터 시작하게 합니다.
					stepSize: 100   // 1 씩 증가하도록 설정합니다.
				}
			}]
		},
		plugins: {
			labels :{
				render: 'percentage',
        		precision: 1,
        		fontSize: 12	//default : 12
        	}
        }
	}				
}

var chart17 = document.getElementById('chart17');//.getContext('2d');

//chart17.width = 120;
chart17.height = 360;

window.myPie = new Chart(chart17, config17);
//##########################################################
var config18 ={
	type: 'bar',
	data: {
		labels: ['보행등'],
		datasets: [
			{
				label: '2색등',
				backgroundColor: color(window.chartColors.red).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt18}
				]
			}, {
				label: '3색등',
				backgroundColor: color(window.chartColors.blue).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt19}
				]
			}
		]
	},
	options: {
		responsive: true,
		legend: {
			position: 'top',
		},
		title: {
			display: true,
			text: '교통신호 - 보행등',
			fontSize:14
		},
		scales: {	//x영역 -> y영역은 동일하게 yAxes 설정
			xAxes: [{
				categoryPercentage: 1.0,
				barPercentage: 0.3,
				/* gridLines: {
	                offsetGridLines: false
	            } */
			}],
			yAxes: [{
				ticks: {
					beginAtZero : true, // 0부터 시작하게 합니다.
					stepSize: 100   // 1 씩 증가하도록 설정합니다.
				}
			}]
		},
		plugins: {
			labels :{
				render: 'percentage',
        		precision: 1,
        		fontSize: 12	//default : 12
        	}
        }
	}				
}

var chart18 = document.getElementById('chart18');//.getContext('2d');

//chart18.width = 120;
chart18.height = 360;

window.myPie = new Chart(chart18, config18);
//##########################################################
var config19 ={
	type: 'bar',
	data: {
		labels: ['전자제어기'],
		datasets: [
			{
				label: '전자일반',
				backgroundColor: color(window.chartColors.red).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt22}
				]
			}, {
				label: '2004년식',
				backgroundColor: color(window.chartColors.blue).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt23}
				]
			}, {
				label: '2010년식',
				backgroundColor: color(window.chartColors.orange).rgbString(),
				borderColor: window.chartColors.orange,
				borderWidth: 1,
				data: [
					${totCnt24}
				]
			}
		]
	},
	options: {
		responsive: true,
		legend: {
			position: 'top',
		},
		title: {
			display: true,
			text: '교통신호 - 전자제어기',
			fontSize:14
		},
		legend: {
            display: true,
            labels: {
            	boxWidth : 20,
            	usePointStyle: false
            }
        },
		scales: {	//x영역 -> y영역은 동일하게 yAxes 설정
			xAxes: [{
				categoryPercentage: 1.0,
				barPercentage: 0.4,
				/* gridLines: {
	                offsetGridLines: false
	            } */
			}],
			yAxes: [{
				ticks: {
					beginAtZero : true, // 0부터 시작하게 합니다.
					stepSize: 100   // 1 씩 증가하도록 설정합니다.
				}
			}]
		},
		plugins: {
			labels :{
				render: 'percentage',
        		precision: 1,
        		fontSize: 12	//default : 12
        	}
        }
	}				
}

var chart19 = document.getElementById('chart19');//.getContext('2d');

//chart19.width = 120;
chart19.height = 360;

window.myPie = new Chart(chart19, config19);
//##########################################################
var config20 ={
	type: 'bar',
	data: {
		labels: ['정주기 제어기'],
		datasets: [
			{
				label: '듀얼링',
				backgroundColor: color(window.chartColors.red).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt25}
				]
			}, {
				label: '싱글링',
				backgroundColor: color(window.chartColors.blue).rgbString(),
				borderColor:  "#ffffff",
				borderWidth: 2,
				data: [
					${totCnt26}
				]
			}
		]
	},
	options: {
		responsive: true,
		legend: {
			position: 'top',
		},
		title: {
			display: true,
			text: '교통신호 - 정주기 제어기',
			fontSize:14
		},
		legend: {
            display: true,
            labels: {
            	boxWidth : 40			//default : 40
            	/*
            	,fontSize:16
            	,fontStyle:'bold'
            	,fontColor: 'red'
            	,padding:20
            	,usePointStyle: true	//legend style : default : false
            	*/
            }
        },
		scales: {	//x영역 -> y영역은 동일하게 yAxes 설정
			xAxes: [{
				categoryPercentage: 1.0,
				barPercentage: 0.3,
				/* gridLines: {
	                offsetGridLines: false
	            } */
			}],
			yAxes: [{
				ticks: {
					beginAtZero : true, // 0부터 시작하게 합니다.
					stepSize: 100   // 1 씩 증가하도록 설정합니다.
				}
			}]
		},
		plugins: {
			labels :{
				render: 'percentage',
        		precision: 1,
        		fontSize: 12	//default : 12
        	}
        }
	}				
}

var chart20 = document.getElementById('chart20');//.getContext('2d');

//chart20.width = 120;
chart20.height = 360;

window.myPie = new Chart(chart20, config20);
</script>


