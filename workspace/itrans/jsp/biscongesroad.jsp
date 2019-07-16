<!DOCTYPE html>
<!-- Add a title -->

<html>
  <head>    
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
      <link rel="stylesheet" href="dc.css">
	  <link rel="stylesheet" href="bisgrid.css">
      <title>Congestion Road </title>
    <head> 
<style> </style>
<div ng-app="ltaApp" ng-controller="ltaController">  
	<body> 
		<table class="chartable" cellpadding="20" align="center">
			<tr>
				<td style="border:1px solid black">
					<!-- <h5 id="titleLabelcon">  </h5> -->
					<canvas id="myChartconroad" width="900" height="500"></canvas>
				</td>
			 </tr>     
		</table>
	  
	<table>
		<tr ng-repeat="biscon in bisroadcon"> 
			<td>
			  <input type="hidden" id="bisroadconarr" name="bisroadconarr" value='{{biscon.labelname}}{{sep}}{{biscon.records}}' size="25" readonly>
			  <!-- {{biscon.labelname}} &nbsp;&nbsp;{{biscon.records}}  -->
			</td>
		</tr>
	</table>
		<script src="jquery.js"></script>
		<script src="Chart.min.js"></script>
		<script src="bootstrap.min.js"></script>
		<script src="angular.min.js"></script>
		<script type="text/javascript"  src="democontroller.js"></script>  	 
		<script src="chartjsbarcon.js"></script>
		  
	</body>
</div>
</html>