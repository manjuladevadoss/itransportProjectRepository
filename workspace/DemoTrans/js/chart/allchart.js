window.onload = function () {
// line chart
var data2 = [20, 40, 20, 50, 30, 30, 70];
var labels =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];

    var ctx = document.getElementById("myChart").getContext('2d');
	var gradient = ctx.createLinearGradient(0, 0, 0, 400);
    gradient.addColorStop(0, 'rgba(216,90,172, 1)');   
    gradient.addColorStop(1, 'rgba(97,68,117, 1)');
    console.log("load the chart 1");
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {                        
			labels: labels,
            datasets: [{
				label: 'Overdue Alarms',
                data: data2,
				borderColor: 'rgba(216,90,172, 1)',
                //backgroundColor: 'rgba(116,71,120, 0.8)'
				backgroundColor: gradient
            }]
        },
		options: {
			// responsive: true, tooltips: true,
		   legend: {
			display: true,
				//top label name
			labels: {
					fontColor: 'rgb(216,90,172)',
			}
		},
			
			
		scales: {			
			yAxes: [{
				ticks: {
					beginAtZero: false
				},
				gridLines: {
					display:false
				}					
			}],
			xAxes: [{
				gridLines: {
					display:false
				}
			}]
				
        }
    }
		
    });
    
    //bar chart
	// Chart.defaults.global.defaultFontColor = 'red'; //x-axis and y-axis font color change
	var data1 = [20, 10, 30, 20, 20, 30, 50];
    var labels1 =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];
    console.log("load the chart 2");
    showGraph(data1, labels1);
     
}
/*
var myVar1 = setInterval(graph1(), 3000);
var myVar2 = setInterval(graph2(), 6000);
var myVar3 = setInterval(graph3(), 9000);

function graph1(){
	var data2 = [10, 12, 30, 15, 17, 10, 18];
	var labels2 =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];
	console.log("graph1");
	showGraph(data2, labels2);
}    
function graph2(){
	var  data3 = [30, 12, 20, 11, 12, 10, 12];
	var labels3 =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];
	console.log("graph3");
	showGraph(data3, labels3);
}
function graph3(){
	var  data4 = [15, 10, 24, 15, 21, 10, 20];
	var labels4 =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];
	console.log("graph4");
	showGraph(data4, labels4);
}
*/
function showGraph(data1, labels1) {
	Chart.defaults.global.defaultFontSize = 10; //x-axis and y-axis font size change
	var ctx1 = document.getElementById("myBarChart").getContext('2d');
	var gradient1 = ctx1.createLinearGradient(0, 0, 0, 400);
    gradient1.addColorStop(0, 'rgba(193,172,228,1)');   
    gradient1.addColorStop(1, 'rgba(159,124,242,0)');
    var myBarChart = new Chart(ctx1, {
        // type of chart
		type: 'bar',
        
		// column and row values and bar colors
		data: {                        
			labels: labels1,
            datasets: [{
				label: 'Total Work orders',
                data: data1,
				borderColor: 'rgba(193,172,228, 1)',
                //backgroundColor: 'rgba(116,71,120, 0.8)'
				backgroundColor: gradient1
            }]
        },
		//Change the bar width size
		options: {
			// responsive: true, tooltips: true,
		    legend: {
				display: true,
				//top label name
				labels: {
					fontColor: 'rgb(159,124,242)',
				}
			},
			animation:	{
				duration: 5000,
				easing: 'linear'
			},
			
			scales: {			
				yAxes: [{
					ticks: {
						beginAtZero: true
					},
					//remove gridlines
					gridLines: {
						display:false
					}					
				}],
				xAxes: [{
					// Change bar char width size
					barPercentage: 0.3,
					gridLines: {
						display:false
					}
				}]
        }
    }
    });  
}

