

  var bgcolor = [  
				"rgba(79,129,189)",
				"rgba(192,80,77)",
				"rgba(155,187,89)",
				"rgba(75,175,198)"
				];
  var bgBdcolor = [  
				"rgba(79,129,189)",
				"rgba(192,80,77)",
				"rgba(155,187,89)",
				"rgba(75,175,198)"
				];
/*** Incident Event Array ***/
/* 
  var titleLabel = ""; 
  var ctxchartid = "";
  var labelData = []; 
  var valueData = []; 
  var k = 0;
  var totalVal = 0;
  var chartdata = [ 
	  {
          "canvaschartid": "myInciChart1",
          "titlelabel": "Major Incident by ITSO OCC", 
          "labeldata": ["Important", "Massive Jam", "Others"], 
          "valuedata": [5, 2, 1] 
          },{ 
          "canvaschartid": "myInciChart2",
          "titlelabel": "Major Incident by KMOCC", 
          "labeldata": ["Important", "Massive Jam", "Others"], 
          "valuedata": [8, 6, 5] 
          },{ 
          "canvaschartid": "myInciChart3",
          "titlelabel": "Major Incident by LTOC", 
          "labeldata": ["Important", "Massive Jam", "Others"], 
          "valuedata": [3, 3, 3] 
          },{ 
          "canvaschartid": "myInciChart4",
          "titlelabel": "Ongoing Incident Record(IR)", 
          "labeldata": ["Accident", "Roadwork", "Heavy Congestion", "Vehicle Breakdown"], 
          "valuedata": [4, 2, 3, 6] 
          },{ 
          "canvaschartid": "myEventChart1",
          "titlelabel": "Ongoing Event Record(ER)", 
          "labeldata": ["Marathon", "F1", "National Day", "Thaipusam"], 
          "valuedata": [2, 2, 3, 1] 
       }
    ];
       
	for (i in chartdata) { 
		ctxchartid = chartdata[i].canvaschartid;  // chart title
		titleLabel = chartdata[i].titlelabel;  // chart title
		//alert("Title : " + titleLabel  + "     chartid : " + ctxchartid);
		labelData[k] =  chartdata[i].labeldata;   // label name
		valueData[k] =  chartdata[i].valuedata;   // label value
		k++;		
		for (j=0;j<labelData.length;j++) {    
			 // alert("Lable : " + labelData[j] + ": " + valueData[j]);
			 for(l=0;l<valueData[j].length;l++) {
			  	z = parseInt(valueData[j][l]);
			   	totalVal = totalVal + z;
			  }
			// alert("totalVal : " + totalVal);			  
			//alert("ctxchartid : " + ctxchartid + "   - titleLabel : " + titleLabel);
			incidentChartCreation(ctxchartid, labelData, valueData, totalVal, titleLabel);						 
			totalVal = 0;
		}	 
		// reset the value for next array element
		totalVal = 0;
		labelData = [];
		valueData = [];
		k = 0;
		ctxchartid = "";			
	}
*/	
/*** End of Incident Event Array ***/  
  
  
/*** Start of Chart 1 */
  var ctxIncident1 = document.getElementById("myInciChart1");
  var totalVal = 0;
  var titleLabel = 'Major Incident by ITSO OCC';
 // document.getElementById("titleLabel").innerHTML = titleLabel;
  var labelData = ["Important", "Massive Jam", "Others"];
  var valueData = [5, 2, 1];
  for(i=0;i<valueData.length;i++) {
    totalVal = totalVal+valueData[i];
  }
  var data1 = {
    labels: labelData,
    datasets: [
      {
     // label: "TeamA Score",
        data: valueData,
        backgroundColor: bgcolor,
        borderColor: bgBdcolor,
        borderWidth: [1, 1, 1]
      }
    ]
  };

incidentChartCreation(ctxIncident1, data1, totalVal,titleLabel);

/*** End of Chart 1 */

/*** Start of Chart 2 */

  var ctxIncident2 = document.getElementById("myInciChart2");
  var totalVal2 = 0;
  var titleLabel2 = 'Major Incident by KMOCC';
 // document.getElementById("titleLabel2").innerHTML = titleLabel2;
  var labelData2 = ["Important", "Massive Jam", "Others"];
  var valueData2 = [2, 2, 1];
  for(i=0;i<valueData2.length;i++) {
    totalVal2 = totalVal2+valueData2[i];
  }
  var data2 = {
    labels: labelData2,
    datasets: [
      {
     // label: "TeamA Score",
        data: valueData2,
        backgroundColor: bgcolor,
        borderColor: bgBdcolor,
        borderWidth: [1, 1, 1]
      }
    ]
  };
incidentChartCreation(ctxIncident2, data2, totalVal2,titleLabel2);

/*** End of Chart 2 */

/*** Start of Chart 3 */

var ctxIncident3 = document.getElementById("myInciChart3");
var totalVal3 = 0;
var titleLabel3 = 'Major Incident by LTOC';
//document.getElementById("titleLabel3").innerHTML = titleLabel3;
var labelData3 = ["Important", "Massive Jam", "Others"];
var valueData3 = [3, 3, 3];
for(i=0;i<valueData3.length;i++) {
  totalVal3 = totalVal3+valueData3[i];
}
var data3 = {
  labels: labelData3,
  datasets: [
    {
   // label: "TeamA Score",
      data: valueData3,
      backgroundColor: bgcolor,
      borderColor: bgBdcolor,
      borderWidth: [1, 1, 1]
    }
  ]
};
incidentChartCreation(ctxIncident3, data3, totalVal3,titleLabel3);

/*** End of Chart 3 */

/*** Start of Chart 4 */

var ctxIncident4 = document.getElementById("myInciChart4");
var totalVal4 = 0;
var titleLabel4 = "Ongoing Incident Record(IR)";
//document.getElementById("titleLabel4").innerHTML = titleLabel4;
var labelData4 = ['Accident','Roadwork','Heavy Congestion','Vehicle Breakdown'];
var valueData4 = [4, 2, 3, 6];
for(i=0;i<valueData4.length;i++) {
  totalVal4 = totalVal4+valueData4[i];
}
var data4 = {
  labels: labelData4,
  datasets: [
    {
   // label: "TeamA Score",
      data: valueData4,
      backgroundColor: bgcolor,
      borderColor: bgBdcolor,
      borderWidth: [1, 1, 1]
    }
  ]
};
incidentChartCreation(ctxIncident4, data4, totalVal4,titleLabel4);

/*** End of Chart 4 */

/*** Start of Chart 5 */

var ctxEvent1 = document.getElementById("myEventChart1");
var totalVal5 = 0;
var titleLabel5 = 'Ongoing Event Record(ER)';
//document.getElementById("titleLabel5").innerHTML = titleLabel5;
var labelData5 = ['Marathon', 'F1', 'National Day', 'Thaipusam'];
var valueData5 = [2, 2, 3, 1];
for(i=0;i<valueData5.length;i++) {
  totalVal5 = totalVal5+valueData5[i];
}
var data4 = {
  labels: labelData5,
  datasets: [
    {
   // label: "TeamA Score",
      data: valueData5,
      backgroundColor: bgcolor,
      borderColor: bgBdcolor,
      borderWidth: [1, 1, 1]
    }
  ]
};
incidentChartCreation(ctxEvent1, data4, totalVal5, titleLabel5); 

/*** End of Chart 5 */

function incidentChartCreation(ctxInciEvent, data1, totalVal, titleLabel){
//function incidentChartCreation(ctxInciEvent, labelData, valueData, totalVal,titleLabel){
/*
			var data1 = {
				labels: labelData,
				datasets: [
					 {
					 // label: "TeamA Score",
					 data: valueData,
					 backgroundColor: bgcolor,
					 borderColor: bgBdcolor,
					 borderWidth: [1, 1, 1]
					 }
				]
			}; 
*/

//options
var options = {
      elements: {  // Center value see the plugin to change font size, color, name
		center: {
		  text: totalVal
  		}
	}, 
    responsive: true,
    legend: {
     // display: true,
      position: "right",
      labels: {
		boxWidth: 10,
        fontColor: "#ffffff",
        fontSize: 12,
		fontFamily: '"Roboto", Helvetica, sans-serif' 
      }
    },    
    title: {
            display: true,
            text: titleLabel,
            position: "top",
            fontSize : '20',
            fontColor: "#ffffff",
			fontFamily: '"Roboto", Helvetica, sans-serif' 
    } ,
    plugins: {
      labels: {
      render: 'value',
      fontSize: 20,
      fontStyle: 'bold',
      fontColor: '#ffffff',
      fontFamily: '"Roboto", Helvetica, sans-serif' 
      }
  } 
  };
  //create Chart class object
  var incidentChart = new Chart(ctxInciEvent, {
    type: "doughnut",
    data: data1,
    options: options
  });

}

Chart.pluginService.register({
    beforeDraw: function (chart) {
        if (chart.config.options.elements.center) {
    //Get ctx from string
    var ctx = chart.chart.ctx;
    
            //Get options from the center object in options
    var centerConfig = chart.config.options.elements.center;
    var fontStyle = centerConfig.fontStyle || 'Roboto, Helvetica, sans-serif';
    var txt = centerConfig.text;
    var color = centerConfig.color || 'green';
    ctx.textAlign = 'center';
    ctx.textBaseline = 'middle';
	fontSizeToUse = '30';
    var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
    var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
    ctx.font = fontSizeToUse + 'px  ' + fontStyle;  //ctx.font syntax is '28px Roboto'
    ctx.fillStyle = '#ffffff';
    
    //Draw text in center
    ctx.fillText(txt, centerX, centerY);
        }
    }
});