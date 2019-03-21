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
	 	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

input[type=text] {
  box-sizing: border-box;
  border: 1px solid  #202B53;
  border-radius: 4px;
  font-size: 12px;
  color: #C8CFF4;
   height: 30px;
  width: 200px;
  font-family: Roboto, Helvetica, sans-serif;
  background-color: #131A32;
  background-image: url('searchicon.png');
  background-position: 10px 10px; 
  background-repeat: no-repeat;
  padding: 15px 25px 22px 28px;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
}


</style>
 
  </head>
  <body>
    <div class="container-fluid">
 <h3> iTransport 2.0 </h3>
     <div class="bs-example">
<div class="contentEvent">
   <div ng-app="ltaApp" ng-controller="ltaController">
   
      <table width="100%">
     <tr> 
     <td> <h5>EVENTS</h5>   <a href="createvent.jsp#createventpopup"> Create New Event </a></td>
		<td>
		<div align='right'> 
			<p><input type="text" size="35" placeholder="Search" ng-model="searchEvent">  </P>
			
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
					<th width="15%"> <a href="#" ng-click="sortType = 'type'; sortReverse = !sortReverse"><h4> Type  <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th width="20%"> <a href="#" ng-click="sortType = 'name'; sortReverse = !sortReverse"><h4> Name <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th width="20%"> <a href="#" ng-click="sortType = 'location'; sortReverse = !sortReverse"><h4> Location <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th width="10%"> <a href="#" ng-click="sortType = 'status'; sortReverse = !sortReverse"><h4>Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th width="20%"> <a href="#" ng-click="sortType = 'start'; sortReverse = !sortReverse"><h4>Start <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th width="30%"> <a href="#" ng-click="sortType = 'end'; sortReverse = !sortReverse"><h4>End <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
			</tr>
	 	 </table> </td></tr>
	 <tr><td> 
	   <div class='scroll'>
	     <table border="1" width="100%">
				<tr ng-repeat="event in eventRec | orderBy:sortType:sortReverse | filter:searchEvent">
					<td width="15%"><p>{{event.type}}</p></td>
					<td width="20%"><p>{{event.name}}</p></td>
					<td width="20%"><p>{{event.location}}</p></td>
					<td width="10%"> 
						<div ng-if="event.status==='APPROVED'" > <a class="buttonappro">{{event.status}}</a></div> 
						<div ng-if="event.status==='PLANNING'" > <a class="buttonplan">{{event.status}}</a></div> 
					</td>
					<td width="20%"><p>{{event.start}}</p></td>
					<td width="30%"><p>{{event.end}}</p></td>
				</tr>
		</table>   
		</div>  
		 </td></tr>
 </table> 
	
	
    </div> 
 
	 	
  
</div>
</div>
</div>
  </body>
</html>

