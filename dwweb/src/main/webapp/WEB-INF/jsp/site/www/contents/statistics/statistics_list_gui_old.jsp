<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
  <script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
        	
            ['도로명', '전자', '일반', { role: 'annotation' } ],
		<c:forEach var="list" items="${listStatistics}" varStatus="st">
            ['${list.routeNm}', ${list.cnt1}, ${list.cnt2}, ''],
		</c:forEach>
	]);

      var view = new google.visualization.DataView(data);
      /* view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]); */

      var options = {
                    		   chart: {
                    	            title: '신호등',
                    	            subtitle: '제어방식',
                    	          },
    	        width: 900,
    	        height: 600,
                chart:{
                	title:'신호등구분',
        	        subtitle: '제어방식',
                },
    	        legend: { position: 'top', maxLines: 3 },
    	        bar: { groupWidth: '75%' },
    	        isStacked: true
    	      };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart.draw(view, options);
  }
  </script>
<div id="barchart_values" style="width: 900px; height: 600px; border:solid 1px red;"></div>
  