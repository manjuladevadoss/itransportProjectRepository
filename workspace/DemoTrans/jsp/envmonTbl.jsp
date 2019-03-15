<!doctype html>
<html >
<title>Environmental</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="incident.css">
	 <link rel="stylesheet" href="dropdownstyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
</style>
 
  </head>
  <body>
    <div class="container">
 <h3> iTransport 2.0 </h3>
     <div class="bs-example">
<div class="content">
   <div ng-app="ltaApp" ng-controller="ltaController">
   
			<table width="100%">
			 <tr > 
			 <td> <h5>ENVIRONMENTAL MONITORING LIST</h5><td>
				<td>
				<div align='right'> 
					<p>Search <input type="text" size="35" placeholder="Search" ng-model="searchWorkOrderfromgrid">  </P>
					
				</div> 
			   </td> 
			   <td>
				   <div class="dropdown">
					<p>&nbsp; <img src="cormenu.jpg" width="15" height="15"> </p>
						<div class="dropdown-content">
							<a href="incidentTbl.jsp">Incident Record</a>
							<a href="workorderTbl.jsp">Work Order</a>
							<a href="techalarmTbl.jsp">Technical Alarms</a>
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
		  
		   <br>
			 <table border="1" width="100%">
				<tr>
					<th> <a href="#" ng-click="sortType = 'date'; sortReverse = !sortReverse"><h4> Date </h4></a></th>
					<th> <a href="#" ng-click="sortType = 'wonum'; sortReverse = !sortReverse"><h4> Wonum </h4></a></th>
					<th> <a href="#" ng-click="sortType = 'descri'; sortReverse = !sortReverse"><h4> Description </h4></a></th>
					<th> <a href="#" ng-click="sortType = 'status'; sortReverse = !sortReverse"><h4>Status </h4></a></th>
					<th> <a href="#" ng-click="sortType = 'zone'; sortReverse = !sortReverse"><h4>Zone </h4></a></th>
				</tr>
					<tr ng-repeat="workOrder in workorderRec | orderBy:sortType:sortReverse | filter:searchWorkOrderfromgrid">
						<td><p>{{workOrder.date}}</p></td>
						<td><p>{{workOrder.wonum}}</p></td>
						<td><p>{{workOrder.descri}}</p></td>
						<td>
						<div ng-if="workOrder.status==='ACTIVE'" > <a class="buttonact">{{workOrder.status}}</a></div> 
						<div ng-if="workOrder.status==='NOT ACTIVE'" > <a class="buttonnotact">{{workOrder.status}}</a></div> 
						</td>
						<td><p>{{workOrder.zone}}</p></td>
					</tr>
			</table>    
    </div> <br>
     <a href="cc.jsp" class="button1"> Common Control</a>
</div>
</div>
</div>
  </body>
</html>

