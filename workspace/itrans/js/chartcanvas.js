   window.onload = function () {

//bar chart work order
var ctx2 = document.getElementById("barchartContainer");
var barChart = new CanvasJS.Chart(ctx2, {
	backgroundColor: 'rgba(34,49,94, 1.0)',	
	title: {
		text: "Work Order",
		fontColor: "#C8CFF4",
		fontFamily: "Roboto, Helvetica, sans-serif"
	},  
	axisX: {
       // title: "Time",
		//valueFormatString: "hh:mm",
		gridThickness: 0,
		labelFontSize: 10,
		labelFontColor: "#C8CFF4"
    },
	axisY: {
		//title: "Temperature (°C)",
		//suffix: " °C"
		gridThickness: 0,
		labelFontSize: 10,
		labelFontColor: "#C8CFF4"
	},
	data: [{
		type: "column",	
		//yValueFormatString: "#,### °C",
		//indexLabel: "{y}",
		dataPoints: [
			{ label: "01.00", y: 15 },
			{ label: "02.00", y: 28 },
			{ label: "03.00", y: 18 },
			{ label: "04.00", y: 15 },
			{ label: "05.00", y: 28 },
			{ label: "06.00", y: 18 },
			{ label: "07.00", y: 14 },
			{ label: "08.00", y: 12 },
			{ label: "09.00", y: 24 },
			{ label: "10.00", y: 14 },
			{ label: "11.00", y: 12 },
			{ label: "12.00", y: 24 }
		]
	}]
});

function updateBarChart() {
	var boilerColor, deltaY, yVal;
	var dps = barChart.options.data[0].dataPoints;
	var j =6;
	for (var i = 0; i < dps.length; i++) {
		deltaY = Math.round(2 + Math.random() *(-2-2));
		yVal = deltaY + dps[i].y > 0 ? dps[i].y + deltaY : 0;
		//boilerColor = yVal > 15 ? "#7DD6F7" : yVal <= 5 ? "#6B8E23" : yVal < 15 ? "#6B8E23" : null;
		boilerColor = "#D0A2FD"; 
		dps[i] = {label: (j+1)+".00" , y: yVal, color: boilerColor};
		j++;
	}
	barChart.options.data[0].dataPoints = dps; 
	barChart.render();
};
updateBarChart();
setInterval(function() {updateBarChart()}, 4000);
//end of bar chart

//start linechart technical work alarm
var ctx1 = document.getElementById("linechartContainer");
var lineChart = new CanvasJS.Chart(ctx1, {
	backgroundColor: 'rgba(34,49,94, 1.0)',
	title: {
		text: "Alarms",
		fontColor: "#C8CFF4",
		fontFamily: "Roboto, Helvetica, sans-serif"
	},  
	axisX: {
       // title: "Time",
		//valueFormatString: "hh:mm",
		gridThickness: 0,
		labelFontSize: 10,
		labelFontColor: "#C8CFF4"
    },
	axisY: {
		//title: "Temperature (°C)",
		//suffix: " °C"
		gridThickness: 0,
		labelFontSize: 10,
		labelFontColor: "#C8CFF4"
	},
	data: [{
		type: "line",	
		//yValueFormatString: "#,### °C",
		//indexLabel: "{y}",
		dataPoints: [
			{ label: "01.00", y: 15 },
			{ label: "02.00", y: 28 },
			{ label: "03.00", y: 18 },
			{ label: "04.00", y: 15 },
			{ label: "05.00", y: 28 },
			{ label: "06.00", y: 18 },
			{ label: "07.00", y: 14 },
			{ label: "08.00", y: 12 },
			{ label: "09.00", y: 24 },
			{ label: "10.00", y: 14 },
			{ label: "11.00", y: 12 },
			{ label: "12.00", y: 24 }
		]
	}]
});

function updateLineChart() {
	var boilerColor, deltaY, yVal;
	var dps = lineChart.options.data[0].dataPoints;
	var j =6;
	for (var i = 0; i < dps.length; i++) {
		deltaY = Math.round(2 + Math.random() *(-2-2));
		yVal = deltaY + dps[i].y > 0 ? dps[i].y + deltaY : 0;
		//boilerColor = yVal > 200 ? "#FF2500" : yVal >= 170 ? "#FF6000" : yVal < 170 ? "#6B8E23 " : null;
		boilerColor = "#D0A2FD";  
		dps[i] = {label: (j+1)+".00" , y: yVal, color: boilerColor};
		j++;
	}
	lineChart.options.data[0].dataPoints = dps; 
	lineChart.render();
};
updateLineChart();
setInterval(function() {updateLineChart()}, 5000);
//End linechart

}