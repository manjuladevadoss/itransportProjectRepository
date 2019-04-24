
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>technicalalarm Chart</title>
</head>
<style>

</style>

<script>
window.onload = function () {

var data2 = [20, 40, 20, 50, 30, 30, 70];
var labels =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];

    var ctx = document.getElementById("myChart").getContext('2d');
	var gradient = ctx.createLinearGradient(0, 0, 0, 400);
    gradient.addColorStop(0, 'rgba(216,90,172, 1)');   
    gradient.addColorStop(1, 'rgba(97,68,117, 1)');
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
	
	
	
	//bar Chart creation
	
	// Chart.defaults.global.defaultFontColor = 'red'; //x-axis and y-axis font color change
	Chart.defaults.global.defaultFontSize = 10; //x-axis and y-axis font size change
	var data1 = [20, 10, 30, 20, 20, 30, 50];
    var labels1 =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];

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
 
//map border 216 90 172
//map background 116 71 120
</script>


<body>
<table>
	<tr> 
		<td> 
	  
        <canvas id="myChart" style="width:90%; height:100%;"></canvas>
   
		</td>
		</tr> <tr>
		<td> 
	   
        <canvas id="myBarChart" style="width:90%; height:100%;"></canvas>
   
		</td>

	</tr>	
</table>


</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- <script src="./myChart.js"></script> -->

</html>
