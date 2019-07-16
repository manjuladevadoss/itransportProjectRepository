<!DOCTYPE html>
<!-- Add a title -->

<html>
  <head>    
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="dropdownlistStyle.css">
	  <link rel="stylesheet" href="dc.css">
	  <link rel="stylesheet" href="bisgrid.css">

		<script type="text/javascript"  src="jquery.js"></script> 
		<script src="bootstrap.min.js"></script>
		<script src="angular.min.js"></script>
		<script type="text/javascript"  src="democontroller.js"></script> 
			
      <title>Zone work load </title>
    <head> 
<style>
</style>
<body>   
<div class="container-fluid">
<div ng-app="ltaApp" ng-controller="ltaController">		
	<table class="zonedatatable" cellpadding="3">
		<tr>
			<td>
				<div class="chart-containerzone" > 
					<canvas id="myChartZone1" width="800" height="500"></canvas>	
					<hr style="border:1px solid #70A2C9; ">
					<canvas id="myChartZone5" width="800" height="500"></canvas>					
				</div>  
			</td>
			<td>
				<div class="chart-containerzone"> 
					<canvas id="myChartZone2" width="800" height="500"></canvas>
					<hr style="border:1px solid #70A2C9; ">
					<canvas id="myChartZone6" width="800" height="500"></canvas>					
				</div>  
			</td>
			<td>
				<div class="chart-containerzone"> 
					<canvas id="myChartZone3" width="800" height="500"></canvas>						
					<hr style="border:1px solid #70A2C9; ">
					<canvas id="myChartZoneA" width="800" height="500"></canvas>
				</div>  
			</td>
			<td>
				<div class="chart-containerzone"> 
					<canvas id="myChartZone4" width="800" height="500"></canvas>						
					<hr style="border:1px solid #70A2C9; ">
					<canvas id="myChartZoneB" width="800" height="500"></canvas>
				</div>  
			</td>
		</tr>
	</table> 	
</div>
</div>
		<script src="jquery.js"></script>
		<script src="Chart.min.js"></script>
		<script src="chartjsbarzone.js"></script>      
</body>
</html>