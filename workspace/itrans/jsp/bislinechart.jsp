<html lang="en">
<head>
  <title>BIS Line Chart </title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="bisgrid.css">
	<link rel="stylesheet" href="bisdropdown.css">
 	<script type="text/javascript"  src="jquery.js"></script> 
 	<script src="bootstrap.min.js"></script>
  	<script src="angular.min.js"></script>
  	<script type="text/javascript"  src="democontroller.js"></script> 
<style> 
</style>
		<script src="jquery.js"></script>
		<script src="Chart.min.js"></script>
<script>
var speedCanvas = document.getElementById("speedChart");

//Chart.defaults.global.defaultFontFamily = "Lato";
//Chart.defaults.global.defaultFontSize = 18;

var dataFirst = {
    label: "Car A - Speed (mph)",
    data: [0, 59, 75, 20, 20, 55, 40],
    lineTension: 0,
    fill: false,
    borderColor: 'red'
  };

var dataSecond = {
    label: "Car B - Speed (mph)",
    data: [20, 15, 60, 60, 65, 30, 70],
    lineTension: 0,
    fill: false,
    borderColor: 'blue'
  };

var speedData = {
  labels: ["0s", "10s", "20s", "30s", "40s", "50s", "60s"],
  datasets: [dataFirst, dataSecond]
};

var chartOptions = {
  legend: {
    display: true,
    position: 'top',
    labels: {
      boxWidth: 80,
      fontColor: 'black'
    }
  }
};

var lineChart = new Chart(speedCanvas, {
  type: 'line',
  data: speedData,
  options: chartOptions
});
</script>

</head>
	<body>
		<div class="container-fluid">
			<div ng-app="ltaApp" ng-controller="ltaController">	
				<h4>&nbsp; Business Intelligence - Real Time</h4>
				<canvas id="speedChart" width="200" height="200"></canvas>			
			</div>
		</div> 
	</body>
</html>