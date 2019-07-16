<!DOCTYPE html>
<html lang="en">
<head>
<title>BIS</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

 	<link rel="stylesheet" href="bisdropdownlistStyle.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" >
	
 	<script type="text/javascript"  src="jquery.js"></script> 
 	<script src="bootstrap.min.js"></script>
  	<script src="angular.min.js"></script>
  	<script type="text/javascript"  src="democontroller.js"></script> 
<style type="text/css">

</style>

</head>
<body>
<div class="container-fluid">
<div ng-app="ltaApp" ng-controller="ltaController">
	<table width="60%" border="0">
			<tr> 			
				<td align="center"> 	
					<h4>BIS Real Time Dashboard </h4> 
				</td>
				<td></td>
			</tr>
			<tr>
				<td align="center">
						
				</td>
				<td>
				   <div align="left"> 	
			   		<div class="dropdown" style="float:right;">
							 list <i class="fa fa-align-justify fa_custom"></i>
							 <div class="dropdown-content" style="float:right;">
							<a href="#"  style="text-decoration: none" ng-click="bisroadshow()"> Road Works </a>								
							<a href="#"  style="text-decoration: none" ng-click="bisincieventshow()"> Incidents & Events </a>
							<a href="#"  style="text-decoration: none" ng-click="bisconshow()"> Congestion Road Works </a>
							<a href="#"  style="text-decoration: none" ng-click="bisspeedshow()"> Speed Data </a>																						
						</div> 
					</div> 
					</div>
				</td>
			</tr>			 
			<tr> 			
		    <td colspan="2"> 	
			   	<div ng-show="showbisincevent"> 			 
					<iframe src="bisincievent.jsp" height="680" width="1300"> </iframe>  								
				</div>	 								
				<div ng-show="showbisroad"> 
					<iframe src="bisroad.jsp" height="680" width="1300"> </iframe> 								 								
				</div>				
				<div ng-show="showconroad">					
					<iframe src="biscongesroad.jsp" height="680" width="1300"> </iframe>					
				</div>	
				<div ng-show="showspeed">					
					<iframe src="bisspeed.jsp" height="680" width="1300"> </iframe>					
				</div>		
			</td>
			</tr>
	</table>		 
	</div> 
</div> 			 
</body>
</html>   
                      