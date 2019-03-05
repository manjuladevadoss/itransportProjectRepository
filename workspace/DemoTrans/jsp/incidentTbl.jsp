<!doctype html>
<html >
<title>incident Record</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="demo.css">
	 <link rel="stylesheet" href="dropdownstyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.content {
  max-width: 800px;
  margin: auto;
  background: #202B53;
  padding: 10px;
  margin-top: 5%;
}

h4 {
  font-family: Roboto, Helvetica, sans-serif;
  color: #C8CFF4;
  font-weight: bold;
  font-size: 16px;
}

.button1 {
  font-size: 1em;
  padding: 7px 14px;
  color: #202B53;
  border: 2px solid #C8CFF4;
  border-radius: 40px/60px;
  background:#C8CFF4;
}
</style>
 
  </head>
  <body>
  <div class="container-fluid">
  <h3> iTransport 2.0 </h3>
<div class="bs-example">
<div class="content">
   <div ng-app="ltaApp" ng-controller="ltaController">

   <table width="100%">
     <tr > 
     <td> <h5>Incident Record </h5> <td>
		<td>
		<div align='right'> 
			<p>Search <input type="text" size="35" placeholder="Search" ng-model="searchIncident">  </P>
			
		</div> 
	   </td> 
	   <td>
		   <div class="dropdown">
			<p>Menu <img src="cormenu.jpg" width="15" height="15"> </p>
				<div class="dropdown-content">
					<a href="workorderTbl.jsp">Work Order</a>
					<a href="techalarmTbl.jsp">Technical Alarms</a>
					<a href="envmonTbl.jsp">Environment</a>
					<a href="eventTbl.jsp">Events</a>
					<a href="envmonTbl.jsp">Road Works</a>
					 <hr color = "#C8CFF4"  style="padding:0px; margin:0px;">
					<a href="envmonTbl.jsp">Merge up/down</a>
					<a href="envmonTbl.jsp">Merge sideways</a>
				</div>
			</div>
		</td>
	 </tr>
	 </table>
    <br>
     <table border="1" width="100%">
		<tr>
			<th> <a href="#" ng-click="sortType = 'irid'; sortReverse = !sortReverse"><h4> IRID </h4></a></th>
			<th> <a href="#" ng-click="sortType = 'type'; sortReverse = !sortReverse"> <h4>Type </h4></a></th>
			<th> <a href="#" ng-click="sortType = 'state'; sortReverse = !sortReverse"> <h4>State </h4></a></th>
			<th> <a href="#" ng-click="sortType = 'zone'; sortReverse = !sortReverse"> <h4>Zone </h4> </a></th>
			<th> <a href="#" ng-click="sortType = 'roadname'; sortReverse = !sortReverse"> <h4>Road Name </h4></a></th>
			<th> <a href="#" ng-click="sortType = 'lanes'; sortReverse = !sortReverse"> <h4>Lanes </h4></a></th>
		</tr>
		<tr ng-repeat="incident in incidentRec | orderBy:sortType:sortReverse | filter:searchIncident">
				<td><font color="#C8CFF4" size="3">{{incident.irid}}<font color="#C8CFF4" size="3"></td>
				<td>
					<div ng-if="incident.type==='Accident'"><img src="accident.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
					<div ng-if="incident.type==='Road Works'"><img src="roadwork.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
					<div ng-if="incident.type==='Obstacle'"><img src="obstacle.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
					<div ng-if="incident.type==='Break Down'"><img src="breakdown.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
					<div ng-if="incident.type==='Heavy Traffic'"><img src="heavytraffic.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
					<div ng-if="incident.type==='Mobile Road Works'"><img src="mobileroadwork.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
					<div ng-if="incident.type==='Unattended Vehicle'"><img src="unattvehicle.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
					<div ng-if="incident.type==='Miscellaneous'"><img src="misce.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
				</td>
				<td><font color="#C8CFF4" size="3">{{incident.state}}</font></td>
				<td><font color="#C8CFF4" size="3">{{incident.zone}}</font></td>
				<td><font color="#C8CFF4" size="3">{{incident.roadname}}</font></td>
				<td><font color="#C8CFF4" size="3">{{incident.lanes}}</font></td>
			</tr>
	</table>     
  
<br>

	<a href="createinc.jsp#popup1" class="button1"> Create Incident </a>
    <a href="cc.jsp" class="button1"> Common Control</a>
    
      </div>
     </div>
 </div>
   </div>
  </body>
</html>

