<!doctype html>
<html >
<title>Event</title>
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
.fontcolor{ 
color: #AD484A;
}
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


h10 {
  font-family: Roboto, Helvetica, sans-serif;
  color: #48AD76;
  font-weight: bold;
  font-size: 18px;
}

.buttonp{
  font-size: 1em;
  padding: 2px 7px;
  color: block;
  border: 2px solid yellow;
  border-radius: 40px/60px;
  background:yellow;
}

.buttona{
  font-size: 1em;
  padding: 2px 7px;
  color: block;
  border: 2px solid #77ebff;
  border-radius: 40px/60px;
  background:#77ebff;
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
			<p>Menu <img src="cormenu.jpg" width="15" height="15"> </p>
				<div class="dropdown-content">
					<a href="incidentTbl.jsp">Incident Record</a>
					<a href="workorderTbl.jsp">Work Order</a>
					<a href="techalarmTbl.jsp">Technical Alarms</a>
					<a href="envmonTbl.jsp">Environment</a>
					<a href="envmonTbl.jsp">Road Works</a>
					 <hr color = "#C8CFF4">
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
     <table border="1" width="100%">
		<tr>
			<th> <a href="#" ng-click="sortType = 'type'; sortReverse = !sortReverse"><h4> Type </h4></a></th>
			<th> <a href="#" ng-click="sortType = 'name'; sortReverse = !sortReverse"><h4> Name </h4></a></th>
			<th> <a href="#" ng-click="sortType = 'location'; sortReverse = !sortReverse"><h4> Location </h4></a></th>
			<th> <a href="#" ng-click="sortType = 'status'; sortReverse = !sortReverse"><h4>Status </h4></a></th>
			<th> <a href="#" ng-click="sortType = 'start'; sortReverse = !sortReverse"><h4>Start </h4></a></th>
				<th> <a href="#" ng-click="sortType = 'end'; sortReverse = !sortReverse"><h4>End </h4></a></th>
		</tr>
			<tr ng-repeat="event in eventRec | orderBy:sortType:sortReverse | filter:searchEvent">
				<td><p>{{event.type}}</p></td>
				<td><p>{{event.name}}</p></td>
				<td><p>{{event.location}}</p></td>
				<td> 
					<div ng-if="event.status==='APPROVED'" > <p><a class="buttona">{{event.status}}</a></p></div> 
					<div ng-if="event.status==='PLANNING'" > <p><a class="buttonp">{{event.status}}</a></p></div> 
				</td>
				<td><p>{{event.start}}</p></td>
					<td><p>{{event.end}}</p></td>
			</tr>
	</table>     
    </div> <br>
     <a href="createvent.jsp#popup2" class="button1"> Create New Event </a>
	 <a href="cc.jsp" class="button1"> Common Control</a>
	 	
  
</div>
</div>
</div>
  </body>
</html>

