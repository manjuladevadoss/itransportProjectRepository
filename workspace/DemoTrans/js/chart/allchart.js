window.onload = function () {
// Bar chart for work order 
	Chart.defaults.global.defaultFontSize = 10; //x-axis and y-axis font size change
	var ctx1 = document.getElementById("myChart").getContext('2d');
	var gradient1 = ctx1.createLinearGradient(0, 0, 0, 400);
    gradient1.addColorStop(0, 'rgba(193,172,228,1)');   
    gradient1.addColorStop(1, 'rgba(159,124,242,0)');
    var  data1 = [15, 10, 24, 15, 21, 10, 20];
    var labels1 =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];
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
    
    //Line chart for technical alarm
	// Chart.defaults.global.defaultFontColor = 'red'; //x-axis and y-axis font color change
    var ctx2 = document.getElementById("myBarChart");
    var  data = [15, 10, 24, 15, 21, 10, 20];
    var labels =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];
    var myLineChart = new Chart(ctx2, {
          type: 'line',
          data: {                        
  			labels: labels,
              datasets: [{
  				label: 'Alarms',
                  data: data,
  				borderColor: 'rgba(193,172,228, 1)',
                  //backgroundColor: 'rgba(116,71,120, 0.8)'
  				backgroundColor: 'rgba(216,90,172, 1)'
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
  		animation:	{
  				duration: 1000,
  				easing: 'linear'
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
}

//Line charts are called based on the time interval
var myVar = setInterval(showGraph1, 5000);
var myVar = setInterval(showGraph2, 10000);
var myVar = setInterval(showGraph3, 15000);
function showGraph1() {
  var ctx = document.getElementById("myBarChart");
  var data = [10, 15, 13, 18, 12, 9, 5];
  var labels =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];
  var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {                        
			labels: labels,
            datasets: [{
				label: 'Alarms',
                data: data,
				borderColor: 'rgba(193,172,228, 1)',
                //backgroundColor: 'rgba(116,71,120, 0.8)'
				backgroundColor: 'rgba(216,90,172, 1)'
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
		animation:	{
				duration: 1000,
				easing: 'linear'
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
}
function showGraph2() { 
  var ctx = document.getElementById("myBarChart");
  var data = [20, 40, 20, 50, 30, 30, 70];
  var labels =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];
  var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {                        
			labels: labels,
            datasets: [{
				label: 'Alarms',
                data: data,
				borderColor: 'rgba(193,172,228, 1)',
                //backgroundColor: 'rgba(116,71,120, 0.8)'
				backgroundColor: 'rgba(216,90,172, 1)'
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
		animation:	{
				duration: 1000,
				easing: 'linear'
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
}
function showGraph3() { 
  var ctx = document.getElementById("myBarChart");
  var  data = [15, 10, 24, 15, 21, 10, 20];
  var labels =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];
  var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {                        
			labels: labels,
            datasets: [{
				label: 'Alarms',
                data: data,
				borderColor: 'rgba(193,172,228, 1)',
                //backgroundColor: 'rgba(116,71,120, 0.8)'
				backgroundColor: 'rgba(216,90,172, 1)'
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
			animation:	{
				duration: 1000,
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

//Bar charts are called based on the time interval
var myVar = setInterval(showBarGraph1, 5500);
var myVar = setInterval(showBarGraph2, 10500);

function showBarGraph1() {
	// Bar chart for work order 
	Chart.defaults.global.defaultFontSize = 10; //x-axis and y-axis font size change
	var ctx1 = document.getElementById("myChart").getContext('2d');
	var gradient1 = ctx1.createLinearGradient(0, 0, 0, 400);
    gradient1.addColorStop(0, 'rgba(193,172,228,1)');   
    gradient1.addColorStop(1, 'rgba(159,124,242,0)');
    var  data1 = [10, 12, 5, 15, 8, 14, 10];
    var labels1 =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];
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
				duration: 2000,
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

function showBarGraph2(){
Chart.defaults.global.defaultFontSize = 10; //x-axis and y-axis font size change
	var ctx1 = document.getElementById("myChart").getContext('2d');
	var gradient1 = ctx1.createLinearGradient(0, 0, 0, 400);
    gradient1.addColorStop(0, 'rgba(193,172,228,1)');   
    gradient1.addColorStop(1, 'rgba(159,124,242,0)');
    var  data1 = [15, 10, 24, 15, 21, 10, 20];
    var labels1 =  ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];
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
				duration: 2000,
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






/*function showGraph(data1, labels1) {
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
}*/

