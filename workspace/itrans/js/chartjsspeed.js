
  /*** Start of Chart 1 */
   var bgColor = [
          "rgba(192,0,0)",
		  "rgba(255,192,0)",
		  "rgba(0,176,80)"
        ];
	var	bgborderColor	= [
          "rgba(192,0,0)",
		  "rgba(255,192,0)",
		  "rgba(0,176,80)"
        ]

  var ctxSpeed1 = document.getElementById("myChartSpeed1");
  var totalSpeed1Val = 0;
  var titleSpeedLabel = 'EAC Speed Distribution';
  var labelSpeedData = ["Red", "Ambar", "Green"];
  var valueSpeedData = [3, 6, 4];
  for(i=0;i<valueSpeedData.length;i++) {
    totalSpeed1Val = totalSpeed1Val+valueSpeedData[i];
  }
  var speedData1 = {
    labels: labelSpeedData,
    datasets: [
      {
     // label: "TeamA Score",
        data: valueSpeedData,
        backgroundColor: bgColor,
        borderColor: bgborderColor,
        borderWidth: [1, 1, 1]
      }
    ]
  };
SpeedChartCreation(ctxSpeed1, speedData1, totalSpeed1Val,titleSpeedLabel);
/*** End of Chart 1 */

/*** Start of Chart 2 */
  var ctxSpeed2 = document.getElementById("myChartSpeed2");
  var totalSpeedVal2 = 0;
  var titleSpeedLabel2 = 'Expressway Speed Distribution';
  var labelSpeedData2 = ["Red", "Ambar", "Green"];
  var valueSpeedData2 = [2, 2, 1];
  for(i=0;i<valueSpeedData2.length;i++) {
    totalSpeedVal2 = totalSpeedVal2+valueSpeedData2[i];
  }
  var dataSpeed2 = {
    labels: labelSpeedData2,
    datasets: [
      {
     // label: "TeamA Score",
        data: valueSpeedData2,
        backgroundColor: bgColor,
        borderColor: bgborderColor,
        borderWidth: [1, 1, 1]
      }
    ]
  };
SpeedChartCreation(ctxSpeed2, dataSpeed2, totalSpeedVal2,titleSpeedLabel2);
/*** End of Chart 2 */

/*** Start of Chart 3 */
var ctxSpeed3 = document.getElementById("myChartSpeed3");
var totalSpeedVal3 = 0;
var titleSpeedLabel3 = 'EAC Travel Time Index Distribution';
var labelSpeedData3 = ["Red", "Ambar", "Green"];
var valueSpeedData3 = [2, 1, 8];
for(i=0;i<valueSpeedData3.length;i++) {
  totalSpeedVal3 = totalSpeedVal3+valueSpeedData3[i];
}
var dataSpeed3 = {
  labels: labelSpeedData3,
  datasets: [
    {
   // label: "TeamA Score",
      data: valueSpeedData3,
      backgroundColor: bgColor,
      borderColor: bgborderColor,
      borderWidth: [1, 1, 1]
    }
  ]
};
SpeedChartCreation(ctxSpeed3, dataSpeed3, totalSpeedVal3,titleSpeedLabel3);
/*** End of Chart 3 */

/*** Start of Chart 4 */
var ctxSpeed4 = document.getElementById("myChartSpeed4");
var totalSpeedVal4 = 0;
var titleSpeedLabel4 = "Expressway Travel Time Index Distribution";
var labelSpeedData4 = ["Red", "Ambar", "Green"];
var valueSpeedData4 = [4, 2, 3];
for(i=0;i<valueSpeedData4.length;i++) {
  totalSpeedVal4 = totalSpeedVal4+valueSpeedData4[i];
}
var dataSpeed4 = {
  labels: labelSpeedData4,
  datasets: [
    {
   // label: "TeamA Score",
      data: valueSpeedData4,
      backgroundColor: bgColor,
      borderColor: bgborderColor,
      borderWidth: [1, 1, 1]
    }
  ]
};
SpeedChartCreation(ctxSpeed4, dataSpeed4, totalSpeedVal4,titleSpeedLabel4);
/*** End of Chart 4 */

function SpeedChartCreation(ctxSpeed, speedChartdata, totalSpeedVal, titleSpeedLabel){
//options
var speedOptions = {
    responsive: true,
    legend: {
     // display: true,
      position: "right",
      labels: {
        fontColor: '#ffffff',
        fontSize: 12,
        boxWidth: 10,
		fontFamily: '"Roboto", Helvetica, sans-serif' 
      }
    },    
    title: {
            display: true,
            text: titleSpeedLabel,
            position: "top",
            fontSize : 20,
            fontColor: '#ffffff',
			fontFamily: '"Roboto", Helvetica, sans-serif' 
    } ,
    plugins: {
      labels: {
     // render: 'value',
      fontSize: 14,
      fontStyle: 'bold',
      fontColor: '#ffffff',
      fontFamily: '"Roboto", Helvetica, sans-serif' 
      }
  } 
  };
  //create Chart class object
  var SpeedChart = new Chart(ctxSpeed, {
    type: "doughnut",
    data: speedChartdata,
    options: speedOptions
  });

}

Chart.pluginService.register({
    beforeDraw: function (chart) {
        if (chart.config.options.elements.center) {
    //Get ctx from string
    var ctx = chart.chart.ctx;
    
            //Get options from the center object in options
    var centerConfig = chart.config.options.elements.center;
  //	var fontStyle = centerConfig.fontStyle || 'Arial';
            var txt = centerConfig.text;
    var color = centerConfig.color || 'green';
    ctx.textAlign = 'center';
    ctx.textBaseline = 'middle';
    var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
    var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
  //  ctx.font = fontSizeToUse+"px " + fontStyle;
    //ctx.fillStyle = color;
    
    //Draw text in center
    ctx.fillText(txt, centerX, centerY);
        }
    }
});