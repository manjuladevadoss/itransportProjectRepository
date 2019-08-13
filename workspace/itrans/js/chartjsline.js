
speedGraph1();
speedLkLrInterval = setInterval(speedGraph2, 5000);	
speedLkLrInterval = setInterval(speedGraph1, 10000);	


var dataFirst, dataSecond, dataThird, dataFour;
Chart.defaults.global.defaultFontColor = '#ffffff';
Chart.defaults.global.defaultFontStyle = 'normal';
Chart.defaults.global.defaultFontSize = 9;
Chart.defaults.global.defaultFontFamily = '"Roboto", Helvetica, sans-serif';


function speedGraph1() {
//call BKE Graph
var speedChartBKE = document.getElementById("speedChartBKE");
graphBKE();


//call AYE Graph
var speedChartAYE = document.getElementById("speedChartAYE");
graphAYE();

//call KJE Graph
var speedChartKJE = document.getElementById("speedChartKJE");
graphKJE();

//call CTE Graph
var speedChartCTE = document.getElementById("speedChartCTE");
graphCTE();

//call SLE Graph
var speedChartSLE = document.getElementById("speedChartSLE");
graphSLE();

//call ECP Graph
var speedChartECP = document.getElementById("speedChartECP");
graphECP();

//call TPE Graph
var speedChartTPE = document.getElementById("speedChartTPE");
graphTPE();

//call PIE Graph
var speedChartPIE = document.getElementById("speedChartPIE");
graphPIE();


function graphBKE() {
	var ylabelBKE = "BKE";
	
	LabelPIE = "BKE(PIE)";
	dataPIE =  [60,40,35,95,90,100,105,65,180,55,65,90,85,100,125,90,170,95,105,65,45,75,160];
	borderColorPIE = 'rgba(82, 217, 129)';
	
	LabelWOOD = "BKE(W'lands)";
	dataWOOD = [90,70,95,85,95,105,120,100,180,155,175,95,185,150,165,105,90,100,85,105,65,90];
	borderColorWOOD = 'rgba(239, 61, 255)';
	
	LabelHT = "Heavy Traffic";
	dataHT = [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColorHT = 'rgba(255,255,128)';
	
	LabelOTR = "Other";
	dataOTR = [180,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColorOTR = 'rgba(152,16,19)';
	
	dataGraph(LabelPIE, dataPIE, borderColorPIE, 
					LabelWOOD, dataWOOD, borderColorWOOD, 
					LabelHT, dataHT, borderColorHT,
					LabelOTR, dataOTR, borderColorOTR)		
							
	drawGraph(speedChartBKE, ylabelBKE, dataFirst, dataSecond, dataThird, dataFour)	;
}

function graphAYE() {
	var ylabelAYE = "AYE";
	
	LabelMEC = "AYE(MCE)";
	dataMEC = [20, 20, 30,70,30,40,30, 45, 50,60,80,10,30,55,60,40,25, 25, 30];
	borderColorMEC = 'rgba(82, 217, 129)';
	
	LabelTuas = "AYE(Tuas)";
	dataTuas = [50,60,80,10,30,55,60,40,25, 25, 30, 20, 20, 30,70,30,40,30, 45];
	borderColorTuas = 'rgba(239, 61, 255)';
	
	LabelHT = "Heavy Traffic";
	dataHT = [180,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColorHT = 'rgba(255,255,128)';
	
	LabelOTR = "Other";
	dataOTR = [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColorOTR = 'rgba(152,16,19)';
	
	dataGraph(LabelMEC, dataMEC, borderColorMEC, 
					LabelTuas, dataTuas, borderColorTuas, 
					LabelHT, dataHT, borderColorHT,
					LabelOTR, dataOTR, borderColorOTR)	
	drawGraph(speedChartAYE, ylabelAYE, dataFirst, dataSecond, dataThird, dataFour)	
}

function graphKJE() {
	var ylabelKJE = "KJE";
	
	LabelBKE = "KJE(BKE)";
	dataBKE = [50, 70,100, 130, 100,80,40,70,95,120,170,195,150,80,150,120, 65, 45, 40];
	borderColorBKE = 'rgba(82, 217, 129)';
	
	LabelPIE = "KJE(PIE)";
	dataPIE = [130, 100,80,40,70,95,120,50,170, 70,100, 50, 110,80,40,105,85,55,120,65];
	borderColorPIE = 'rgba(239, 61, 255)';
	
	LabelHT = "Heavy Traffic";
	dataHT = [50,60,80,10,30,55,60,40,25, 25,90, 30, 20, 20, 30,70,30,40,30, 45 ];
	borderColorHT = 'rgba(255,255,128)';
	
	LabelOTR = "Other";
	dataOTR = [105,90,155,175,95,185,180,155,175,95,185,130, 100,80,40,70,95,120,170,195];
	borderColorOTR = 'rgba(152,16,19)';
	
	dataGraph(LabelBKE, dataBKE, borderColorBKE, 
			  LabelPIE, dataPIE, borderColorPIE, 
			  LabelHT, dataHT, borderColorHT,
		      LabelOTR, dataOTR, borderColorOTR)	
	drawGraph(speedChartKJE, ylabelKJE, dataFirst, dataSecond, dataThird, dataFour)	
}

function graphCTE() {
	var ylabelAYE = "CTE";
	
	Label1 = "CTE(AYE)";
	data1 = [20, 20, 30,70,30,40,30, 45, 50,60,80,10,30,55,60,40,25, 25, 30];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "CTE(SLE)";
	data2 = [50,60,80,10,30,55,60,40,25, 25, 30, 20, 20, 30,70,30,40,30, 45];
	borderColor2 = 'rgba(239, 61, 255)';
	
	Label3 = "Heavy Traffic";
	data3 = [180,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColor3 = 'rgba(255,255,128)';
	
	Label4 = "Other";
	data4 = [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColor4 = 'rgba(152,16,19)';
	
	dataGraph(Label1, data1, borderColor1, 
				Label2, data2, borderColor2, 
				Label3, data3, borderColor3,
				Label4, data4, borderColor4)	
	drawGraph(speedChartCTE, ylabelAYE, dataFirst, dataSecond, dataThird, dataFour)	
}

function graphSLE() {
	var ylabelBKE = "SLE";
	
	Label1 = "SLE(CTE)";
	data1 =  [90,85,100,125,90,170,95,105,65,45,75,160,60,40,35,95,90,100,105,65,180,55,65];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "SLE(BKE)";
	data2 = [95,185,150,165,105,90,100,85,105,45,65,90,90,70,95,85,95,105,120,100,180,155];
	borderColor2 = 'rgba(239, 61, 255)';
	
	Label3 = "Heavy Traffic";
	data3 = [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColor3 = 'rgba(255,255,128)';
	
	Label4 = "Other";
	data4 = [180,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColor4 = 'rgba(152,16,19)';
	
	dataGraph(Label1, data1, borderColor1, 
		Label2, data2, borderColor2, 
		Label3, data3, borderColor3,
		Label4, data4, borderColor4)		
							
	drawGraph(speedChartSLE, ylabelBKE, dataFirst, dataSecond, dataThird, dataFour)	;
}

function graphECP() {
	var ylabelECP = "ECP";
	
	Label1 = "ECP(Changi)";
	data1 =  [95,105,65,45,75,160,60,40,35,90,85,100,125,90,170,95,90,100,105,65,180,55,65];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "ECP(City)";
	data2 = [55,45,65,90,90,70,95,85,105,95,185,150,165,105,90,100,85,105,120,100,180,155];
	borderColor2 = 'rgba(239, 61, 255)';
	
	Label3 = "Heavy Traffic";
	data3 = [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColor3 = 'rgba(255,255,128)';
	
	Label4 = "Other";
	data4 = [130,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColor4 = 'rgba(152,16,19)';
	
	dataGraph(Label1, data1, borderColor1, 
		Label2, data2, borderColor2, 
		Label3, data3, borderColor3,
		Label4, data4, borderColor4)		
							
	drawGraph(speedChartECP, ylabelECP, dataFirst, dataSecond, dataThird, dataFour)	;
}

function graphTPE() {
	var ylabelTPE = "TPE";
	
	Label1 = "TPE(PIE)";
	data1 =  [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "TPE(SLE)";
	data2 = [180,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColor2 = 'rgba(239, 61, 255)';
	
	Label3 = "Heavy Traffic";
	data3 = [185,100,155,175,95,185,150,165,105,105,90,155,175,95,185,180,155,175,95];
	borderColor3 = 'rgba(255,255,128)';
	
	Label4 = "Other";
	data4 = [155,175,95,185,180,155,175,95,185,180,155,175,95,185,150,165,105,90];
	borderColor4 = 'rgba(152,16,19)';
	
	dataGraph(Label1, data1, borderColor1, 
		Label2, data2, borderColor2, 
		Label3, data3, borderColor3,
		Label4, data4, borderColor4)		
							
	drawGraph(speedChartTPE, ylabelTPE, dataFirst, dataSecond, dataThird, dataFour)	;
}


function graphPIE() {
	var ylabelCTE = "PIE";
	
	Label1 = "PIE(Changi)";
	data1 = [120, 50, 80,120,75,100,150, 75, 40,70,100,95,65,85,75,90,45, 65, 45];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "PIE(Tuas)";
	data2 = [70,100,95,65,85,75,90,45, 65, 45, 120, 50, 80, 120, 75, 100, 150, 75];
	borderColor2 = 'rgba(239, 61, 255)';
	
	Label3 = " Heavy Traffic";
	data3 = [180,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColor3 = 'rgba(255,255,128)';
	
	Label4 = " Other";
	data4 = [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColor4 = 'rgba(152,16,19)';
	
	dataGraph(Label1, data1, borderColor1, 
				Label2, data2, borderColor2, 
				Label3, data3, borderColor3,
				Label4, data4, borderColor4)	
	drawGraph(speedChartPIE, ylabelCTE, dataFirst, dataSecond, dataThird, dataFour)	
}


function dataGraph(firstLabel, firstData, firstColor, 
						secondLabel, secondData, secondColor, 
						thirdLabel, thirdData, thirdColor,
						fourthLabel, fourthData, fourthColor){								
	dataFirst = {
		label: firstLabel,
		data: firstData,
		lineTension: 0,
		fill: false,
		borderColor: firstColor,
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

	dataSecond = {
		label: secondLabel,
		data: secondData,
		lineTension: 0,
		fill: false,
		borderColor: secondColor,
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
	
	dataThird = {
		label: thirdLabel,
	//	data: thirdData,
		lineTension: 0,
		fill: false,
	//	borderColor: thirdColor,
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
	dataFour = {
		label: fourthLabel,
	//	data: fourthData,
		lineTension: 0,
		fill: false,
	//	borderColor: fourthColor,
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
}
  
function drawGraph(dataChart,ylabel, dataFirst, dataSecond, dataThird, dataFour){
	var speedDataXLabel = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
	var speedData = {
		labels:speedDataXLabel,
		datasets: [dataFirst, dataSecond, dataThird, dataFour],
	};
	
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
				},
				gridLines:{
					display:false,
					color:"gray"
					//lineWidth: 0
				},
				bezierCurve : true
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
				  min:0,
				  beginAtZero: true,
                  //steps: 50,
                  stepValue: 50,
                  max: 200
				}, 
				gridLines: {
					display:false,
					//lineWidth: 0
				},
				
				scaleLabel: { // This is for xscale title
				display: true,
				labelString: ylabel,
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
		  boxWidth: 1,
		  fontColor: '#ffffff'
		}
	  }
	};

var lineChart = new Chart(dataChart, {
  type: 'line',
  data: speedData,
  options: chartOptions
});

}

}


function speedGraph2() {
//call BKE Graph
var speedChartBKE = document.getElementById("speedChartBKE");
graphBKE();


//call AYE Graph
var speedChartAYE = document.getElementById("speedChartAYE");
graphAYE();

//call KJE Graph
var speedChartKJE = document.getElementById("speedChartKJE");
graphKJE();

//call CTE Graph
var speedChartCTE = document.getElementById("speedChartCTE");
graphCTE();

//call SLE Graph
var speedChartSLE = document.getElementById("speedChartSLE");
graphSLE();

//call ECP Graph
var speedChartECP = document.getElementById("speedChartECP");
graphECP();

//call TPE Graph
var speedChartTPE = document.getElementById("speedChartTPE");
graphTPE();

//call PIE Graph
var speedChartPIE = document.getElementById("speedChartPIE");
graphPIE();


function graphBKE() {
	var ylabelBKE = "BKE";
	
	LabelPIE = "BKE(PIE)";
	dataPIE =  [90,85,100,125,90,170,95,105,65,45,70,40,35,95,90,100,105,65,180,55,65,75,160];
	borderColorPIE = 'rgba(82, 217, 129)';
	
	LabelWOOD = "BKE(W'lands)";
	dataWOOD = [180,155,175,90,70,95,85,95,105,120,105,90,100,85,105,65,90,100,95,185,150,165];
	borderColorWOOD = 'rgba(239, 61, 255)';
	
	LabelHT = "Heavy Traffic";
	dataHT = [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColorHT = 'rgba(255,255,128)';
	
	LabelOTR = "Other";
	dataOTR = [180,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColorOTR = 'rgba(152,16,19)';
	
	dataGraph(LabelPIE, dataPIE, borderColorPIE, 
					LabelWOOD, dataWOOD, borderColorWOOD, 
					LabelHT, dataHT, borderColorHT,
					LabelOTR, dataOTR, borderColorOTR)		
							
	drawGraph(speedChartBKE, ylabelBKE, dataFirst, dataSecond, dataThird, dataFour)	;
}

function graphAYE() {
	var ylabelAYE = "AYE";
	
	LabelMEC = "AYE(MCE)";
	dataMEC = [155,175,95,185,150,165,105,90,155,175,60,80,10,30,55,60,40,25, 25, 30];
	borderColorMEC = 'rgba(82, 217, 129)';
	
	LabelTuas = "AYE(Tuas)";
	dataTuas = [50,60,80,10,30,55,60,155,175,95,185,150,165,105,90,155,175,30, 45];
	borderColorTuas = 'rgba(239, 61, 255)';
	
	LabelHT = "Heavy Traffic";
	dataHT = [180,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColorHT = 'rgba(255,255,128)';
	
	LabelOTR = "Other";
	dataOTR = [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColorOTR = 'rgba(152,16,19)';
	
	dataGraph(LabelMEC, dataMEC, borderColorMEC, 
					LabelTuas, dataTuas, borderColorTuas, 
					LabelHT, dataHT, borderColorHT,
					LabelOTR, dataOTR, borderColorOTR)	
	drawGraph(speedChartAYE, ylabelAYE, dataFirst, dataSecond, dataThird, dataFour)	
}

function graphKJE() {
	var ylabelKJE = "KJE";
	
	LabelBKE = "KJE(BKE)";
	dataBKE = [170, 70,100, 50, 110,80,40,105,130, 100,80,40,70,95,120,50,,85,55,120,65,98];
	borderColorBKE = 'rgba(82, 217, 129)';
	
	LabelPIE = "KJE(PIE)";
	dataPIE = [50, 130, 100,80,40,70,95,120,170, 70,100,25,90, 30, 20, 20,195,150,125,45,40];
	borderColorPIE = 'rgba(239, 61, 255)';
	
	LabelHT = "Heavy Traffic";
	dataHT = [50,60,80,10,30,55,60,40,25, 25,90, 30, 20, 20, 30,70,30,40,30, 45 ];
	borderColorHT = 'rgba(255,255,128)';
	
	LabelOTR = "Other";
	dataOTR = [105,90,155,175,95,185,180,155,175,95,185,130, 100,80,40,70,95,120,170,195];
	borderColorOTR = 'rgba(152,16,19)';
	
	dataGraph(LabelBKE, dataBKE, borderColorBKE, 
			  LabelPIE, dataPIE, borderColorPIE, 
			  LabelHT, dataHT, borderColorHT,
		      LabelOTR, dataOTR, borderColorOTR)	
	drawGraph(speedChartKJE, ylabelKJE, dataFirst, dataSecond, dataThird, dataFour)	
}

function graphCTE() {
	var ylabelAYE = "CTE";
	
	Label1 = "CTE(AYE)";
	data1 = [50,60,30,70,30,40,30, 45, 50, 30, 20, 20, 30,70,30,40,30, 75,45];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "CTE(SLE)";
	data2 = [20, 20, 60,80,80,10,30,55,60,40,25, 25,10,30,55,60,40,25, 25, 30];
	borderColor2 = 'rgba(239, 61, 255)';
	
	Label3 = "Heavy Traffic";
	data3 = [180,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColor3 = 'rgba(255,255,128)';
	
	Label4 = "Other";
	data4 = [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColor4 = 'rgba(152,16,19)';
	
	dataGraph(Label1, data1, borderColor1, 
				Label2, data2, borderColor2, 
				Label3, data3, borderColor3,
				Label4, data4, borderColor4)	
	drawGraph(speedChartCTE, ylabelAYE, dataFirst, dataSecond, dataThird, dataFour)	
}

function graphSLE() {
	var ylabelBKE = "SLE";
	
	Label1 = "SLE(CTE)";
	data1 =  [95,90,90,70,95,85,95,105,120,100,180,155,150,165,105,90,100,85,105,45,65,98];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "SLE(BKE)";
	data2 = [90,85,100,40,35,95,90,100,105,65,180,55,65,125,90,170,95,105,65,45,75,160,60];
	borderColor2 = 'rgba(239, 61, 255)';
	
	Label3 = "Heavy Traffic";
	data3 = [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColor3 = 'rgba(255,255,128)';
	
	Label4 = "Other";
	data4 = [180,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColor4 = 'rgba(152,16,19)';
	
	dataGraph(Label1, data1, borderColor1, 
		Label2, data2, borderColor2, 
		Label3, data3, borderColor3,
		Label4, data4, borderColor4)		
							
	drawGraph(speedChartSLE, ylabelBKE, dataFirst, dataSecond, dataThird, dataFour)	;
}

function graphECP() {
	var ylabelECP = "ECP";
	
	Label1 = "ECP(Changi)";
	data1 =  [165,105,90,155,175,95,185,180,155,105,90,100,85,105,120,100,180,155,100];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "ECP(City)";
	data2 = [175,95,185,100,155,175,95,185,150,165,105,170,95,90,100,105,65,180,55,65];
	borderColor2 = 'rgba(239, 61, 255)';
	
	Label3 = "Heavy Traffic";
	data3 = [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColor3 = 'rgba(255,255,128)';
	
	Label4 = "Other";
	data4 = [130,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColor4 = 'rgba(152,16,19)';
	
	dataGraph(Label1, data1, borderColor1, 
		Label2, data2, borderColor2, 
		Label3, data3, borderColor3,
		Label4, data4, borderColor4)		
							
	drawGraph(speedChartECP, ylabelECP, dataFirst, dataSecond, dataThird, dataFour)	;
}

function graphTPE() {
	var ylabelTPE = "TPE";
	
	Label1 = "TPE(PIE)";
	data1 =  [105,90,155,175,95,185,180,155,175,95,185,175,95,185,180,155,175,95,185];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "TPE(SLE)";
	data2 = [185,100,155,175,95,185,150,165,120,100,155,175,100,95,185,150,165,105];
	borderColor2 = 'rgba(239, 61, 255)';
	
	Label3 = "Heavy Traffic";
	data3 = [185,100,155,175,95,185,150,165,105,105,90,155,175,95,185,180,155,175,95];
	borderColor3 = 'rgba(255,255,128)';
	
	Label4 = "Other";
	data4 = [155,175,95,185,180,155,175,95,185,180,155,175,95,185,150,165,105,90];
	borderColor4 = 'rgba(152,16,19)';
	
	dataGraph(Label1, data1, borderColor1, 
		Label2, data2, borderColor2, 
		Label3, data3, borderColor3,
		Label4, data4, borderColor4)		
							
	drawGraph(speedChartTPE, ylabelTPE, dataFirst, dataSecond, dataThird, dataFour)	;
}


function graphPIE() {
	var ylabelCTE = "PIE";
	
	Label1 = "PIE(Changi)";
	data1 = [70,100,95,65,85,75,90,45, 65, 45, 120, 50, 80, 120, 75, 100, 150, 75];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "PIE(Tuas)";
	data2 = [120, 50, 80,120,75,100,150, 75, 40,70,100,95,65,85,75,90,45, 65, 45];
	borderColor2 = 'rgba(239, 61, 255)';
	
	Label3 = " Heavy Traffic";
	data3 = [180,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColor3 = 'rgba(255,255,128)';
	
	Label4 = " Other";
	data4 = [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColor4 = 'rgba(152,16,19)';
	
	dataGraph(Label1, data1, borderColor1, 
				Label2, data2, borderColor2, 
				Label3, data3, borderColor3,
				Label4, data4, borderColor4)	
	drawGraph(speedChartPIE, ylabelCTE, dataFirst, dataSecond, dataThird, dataFour)	
}


function dataGraph(firstLabel, firstData, firstColor, 
						secondLabel, secondData, secondColor, 
						thirdLabel, thirdData, thirdColor,
						fourthLabel, fourthData, fourthColor){								
	dataFirst = {
		label: firstLabel,
		data: firstData,
		lineTension: 0,
		fill: false,
		borderColor: firstColor,
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

	dataSecond = {
		label: secondLabel,
		data: secondData,
		lineTension: 0,
		fill: false,
		borderColor: secondColor,
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
	
	dataThird = {
		label: thirdLabel,
	//	data: thirdData,
		lineTension: 0,
		fill: false,
	//	borderColor: thirdColor,
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
	dataFour = {
		label: fourthLabel,
	//	data: fourthData,
		lineTension: 0,
		fill: false,
	//	borderColor: fourthColor,
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
}
  
function drawGraph(dataChart,ylabel, dataFirst, dataSecond, dataThird, dataFour){
	var speedDataXLabel = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
	var speedData = {
		labels:speedDataXLabel,
		datasets: [dataFirst, dataSecond, dataThird, dataFour],
	};
	
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
				},
				gridLines:{
					display:false,
					color:"gray"
					//lineWidth: 0
				},
				bezierCurve : true
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
				  min:0,
				  beginAtZero: true,
                  //steps: 50,
                  stepValue: 50,
                  max: 200
				}, 
				gridLines: {
					display:false,
					//lineWidth: 0
				},
				
				scaleLabel: { // This is for xscale title
				display: true,
				labelString: ylabel,
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
		  boxWidth: 1,
		  fontColor: '#ffffff'
		}
	  }
	};

var lineChart = new Chart(dataChart, {
  type: 'line',
  data: speedData,
  options: chartOptions
});

}

}




