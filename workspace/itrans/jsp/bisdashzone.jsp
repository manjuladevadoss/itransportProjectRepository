<!DOCTYPE html>
<!-- Add a title -->

<html>
  <head>    
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="bisdropdown.css">
	  <link rel="stylesheet" href="dc.css">
	  <link rel="stylesheet" href="bisgrid.css">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

		<script type="text/javascript"  src="jquery.js"></script> 
		<script src="bootstrap.min.js"></script>
		<script src="angular.min.js"></script>
		<script type="text/javascript"  src="democontroller.js"></script> 
			
      <title>Zone Dashboard </title>
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
		<a href="#" ng-click="biszoneshowdash('zone1234')">Zone 1 2 3 4</a>	
		<a href="#" ng-click="biszoneshowdash('zone67ab')">Zone 6 7 A B</a>
  </div>
</div>
<br>
	<div ng-show="zone1to4"> 	
		<table class="zonedatatable"  cellpadding="10">
			<tr>
			<td  style="border:solid 2px #293E78">
				<div class="chart-containerzonedash"> 
					<canvas id="myChartZone1" width="800" height="500"></canvas>						
				</div>  
			</td>
			<td style="border:solid 2px #293E78">
				<div class="chart-containerzonedash"> 
					<canvas id="myChartZone2" width="800" height="500"></canvas>					
				</div>  
			</td>
			<td style="border:solid 2px #293E78">
				<div class="chart-containerzonedash"> 
					<canvas id="myChartZone3" width="800" height="500"></canvas>						
				</div>  
			</td>
			<td style="border:solid 2px #293E78">
				<div class="chart-containerzonedash"> 
					<canvas id="myChartZone4" width="800" height="500"></canvas>						
				</div>  
			</td>
			</tr>
		</table> 
	</div>
	<div ng-show="zone5toB"> 			
		<table class="zonedatatable" cellpadding="10">
			<tr>
			<td style="border:solid 2px #293E78">
				<div class="chart-containerzonedash" > 
					<canvas id="myChartZone5" width="800" height="500"></canvas>					
				</div>  
			</td>
			<td style="border:solid 2px #293E78">
				<div class="chart-containerzonedash"> 
					<canvas id="myChartZone6" width="800" height="500"></canvas>					
				</div>  
			</td>
			<td style="border:solid 2px #293E78">
				<div class="chart-containerzonedash"> 
					<canvas id="myChartZoneA" width="800" height="500"></canvas>
				</div>  
			</td>
			<td style="border:solid 2px #293E78">
				<div class="chart-containerzonedash"> 
					<canvas id="myChartZoneB" width="800" height="500"></canvas>
				</div>  
			</td>
			</tr>
		</table>		
	</div> 
</div>
</div>
		<script src="jquery.js"></script>
		<script src="Chart.min.js"></script>
		<script src="chartjsbarzone.js"></script>

      
</body>
</html>


					 	