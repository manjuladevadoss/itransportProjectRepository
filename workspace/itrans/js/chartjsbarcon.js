Chart.defaults.global.legend.display = true; //lable name replace with title tag
// Chart.defaults.global.tooltips.enabled = false;  Tool Tip

var a=1, b =12, c=8, d=4, e=10;
var dataLabel1 = 'Did not complied with COP';
var dataLabel2 = 'Late Opening';
var dataLabel3 = 'Rejected';
var dataLabel4 = 'Ask to pack up due to secondary incident';
var dataLabel5 =  'Delay due to traffic condition/incident';
var titleText = 'Reason Roadworks ask to leave';
document.getElementById("titleLabelcon").innerHTML = titleText;
var ctx = document.getElementById("myChartconroad");
var xlabel="Number of Roadwork";
var myChart = new Chart(ctx, {
    
  type: 'horizontalBar',
data: {
    datasets: [{
      label: dataLabel1,
      backgroundColor: "rgba(183,221,240)",
      data: [a]
    }, {
      label: dataLabel2,
      backgroundColor: "rgba(175,156,221)",
      data: [b]
    }, {
      label: dataLabel3,
      backgroundColor: "rgba(102,141,165)",
      data: [c]
    }, {
      label: dataLabel4,
      backgroundColor: "rgba(214,240,116)",
      data: [d]
     }, {
      label: dataLabel5,
      backgroundColor: "rgba(248,255,193)",
      data: [e]
    }]
  },
  options: {
    responsive: false,	
    title: {
			display: true,
           // text: titleText,
            fontSize : '25',
            fontColor : '#ffffff',
			
        },
    scales: {
      xAxes: [{
        ticks: {
            label: xlabel,
            padding:10,
            display:true, // xAxes label name next to the scale
            min:0,
            fontColor: "#ffffff",
			fontSize : 15,
			fontFamily: '"Roboto", Helvetica, sans-serif' 
			//beginAtZero: false,
              //maxRotation: 90,
         // minRotation: 80
        },
        gridLines: {
            display:true,
			color:"gray"
            //lineWidth: 0
        }
      }],
      yAxes: [{
        categoryPercentage: 1.0, // used to remove the space between bars
        barPercentage: 1.0, // used to remove the space between bars
         barThickness: 50,
       //  maxBarThickness: 8,
           // minBarLength: 2,
        ticks: {
          label: xlabel,
          fontColor: "#ffffff",
		  fontFamily: '"Roboto", Helvetica, sans-serif' ,
          display:false,  // yAxes label name to the scale
		  padding:10,
          //beginAtZero: false,
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
       // legendText : titleText,
		//text : titleText,
        fontColor: "#ffffff",
		fontFamily: '"Roboto", Helvetica, sans-serif' ,
		fontSize : 15,
      //  fontSize : '10',
        boxWidth: 13  // legent leftside box width
      }
    }
  }
});
