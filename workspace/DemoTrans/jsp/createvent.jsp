<!doctype html>
<html >
<title>Event Creation</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="popup.css">
	 	 <link rel="stylesheet" href="dropdownstyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	  <link rel="stylesheet" href="demo.css">
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
h4 {
  font-family: Roboto, Helvetica, sans-serif;
  color: #C8CFF4;
  font-weight: bold;
  font-size: 16px;
}
.button1 {
  font-size: .7em;
  padding: 4px 15px;
  color: #202B53;
  border: 2px solid #C8CFF4;
  border-radius: 40px/60px;
  background:#C8CFF4;
}
.button2 {
  font-size: 1em;
  padding: 10px 45px;
  color: #202B53;
  border: 2px solid #C8CFF4;
  border-radius: 40px/60px;
  background:#C8CFF4;
}

.buttonRemove {
  font-size: .7em;
  padding: 4px 15px;
  color: #202B53;
  border: 2px solid yellow;
  border-radius: 40px/60px;
  background:yellow;
}

.buttonClosure {
  font-size: .7em;
  padding: 4px 15px;
  color: #202B53;
  border: 2px solid red;
  border-radius: 40px/60px;
  background:red;
}
.content {
  max-width: 800px;
  margin: auto;
  background: #202B53;
  padding: 5px;

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
h6 {
  font-family: Roboto, Helvetica, sans-serif;
  color: #C8CFF4;
  font-size: 13px;
}

h10 {
  font-family: Roboto, Helvetica, sans-serif;
  color: #48AD76;
  font-weight: bold;
  font-size: 18px;
}


</style>
</head>
<body>
   <div ng-app="ltaApp" ng-controller="ltaController">
   <form>
   
    <a href="createvent.jsp#popup2" class="button2"> Create New Event </a>
   
 <div class="container-fluid"> 
<!-- display List of Incident <div ng-show="showList">  -->

 <div class="bs-example">
<div class="content">
	<table width="100%">
     <tr > 
<td> <h5>EVENTS</h5></td>
		<td>
		<div align='right'> 
			<font color="white" size="2">Search <input type="text" size="35" placeholder="Search" ng-model="searchEvent">  </font>
			
		</div> 
	   </td> 
	   <td>
		   <div class="dropdown">
			<font color="white" size="2">Menu <img src="cormenu.jpg" width="15" height="15"> </font>
				<div class="dropdown-content">
					<a href="workorderTbl.jsp">Work Order</a>
					<a href="incidentTbl.jsp">Incident Record</a>
					<a href="techalarmTbl.jsp">Technical Alarms</a>
					<a href="envmonTbl.jsp">Environment</a>
					<a href="eventTbl.jsp">Events</a>
					<a href="envmonTbl.jsp">Road Works</a>
					<hr color = "#C8CFF4" style="padding:0px; margin:0px;">
					<a href="envmonTbl.jsp">Merge up/down</a>
					<a href="envmonTbl.jsp">Merge sideways</a>
				</div>
			</div>
		</td>
	 </tr>
	 </table>
	 <br>
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
			<tr ng-repeat="e in eventNewList | orderBy:sortType:sortReverse | filter:searchEvent">
				<td><p>{{e.type}}</p></td>
				<td><p>{{e.name}}</p></td>
				<td><p>{{e.location}}</p></td>
				<td> 
					<div ng-if="e.status==='APPROVED'" > <p><a class="buttona">{{e.status}}</a></p></div> 
					<div ng-if="e.status==='PLANNING'" > <p><a class="buttonp">{{e.status}}</a></p></div> 
				</td>
				<td><p>{{e.start}}</p></td>
					<td><p>{{e.end}}</p></td>
			</tr>
	</table> 

</div>
</div>


<!-- </div> End display List of Event -->

<!-- Create Event -->
<br>
<br>



<div id="popup2" class="overlay">
  <div class="popup">
    <div class="content">
	<table width="100%"><tr>
		<td><h4>DETAILS</h4></td>
		<td> <div align='right'>  <div ng-show="createbuttonshow"> 
     	<a href="#popup" class="button1" id="Button1" ng-click="addevent()"> Create </a>
		<a href="#popup" class="button1" id="Button1"  ng-click="showincidentlist()"> Close</a> </div>
     	</div> </td>
	</tr></table>   
    <h3>Event Details
	<hr color = "#C8CFF4" style="padding:0px; margin:5px;">
	Fill in the detail of the Event </h3>
	
	
      <table width="100%">

		<tr>
	      <td>
          	<h6>Event Name</h6>
			<input type="text"  placeholder="Event Name" ng-model="eventname">
          </td>
	      <td>
            <h6>Organizer</h6> 
			<input type="text"  placeholder="Oganizer" ng-model="eventorganizer">
          </td>
	  
	  </tr>
        <tr>
          <td> <h6>Start Time </h6>
			<input type="text"  placeholder="Start Time" ng-model="eventstarttime">
          </td>
		  <td> <h6>End Time </h6>
			<input type="text"  placeholder="end Time" ng-model="eventendtime">
          </td>
        </tr>
        <tr>
          <td>
            <h6>Event Supporter</h6>
            <input type="text"  placeholder="supporter" ng-model="eventsupp">
          </td>
          <td>
            <h6>Event Owner </h6>
            <input type="text" placeholder="owner"  ng-model="eventowner">
          </td>
        </tr>

        <tr>
          <td>
            <h6>Event Type </h6>
                <select ng-model="eventype">
					<option value="F1">F1</option>
					<option value="Concert">Concert</option>
					<option value="Summit">Summit</option>
				</select>
          </td>
          <td>
            <h6>Spectators </h6>
            <input type="text"  placeholder="spectator" ng-model="eventspec">
          </td>
        </tr>
		
		<tr>
          <td>
            <h6>Hotline Opening </h6>
			<input type="text"  placeholder="opening" ng-model="eventhotlineope">
          </td>
          <td>
            <h6>Hotline Closing </h6>
            <input type="text"  placeholder="closing" ng-model="eventhotlineclo">
          </td>
        </tr>
		<tr>
          <td>
            <h6>Person(s) in Charge</h6>
			<input type="text"  placeholder="in charge" ng-model="eventincharge">
          </td>
          <td>
            <h6>Command Post Number </h6>
            <input type="text"  placeholder="post no" ng-model="eventpostno">
          </td>
        </tr>
		<tr>
          <td>
            <h6>Event Bubble Position</h6>
			<input type="text"  placeholder="in charge" ng-model="eventbubbleposi">
          </td>
          <td>
            <h6>Event Bubble Size </h6>
            <input type="text"  placeholder="post no" ng-model="eventbubblesize">
          </td>
        </tr>		
      </table>
  <br>
	  <table width="100%">
		<tr>
	      <td colspan="3"><h3>Road Closures </h3></td>
		</tr>
		<tr >
	      <td colspan="3"><hr color = "#C8CFF4"  style="padding:0px; margin:0px;"></td>
		</tr>
		<tr>
	      <td><h6>Road Name</h6></td>
		  <td><h6>Open Time</h6></td>
		  <td><h6>Close Time</h6></td>
		</tr>
		<tr style="height:2px;">
	      <td> <input type="text"  placeholder="road name" ng-model="eventroadname"></td>
		  <td>{{eventstarttime}}</td>
		  <td>{{eventendtime}} </td>
		</tr>
		</table>
	  
	   <h6>Lanes Closure</h6> 
		<h6>LSH1  4 3 2 1  RSH1</h6>
		<h6>(+)add new lines</h6>
		<h6>(-)remove lines</h6>
		<h6>Add road closure for this event </h6> 
	<table width="100%"><tr>
		<td> 
     	<a href="#popup" class="button1" ng-click=""> Upload Road Closure </a>
		<a href="#popup" class="buttonRemove"  ng-click=""> Remove Road Closure</a> 
		<a href="#popup" class="buttonClosure" ng-click=""> Add Road Closure</a> 
     	</td>
	</tr>
	</table> 
	 
      
      

    </div>
  </div>
</div>
  </div>
</div>
<!-- end of Create Incident -->
</form>
  </body>
 
  
</html>