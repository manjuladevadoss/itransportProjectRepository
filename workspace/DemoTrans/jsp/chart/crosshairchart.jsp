<!DOCTYPE HTML>
<html>
<head>  
<script>
window.onload = function () {

var options = {
	animationEnabled: true,  
	title:{
		text: "Over Due Alarms"
	},
	axisY: {
		title: "",
		valueFormatString: "#y,,.",
		//suffix: "mn",
		//prefix: "$"
	},
	data: [{
		type: "area",
		markerSize: 5,
		xValueFormatString: "xxxx",
		yValueFormatString: "yy",
	//	xValueFormatString: "YYYY",
		//yValueFormatString: "$#,##0.##",
		dataPoints: [
			{ x: 08.00, y: 50 },
			{ x: 09.00, y: 20 },
			{ x: 10.00, y: 40 },
			{ x: 11.00, y: 90 },
			{ x: 12.00, y: 20 },
			{ x: 13.00, y: 30 },
			{ x: 14.00, y: 70 },
			{ x: 15.00, y: 40 },
			{ x: 16.00, y: 80 }
			
		]
	}]
};
$("#chartContainer").CanvasJSChart(options);

}
</script>
</head>
<body>
<table>
	<tr>
		<td>
			<div id="chartContainer" style="height: 370px; width: 100%;"></div>		
		</td>
	</tr>
</table>


<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
</body>
</html>