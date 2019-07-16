<html lang="en">
<head>
  <title>BIS</title>
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
<script>
</script>
</head>
	<body>
		<div class="container-fluid">
			<div ng-app="ltaApp" ng-controller="ltaController">	
			<h4>&nbsp; Business Intelligence - Real Time</h4>
		
					<table width="100%" class="dashboard1table"> 
						<tr align="left" valign="top"> 
							<td colspan="4"> 
								<iframe src="bisdashzone.jsp" width="1500" height="300" scrolling="no" frameborder="0"> </iframe> 
							</td>
						</tr>
						<tr align="left" valign="top"> 
							<td> 
								<iframe src="bisdashspeed.jsp" width="370" height="355" scrolling="no" frameborder="0"> </iframe> 
							</td>
							<td>
								<iframe src="bisdashroad.jsp" width="370" height="355" scrolling="no" frameborder="0"> </iframe> 
							</td>
							<td>
								<iframe src="bisdashincievent.jsp" width="370" height="355" scrolling="no" frameborder="0"> </iframe> 
							</td>
							<td>
								<iframe src="bisdashcongesroad.jsp" width="370" height="355" scrolling="no" frameborder="0"> </iframe> 
							</td>
						</tr>					
					</table>				
			</div>
		</div> 
	</body>
</html>