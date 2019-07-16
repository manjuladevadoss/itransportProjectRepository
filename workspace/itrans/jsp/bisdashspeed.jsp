<!DOCTYPE html>
<html>
  <head>    
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="bisdropdown.css">
	  <link rel="stylesheet" href="dc.css">
	  <link rel="stylesheet" href="bisgrid.css">

		<script type="text/javascript"  src="jquery.js"></script> 
		<script src="bootstrap.min.js"></script>
		<script src="angular.min.js"></script>
		<script type="text/javascript"  src="democontroller.js"></script> 
			
      <title>Speed Chart </title>
    <head> 
<style>
</style>
<body>   
<div class="container-fluid">
<div ng-app="ltaApp" ng-controller="ltaController">	
	<div class="dropdown" style="float:right;">
	   <!-- <i class="fa fa-align-justify fa_custom"></i> -->
	   <img src="listimg.png" style="width:13px; height:13px;">
	   <div class="dropdown-content" style="float:left;">
			<a href="#" ng-click="bisspeedshowdash('exspeed')">Expressway Speed</a>	
			<a href="#" ng-click="bisspeedshowdash('extravel')">Expressway Travel</a>	
			<a href="#" ng-click="bisspeedshowdash('espeed')">EAC Speed</a>	
			<a href="#"  ng-click="bisspeedshowdash('etravel')">EAC Travel</a>	
	   </div>
	</div>
	
	<div ng-show="eacSpeed"> 	
		<table border="0" cellpadding="10" class="dashincieventable">
			<tr>
				<td>
					<div class="chart-container">
						<canvas id="myChartSpeed1" style="width: 300px; height: 256px" ></canvas>                      
					</div>
				</td>
			</tr>
		</table> 
	</div> 

	<div ng-show="eacTravel"> 	
		<table border="0" cellpadding="10" class="dashincieventable">
			<tr >
				<td>
					<div class="chart-container">
					     <canvas id="myChartSpeed3" style="width: 300px; height: 256px" ></canvas> 
					</div>						 
				</td>
			</tr>
		</table>  
	</div>
	<div ng-show="expreSpeed"> 	
		<table  border="0" cellpadding="10" class="dashincieventable">
			<tr >
				<td>
					<div class="chart-container">
						<canvas id="myChartSpeed2" style="width: 300px; height: 256px" ></canvas>  
					</div>                    
				</td>
			</tr>
		</table> 
	</div>
	<div ng-show="expreTravel"> 	
		<table  border="0" cellpadding="10" class="dashincieventable">
			<tr >
				<td>
				<div class="chart-container">
					 <canvas id="myChartSpeed4" style="width: 300px; height: 256px"></canvas>                  
				</div>
				</td>
			</tr>
		</table> 
  	</div>
</div>
</div>

<script src="Chart.min.js"></script>
<script src="chartjs-plugin-labels.js"></script> 
<script src="chartjsspeed.js"></script> 

      
</body>
</html>