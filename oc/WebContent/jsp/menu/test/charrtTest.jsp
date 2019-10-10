<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	// Load the Visualization API and the corechart package.
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		//데이터 부분은 ajax로 가져옴
		// Create the data table.
		var data = new google.visualization.DataTable();
		
		
		/* data.addColumn('string', '가게이름');
		data.addColumn('string', '카테고리');
		data.addColumn('number', '판매량');
		data.addRows([ 
			[ '진뇽분식', 1 ],  
			[ '분식', 1 ],
			[ '444', 1 ]
				]); */

		// Set chart options
		var options = {
			'title' : '가게별 판매량',
			'width' : 700,
			'height' : 600,
			bar:{groupWidth:"50%"},
			 legend: { position: "left" }//법례위치 설정(none은 안보이게)
		};

		// Instantiate and draw our chart, passing in some options.
		//차트 종류변경
		var chart = new google.visualization.ColumnChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>
</head>

<body>
	<!--Div that will hold the pie chart-->
	<div id="chart_div"></div>
</body>
</html>
