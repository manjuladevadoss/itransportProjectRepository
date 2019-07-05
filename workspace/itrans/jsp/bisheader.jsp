<html lang="en">
<head>
  <title>GIS</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="bisgrid.css">
 	<script type="text/javascript"  src="jquery.js"></script> 
 	<script src="bootstrap.min.js"></script>
  	<script src="angular.min.js"></script>
  	<script type="text/javascript"  src="democontroller.js"></script> 
<style> </style>
<script>

</script>
</head>
	<body>
		<div class="container-fluid">
			<div ng-app="ltaApp" ng-controller="ltaController">	
				<table width="100%" class="bisheadertable"> 
						<tr> 
							<td> 
								<h4>&nbsp; <img src="titlelogobar.png" width="20px" height="18px">&nbsp; Business Intelligence - Real Time</h4>
							</td> 
							<td align="right">
								<h3> Dashboard Template  <img src="titlelogobar.png" width="10px" height="10px"> &nbsp;  &nbsp; </h3>			
							</td> 
						</tr>
					</table> 
					
					<table width="100%" class="bisdatatable"> 
						<tr align="left" valign="top"> 
							<td width="10%"> 
								<table>
									<tr>	
										<td><a href="#" style="color: #FFFFFF" ng-click="bisroadshow()">Road Closure</a></td>
									</tr>
									<tr>
										<td><a href="#" style="color: #FFFFFF"  ng-click="bisroadshow()">Road Open</a></td>
									</tr>
									<tr>
										<td><a href="#" style="color: #FFFFFF" ng-click="bisconshow()">Road Work</a></td>
									</tr>
									<tr>
										<td><a href="#" style="color: #FFFFFF" ng-click="bisspeedshow()">Speed</a></td>
									</tr>
									<tr>
										<td><a href="#" style="color: #FFFFFF" ng-click="bisincieventshow()">Incident</a></td>
									</tr>
								</table>
							</td>  
							<td align="left" width="70%">
							
								<div ng-show="showbisincevent"> 			 
									<iframe src="bisincievent.jsp" onload="this.style.height=(this.contentDocument.body.scrollHeight+45) +'px !important';" 
									scrolling="no" style="width:100%;min-height:1000px;border:none;overflow-y:hidden;overflow-x:hidden;"> </iframe>  								
								</div>	 								
								<div ng-show="showbisroad"> 
									<iframe src="bisroad.jsp" onload="this.style.height=(this.contentDocument.body.scrollHeight+45) +'px !important';" 
									scrolling="no" style="width:100%;min-height:1000px;border:none;overflow-y:hidden;overflow-x:hidden;"> </iframe> 								 								
								</div>				
								<div ng-show="showconroad">					
									<iframe src="biscongesroad.jsp" onload="this.style.height=(this.contentDocument.body.scrollHeight+45) +'px !important';" 
									scrolling="no" style="width:100%;min-height:1000px;border:none;overflow-y:hidden;overflow-x:hidden;"> </iframe>					
								</div>	
								<div ng-show="showspeed">					
									<iframe src="bisspeed.jsp" onload="this.style.height=(this.contentDocument.body.scrollHeight+45) +'px !important';" 
									scrolling="no" style="width:100%;min-height:1000px;border:none;overflow-y:hidden;overflow-x:hidden;"> </iframe>					
								</div>	
								
							</td>
						</tr>
					</table> 
					
				
			</div>
		</div> 
	</body>
</html>


