<!doctype html>
<html >
<title>Workorder</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="grid.css">
	 <link rel="stylesheet" href="dropdownstyle.css">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
</style>
 
 </head>
  <body>
    <div class="container-fluid">
		<table>
			<tr> 
				<td> <img src="itranslogo.JPG"></td>
		 		<td> <h7>i-Transport 2.0</h7> </td>
		 </tr>
		</table>
<br><br>
   	<div ng-app="ltaApp" ng-controller="ltaController">
			<table>  <tr><td>
						 <table>
							<tr>
								<th width="20%"> Latitute </th>
								<th width="12%"> Longitude</th>
								<th width="30%"> Eway Name </th>
								<th width="20%"> Direction Description </th>
								<th width="10%"> location </th>
							</tr>
						</table> 
					</td></tr>
					<tr><td>
							<table>
								<tr ng-repeat="data in mapdata">
								<td width="20%"><font color="#C8CFF4" size="3">{{data.latitute}}</font></td>
								<td width="12%"><font color="#C8CFF4" size="3">{{data.longitude}}</font></td>
								<td width="30%"><font color="#C8CFF4" size="3">{{data.ewayname}}</font></td>
								<td width="10%"><font color="#C8CFF4" size="3">{{data.directiondesc}}</font></td>
								<td width="10%"><font color="#C8CFF4" size="3">{{data.location}}</font></td>
						</tr>
							</table> 

					</td></tr>
			</table>
	
   </div> 
</div>





</body>
</html>

