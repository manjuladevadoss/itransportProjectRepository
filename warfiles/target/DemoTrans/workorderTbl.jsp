<!doctype html>
<html >
<title>work Order</title>
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
      <h5>Work Order</h5>
   <div ng-app="ltaApp" ng-controller="ltaController">
     <table border="1" width="100%">
     <tr > 
		<td colspan="4">
		<div align='right'> 
			<p>Search <input type="text" placeholder="Search" ng-model="searchWorkOrder"> </P>
			
		</div> 
	   </td>
	   <td>
		   <div class="dropdown">
			<div align='right'> <img src="cormenu.jpg" width="15" height="15"> </div>
				<div class="dropdown-content">
					<a href="incidentTbl.jsp">Incident Record</a>
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
			<th> <a href="#" ng-click="sortType = 'date'; sortReverse = !sortReverse"> Date </a></th>
			<th> <a href="#" ng-click="sortType = 'wonum'; sortReverse = !sortReverse"> Wonum </a></th>
			<th> <a href="#" ng-click="sortType = 'descri'; sortReverse = !sortReverse"> Description </a></th>
			<th> <a href="#" ng-click="sortType = 'status'; sortReverse = !sortReverse"> Status </a></th>
			<th> <a href="#" ng-click="sortType = 'zone'; sortReverse = !sortReverse"> Zone</a></th>
		</tr>
			<tr ng-repeat="workOrder in workorderRec | orderBy:sortType:sortReverse | filter:searchWorkOrder">
				<td><p>{{workOrder.date}}</p></td>
				<td><p>{{workOrder.wonum}}</p></td>
				<td><p>{{workOrder.descri}}</p></td>
				<td><p>{{workOrder.status}}</p></td>
				<td><p>{{workOrder.zone}}</p></td>
			</tr>
	</table>     
    </div>
    <h5> <a href="cc.jsp">Common Control</a></h5>
    <!-- 
        <embed type="text/html" src="C:/Users/mdevadoss/workspace/DemoPro/html/incidentDisplay.html">  
    -->
  </body>
</html>

