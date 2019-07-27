var speedCanvas = document.getElementById("speedChart");
Chart.defaults.global.defaultFontColor = '#ffffff';
Chart.defaults.global.defaultFontStyle = 'normal';
Chart.defaults.global.defaultFontSize = 12;
Chart.defaults.global.defaultFontFamily = '"Roboto", Helvetica, sans-serif';

var dataFirst = {
    label: "BKE(PIE)",
    data: [10, 55, 24, 54, 40, 25, 35, 17, 21],
    lineTension: 0,
    fill: false,
    borderColor: 'rgba(82, 217, 129)',
	pointBorderColor: false,
    pointBackgroundColor: false,
    pointBorderWidth: 0,
    pointHoverRadius: 8,
    pointHoverBackgroundColor: false,
    pointHoverBorderColor: false,
    pointHoverBorderWidth: 0,
    pointRadius: 0,
    pointHitRadius: 0
  };

var dataSecond = {
    label: "BKE(W'lands)",
    data: [45, 35, 24, 41, 37, 42, 54, 62, 42],
    lineTension: 0,
    fill: false,
    borderColor: 'rgba(239, 61, 255)',
    pointBorderColor: false,
    pointBackgroundColor: false,
    pointBorderWidth: 0,
    pointHoverRadius: 8,
    pointHoverBackgroundColor: false,
    pointHoverBorderColor: false,
    pointHoverBorderWidth: 0,
    pointRadius: 0,
    pointHitRadius: 0    	
  };
  
var dataThird = {
    label: "Heavy Traffic",
    //data:  [0, 0, 0, 0, 0,0, 0, 0, 0],
    lineTension: 0,
    fill: false,
    borderColor: 'blue'
  };

var dataFour = {
    label: "Others",
    //data: [0, 0, 0, 0, 0,0, 0, 0, 0],
    lineTension: 0,
    fill: false,
  borderColor: 'green'
  }; 

var speedData = {
  labels: ["0", "2", "4", "6", "8", "10", "12", "14", "16"],
  datasets: [dataFirst, dataSecond, dataThird, dataFour],
};


var xlabel = "BKE";
var chartOptions = {
	    scales: {
		  xAxes: [{
			ticks:{
				padding:2,
				display:true, // xAxes label name next to the scale
				min:0,
				/*fontColor: "#000000",
				fontSize : 13,*/
				fontFamily: '"Roboto", Helvetica, sans-serif' 
				//beginAtZero: false,
				  //maxRotation: 90,
			 // minRotation: 80
			},
			gridLines:{
				display:false,
				color:"gray"
				//lineWidth: 0
			}
		  }],
		  yAxes:[{
			categoryPercentage: 1.0, // used to remove the space between bars
			barPercentage: 1.0, // used to remove the space between bars
			barThickness: 20, // bar thickness
		   // maxBarThickness: 8,
		   // minBarLength: 2,		
			ticks: {
			  display:true,  // yAxes label name to the scale
			  padding:10,
			  //beginAtZero: false,
			  min:0
			}, 
			gridLines: {
				display:false,
				//lineWidth: 0
			},
			scaleLabel: { // This is for xscale title
			display: true,
			labelString: xlabel,
			fontStyle: "bold",
			/*fontColor: "#000000",
			fontFamily: '"Roboto", Helvetica, sans-serif' ,
			fontSize : 12 */
		   }
		}]
	},
  legend: {
    display: true,
    position: 'right',
    labels: {
      boxWidth: 0,
      fontColor: '#ffffff'
    }
  }
};

var lineChart = new Chart(speedCanvas, {
  type: 'line',
  data: speedData,
  options: chartOptions
});