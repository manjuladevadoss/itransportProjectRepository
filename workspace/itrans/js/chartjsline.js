
var dataFirst, dataSecond, dataThird, dataFour,dataFour;
Chart.defaults.global.defaultFontColor = '#ffffff';
Chart.defaults.global.defaultFontStyle = 'normal';
Chart.defaults.global.defaultFontSize = 9;
Chart.defaults.global.defaultFontFamily = '"Roboto", Helvetica, sans-serif';

//BKE Graph
var speedChartBKE = document.getElementById("speedChartBKE");

//AYE Graph
var speedChartAYE = document.getElementById("speedChartAYE");

//KJE Graph
var speedChartKJE = document.getElementById("speedChartKJE");

//CTE Graph
var speedChartCTE = document.getElementById("speedChartCTE");

//SLE Graph
var speedChartSLE = document.getElementById("speedChartSLE");

//ECP Graph
var speedChartECP = document.getElementById("speedChartECP");

//TPE Graph
var speedChartTPE = document.getElementById("speedChartTPE");

//PIE Graph
var speedChartPIE = document.getElementById("speedChartPIE");

speedGraph1();


function speedGraph1() {

//call BKE Graph
graphBKE();

//call AYE Graph
graphAYE();

//call KJE Graph
graphKJE();

//call CTE Graph
graphCTE();

//call SLE Graph
graphSLE();

//call ECP Graph
graphECP();

//call TPE Graph
graphTPE();

//call PIE Graph
graphPIE();

}

function graphBKE() {
	var ylabelBKE = "BKE";
	
	LabelPIE = "BKE(PIE)";
	dataPIE =  [60,64,68,70,65,70,75,79,75,70,65,40,65,70,60,65,35,75,65,80,95,80,70,60,64,68];
	borderColorPIE = 'rgba(82, 217, 129)';
	
	LabelWOOD = "BKE(W'lands)";
	dataWOOD = [80,85,90,84,95,80,75,70,64,95,86,78,95,84,75,68,64,50,60,48,52,54,56,60,64,68];
	borderColorWOOD = 'rgba(239, 61, 255)';
	
	LabelHT = "Heavy Traffic";
	dataHT = [105,90,155,175,95,185,180,155,175,95,185,100,155,175,95,185,150,165,105];
	borderColorHT = 'rgba(255,255,128)';
	
	LabelOTR = "Other";
	dataOTR = [180,155,175,95,185,150,165,105,90,155,175,95,185,180,155,175,95,185];
	borderColorOTR = 'rgba(152,16,19)';

	historyLable = "History";
	historydata = [30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30];
	historyBorderColor = 'rgba(195,195,195)';
	
/*	dataGraph1(LabelPIE, dataPIE, borderColorPIE, 
					LabelWOOD, dataWOOD, borderColorWOOD, 
					LabelHT, dataHT, borderColorHT,
					LabelOTR, dataOTR, borderColorOTR,
					historyLable,historydata,historyBorderColor)	*/	
							
	//drawGraph1(speedChartBKE, ylabelBKE, dataFirst, dataSecond, dataThird, dataFour,dataFive)	;

		dataGraph(LabelPIE, dataPIE, borderColorPIE, 
					LabelWOOD, dataWOOD, borderColorWOOD, 
					LabelHT, dataHT, borderColorHT,
					LabelOTR, dataOTR, borderColorOTR,
					)	
							
	drawGraph(speedChartBKE, ylabelBKE, dataFirst, dataSecond, dataThird, dataFour)	
}

function graphAYE() {
	var ylabelAYE = "AYE";
	
	LabelMEC = "AYE(MCE)";
	dataMEC = [30,64,68,70,55,65,75,85,80,60,45,55,75,70,80,95,84,77,68,55,75,75,90,85,97,60];
	borderColorMEC = 'rgba(82, 217, 129)';
	
	LabelTuas = "AYE(Tuas)";
	dataTuas = [70,80,95,84,77,68,55,75,75,90,85,97,60,30,64,68,70,55,65,75,85,80,60,45,55,75];
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
	dataBKE = [20,30,43,55,65,75,80,85,80,60,45,55,75,70,80,45,50,65,78,85,75,75,90,85,97,60]
	borderColorBKE = 'rgba(82, 217, 129)';
	
	LabelPIE = "KJE(PIE)";
	dataPIE = [80,75,78,70,65,65,75,85,80,60,45,35,35,45,55,65,84,77,68,55,75,75,90,85,97,60];
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
	data1 =  [70,80,95,84,77,68,85,97,100,70,65,55,65,75,80,95,70,55,65,75,85,80,60,45,55,75];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "CTE(SLE)";
	data2 =  [40,30,20,30,30,40,55,75,75,90,85,97,60,75,64,75,90,85,95,75,85,80,60,95,68,78,47];
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
	data1 =  [25,30,35,38,45,50,45,40,30,58,65,55,65,50,40,30,25,55,65,68,50,40,48,45,55,65];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "SLE(BKE)";
	data2 = [50,40,30,25,55,65,68,50,40,48,45,55,65,35,25,35,40,45,55,60,30,30,58,65,68,60,25];
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
	data1 =  [30,40,60,70,75,68,68,45,60,75,85,65,68,35,34,35,40,45,55,70,65,60,55,65,68,60,25];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "ECP(City)";
	data2 = [50,40,30,25,55,65,68,50,40,48,45,55,65,35,25,35,40,45,55,60,30,30,58,65,68,60,25];
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
	data1 =  [62,72,82,85,80,75,95,80,85,65,55,68,75,65,85,74,85,75,85,65,70,75,80];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "TPE(SLE)";
	data2 = [30,35,40,45,50,35,45,65,25,35,64,4,35,40,45,65,38,40,50,55,45,40,35,49];
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
	data1 =  [74,85,75,85,65,70,62,72,82,85,80,75,65,85,75,80,95,80,85,65,55,68,75];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "PIE(Tuas)";
	data2 = [65,25,35,64,4,35,40,35,45,40,50,55,45,40,35,45,65,38,30,35,40,45,50,49];
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

speedLkLrInterval = setInterval(graphSLE1, 5000);	
speedLkLrInterval = setInterval(graphSLE2, 10000);
speedLkLrInterval = setInterval(graphSLE, 15000);

//speedLkLrInterval1 = setInterval(speedGraph3, 8000);	

function graphSLE1() {
	var ylabelBKE = "SLE";

	Label1 = "SLE(CTE)";
	data1 =   [40,55,35,38,50,55,50,45,35,48,55,65,75,50,58,55,45,65,40,60,40,45,55,65,68,50];
	borderColor1 = 'rgba(82, 217, 129)';
		
	Label2 = "SLE(BKE)";
	data2 =  [60,50,40,35,45,55,58,60,70,58,45,55,65,75,85,90,95,85,80,74,68,70,35,45,60,65,75];
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

function graphSLE2() {
	var ylabelBKE = "SLE";

	Label1 = "SLE(CTE)";
	data1 =   [60,65,75,70,65,60,45,55,55,60,75,95,85,90,85,75,55,95,45,50,70,65,75,95,88,60];
	borderColor1 = 'rgba(82, 217, 129)';
		
	Label2 = "SLE(BKE)";
	data2 =  [50,55,45,65,85,45,65,70,78,60,75,65,80,65,95,75,55,65,70,64,78,50,45,65,80,65,85];
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

speedLkLrIntervalAYE1 = setInterval(graphAYE1, 7000);	
speedLkLrIntervalAYE2 = setInterval(graphAYE2, 12000);
speedLkLrIntervalAYE3 = setInterval(graphAYE, 17000);

function graphAYE1() {
	var ylabelAYE = "AYE";

	LabelMEC = "AYE(MCE)";
	dataMEC =  [30,64,68,70,55,65,75,85,80,60,45,55,75,70,80,90,85,97,60,95,84,77,68,55,75,75];
	borderColorMEC = 'rgba(82, 217, 129)';
	
	LabelTuas = "AYE(Tuas)";
	dataTuas =[70,80,95,84,77,68,55,75,75,90,85,97,60,30,64,68,75,85,80,60,45,55,75,70,55,65];
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

function graphAYE2() {
	var ylabelAYE = "AYE";

	LabelMEC = "AYE(MCE)";
	dataMEC =  [45,74,78,80,65,75,85,95,90,75,65,85,75,77,85,85,75,65,75,85,74,67,48,95,45,35];
	borderColorMEC = 'rgba(82, 217, 129)';
	
	LabelTuas = "AYE(Tuas)";
	dataTuas =[85,65,75,74,75,88,65,75,75,95,85,95,63,35,54,68,75,65,80,70,55,50,75,70,75,65];
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


speedLkLrIntervalAYE1 = setInterval(graphPIE1, 9000);	
speedLkLrIntervalAYE2 = setInterval(graphPIE2, 14000);
speedLkLrIntervalAYE3 = setInterval(graphPIE, 19000);

function graphPIE1() {
	var ylabelCTE = "PIE";
	
	Label1 = "PIE(Changi)";
	data1 =  [65,75,65,75,55,60,62,78,72,98,70,65,55,85,75,85,90,85,80,67,59,69,80];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "PIE(Tuas)";
	data2 = [75,35,55,54,54,85,48,45,58,50,60,65,55,48,39,49,60,39,38,45,49,45,58,49];
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

function graphPIE2() {
	var ylabelCTE = "PIE";
	
	Label1 = "PIE(Changi)";
	data1 =  [85,95,95,85,80,70,72,68,82,88,80,95,55,85,75,94,90,80,85,68,54,69,82];
	borderColor1 = 'rgba(82, 217, 129)';
	
	Label2 = "PIE(Tuas)";
	data2 = [79,39,59,52,57,89,42,47,60,59,79,85,90,78,65,50,80,40,65,84,65,75,68,60];
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

speedLkLrIntervalCTE1 = setInterval(graphCTE1, 11000);	
speedLkLrIntervalCTE2 = setInterval(graphCTE2, 16000);
speedLkLrIntervalCTE3 = setInterval(graphCTE, 21000);
	
function graphCTE1() {
	var ylabelAYE = "CTE";
		
	Label1 = "CTE(AYE)";
	data1 =  [80,90,45,84,77,74,95,75,85,80,75,65,65,65,75,79,85,65,47,60,70,77,75,45,74,60,85,80,90,65,47,56,65,85,75,45,80,65];
	borderColor1 = 'rgba(82, 217, 129)';
			
	Label2 = "CTE(SLE)";
	data2 =  [52,40,60,75,50,75,65,45,35,50,65,77,50,35,75,70,65,70,40,85,48,68,57,45,64,75,80,95,85,74,64,60,74,60,74,84,64,70];
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

function graphCTE2() {
	var ylabelAYE = "CTE";
		
	Label1 = "CTE(AYE)";
	data1 =  [85,40,45,74,67,44,85,65,75,82,65,45,75,65,60,89,65,60,77,90,80,67,85,65,44,50,65,40,70,65,49,50,66,85,75,40,75,70];
	borderColor1 = 'rgba(82, 217, 129)';
			
	Label2 = "CTE(SLE)";
	data2 =  [60,50,40,75,55,70,60,47,30,58,66,77,56,38,74,78,66,72,47,86,48,66,58,49,64,78,82,74,55,64,60,65,77,66,73,80,69,73];
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
	var speedDataXLabel = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30];
	//var speedDataXLabel = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
	//var speedDataXLabel = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
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
					beginAtZero: true, 
					min:0,
					max: 30,
					stepSize: 50,					
                    //autoSkip: true,
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
				  beginAtZero: true, 
				  min:0,
				  max: 100,
				  stepSize: 50,
				  autoSkip: true
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

function dataGraph1(firstLabel, firstData, firstColor, 
	secondLabel, secondData, secondColor, 
	thirdLabel, thirdData, thirdColor,
	fourthLabel, fourthData, fourthColor,
	hisLabel, hisData, hisColor){	

		dataFive= {
			label: "",  /*hisLabel,*/
			data: hisData,
			lineTension: 0,
			fill: false,
			borderColor: hisColor,
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



function drawGraph1(dataChart,ylabel, dataFirst, dataSecond, dataThird, dataFour,dataFive){
	var speedDataXLabel = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
	var speedData = {
		labels:speedDataXLabel,
		datasets: [dataFirst, dataSecond, dataThird, dataFour,dataFive],
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
				  beginAtZero: true, 
				  min:0,
				  max: 100,
				  stepSize: 50,
				 // autoSkip: false
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










