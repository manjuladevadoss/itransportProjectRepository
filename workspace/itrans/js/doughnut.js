

//var ctx2 = document.getElementById("myDoughnutChart3");
//var ctx3 = document.getElementById("myDoughnutChart4");
//var ctx4 = document.getElementById("myDoughnutChart5");

 

  /*** Start of Chart 1 */
  var ctx = document.getElementById("myDoughnutChart1");
  var totalVal = 0;
  var titleLabel = 'Major Incident by ITSO OCC';
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
        backgroundColor: [
          "rgba(79,129,189)",
          "rgba(155,187,89)",
          "rgba(192,80,77)"
        ],
        borderColor: [
          "rgba(79,129,189)",
          "rgba(155,187,89)",
          "rgba(192,80,77)"
        ],
        borderWidth: [1, 1, 1]
      }
    ]
  };
doughnut(ctx, data1, totalVal,titleLabel);
/*** End of Chart 1 */

/*** Start of Chart 2 */
  var ctx2 = document.getElementById("myDoughnutChart2");
  var totalVal2 = 0;
  var titleLabel2 = 'Major Incident by KMOCC';
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
        backgroundColor: [
          "rgba(79,129,189)",
          "rgba(155,187,89)",
          "rgba(192,80,77)"
        ],
        borderColor: [
          "rgba(79,129,189)",
          "rgba(155,187,89)",
          "rgba(192,80,77)"
        ],
        borderWidth: [1, 1, 1]
      }
    ]
  };
doughnut(ctx2, data2, totalVal2,titleLabel2);
/*** End of Chart 2 */

/*** Start of Chart 3 */
var ctx3 = document.getElementById("myDoughnutChart3");
var totalVal3 = 0;
var titleLabel3 = 'Major Incident by LTOC';
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
      backgroundColor: [
        "rgba(79,129,189)",
        "rgba(155,187,89)",
        "rgba(192,80,77)"
      ],
      borderColor: [
        "rgba(79,129,189)",
        "rgba(155,187,89)",
        "rgba(192,80,77)"
      ],
      borderWidth: [1, 1, 1]
    }
  ]
};
doughnut(ctx3, data3, totalVal3,titleLabel3);
/*** End of Chart 3 */

/*** Start of Chart 4 */
var ctx4 = document.getElementById("myDoughnutChart4");
var totalVal4 = 0;
var titleLabel4 = "Ongoing Incident Record(IR)";
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
      backgroundColor: [
        "rgba(79,129,189)",
        "rgba(155,187,89)",
        "rgba(192,80,77)",
        "rgb(196, 143, 90)"
      ],
      borderColor: [
        "rgba(79,129,189)",
        "rgba(155,187,89)",
        "rgba(192,80,77)",
        "rgb(196, 143, 90)"
      ],
      borderWidth: [1, 1, 1]
    }
  ]
};
doughnut(ctx4, data4, totalVal4,titleLabel4);
/*** End of Chart 4 */


/*** Start of Chart 5 */
var ctx5 = document.getElementById("myDoughnutChart5");
var totalVal5 = 0;
var titleLabel5 = 'Ongoing Event Record(ER)';
var labelData5 = ['Marathon', 'F1', 'National Day', 'Thaipusam'];
var valueData5 = [2, 2, 3, 1];
for(i=0;i<valueData5.length;i++) {
  totalVal5 = totalVal5 + valueData5[i];
}
var data5 = {
  labels: labelData5,
  datasets: [
    {
   // label: "TeamA Score",
      data: valueData5,
      backgroundColor: [
        "rgba(79,129,189)",
        "rgba(155,187,89)",
        "rgba(192,80,77)",
        "rgb(196, 143, 90)"
      ],
      borderColor: [
        "rgba(79,129,189)",
        "rgba(155,187,89)",
        "rgba(192,80,77)",
        "rgb(196, 143, 90)"
      ],
      borderWidth: [1, 1, 1]
    }
  ]
};
doughnut(ctx5, data5, totalVal5,titleLabel5);
/*** End of Chart 5 */



function doughnut(ctx, data1, totalVal,titleLabel){
//options
var options = {
    elements: {
				center: {
					text: totalVal
         /* color: '#FF6384', // Default is #000000
          fontStyle: 'Arial', // Default is Arial
          sidePadding: 10, // Defualt is 20 (as a percentage)
          fontSize: '25px'*/
				}
			},
    responsive: true,
    legend: {
     // display: true,
      position: "right",
      labels: {
        fontColor: "#333",
        fontSize: 10,
        boxWidth: 10
      }
    },    
    title: {
            display: true,
            text: titleLabel,
            position: "top",
            fontSize : '15',
            fontColor : 'black'
    },
    plugins: {
      labels: {
      render: 'value',
      fontSize: 10,
      fontStyle: 'bold',
      fontColor: '#000',
      fontFamily: '"Lucida Console", Monaco, monospace' 
      }
  } 
  };
  //create Chart class object
  var chart1 = new Chart(ctx, {
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