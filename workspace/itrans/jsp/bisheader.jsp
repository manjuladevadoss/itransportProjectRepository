<html lang="en">
<head>
  <title>BIS</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="bisgrid.css">
	<link rel="stylesheet" href="bisdropdownlistStyle.css">
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
				<table width="100%" class="bisheadertable"> 
						<tr> 
							<td> 
								<h4>&nbsp; Business Intelligence - Real Time</h4>
							</td> 
							<td align="right">
								<div class="dropdown" style="float:right;">				 
									<h3> Dashboard Template </h3>
									<div class="dropdown-content" style="float:left;">
										<a href="#" style="color: #000000" ng-click="bisincieventshow()">Incident</a>		
										<a href="#" style="color: #000000" ng-click="bisroadshow()">Road Closure</a>
										<a href="#" style="color: #000000"  ng-click="bisroadshow()">Road Open</a>	
										<a href="#" style="color: #000000" ng-click="bisconshow()">Road Work</a>
										<a href="#" style="color: #000000" ng-click="bisspeedshow()">Speed</a>		
										<a href="#" style="color: #000000" ng-click="biszoneshow()">Zone</a>	
									</div>
								</div>  			
							</td> 
						</tr>
					</table> 					
					<table width="100%" class="bisdatatable"> 
						<tr align="left" valign="top"> 
							<td align="left" width="70%">
								<div ng-show="showbisincevent"> 			 
									<iframe src="bisincievent.jsp" onload="this.style.height=(this.contentDocument.body.scrollHeight+45) +'px !important';" 
									scrolling="no" style="width:100%;min-height:800px;border:none;overflow-y:hidden;overflow-x:hidden;"> 
									</iframe>  								
								</div>	 								
								<div ng-show="showbisroad"> 
									<iframe src="bisroad.jsp" onload="this.style.height=(this.contentDocument.body.scrollHeight+45) +'px !important';" 
									scrolling="no" style="width:100%;min-height:800px;border:none;overflow-y:hidden;overflow-x:hidden;"> 
									</iframe> 								 								
								</div>				
								<div ng-show="showconroad">					
									<iframe src="biscongesroad.jsp" onload="this.style.height=(this.contentDocument.body.scrollHeight+45) +'px !important';" 
									scrolling="no" style="width:100%;min-height:800px;border:none;overflow-y:hidden;overflow-x:hidden;"> 
									</iframe>					
								</div>	
								<div ng-show="showspeed">	
									<iframe src="bisspeed.jsp" onload="this.style.height=(this.contentDocument.body.scrollHeight+45) +'px !important';" 
									scrolling="no" style="width:100%;min-height:800px;border:none;overflow-y:hidden;overflow-x:hidden;"> 
									</iframe>									
								</div>
								<div ng-show="showzone">	
									<iframe src="biszone.jsp" onload="this.style.height=(this.contentDocument.body.scrollHeight+45) +'px !important';" 
									scrolling="no" style="width:100%;min-height:800px;border:none;overflow-y:hidden;overflow-x:hidden;"> 
									</iframe>									
								</div>
							</td>
						</tr>
					</table>				
			</div>
		</div> 
	</body>
</html>


