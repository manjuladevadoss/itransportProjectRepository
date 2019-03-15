<!doctype html>
<html >
<title>Event</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="event.css">
	 <link rel="stylesheet" href="dropdownstyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* width */
::-webkit-scrollbar {
  width: 8px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 100px #43498F; 
  border-radius: 3px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #202B53; 
  border-radius: 3px;
}
::-webkit-scrollbar-corner {
  background: #202B53; 
  border-radius: 3px;
}
</style>
 
  </head>
  <body>
    <div class="container">
 <h3> iTransport 2.0 </h3>
     <div class="bs-example">
<div class="content">
   <div ng-app="ltaApp" ng-controller="ltaController">
   
      <table width="100%">
     <tr> 
     <td> <h5>EVENTS</h5></td>
		<td>
		<div align='right'> 
			<p>Search <input type="text" size="35" placeholder="Search" ng-model="searchEvent">  </P>
			
		</div> 
	   </td> 
	   <td>
		   <div class="dropdown">
			<p>&nbsp;<img src="cormenu.jpg" width="15" height="15"> </p>
				<div class="dropdown-content">
					<a href="incidentTbl.jsp">Incident Record</a>
					<a href="workorderTbl.jsp">Work Order</a>
					<a href="techalarmTbl.jsp">Technical Alarms</a>
					<a href="envmonTbl.jsp">Environment</a>
					<a href="envmonTbl.jsp">Road Works</a>
					 <hr color = "#C8CFF4" style="padding:0px; margin:0px;">
					<a href="envmonTbl.jsp">Merge up/down</a>
					<a href="envmonTbl.jsp">Merge sideways</a>
				</div>
			</div>
		</td>
	 </tr>
	 </table>
	 
	 <table width="30%">
	     <tr> 
	     	<td> <h10> {{noofeventToday}} </h6> <h4>Events(s) Today </h10> </td>
		 	<td> <h10> {{noofeventUpcome}} </h6> <h4>Upcoming Event(s) </h10> </td>
		  </tr>
	  </table>
   <br>
   
   <table width="100%"> 
	 <tr><td>
		<table width="98%">  
			<tr>
					<th width="15%"> <a href="#" ng-click="sortType = 'type'; sortReverse = !sortReverse"><h4> Type </h4></a></th>
					<th width="20%"> <a href="#" ng-click="sortType = 'name'; sortReverse = !sortReverse"><h4> Name </h4></a></th>
					<th width="20%"> <a href="#" ng-click="sortType = 'location'; sortReverse = !sortReverse"><h4> Location </h4></a></th>
					<th width="10%"> <a href="#" ng-click="sortType = 'status'; sortReverse = !sortReverse"><h4>Status </h4></a></th>
					<th width="20%"> <a href="#" ng-click="sortType = 'start'; sortReverse = !sortReverse"><h4>Start </h4></a></th>
					<th width="30%"> <a href="#" ng-click="sortType = 'end'; sortReverse = !sortReverse"><h4>End </h4></a></th>
			</tr>
	 	 </table> </td></tr>
	 <tr><td> 
	   <div class='scroll'>
	     <table border="1" width="100%">
			<!-- <tr>
				 <th> <a href="#" ng-click="sortType = 'type'; sortReverse = !sortReverse"><h4> Type </h4></a></th>
				<th> <a href="#" ng-click="sortType = 'name'; sortReverse = !sortReverse"><h4> Name </h4></a></th>
				<th> <a href="#" ng-click="sortType = 'location'; sortReverse = !sortReverse"><h4> Location </h4></a></th>
				<th> <a href="#" ng-click="sortType = 'status'; sortReverse = !sortReverse"><h4>Status </h4></a></th>
				<th> <a href="#" ng-click="sortType = 'start'; sortReverse = !sortReverse"><h4>Start </h4></a></th>
					<th> <a href="#" ng-click="sortType = 'end'; sortReverse = !sortReverse"><h4>End </h4></a></th>
					
			</tr>  -->
				<tr ng-repeat="event in eventRec | orderBy:sortType:sortReverse | filter:searchEvent">
					<td width="15%"><p>{{event.type}}</p></td>
					<td width="20%"><p>{{event.name}}</p></td>
					<td width="20%"><p>{{event.location}}</p></td>
					<td width="10%"> 
						<div ng-if="event.status==='APPROVED'" > <a class="buttona">{{event.status}}</a></div> 
						<div ng-if="event.status==='PLANNING'" > <a class="buttonp">{{event.status}}</a></div> 
					</td>
					<td width="20%"><p>{{event.start}}</p></td>
					<td width="30%"><p>{{event.end}}</p></td>
				</tr>
		</table>   
		</div>  
		 </td></tr>
 </table> 
	
	
    </div> <br>
     <a href="createvent.jsp#popup2" class="button1a"> Create New Event </a>
	 <a href="cc.jsp" class="button1a"> Common Control</a>
	 	
  
</div>
</div>
</div>
  </body>
</html>

