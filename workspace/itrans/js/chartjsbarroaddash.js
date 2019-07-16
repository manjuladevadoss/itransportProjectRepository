	Chart.defaults.global.legend.display = true; //lable name replace with title tag
	Chart.defaults.global.defaultFontColor = '#ffffff';
	Chart.defaults.global.defaultFontStyle = 'normal';
	Chart.defaults.global.defaultFontSize = 12;
	Chart.defaults.global.defaultFontFamily = '"Roboto", Helvetica, sans-serif';
// Chart.defaults.global.tooltips.enabled = false;  Tool Tip


/*** Road Opening Data */
//var  myChart ;
var openA = 10, openB = 8, openC=15;
var ctxOpen1 = document.getElementById("myChartOpen");
var dataLabelOpen1 = 'Roads Open Early';
var dataLabelOpen2 = 'Roads Open on Time';
var dataLabelOpen3 = 'Roads Open Late';
var titleTextOpen = 'Road Opening';
chartFunction(openA,openB,openC,dataLabelOpen1,dataLabelOpen2,dataLabelOpen3,titleTextOpen,ctxOpen1);
/*** End of Road Opening Data */


/*** Road Closure Data */
var closeData1 =5, closeData2 =7, closeData3=10;
var dataLabel1 = 'Roads Close Early';
var dataLabel2 = 'Roads Close On Time';
var dataLabel3 = 'Roads Close Late';
var titleTextClose = 'Road Closure';
var ctxClose1 = document.getElementById("myChartClose");
chartFunction(closeData1,closeData2,closeData3,dataLabel1,dataLabel2,dataLabel3,titleTextClose,ctxClose1);
/*** End of Road Closure Data */


function chartFunction(a,b,c,dataLabel1,dataLabel2,dataLabel3,titleText,ctx) {
	if (myChart) {
    myChart.destroy();
  } 
var myChart = new Chart(ctx, { 
  type: 'horizontalBar',
data: {
    datasets: [{
      label: dataLabel1,
      backgroundColor: "rgba(79,129,189)",
      data: [a]
    }, {
      label: dataLabel2,
      backgroundColor: "rgba(155,187,89)",
      data: [b]
    }, {
      label: dataLabel3,
      backgroundColor: "rgba(192,80,77)",
      data: [c]
    }]
  },
  options: {
    responsive: false,	
    title: {
			display: true,
            text: titleText,
            fontSize : '20',
            /*fontColor : '#000000', 
			fontFamily: '"Roboto", Helvetica, sans-serif' */
			
    },
    scales: {
		  xAxes: [{
			ticks:{
				padding:2,
				display:true, // xAxes label name next to the scale
				min:0,
				/*fontColor: "#000000",
				fontSize : 12,
				fontFamily: '"Roboto", Helvetica, sans-serif' */
				//beginAtZero: false,
				  //maxRotation: 90,
			 // minRotation: 80
			},
			gridLines:{
				display:true,
				color:"gray"
				//lineWidth: 0
			}
		  }],
		  yAxes:[{
			categoryPercentage: 1.0, // used to remove the space between bars
			barPercentage: 1.0, // used to remove the space between bars
			barThickness: 33, // bar thickness
		   // maxBarThickness: 8,
		   // minBarLength: 2,		
			ticks: {
			  display:true,  // yAxes label name to the scale
			  padding:10,
			  //beginAtZero: false,
			  min:0
			}, 
			gridLines: {
				display:false
			}
		}]
	},
    legend: {   // side lable name with bar
      display: true,
      position: 'bottom',
      align: "middle",
      labels: {
        /*fontColor: "#000000",
		fontFamily: '"Roboto", Helvetica, sans-serif' ,
		fontSize : 12,*/
        boxWidth: 10  // legend leftside next to the label box width
      }
    },
	tooltips: {
		enabled: false
	}
  }
});
}