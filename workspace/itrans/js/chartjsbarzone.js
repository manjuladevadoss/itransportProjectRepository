var bgColor1 = [
    'rgba(118, 183, 178)',
	'rgba(118, 183, 178)',
    'rgba(78, 121, 167)',
    'rgba(237, 201, 72)',
    'rgba(242, 142, 43)'
  ];
  
var bgColor2 = ['rgba(42, 87, 131)',
			  'rgba(81, 130, 175)',
			  'rgba(96, 145, 187)',
			  'rgba(111, 160, 200)',
			  'rgba(112, 162, 201)'
			  ];
var xlabel = "IR Count";
var ydataLabels = ["RoadWorks", "Accident", "Vehicle Breakdown", "Obstacles", "Heavy Traffic"];


var myChartZoneId1 = document.getElementById("myChartZone1");
var ylabel1 = "Zone 1";
var xdataValues1 = [3, 4, 6, 8, 10];
createzoneChart(xlabel, ylabel1, xdataValues1, ydataLabels, bgColor1, myChartZoneId1);

var myChartZoneId2 = document.getElementById("myChartZone2");
var ylabe2 = "Zone 2";
var xdataValues2 = [1, 3, 5, 5, 8];
createzoneChart(xlabel, ylabe2, xdataValues2, ydataLabels, bgColor1, myChartZoneId2);

var myChartZoneId3 = document.getElementById("myChartZone3");
var ylabe3 = "Zone 3";
var xdataValues3 = [3, 7, 9, 8, 9];
createzoneChart(xlabel, ylabe3, xdataValues3, ydataLabels, bgColor1, myChartZoneId3);

var myChartZoneId4 = document.getElementById("myChartZone4");
var ylabe4 = "Zone 4";
var xdataValues4 = [3, 5, 7, 7, 11];
createzoneChart(xlabel, ylabe4, xdataValues4, ydataLabels, bgColor1, myChartZoneId4);

var myChartZoneId5 = document.getElementById("myChartZone5");
var ylabe5 = "Zone 5";
var xdataValues5 = [3, 6, 5, 9, 10];
createzoneChart(xlabel, ylabe5, xdataValues5, ydataLabels, bgColor1, myChartZoneId5);

var myChartZoneId6 = document.getElementById("myChartZone6");
var ylabe6 = "Zone 6";
var xdataValues6 = [3, 5, 11, 7, 9];
createzoneChart(xlabel, ylabe6, xdataValues6, ydataLabels, bgColor1, myChartZoneId6);

var myChartZoneIdA = document.getElementById("myChartZoneA");
var ylabeA = "Zone A";
var xdataValuesA = [3, 5, 11, 7, 10];
createzoneChart(xlabel, ylabeA, xdataValuesA, ydataLabels, bgColor1, myChartZoneIdA);

var myChartZoneIdB = document.getElementById("myChartZoneB");
var ylabeB = "Zone B";
var xdataValuesB = [3, 5, 11, 7, 10];
createzoneChart(xlabel, ylabeB, xdataValuesB, ydataLabels, bgColor1, myChartZoneIdB);

Chart.defaults.global.defaultFontColor = '#ffffff';
Chart.defaults.global.defaultFontStyle = 'normal';
Chart.defaults.global.defaultFontSize = 12;
Chart.defaults.global.defaultFontFamily = '"Roboto", Helvetica, sans-serif';
Chart.defaults.global.legend.display = false;

function createzoneChart(xlabel, ylabel, xdataValues, ydataLabels, bgColor, myChartZoneId) {
	var dataSetValue = {
	  //label: 'Density of Planets (kg/m3)',
	  display: false,
	  data: xdataValues,
	  backgroundColor: bgColor,
	  borderColor: bgColor,
	  borderWidth: 1,
	  hoverBorderWidth: 0 
	};

	var chartOptions = {
	  scales: {
		yAxes: [{
		  barPercentage: 0.8,
		  barPercentage: 1,
		  categoryPercentage: 0.6,
		  gridLines:{
					display:false,
					color:"gray"
					//lineWidth: 0
			},scaleLabel: { // This is for xscale title
				display: true,
				labelString: ylabel,
				fontStyle: "bold",
				fontColor: "#ffffff",
				fontFamily: '"Roboto", Helvetica, sans-serif' ,
				fontSize : 12
			   }
		  
		}],
		xAxes: [{
		  gridLines:{
			display:false,
			color:"gray"
			//lineWidth: 0
		  },
		  scaleLabel: { // This is for xscale title
			display: true,
			labelString: xlabel,
			fontStyle: "bold",
			fontColor: "#ffffff",
			fontFamily: '"Roboto", Helvetica, sans-serif' ,
			fontSize : 12
		  }			
		}]
	  },
		legend: {   // side lable name with bar
		  display: false,
		  position: 'bottom',
		  align: "middle",
		  labels: {
			fontColor: "#ffffff",
			fontFamily: '"Roboto", Helvetica, sans-serif' ,
			fontSize : 15,
			boxWidth: 10  // legend leftside next to the label box width
		  }
		},
	  elements: {
		rectangle: {
		  borderSkipped: 'left',
		}
	  }
	};

	var barChart = new Chart(myChartZoneId, {
	  type: 'horizontalBar',
	  data: {
		labels: ydataLabels,
		datasets: [dataSetValue],
	  },
	  options: chartOptions
	});

}

