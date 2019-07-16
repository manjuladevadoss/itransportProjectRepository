<!DOCTYPE html>
<!-- Add a title -->

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
			
      <title>Incident Event </title>
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
	<a href="#" ng-click="bisincieventdash('kmocc')">KMOCC</a>	
	<a href="#" ng-click="bisincieventdash('ltoc')">LTOC</a>	
	<a href="#" ng-click="bisincieventdash('occ')">OCC</a>
	<a href="#" ng-click="bisincieventdash('ir')">Incident Record</a>
	<a href="#" ng-click="bisincieventdash('er')">Event Record</a>
  </div>
</div>

	<div ng-show="incidentocc"> 	
		<table border="0" cellpadding="10" class="dashincieventable">
			<tr>
				<td>
					<div class="chart-container">
						<canvas id="myInciChart1" style="width: 300px; height: 256px"></canvas>                 					
					</div>
				</td>
			</tr>
		</table> 
	</div> 

	<div ng-show="incidentkmocc"> 	
		<table border="0" cellpadding="10" class="dashincieventable">
			<tr >
				<td>
					<div class="chart-container">
					    <canvas id="myInciChart2" style="width: 300px; height: 256px"></canvas>                  
					</div>						 
				</td>
			</tr>
		</table>  
	</div>
	<div ng-show="incidentltoc"> 	
		<table  border="0" cellpadding="10" class="dashincieventable">
			<tr >
				<td>
					<div class="chart-container">
						<canvas id="myInciChart3" style="width: 300px; height: 256px"></canvas>                  

					</div>                    
				</td>
			</tr>
		</table> 
	</div>
	<div ng-show="incidentir"> 	
		<table  border="0" cellpadding="10"  class="dashincieventable">
			<tr >
				<td>
				<div class="chart-container">
					<canvas id="myInciChart4"  style="width: 300px; height: 256px"></canvas>                               
				</div>
				</td>
			</tr>
		</table> 
  	</div>
	<div ng-show="incidenter"> 	
		<table  border="0" cellpadding="10"  class="dashincieventable">
			<tr >
				<td>
				<div class="chart-container">
					<canvas id="myEventChart1" style="width: 300px; height: 256px"></canvas>                 
				</div>
				</td>
			</tr>
		</table> 
  	</div>
</div>
</div>

<script src="Chart.min.js"></script>
<script src="chartjs-plugin-labels.js"></script> 
<script src="chartjsincievent.js"></script> 

      
</body>
</html>