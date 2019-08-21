<html lang="en">
<head>
  <title>ccgrid viewta </title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <meta http-equiv="refresh" content="40" /> -->
    <link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="grid.css">
	<link rel="stylesheet" href="dropdownlistStyle.css">
	
 	<!-- <link rel="stylesheet" href="css/bootstrap.min.css">  -->
 	<script type="text/javascript"  src="jquery.js"></script> 
 	<script src="bootstrap.min.js"></script>
  	<script src="angular.min.js"></script>
  	<script type="text/javascript"  src="democontroller.js"></script> 
  	
	<!--  Chart 
	<script src="chart/Chart.js"></script>
	<script src="chart/jquery-3.3.1.min.js"></script>
	<script src="chart/allchart.js"></script>    -->
	
 	 <!-- Start of dynamic chart java Script  -->
 	 	<script src="canvasjs.min.js"></script>
 	 	<script type="text/javascript"  src="chartcanvas.js"></script> 
 	 <!-- End of dynamic chart java Script  -->
  	
	<!-- Start of modal map content  -->
		<script src="http://localhost:8080/itrans/arcgis_4.11/init.js"></script>  
		<script src="basemap411ta.js"></script>  
	
 <style>
 h4 {
  height: 30px;
  width: 462px;
  color: #ffffff;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 24px;
  font-weight: 100;
  line-height: 30px;
}

h5 {
  color: #ffffff;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 100;
  line-height: 30px;
}
h10 {
  color: #4dd2ff;
  font-weight: bold;
  font-size: 20px;
}
h11 {
  color: #4dd2ff;
  font-weight: bold;
  font-size: 18px;
}
 h12 {
  color: #ffffff;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 18px;
}

/*Right click Menu*/
#items{
	list-style:none;
	margin:0px;
	margin-top:2px;
	padding-left:3px;
	padding-right:5px;
	padding-bottom:3px;
	color: #ffffff;
}

/*** Modal design */
/* Modal Content */
.modal-content1 {
  position: relative;
  background-color: #fffcfc;
  margin: auto;
  left: 0;
  padding: 0;
  border: 1px solid #888;
  width: 95%;
  height: 95%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s
}

/* Inner Modal */
.modalInner {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 5; /* Sit on top */
  padding-top: 50px; /* Location of the box */
  padding-left: 50px; 
  left: 0;
  top: 0;
  width: 95%; /* Full width */
  height: 95%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0); /* Black w/ opacity */
}
</style>

</head>
<body>
<div class="container-fluid">
<div ng-app="ltaApp" ng-controller="ltaController">
	
	<table width="100%" style="background-color: rgba(49,53,81,0.5);"> 
			<tr> 
				<td> 
					<h4> <img src="titlelogobar.png" width="20px" height="18px">&nbsp; i-Transport 2.0 </h4>
				</td> 
				<td align="right">
				
					 <!--  <input type="text" size="15" placeholder="Search" ng-model="searchIncidentfromgrid"> 
					      <div class="inner-addon left-addon" style="color:#ffffff;">
					                <input type="text" class="form-control" placeholder="Search" />
								</div>
					<img src="alarm.JPG" width="40" height="28">  -->
								
				</td> 
			</tr>
		</table>
	<div class="grid-container">  
	  <!--  <div class="item1">
	  </div>  -->
	  
	  <div class="item2" ng-style="divItem2">
	  
		 <table width="100%">
			 <tr > 
			 <td>  
				<div ng-show="showinc">
					<h5>INCIDENT RECORD</h5>
				</div>
				<div ng-show="showworkorder">
					<h5>WORK ORDER</h5>
				</div>
				<div ng-show="showenv">
					<h5>ENVIRONMENTAL MONITORING LIST</h5>
				</div>
				<div ng-show="showtech">
					<h5>TECHNICAL ALARMS</h5>
				</div>
				<div ng-show="showrdwork">
					<h5>ROAD WORK</h5>
				</div>
				<div ng-show="showevent">
				<table> 
					<tr>
						<td>
							<h5>EVENTS </h5> 
						</td>
						<td width="50%" align="center">
							<!-- <a href="#" ng-click="createEventCall()" style="text-decoration:none;"> <h11>&nbsp; &nbsp; &nbsp; New Event </h11></a> -->
							
							<a href="createventbase.jsp" target="_blank" style="text-decoration:none;"> <h11>&nbsp; &nbsp; &nbsp; New Event </h11></a>
						</td>
					</tr>
				</table> 	
				</div>
			 </td>
			<!--  <td> <a href="createinc.jsp#popup" style="text-decoration:none;"> <font Color="#4dd2ff"> Click here to Incident </font> </a> </td>  -->
				<td align='right'>
				
							
					          <!--  
					          <div class="inner-addon left-addon" style="color:#ffffff;">
					          	<i class="glyphicon glyphicon-search"></i> 
					          </div> 
					          -->
					          <input type="text"  style="padding-left: 10px;" placeholder="Search" ng-model="searchIncidentfromgrid" />
       						
			   </td> 
			   <td> 	
			   		<div class="dropdown" style="float:right;">
							 <!-- <i class="fa fa-align-justify fa_custom"></i> -->
							 <img src="listimg.png" style="width:13px; height:13px;">
							 <div class="dropdown-content" style="float:left;">
								<div ng-hide="showinc">
									<a href="#"  style="text-decoration: none" ng-click="viewincitem2()">Incident Record</a>
								</div>	
								<div ng-hide="showworkorder">
									<a href="#"  style="text-decoration: none" ng-click="viewworkorderitem2()">Work Order</a>
								</div>	
								<div ng-hide="showtech">
									<a href="#"  style="text-decoration: none" ng-click="viewtecitem2()">Technical Alarms</a>
								</div>	
								<div ng-hide="showenv">
									<a href="#"  style="text-decoration: none" ng-click="viewenvirontem2()">Environment</a>
								</div>	
								<div ng-hide="showrdwork">
									<a href="#"  style="text-decoration: none" ng-click="viewrdworkitem2()">Road Work</a>
								</div>
								<div ng-hide="showevent">
									<a href="#"  style="text-decoration: none" ng-click="vieweventitem2()">Events</a>
								</div>										
									<img src="horibar.JPG" style="padding:5px; height:18px;" >
								<div ng-show="viewmergeflag">
									<a href="#"  style="text-decoration: none"  ng-click="viewmerge()">Merge up/down</a>	
								</div>																
								<div ng-show="splitflag">
									<a href="#"  style="text-decoration: none"  ng-click="splitmerge()">Split Panels</a>	
								</div>
								<div ng-show="viewhrmerge">
									<a href="#"  style="text-decoration: none" ng-click="mergeside()">Merge sideways</a>
								</div>
								<div ng-show="splithrview">
									<a href="#"  style="text-decoration: none"  ng-click="splitside()">Split sideways</a>
								</div>
						  </div>
						</div> 
				</td>
			 </tr>
			 </table>
			<br> <div ng-show="showinc">
				<table width="100%"> 
					 <tr><td>
						 <table width="98%" id="datatbl">
							<tr>
								<th width="10%"> <a href="#" ng-click="sortType = 'irid'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"><font style="font-size:16px;color:#ffffff">IR ID</font></a></th>
								<th width="25%"> <a href="#" ng-click="sortType = 'type'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Type</font></a></th>
								<th width="20%"> <a href="#" ng-click="sortType = 'state'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Status</font></a></th>
								<th width="10%"> <a href="#" ng-click="sortType = 'zone'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Zone</font> </a></th>
								<th width="23%"> <a href="#" ng-click="sortType = 'roadname'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Road Name</font></a></th>
								<th width="27%"> <a href="#" ng-click="sortType = 'lanes'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Lanes</font></a></th>
							</tr>
						 </table> 
					</td></tr>
					<tr><td>  
						<div class='scrollinc'>
							<table width="100%"  id="inctbl">
									<tr ng-repeat="inc in incidentRec | orderBy:sortType:sortReverseincfromgrid | filter:searchIncidentfromgrid">
										<td width="10%"><font color="#ffffff" size="2px">{{inc.irid}}</font></td>
										<td width="25%">
											<div ng-if="inc.type==='Accident'"><img src="accident.jpg"><font color="#ffffff" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Road Works'"><img src="roadwork.jpg"><font color="#ffffff" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Obstacle'"><img src="obstacle.jpg"><font color="#ffffff" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Break Down'"><img src="breakdown.jpg"><font color="#ffffff" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Heavy Traffic'"><img src="heavytraffic.jpg"><font color="#ffffff" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Mobile Road Works'"><img src="mobileroadwork.jpg"><font color="#ffffff" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Unattended Vehicle'"><img src="unattvehicle.jpg"><font color="#ffffff" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Miscellaneous'"><img src="misce.jpg"><font color="#ffffff" size="2px"> {{inc.type}}</font></div>
										</td>
										
										<td width="20%">
											<font color="#ffffff" size="2px"> {{inc.state}}</font>
										</td>
										<td width="10%"><font color="#ffffff" size="2px"> {{inc.zone}}</font></td>
										<td width="23%"><font color="#ffffff" size="2px"> {{inc.roadname}}</font></td>
										<td width="27%"><font color="#ffffff" size="2px"> {{inc.lanes}}</font></td>
									</tr>
							</table> 
						</div>
					</td></tr>
				</table> 		
			</div>
			
			<!-- ***************** -->
			<!-- Road Work -->
			<div ng-show="showrdwork">
				<table width="100%"> 
					 <tr><td>
						 <table width="98%" id="datatbl">
							<tr>
								<th width="10%"> <a href="#" ng-click="sortType = 'irid'; sortReverseroadwkfromgrid = !sortReverseroadwkfromgrid" style="text-decoration:none;"><font style="font-size:16px;color:#ffffff">IR ID</font></a></th>
								<th width="28%"> <a href="#" ng-click="sortType = 'type'; sortReverseroadwkfromgrid = sortReverseroadwkfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Type<i class="fa fa-caret-down" style="font-size:16px;color:#ffffff"> </i></font></a></th>
								<th width="20%"> <a href="#" ng-click="sortType = 'state'; sortReverseroadwkfromgrid = sortReverseroadwkfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Status</font></a></th>
								<th width="10%"> <a href="#" ng-click="sortType = 'zone'; sortReverseroadwkfromgrid = sortReverseroadwkfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Zone</font> </a></th>
								<th width="23%"> <a href="#" ng-click="sortType = 'roadname'; sortReverseroadwkfromgrid = sortReverseroadwkfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Road Name</font></a></th>
								<th width="29%"> <a href="#" ng-click="sortType = 'lanes'; sortReverseroadwkfromgrid = sortReverseroadwkfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Lanes</font></a></th>
							</tr>
						 </table> 
					</td></tr>
					<tr><td>  
						<div class='scrollinc'>
							<table width="100%"  id="inctbl">
									<tr ng-repeat="rdwork in roadworkRec | orderBy:sortType:sortReverseroadwkfromgrid | filter:searchIncidentfromgrid">
										<td width="10%"><font color="#ffffff" size="2px">{{rdwork.irid}}</font></td>
										<td width="28%">											
											<img src="roadwork.jpg"><font color="#ffffff" size="2px"> {{rdwork.type}}</font>
										</td>
										
										<td width="20%">
											<font color="#ffffff" size="2px"> {{rdwork.state}}</font>
										</td>
										<td width="10%"><font color="#ffffff" size="2px"> {{rdwork.zone}}</font></td>
										<td width="23%"><font color="#ffffff" size="2px"> {{rdwork.roadname}}</font></td>
										<td width="27%"><font color="#ffffff" size="2px"> {{rdwork.lanes}}</font></td>
									</tr>
							</table> 
						</div>
					</td></tr>
				</table> 		
			</div>
			
			
			<!-- ******************* -->
			<div ng-show="showworkorder">
						<table width="100%">  
						<tr><td>
					 <table width="98%" id="datatbl">
						<tr>
							<th width="20%"> <a href="#" ng-click="sortTypewo = 'date'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#ffffff" style="text-decoration:none;">Date</font></a></th>
							<th width="12%"> <a href="#" ng-click="sortTypewo = 'wonum'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#ffffff" style="text-decoration:none;">Wonum</font></a></th>
							<th width="30%"> <a href="#" ng-click="sortTypewo = 'descri'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#ffffff" style="text-decoration:none;">Description</font></a></th>
							<th width="20%"> <a href="#" ng-click="sortTypewo = 'status'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#ffffff" style="text-decoration:none;">Status</font></a></th>
							<th width="11%"> <a href="#" ng-click="sortTypewo = 'zone'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#ffffff" style="text-decoration:none;">Zone</font></a></th>
						</tr>
						</table>
				</td></tr>
				<tr><td> 				
						<div class='scrollinc'>
							<table width="100%"  id="inctbl">
								<tr ng-repeat="workOrder in workorderRec | orderBy:sortTypewo:sortReversewc | filter:searchIncidentfromgrid">
									<td width="20%"><font color="#ffffff" size="2px">{{workOrder.date}}</font></td>
									<td width="12%"><font color="#ffffff" size="2px">{{workOrder.wonum}}</font></td>
									<td width="30%"><font color="#ffffff" size="2px">{{workOrder.descri}}</font></td>
									<td width="20%">
										<div ng-if="workOrder.status==='ACTIVE'"> <a class="buttonact" style="color:black">{{workOrder.status}}</a></div> 
										<div ng-if="workOrder.status==='NOT ACTIVE'"> <a class="buttonnotact" style="color:black">{{workOrder.status}}</a></div> 
										<div ng-if="workOrder.status==='JOB DONE'"> <a class="buttonclose" style="color:black">{{workOrder.status}}</a></div> 
										<div ng-if="workOrder.status=='PENDING'"> <a class="buttonpending" style="color:black">{{workOrder.status}}</a></div>    
									</td>
									<td width="10%"><font color="#ffffff" size="2px">{{workOrder.zone}}</font></td>
								</tr>
							</table>  			
						</div>			
				</td></tr>
				</table> 	
			</div>
			
			<div ng-show="showenv">
				<table width="100%">  
					<tr><td>
					 <table width="98%" id="datatbl">
						<tr>
							<th width="16%"> <a href="#" ng-click="sortTypenv = 'startime'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#ffffff">Start Time</font></a></th>
							<th width="15%"> <a href="#" ng-click="sortTypenv = 'endtime'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#ffffff">End Time </font></a></th>
							<th width="10%"> <a href="#" ng-click="sortTypenv = 'alarmid'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#ffffff">Alarm ID</font></a></th>
							<th width="30%"> <a href="#" ng-click="sortTypenv = 'desc'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#ffffff">Description</font></a></th>
							<th width="10%"> <a href="#" ng-click="sortTypenv = 'status'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#ffffff">Status</font></a></th>
						</tr>
					</table> 
				</td></tr>
				<tr><td>
					<div class='scrollinc'>
						<table  id="inctbl" width="100%">
							<tr ng-repeat="envmoni in environmonitorec | orderBy:sortTypenv:sortReversenv | filter:searchIncidentfromgrid">
								<td width="16%"><font color="#ffffff" size="2px">{{envmoni.startime}}</font></td>
								<td width="15%"><font color="#ffffff" size="2px">{{envmoni.endtime}}</font></td>
								<td width="10%"><font color="#ffffff" size="2px">{{envmoni.alarmid}}</font></td>
								<td width="30%"><font color="#ffffff" size="2px">{{envmoni.desc}}</font></td>
								<td width="9%">
									<div ng-if="envmoni.status==='open'" > <a class="buttonact" style="color:black">{{envmoni.status | uppercase}}</a></div> 
									<div ng-if="envmoni.status=='close'" > <a class="buttonclose" style="color:black">{{envmoni.status | uppercase}}</a></div> 
									<div ng-if="envmoni.status==='in progress'" > <a class="buttonpending" style="color:black">{{envmoni.status | uppercase}}</a></div> 
								</td>
							</tr>
						</table> 
					</div>
				</td></tr>
				</table> 
			</div>
			
			<div ng-show="showtech">
		<table width="100%">  <tr><td>
				 <table width="98%" id="datatbl">
					<tr>
						<th width="19%"> <a href="#" ng-click="sortTypeta = 'startdate'; sortReverseta = !sortReverseta"  style="text-decoration:none;"><font style="font-size:16px;color:#ffffff">Start Time </font></a></th>
						<th width="15%"> <a href="#" ng-click="sortTypeta = 'alarmid'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Alarm ID</font></a></th>
						<th width="30%"> <a href="#" ng-click="sortTypeta = 'description'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Description </font></a></th>
						<th width="10%"> <a href="#" ng-click="sortTypeta = 'source'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Source</font></a></th>
						<th width="11%"> <a href="#" ng-click="sortTypeta = 'zone'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Zone</font></a></th>
						<th width="13%"> <a href="#" ng-click="sortTypeta = 'status'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Status</font></a></th>
					</tr>
				</table> 
			</td></tr>
			<tr><td>
				<div class='scrollinc'>
					<table  id="inctbl" width="100%">
						<tr ng-repeat="techalarm in technicalalarmrec | orderBy:sortTypeta:sortReverseta | filter:searchtechnicalAlarmfromgrid">
							<td width="20%"><font color="#ffffff" size="2px">{{techalarm.startdate}}</font></td>
							<td width="15%"><font color="#ffffff" size="2px">{{techalarm.alarmid}}</font></td>
							<td idth="30%"><font color="#ffffff" size="2px">{{techalarm.description}}</font></td>
							<td width="10%">
								<font color="#ffffff" size="2px">{{techalarm.source}}</font>
							</td>
							<td width="12%"><font color="#ffffff" size="2px">{{techalarm.zone}}</font></td>
							<td width="12%">
								<div ng-if="techalarm.status==='open'" > <a class="buttonact" style="color:black">{{techalarm.status | uppercase}}</a></div> 
								<div ng-if="techalarm.status=='close'" > <a class="buttonclose" style="color:black">{{techalarm.status | uppercase}}</a></div> 
								<div ng-if="techalarm.status==='in progress'" > <a class="buttonpending" style="color:black"> {{techalarm.status | uppercase}}</a></div> 							
							</td>
						</tr>
					</table> 
				</div>
			</td></tr></table> 	
			</div>
			<div ng-show="showevent">

	
			 <table>
			     <tr> 
			     	<td align="center"> <h10> {{noofeventToday}} </h10> <br><h12>Events(s) Today </h12> </td>
				 	<td align="center"> <h10> {{noofeventUpcome}} </h10> <br> <h12> &nbsp;&nbsp; &nbsp;&nbsp;  Upcoming Event </h12> </td>
				  </tr>
			  </table>
			<table width="100%"> <tr><td>
						 <table width="100%" id="datatbl">
							<tr>
								<th width="13%" align="center"> <a href="#" ng-click="sortType = 'type'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Type</font></a></th>
								<th width="19%" align="center"> <a href="#" ng-click="sortType = 'name'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Name</font></a></th>
								<th width="20%" align="center"> <a href="#" ng-click="sortType = 'location'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Location</font></a></th>
								<th width="11%" align="center"> <a href="#" ng-click="sortType = 'status'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Status</font></a></th>
								<th width="20%" align="center"> <a href="#" ng-click="sortType = 'start'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Start</font></a></th>
								<th width="1%" align="center"> <a href="#" ng-click="sortType = 'end'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">End</font></a></th>
								<th> </th>
							</tr>
						</table> 
					</td></tr>
					<tr><td>
						<div class='scrollinc'>
							<table   id="inctbl"  width="100%">
								<tr ng-repeat="event in eventRec | orderBy:sortType:sortReverse | filter:searchIncidentfromgrid">
									<td width="13%" align="left"><font color="#ffffff" size="2px">{{event.type}}</font></td>
									<td width="20%" align="left"><font color="#ffffff" size="2px">{{event.name}}</font></td>
									<td width="20%" align="left"><font color="#ffffff" size="2px">{{event.location}}</font></td>
									<td width="10%" align="left"> 
										<div ng-if="event.status==='APPROVED'" > <a class="buttonappro"  style="color:black">{{event.status | uppercase}}</a></div> 
										<div ng-if="event.status==='PLANNING'" > <a class="buttonplan" style="color:black">{{event.status | uppercase}}</a></div> 
										<div ng-if="event.status==='LIVE'" > <a class="buttonact" style="color:black">{{event.status | uppercase}}</a></div> 
										<div ng-if="event.status==='OVER'" > <a class="buttonclose" style="color:black">{{event.status | uppercase}}</a></div> 
									</td>
									<td width="20%" align="left"><font color="#ffffff" size="2px">{{event.start}}</font></td>
									<td width="32%" align="left"><font color="#ffffff" size="2px">{{event.end}}</font></td>
								</tr>
							</table> 
						</div>
					</td></tr>
			</table>   			
			</div>		
		</div>				  
	  
	  <div class="item3" ng-style="divItem3">
		<table width="100%">
			<tr> 
			 <td> <h5>WORK ORDER </h5><td>
			 <td align='right'>
				<input type="text" size="35" style="padding-left: 10px;" placeholder="Search"  ng-model="searchworkorderfromgrid"> 
			 </td>
			 <td> 	
			   		<div class="dropdown" style="float:right;">
							<!-- <i class="fa fa-align-justify fa_custom"></i>  -->
							<img src="listimg.png" style="width:13px; height:13px;">
							<div class="dropdown-content" style="float:left;">
								<a href="#" style="text-decoration: none">Incident Record</a>
								<a href="#" style="text-decoration: none">Technical Alarms</a>
								<a href="#" style="text-decoration: none">Environment</a>
								<a href="#" style="text-decoration: none">Events</a>
								<a href="#" style="text-decoration: none">Road Works</a>
								 	 <img src="horibar.JPG" style="padding:5px; height:18px;" >
								<a href="#" style="text-decoration: none">Merge up/down</a>
								<a href="#" style="text-decoration: none">Merge sideways</a>
							 </div>
				  </div> 
			</td>
			    
			 </tr>
		</table>
		<table>
			<tr>
				<td>
				<!--  progress bar  -->&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
				</td>
				<td>
				 <div id="barchartContainer" style="height: 100px; width:20%;"></div>   
				</td>
			</tr>
		</table>
		
		<br>
		<table width="100%">  <tr><td>
			 <table width="98%" id="datatbl">
				<tr>
					<th width="20%"> <a href="#" ng-click="sortTypewo = 'date'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#ffffff" style="text-decoration:none;">Date</font></a></th>
					<th width="12%"> <a href="#" ng-click="sortTypewo = 'wonum'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#ffffff" style="text-decoration:none;">Wonum</font></a></th>
					<th width="30%"> <a href="#" ng-click="sortTypewo = 'descri'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#ffffff" style="text-decoration:none;">Description</font></a></th>
					<th width="20%"> <a href="#" ng-click="sortTypewo = 'status'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#ffffff" style="text-decoration:none;">Status</font></a></th>
					<th width="11%"> <a href="#" ng-click="sortTypewo = 'zone'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#ffffff" style="text-decoration:none;">Zone</font></a></th>
				</tr>
				</table>
		</td></tr>
		<tr><td> 				
				<div class='scrollwc'>
					<table width="100%"  id="inctbl">
						<tr ng-repeat="workOrder in workorderRec | orderBy:sortTypewo:sortReversewc | filter:searchworkorderfromgrid">
							<td width="20%"><font color="#ffffff" size="2px">{{workOrder.date}}</font></td>
							<td width="12%"><font color="#ffffff" size="2px">{{workOrder.wonum}}</font></td>
							<td width="30%"><font color="#ffffff" size="2px">{{workOrder.descri}}</font></td>
							<td width="20%">
								<div ng-if="workOrder.status==='ACTIVE'"> <a class="buttonact" style="color:black">{{workOrder.status}}</a></div> 
								<div ng-if="workOrder.status==='NOT ACTIVE'"> <a class="buttonnotact" style="color:black">{{workOrder.status}}</a></div> 
								<div ng-if="workOrder.status==='JOB DONE'"> <a class="buttonclose" style="color:black">{{workOrder.status}}</a></div> 
								<div ng-if="workOrder.status=='PENDING'"> <a class="buttonpending" style="color:black">{{workOrder.status}}</a></div>    
							</td>
							<td width="10%"><font color="#ffffff" size="2px">{{workOrder.zone}}</font></td>
						</tr>
					</table>  			
				</div>			
		</td></tr></table> 	  
	  </div>
	  
	  <div class="item4" ng-style="divItem4">
			<table width="100%">
				 <tr> 
					<td> <h5>TECHNICAL ALARMS </h5></td>
					<td align='right'>
						<input type="text" size="35" style="padding-left: 10px;" placeholder="Search"  ng-model="searchtechnicalAlarmfromgrid"> 			 
					 </td> 
					 <td> 	
				   		<div class="dropdown" style="float:right;">
								 <!--  <i class="fa fa-align-justify fa_custom"></i>-->
								 <img src="listimg.png" style="width:13px; height:13px;">
								  <div class="dropdown-content" style="float:left;">
								<a href="#" style="text-decoration: none">Incident Record</a>
								<a href="#" style="text-decoration: none">Work Order</a>
								<a href="#" style="text-decoration: none">Environment</a>
								<a href="#" style="text-decoration: none">Events</a>
								<a href="#" style="text-decoration: none">Road Works</a>
								 	<img src="horibar.JPG" style="padding:5px; height:18px;" >
								<a href="#" style="text-decoration: none">Merge up/down</a>
								<a href="#" style="text-decoration: none">Merge sideways</a>
								  </div>
							</div> 
					</td>
				 </tr>
			 </table>	   
		<table>
			<tr>
				<td><!--  progress bar  --> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; </td>
				<td> <div id="linechartContainer" style="height: 100px; width:20%;"></div>  </td>
			</tr>
		</table>
			
				 
		    <br>
		<table width="100%">  <tr><td>
				 <table width="98%" id="datatbl">
					<tr>
						<th width="19%"> <a href="#" ng-click="sortTypeta = 'startdate'; sortReverseta = !sortReverseta"  style="text-decoration:none;"><font style="font-size:16px;color:#ffffff">Start Time </font></a></th>
						<th width="15%"> <a href="#" ng-click="sortTypeta = 'alarmid'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Alarm ID</font></a></th>
						<th width="30%"> <a href="#" ng-click="sortTypeta = 'description'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Description </font></a></th>
						<th width="10%"> <a href="#" ng-click="sortTypeta = 'source'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Source</font></a></th>
						<th width="11%"> <a href="#" ng-click="sortTypeta = 'zone'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Zone</font></a></th>
						<th width="13%"> <a href="#" ng-click="sortTypeta = 'status'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#ffffff">Status</font></a></th>
					</tr>
				</table> 
			</td></tr>
			<tr><td>
				<div class='scrollwc'>
					<table  id="inctbl" width="100%">
						<tr ng-repeat="techalarm in technicalalarmrec | orderBy:sortTypeta:sortReverseta | filter:searchtechnicalAlarmfromgrid">
							<td width="20%"><font color="#ffffff" size="2px">{{techalarm.startdate}}</font></td>
							<td width="15%"><font color="#ffffff" size="2px">{{techalarm.alarmid}}</font></td>
							<td idth="30%"><font color="#ffffff" size="2px">{{techalarm.description}}</font></td>
							<td width="10%">
								<font color="#ffffff" size="2px">{{techalarm.source}}</font>
							</td>
							<td width="12%"><font color="#ffffff" size="2px">{{techalarm.zone}}</font></td>
							<td width="12%">
								<div ng-if="techalarm.status==='open'" > <a class="buttonact" style="color:black">{{techalarm.status | uppercase}}</a></div> 
								<div ng-if="techalarm.status=='close'" > <a class="buttonclose" style="color:black">{{techalarm.status | uppercase}}</a></div> 
								<div ng-if="techalarm.status==='in progress'" > <a class="buttonpending" style="color:black"> {{techalarm.status | uppercase}}</a></div> 							
							</td>
						</tr>
					</table> 
				</div>
			</td></tr></table> 
	  </div>
	  

	  
	  <div class="item5" ng-style="divItem5">
			<table width="100%">
				 <tr> 
				 <td> <h5>TRAFFIC ALERTS</h5><td>
				 <td align='right'>
					<input type="text" size="35" style="padding-left: 10px;" placeholder="Search"  ng-model="searchEnvifromgrid"> 			 
				 </td>
				 <td> 	
			   		<div class="dropdown" style="float:right;">
							<!-- <i class="fa fa-align-justify fa_custom"></i>  -->
							<img src="listimg.png" style="width:13px; height:13px;">
							<div class="dropdown-content" style="float:left;">
								<a href="#" style="text-decoration: none">Incident Record</a>
								<a href="#" style="text-decoration: none">Technical Alarms</a>
								<a href="#" style="text-decoration: none">Environment</a>
								<a href="#" style="text-decoration: none">Events</a>
								<a href="#" style="text-decoration: none">Road Works</a>
								 	 <img src="horibar.JPG" style="padding:5px; height:18px;" >
								<a href="#" style="text-decoration: none">Merge up/down</a>
								<a href="#" style="text-decoration: none">Merge sideways</a>
							 </div>
				  </div> 
			</td>		 
				 </tr>
			 </table>
		   <br>
			<table width="100%">      	 	 
				<tr><td>
				 <table width="98%" id="datatbl">
					<tr>
						<th width="10%"> <a href="#" ng-click="sortTypenv = 'startime'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#ffffff">Status</font></a></th>
						<th width="13%"> <a href="#" ng-click="sortTypenv = 'endtime'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#ffffff">Time</font></a></th>
						<th width="16%"> <a href="#" ng-click="sortTypenv = 'alarmid'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#ffffff">Alert ID</font></a></th>
						<th width="14%"> <a href="#" ng-click="sortTypenv = 'desc'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#ffffff">Road Name</font></a></th>					
						<th width="18%"> <a href="#" ng-click="sortTypenv = 'status'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#ffffff">Description</font></a></th>
						<th width="12%"> <a href="#" ng-click="sortTypenv = 'status'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#ffffff">Source</font></a></th>
					</tr>
				</table> 
			</td></tr>
			<tr><td>
				<div class='scrollev'>
					
							<table  id="inctbl" width="100%">
									<tr ng-repeat="tralert in trafficalert | orderBy:sortTypenv:sortReversenv | filter:searchEnvifromgrid">
										<!-- 	 
											 <div ng-if="tralert.status=='Unverified'" >
										<td width="10%">
											  
												<font color="#ffffff" size="2px">{{tralert.status}}</font>
											</td>
										</div>  -->
										
										<td width="10%">
											<div ng-if="tralert.status=='Unverified'" > 	
												<font color="#ffffff" size="2px">{{tastatuschange}}</font>											
											</div>
											<div ng-if="tralert.status!='Unverified'" > 	
													<font color="#ffffff" size="2px">{{tralert.status}}</font>											
												</div>
										</td>													
									  
										<td width="13%">
										<div ng-if="tralert.rname=='CTE'" > 
											<font color="#ffffff" size="2px">{{accTrafficAlertTime}}</font>
										</div>
										<div ng-if="tralert.rname!='CTE'" > 
											<font color="#ffffff" size="2px">{{tralert.time}}</font>
										</div>
										</td>
										<td width="16%"><font color="#ffffff" size="2px">{{tralert.alertid | uppercase}}</font> </td>
										<td width="14%">
												<font color="#ffffff" size="2px">{{tralert.rname}}</font>
											</td>
										<td width="18%"><font color="#ffffff" size="2px">{{tralert.desc}}</font></td>
										<td width="12%"><font color="#ffffff" size="2px">{{tralert.source}}</font></td>
									</tr>
								</table> 

				</div>
			</td></tr>
			</table> 	
			
<!--  Traffic Alert Model window  -->			
			<div id="myModal" class="modalInner">
	  <!-- Modal content -->
	  <div class="modal-content1">
		  <!-- <span class="close">&times;</span> -->
		<div class="modal-body">      
			
<iframe src="createtabase.jsp" width="1310" height="563" scrolling="no" frameborder="0"> </iframe> 
		</div>
	</div>
	</div>
			
			
<!--  end of model window -->					
	  </div>  
	</div>  
</div>
</div> 
</body>
<script>
function acczonewindow(){
	  myModal.style.display = "block";
}
window.onclick = function(event) {
  if (event.target == myModal) {
	myModal.style.display = "none"; 
  }
}

</script>

</html>