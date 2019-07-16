//window.onload=my_code;

//function my_code(){
	Chart.defaults.global.legend.display = true; //lable name replace with title tag
	// Chart.defaults.global.tooltips.enabled = false;  Tool Tip
var bisroadconarr = document.getElementsByName("bisroadconarr");
var labelNameArr =[];
var totalRecordsArr =[];
/*for(i=0;i<bisroadconarr.length;i++) {
	var  str = bisroadconarr[i].value;	
	var word1sep = str.indexOf("$");
	
	var labelName = str.substring(0, word1sep);
	labelNameArr[i] = labelName ;
	
	var totalRecords = str.substring(word1sep+1, str.length);
	totalRecordsArr[i] = totalRecords ;
	
	alert(labelName  + " : " +  totalRecords) 
}

k = 0;
var titleText = labelNameArr[k];

k=k+1;
var dataLabel1 = labelNameArr[k];
var a = totalRecordsArr[k] ;
alert("dataLabel1 "  + " : " +  dataLabel1) 
alert("a "  + " : " +  a) 
k=k+1;
var dataLabel2 = labelNameArr[k];
var b = totalRecordsArr[k] ;

k=k+1;
var dataLabel3 = labelNameArr[k];
var c = totalRecordsArr[k] ;

k=k+1;
var dataLabel4 = labelNameArr[k];
var d = totalRecordsArr[k] ;

k=k+1;
var dataLabel5 = labelNameArr[k];
var e = totalRecordsArr[k]; */

 var a=1, b =12, c=8, d=4, e=10;
var titleText = 'Reason Roadworks ask to leave';
var dataLabel1 = 'Did not complied with COP';
var dataLabel2 = 'Late Opening';
var dataLabel3 = 'Rejected';
var dataLabel4 = 'Ask to pack up due to secondary incident';
var dataLabel5 =  'Delay due to traffic condition/incident'; 



//document.getElementById("titleLabelcon").innerHTML = titleText;
var ctx = document.getElementById("myChartconroad");
var xlabel="Number of Roadwork";
var myChart = new Chart(ctx, {
	type: 'horizontalBar',
	data: {
    datasets: [{
      label: dataLabel1,
      backgroundColor: "rgba(219,132,61)",
      data: [a]
    }, {
      label: dataLabel2,
      backgroundColor: "rgba(75,175,198)",
      data: [b]
    }, {
      label: dataLabel3,
      backgroundColor: "rgba(128,100,162)",
      data: [c]
    }, {
      label: dataLabel4,
      backgroundColor: "rgba(0,176,80)",
      data: [d]
     }, {
      label: dataLabel5,
      backgroundColor: "rgba(79,129,189)",
      data: [e]
    }]
  },
  options: {
    responsive: false,	
    title: {
			display: true,
            text: titleText,
            fontSize : '25',
            fontColor : '#000000',
			
    },
    scales: {
		  xAxes: [{
			ticks:{
				padding:2,
				display:true, // xAxes label name next to the scale
				min:0,
				fontColor: "#000000",
				fontSize : 15,
				fontFamily: '"Roboto", Helvetica, sans-serif' 
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
			barThickness: 50, // bar thickness
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
			fontColor: "#000000",
			fontFamily: '"Roboto", Helvetica, sans-serif' ,
			fontSize : 15
		   }
		}]
	},
    legend: {   // side lable name with bar
      display: true,
      position: 'right',
      align: "middle",
      labels: {
        fontColor: "#000000",
		fontFamily: '"Roboto", Helvetica, sans-serif' ,
		fontSize : 15,
        boxWidth: 10  // legend leftside next to the label box width
      }
    },
	tooltips: {
		enabled: false
	}
  }
});

//}



