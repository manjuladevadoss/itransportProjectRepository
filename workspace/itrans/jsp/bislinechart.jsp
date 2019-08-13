<html lang="en">
<head>
  <title>BIS Line Chartasdfdsf </title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="bisgrid.css">
	<link rel="stylesheet" href="bisdropdown.css">
 	<script type="text/javascript"  src="jquery.js"></script> 
 	<script src="bootstrap.min.js"></script>
  	<script src="angular.min.js"></script>
  	<script type="text/javascript"  src="democontroller.js"></script> 
	
	
</head>
<style>
body{
	background-color:  #0A1444;
	background:  #0A1444;
}

</style>
	<body>
		<div class="container-fluid">
			<div ng-app="ltaApp" ng-controller="ltaController">	
			<br>
			<table>
				<tr cellpadding="10px 20px;">
					<td>
						&nbsp;
						<table class="linegraphtable" cellpadding="10px 10px;">
							<tr>
								<td> 
									<canvas id="speedChartAYE" width="750" height="150"></canvas>
								</td>					
							</tr>
						</table> 
						
					</td>
					<td> &nbsp;&nbsp; </td>					
					<td>
						&nbsp;
						<table class="linegraphtable">
							<tr>
								<td> 
									<canvas id="speedChartBKE" width="750" height="150"></canvas>
								</td>					
							</tr>
						</table>
					</td>	
				</tr>
				<tr cellpadding="10px 20px;">
					<td>
						&nbsp;
						<table class="linegraphtable" cellpadding="10px 10px;">
							<tr>
								<td> 
									<canvas id="speedChartKJE" width="750" height="150"></canvas>
								</td>					
							</tr>
						</table> 
						
					</td>
					<td> &nbsp;&nbsp; </td>					
					<td>
						&nbsp;
						<table class="linegraphtable">
							<tr>
								<td> 
									CTE  <!--  <canvas id="speedCanvas1" width="750" height="150"></canvas> -->
								</td>					
							</tr>
						</table>
					</td>	
				</tr>
				<tr cellpadding="10px 20px;">
					<td>
						&nbsp;
						<table class="linegraphtable" cellpadding="10px 10px;">
							<tr>
								<td> 
									KJE  <!--  <canvas id="speedCanvas1" width="750" height="150"></canvas> -->
								</td>					
							</tr>
						</table> 
						
					</td>
					<td> &nbsp;&nbsp; </td>					
					<td>
						&nbsp;
						<table class="linegraphtable">
							<tr>
								<td> 
									CTE <!--  <canvas id="speedCanvas1" width="750" height="150"></canvas> -->
								</td>					
							</tr>
						</table>
					</td>	
				</tr>
								<tr cellpadding="10px 20px;">
					<td>
						&nbsp;
						<table class="linegraphtable" cellpadding="10px 10px;">
							<tr>
								<td> 
									KJE <!--  <canvas id="speedCanvas1" width="750" height="150"></canvas> -->
								</td>					
							</tr>
						</table> 
						
					</td>
					<td> &nbsp;&nbsp; </td>					
					<td>
						&nbsp;
						<table class="linegraphtable">
							<tr>
								<td> 
									CTE <!--  <canvas id="speedCanvas1" width="750" height="150"></canvas> -->
								</td>					
							</tr>
						</table>
					</td>	
				</tr>
				
			</table>									
			</div>
		</div> 
	</body>
		<script src="jquery.js"></script> 
		<script src="Chart.min.js"></script>
		<script type="text/javascript"  src="chartjsline.js"></script> 	
</html>