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
			
      <title>Road Close and Open Chart </title>
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
					<a href="#" ng-click="bisroadshowdash('rclose')">Road Closure</a>	
					<a href="#" ng-click="bisroadshowdash('ropen')">Road Opening</a>	
			   </div>
			</div>



	<div ng-show="rdopen"> 	
		<table border="0" cellpadding="10" class="dashincieventable">
			<tr>
				<td>
					 <div class="chart-container"> 						
						<canvas id="myChartOpen" width="300" height="250"></canvas>						
					 </div> 				 
				</td>
			</tr>
		</table> 
	</div>
	<div ng-show="rdclose"> 			
		<table border="0" cellpadding="10" class="dashincieventable">
			<tr>
				<td>
					<div class="chart-container"> 						
						  <canvas id="myChartClose" width="300" height="250"></canvas>					
					 </div>  				 
				</td>
			</tr>
		</table>		
	</div> 
</div>
</div>
		<script src="jquery.js"></script>
		<script src="Chart.min.js"></script>
		<script src="chartjsbarroaddash.js"></script>

      
</body>
</html>


					 	