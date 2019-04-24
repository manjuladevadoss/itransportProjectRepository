<!doctype html>
<html >
<title>Event</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="event.css">
	<link rel="stylesheet" href="dropdownlistStyle.css">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	 
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.dropdown-content a:hover {color: #4dd2ff; font-weight: bold;}
.dropdown-content {
 min-width: 160px;
 }
 .dropdown-content a {
  min-width: 160px;
 }
</style>

 
 </head>
  <body>
    <div class="container-fluid">
	<table  style="height: 98px; width: 444px;
  background: linear-gradient(177.75deg, rgba(0,0,0,0.2) 0%, rgba(0,0,0,0) 100%);">
		<tr> 
			<td><img src="itranslogo.png" width="88px" height="90px"></td>
	 		<td><h7>i-transport 2.0</h7> </td>
	 </tr>
	</table>
<br><br>
   	<div ng-app="ltaApp" ng-controller="ltaController">
		<table width="70%" align="Center" id="evenmaintbl" style="border: 2px solid #2D50AE;">  
		<tr><td>
		 <table width="100%" >
	     <tr> 
	     <td> <h10>EVENTS  </h10> </td>
	     <td><a href="createvent.jsp#createventpopup"  style="text-decoration:none;"> <font Color="#4dd2ff">Click Here to New Event </font></a> </td>
			<td style="text-align:right">
			<input type="text" size="35" placeholder="Search" ng-model="searchEvent"> 
				
		   </td> 
		   		   <td> 	
			   		<div class="dropdown" style="float:left;">
						<i class="fa fa-align-justify fa_custom"></i>
							  <div class="dropdown-content" style="float:left;">
							<a href="incidentTbl.jsp">Incident Record</a>
							<a href="workorderTbl.jsp"  style="text-decoration: none">Work Order</a>
							<a href="techalarmTbl.jsp" style="text-decoration: none">Technical Alarms</a>
							<a href="envmonTbl.jsp"  style="text-decoration: none">Environment</a>
							<a href="envmonTbl.jsp"  style="text-decoration: none">Road Works</a>
					 	</div>
					</div> 
				</td>
		 </tr>
		 </table>
		</td></tr>
		<tr><td>	 
			 <table width="30%">
			     <tr> 
			     	<td align="center"> <h10> {{noofeventToday}} </h10> <h4>Events(s) Today </h4> </td>
				 	<td align="center"> <h10> {{noofeventUpcome}} </h10> <h4>Upcoming Event </h4> </td>
				  </tr>
			  </table>
		</td></tr>
		
		<tr><td>
			<table width="100%"> <tr><td>
						 <table width="100%">
							<tr>
								<th width="15%"> <a href="#" ng-click="sortType = 'type'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:20px;color:#C8CFF4">Type</font>   <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></a></th>
								<th width="20%"> <a href="#" ng-click="sortType = 'name'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:20px;color:#C8CFF4">Name </font><i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></a></th>
								<th width="20%"> <a href="#" ng-click="sortType = 'location'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:20px;color:#C8CFF4">Location</font> <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></a></th>
								<th width="10%"> <a href="#" ng-click="sortType = 'status'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:20px;color:#C8CFF4">Status</font> <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></a></th>
								<th width="20%"> <a href="#" ng-click="sortType = 'start'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:20px;color:#C8CFF4">Start</font> <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></a></th>
								<th width="30%"> <a href="#" ng-click="sortType = 'end'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:20px;color:#C8CFF4">End </font><i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></a></th>
							</tr>
						</table> 
					</td></tr>
					<tr><td>
						<div class='scroll'>
							<table  id="eventbl" width="100%">
								<tr ng-repeat="event in eventRec | orderBy:sortType:sortReverse | filter:searchEvent">
									<td width="15%">{{event.type}}</td>
									<td width="20%">{{event.name}}</td>
									<td width="20%">{{event.location}}</td>
									<td width="10%"> 
										<div ng-if="event.status==='APPROVED'" > <a class="buttonappro"  style="color:black">{{event.status | uppercase}}</a></div> 
										<div ng-if="event.status==='PLANNING'" > <a class="buttonplan" style="color:black">{{event.status | uppercase}}</a></div> 
										<div ng-if="event.status==='LIVE'" > <a class="buttonact" style="color:black">{{event.status | uppercase}}</a></div> 
										<div ng-if="event.status==='OVER'" > <a class="buttonclose" style="color:black">{{event.status | uppercase}}</a></div> 
									</td>
									<td width="20%">{{event.start}}</td>
									<td width="30%">{{event.end}}</td>
								</tr>
							</table> 
						</div>
					</td></tr>
			</table>   			
						
		</td></tr></table>
	
   </div> 
</div>

</body>
</html>

