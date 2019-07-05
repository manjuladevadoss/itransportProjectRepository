Chart.defaults.global.legend.display = true; //lable name replace with title tag
// Chart.defaults.global.tooltips.enabled = false;  Tool Tip


/*** Road Opening Data */
//var  myChart ;
var openA = 10, openB = 8, openC=15;
var ctxOpen1 = document.getElementById("myChartOpen");
var dataLabelOpen1 = 'Roads Open Early';
var dataLabelOpen2 = 'Roads Open on Time';
var dataLabelOpen3 = 'Roads Open Late';
var titleTextOpen = 'Road Opening';
document.getElementById("titleLabelRoadOp").innerHTML = titleTextOpen;
chartFunction(openA,openB,openC,dataLabelOpen1,dataLabelOpen2,dataLabelOpen3,titleTextOpen,ctxOpen1);

//second Open Road chart
var openA1 = 9, openB2 = 7, openC3 = 6;
var ctxOpen2 = document.getElementById("myChartOpen1");

chartFunction(openA1,openB2,openC3,dataLabelOpen1,dataLabelOpen2,dataLabelOpen3,titleTextOpen,ctxOpen2);
/*** End of Road Opening Data */


/*** Road Closure Data */
var closeData1 =5, closeData2 =7, closeData3=10;
var dataLabel1 = 'Roads Close Early';
var dataLabel2 = 'Roads Close On Time';
var dataLabel3 = 'Roads Close Late';
var titleTextClose = 'Road Closure';
document.getElementById("titleLabelRoadCl").innerHTML = titleTextClose;
var ctxClose1 = document.getElementById("myChartClose");
chartFunction(closeData1,closeData2,closeData3,dataLabel1,dataLabel2,dataLabel3,titleTextClose,ctxClose1);

//second Closure Road chart
var closeData4 = 4, closeData5 =9, closeData6 =12;
var ctxClose2 = document.getElementById("myChartClose1");
chartFunction(closeData4,closeData5,closeData6,dataLabel1,dataLabel2,dataLabel3,titleTextClose,ctxClose2);
 /*** End of Road Closure Data */


function chartFunction(a,b,c,dataLabel1,dataLabel2,dataLabel3,titleTextClose,ctx) {
	if (myChart) {
    myChart.destroy();
  } 
var myChart = new Chart(ctx, { 
  type: 'horizontalBar',
data: {
    datasets: [{
      label: dataLabel1,
      backgroundColor: "rgba(183,204,124)",
      data: [a]
    }, {
      label: dataLabel2,
      backgroundColor: "rgba(247,232,25)",
      data: [b]
    }, {
      label: dataLabel3,
      backgroundColor: "rgba(30,193,214)",
      data: [c]
    }]
  },
  options: {
    responsive: false,
    title: {
            display: true,
            //text: titleText,
            fontSize : '15',
            fontColor : '#ffffff'		
        },
    scales: {
      xAxes: [{
        ticks: {
            label: "data",
            padding:10,
			display:true, // xAxes label name next to the scale
            min:0,
            fontColor: "#ffffff",
			fontSize : 15,
			fontFamily: '"Roboto", Helvetica, sans-serif'
        },
        gridLines: {
            display:true,
			color: 'gray'
            //lineWidth: 0
        }
      }],
      yAxes: [{
        categoryPercentage: 1.0, // used to remove the space between bars
        barPercentage: 1.0, // used to remove the space between bars
		 barThickness: 50,
        ticks: {
          display:false,  // yAxes label name to the scale
          beginAtZero: true,
		  fontColor: "#ffffff",
		  fontFamily: '"Roboto", Helvetica, sans-serif' ,
          min:0
        }, 
        gridLines: {
            display:false,
            //lineWidth: 0
        }
      }]
    },
    legend: {   // side lable name with bar
      display: true,
      position: 'right',
      labels: {
        label:'title',
        fontColor: "#ffffff",
		fontFamily: '"Roboto", Helvetica, sans-serif' ,
		fontSize : 15,
        boxWidth: 13  // legent leftside box width
      }
    }
  }
});
}