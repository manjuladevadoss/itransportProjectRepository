   window.onload = function () {

//bar chart work order
loadbarchart();
loadlinechart();

function loadbarchart(){
  var barCtx = document.getElementById("workorderbarchart");
  var wobarChart = new Chart(barCtx, {
    type: 'bar',
    data: {
      labels: ["1.00", "2.00", "3.00", "4.00", "5.00", "6.00", "7.00", "8.00","9.00", "10.00", "11.00", "12.00"],
      datasets: [{
        //label: '# of Tomatoes',
        data: [2, 3, 4, 3, 5, 2, 4, 1, 2, 4, 2,3],
        backgroundColor: [
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD'
        ],
        borderColor: [
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
         '#D0A2FD',
          '#D0A2FD',
         '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD',
          '#D0A2FD'
        ],
        borderWidth: 1
      }]
    },
    options: {
      responsive: false,
      scales: {
        xAxes: [{
           ticks: {
            maxRotation: 0,
            minRotation: 0,
            fontColor: '#ffffff',
            lineWidth: 2,
            fontSize: 10
          },
          gridLines: {
                  display: false
           }
        }],
        yAxes: [{
         ticks: {
            beginAtZero: true,
            fontColor: '#ffffff',
            lineWidth: 2,
            fontSize: 10
          },
          gridLines: {
                  display: false
          }
        }]
      }, 
      legend: {
              display: false,
              labels: {
                  fontColor: '#ffffff'
              }
          },
      title: {
              display: true,
              text: 'Work Order',
              fontColor: '#ffffff'
          }
    }
  });
}
	
//setInterval(function() {updateBarChart()}, 4000);
//end of bar chart

//start linechart technical work alarm
function loadlinechart(){
  var lineCtx = document.getElementById("alarmlinechart");
  var alalineChart = new Chart(lineCtx, {
    type: 'line',
    data: {
      labels: ["1.00", "2.00", "3.00", "4.00", "5.00", "6.00", "7.00", "8.00", "10.00", "11.00", "12.00"],
  
      datasets: [{
        //label: '# of Tomatoes',
       
        borderColor: "#80b6f4",
              pointBorderColor: "#D0A2FD",
              pointBackgroundColor: "#D0A2FD",
              //pointHoverBackgroundColor: "#80b6f4",
              //pointHoverBorderColor: "#80b6f4",
              pointBorderWidth: 1,
              pointHoverRadius: 1,
            //  pointHoverBorderWidth: 1,
            //  pointRadius: 3,
              fill: false,
        borderWidth: 2,
        data: [7,2,6,7,3,9,7,6,4,5,3,6],
      }]
    },
    options: {
      responsive: false,
      scales: {
        xAxes: [{
           ticks: {
            beginAtZero: true,
            maxRotation: 0,
            minRotation: 0,
            fontColor: '#ffffff',
            lineWidth: 3,
            fontSize: 10
          },
          gridLines: {
            display: false
           }
        }],
        yAxes: [{
         ticks: {
            beginAtZero: true,
            fontColor: '#ffffff',
            lineWidth: 3,
            fontSize: 10
          },
          gridLines: {
            display: false
          }
        }]
      }, 
      legend: {
              display: false,
              labels: {
                  fontColor: '#ffffff'
              }
          },
      title: {
              display: true,
              text: 'Alarms',
              fontColor: '#ffffff'
          }
    }
  });
}

}