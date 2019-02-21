<!doctype html>
<html >
<title>incident Record</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="demo.css">
	 <link rel="stylesheet" href="dropdownstyle.css">
	  <link rel="stylesheet" href="tablestyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

</style>
 
  </head>
  <body>
  <h3>iTransport 2.0</h3>
      <h5>Incident Record !!! </h5>
   <div ng-app="ltaApp" ng-controller="ltaController">
   
     <table border="1" width="50%">
     <tr > 
		<td colspan="5">
		<div align='right'> 
			<p>Search <input type="text" size="35" placeholder="Search" ng-model="searchIncident">  </P>
			
		</div> 
	   </td> 
	   <td>
		   <div class="dropdown">
			<button class="dropbtn"><img src="cormenu.jpg" width="10" height="5"></button>
				<div class="dropdown-content">
					<a href="incidentTbl.jsp">Incident Record</a>
					<a href="workorderTbl.jsp">Work Order</a>
					<a href="techalarmTbl.jsp">Technical Alarms</a>
					<a href="envmonTbl.jsp">Environment</a>
					<a href="envmonTbl.jsp">Events</a>
					<a href="envmonTbl.jsp">Road Works</a>
					<a href="envmonTbl.jsp">Road Works</a>
					<img src="line.jpg" width="175" height="5">
					<a href="envmonTbl.jsp">Merge up/down</a>
					<a href="envmonTbl.jsp">Merge sideways</a>
				</div>
			</div>
		</td>
	 </tr>
		<tr>
			<th> <a href="#" ng-click="sortType = 'irid'; sortReverse = !sortReverse"> IRID </a></th>
			<th> <a href="#" ng-click="sortType = 'type'; sortReverse = !sortReverse"> Type </a></th>
			<th> <a href="#" ng-click="sortType = 'state'; sortReverse = !sortReverse"> State </a></th>
			<th> <a href="#" ng-click="sortType = 'zone'; sortReverse = !sortReverse"> Zone </a></th>
			<th> <a href="#" ng-click="sortType = 'roadname'; sortReverse = !sortReverse"> Road Name </a></th>
			<th> <a href="#" ng-click="sortType = 'lanes'; sortReverse = !sortReverse"> Lanes </a></th>
		</tr>
			<tr ng-repeat="incident in incidentRec | orderBy:sortType:sortReverse | filter:searchIncident">
				<td><p>{{incident.irid}}</p></td>
				<td>
					<div ng-if="incident.type==='Accident'"><img src="accident.jpg" ><font color="white" size="2">{{incident.type}}</font></div>
					<div ng-if="incident.type==='Road Works'"><img src="roadwork.jpg" ><font color="white" size="2">{{incident.type}}</font></div>
					<div ng-if="incident.type==='Obstacle'"><img src="obstacle.jpg" ><font color="white" size="2">{{incident.type}}</font></div>
					<div ng-if="incident.type==='Break Down'"><img src="breakdown.jpg" ><font color="white" size="2">{{incident.type}}</font></div>
				</td>
				<td><p>{{incident.state}}</p></td>
				<td><p>{{incident.zone}}</p></td>
				<td><p>{{incident.roadname}}</p></td>
				<td><p>{{incident.lanes}}</p></td>
			</tr>
	</table>     
    </div>
    <h5> <a href="cc.jsp">Common Control</a></h5>
    <!-- 
        <embed type="text/html" src="C:/Users/mdevadoss/workspace/DemoPro/html/incidentDisplay.html">  
    -->
  </body>
</html>

