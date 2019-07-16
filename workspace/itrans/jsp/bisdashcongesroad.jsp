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
			
      <title>Congestion Road Chart </title>
    <head> 
<style>
</style>
<body>   
<div class="container-fluid">
<div ng-app="ltaApp" ng-controller="ltaController">		
		<table border="0" cellpadding="10" class="dashincieventable">
			<tr>
				<td>
					 <div class="chart-container"> 
						<canvas id="myChartconroad" width="300" height="300"></canvas>                     
					 </div>  
				</td>
			</tr>
		</table> 	
</div>
</div>
		<script src="jquery.js"></script>
		<script src="Chart.min.js"></script>
		<script src="chartjsbarcondash.js"></script>
</body>
</html>