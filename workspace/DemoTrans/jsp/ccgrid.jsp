<!DOCTYPE html>
<html lang="en">
<head>
  <title>ccgrid</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="grid.css">
	<link rel="stylesheet" href="dropdownlistStyle.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 	<script src="bootstrap.min.js"></script>
  	<script src="angular.min.js"></script>
  	<script type="text/javascript"  src="democontroller.js"></script> 
  	<script type="text/javascript"  src="jquery.js"></script> 
 <style>
</style>
</head>
<body>

<div class="container-fluid">
<div ng-app="ltaApp" ng-controller="ltaController">
	
	<div class="grid-container">  
	  <div class="item1">
		<table width="100%"> 
			<tr> 
				<td> 
					<h4> <img src="cormenu.jpg" width="15" height="15"> iTransport 2.0 </h4>
				</td> 
				<td >
					<div align="right"> <input type="text" size="15" placeholder="Search" ng-model="searchIncidentfromgrid">	<img src="alarm.JPG" width="40" height="28"> </div>					
				</td> 
			</tr>
		</table>
	  </div>
	  
	  <div class="item2">
		 <table width="100%">
			 <tr > 
			 <td> <h5>INCIDENT RECORD</h5> <a href="createinc.jsp#popup"> Create Incident </a> </td>
				<td align='right'>
					 <input type="text" size="35" placeholder="Search" ng-model="searchIncidentfromgrid"> 
				<ul>
					  <li><p><img src="cormenu.jpg" width="15" height="15"></p> 
					  <ul>
						<li> <a href="workorderTbl.jsp"  style="text-decoration: none"><font color="white">Work Order</font></a></li>
						<li><a href="techalarmTbl.jsp" style="text-decoration: none"><font color="white">Technical Alarms</font></a></li>
								<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Environment</font></a></li>
								<li><a href="eventTbl.jsp"  style="text-decoration: none"><font color="white">Events</font></a></li>
								<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Road Works</font></a></li>
								<hr color = "#C8CFF4"  style="padding:1px; margin:1px;">
								<li><a href="ccgridmergeinc.jsp"  style="text-decoration: none"><font color="white">Merge up/down</font></a></li>
								<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Merge sideways</font></a></li>
						</ul></li>
					</ul>					 
			   </td> 
			 </tr>
			 </table>
			<br>
			<table width="100%"> 
				 <tr><td>
					<table width="98%">  
						<tr >
							<th width="10%"> <a href="#" ng-click="sortType = 'irid'; sortReverseincfromgrid = !sortReverseincfromgrid"><h4> IR ID <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
							<th width="28%"> <a href="#" ng-click="sortType = 'type'; sortReverseincfromgrid = !sortReverseincfromgrid"> <h4>Type <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"> </i></h4></a></th>
							<th width="20%"> <a href="#" ng-click="sortType = 'state'; sortReverseincfromgrid = !sortReverseincfromgrid"> <h4>State <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
							<th width="10%"> <a href="#" ng-click="sortType = 'zone'; sortReverseincfromgrid = !sortReverseincfromgrid"> <h4>Zone <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4> </a></th>
							<th width="23%"> <a href="#" ng-click="sortType = 'roadname'; sortReverseincfromgrid = !sortReverseincfromgrid"> <h4>Road Name <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
							<th width="27%"> <a href="#" ng-click="sortType = 'lanes'; sortReverseincfromgrid = !sortReverseincfromgrid"> <h4>Lanes <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
						</tr>
					 </table> 
				</td></tr>
				<tr><td>  
					<div class='scroll'>
						<table border="1" width="100%">
								<tr ng-repeat="inc in incidentNewList | orderBy:sortType:sortReverseincfromgrid | filter:searchIncidentfromgrid">
									<td width="10%"><font color="#C8CFF4" size="3">{{inc.irid}}</font></td>
									<td width="28%">
										<div ng-if="inc.type==='Accident'"><img src="accident.jpg"><font color="#C8CFF4" size="3"> {{inc.type}}</font></div>
										<div ng-if="inc.type==='Road Works'"><img src="roadwork.jpg"><font color="#C8CFF4" size="3"> {{inc.type}}</font></div>
										<div ng-if="inc.type==='Obstacle'"><img src="obstacle.jpg"><font color="#C8CFF4" size="3"> {{inc.type}}</font></div>
										<div ng-if="inc.type==='Break Down'"><img src="breakdown.jpg"><font color="#C8CFF4" size="3"> {{inc.type}}</font></div>
										<div ng-if="inc.type==='Heavy Traffic'"><img src="heavytraffic.jpg"><font color="#C8CFF4" size="3"> {{inc.type}}</font></div>
										<div ng-if="inc.type==='Mobile Road Works'"><img src="mobileroadwork.jpg"><font color="#C8CFF4" size="3"> {{inc.type}}</font></div>
										<div ng-if="inc.type==='Unattended Vehicle'"><img src="unattvehicle.jpg"><font color="#C8CFF4" size="3"> {{inc.type}}</font></div>
										<div ng-if="inc.type==='Miscellaneous'"><img src="misce.jpg"><font color="#C8CFF4" size="3"> {{inc.type}}</font></div>
									</td>
									<td width="20%"><font color="#C8CFF4" size="3"> {{inc.state}}</font></td>
									<td width="10%"><font color="#C8CFF4" size="3"> {{inc.zone}}</font></td>
									<td width="23%"><font color="#C8CFF4" size="3"> {{inc.roadname}}</font></td>
									<td width="27%"><font color="#C8CFF4" size="3"> {{inc.lanes}}</font></td>
								</tr>
						</table> 
					</div>
				</td></tr>
			</table> 
		</div>
				  
	 
	  
	  <div class="item3">
		<table width="100%">
			<tr> 
			 <td> <h5>WORK ORDER </h5><td>
			<td align='right'>
				<input type="text" size="35" placeholder="Search" ng-model="searchworkorderfromgrid"> 
				<ul>
					  <li><p><img src="cormenu.jpg" width="15" height="15"></p> 
					  <ul>
						<li> <a href="createinc.jsp"  style="text-decoration: none"><font color="white">Incident Record</font></a></li>
						<li><a href="techalarmTbl.jsp" style="text-decoration: none"><font color="white">Technical Alarms</font></a></li>
								<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Environment</font></a></li>
								<li><a href="eventTbl.jsp"  style="text-decoration: none"><font color="white">Events</font></a></li>
								<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Road Works</font></a></li>
								<hr color = "#C8CFF4"  style="padding:1px; margin:1px;">
								<li><a href="ccgridmergeinc.jsp"  style="text-decoration: none"><font color="white">Merge up/down</font></a></li>
								<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Merge sideways</font></a></li>
						</ul></li>
					</ul>					 
			   </td> 
			 </tr>
		</table>
		
		<img src="workorderchart.JPG" width="60%" height="30%">
		<br>
		<table width="100%">  <tr><td>
			 <table width="98%">
				<tr>
					<th width="20%"> <a href="#" ng-click="sortTypewo = 'date'; sortReversewc = !sortReversewc"><h4> Date <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th width="12%"> <a href="#" ng-click="sortTypewo = 'wonum'; sortReversewc = !sortReversewc"><h4> Wonum <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th width="30%"> <a href="#" ng-click="sortTypewo = 'descri'; sortReversewc = !sortReversewc"><h4> Description <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th width="20%"> <a href="#" ng-click="sortTypewo = 'status'; sortReversewc = !sortReversewc"><h4>Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th width="10%"> <a href="#" ng-click="sortTypewo = 'zone'; sortReversewc = !sortReversewc"><h4>Zone <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
				</tr>
				</table>
		</td></tr>
		<tr><td> 				
				<div class='scrollwc'>
					<table border="1" width="100%" >
						<tr ng-repeat="workOrder in workorderRec | orderBy:sortTypewo:sortReversewc | filter:searchworkorderfromgrid">
							<td width="20%"><font color="#C8CFF4" size="3">{{workOrder.date}}</font></td>
							<td width="12%"><font color="#C8CFF4" size="3">{{workOrder.wonum}}</font></td>
							<td width="30%"><font color="#C8CFF4" size="3">{{workOrder.descri}}</font></td>
							<td width="20%">
								<div ng-if="workOrder.status==='ACTIVE'"> <a class="buttonact">{{workOrder.status}}</a></div> 
								<div ng-if="workOrder.status==='NOT ACTIVE'"> <a class="buttonnotact">{{workOrder.status}}</a></div> 
								<div ng-if="workOrder.status!=='NOT ACTIVE' && workOrder.status!=='ACTIVE'"> <a class="buttonnotact">{{workOrder.status}}</a></div>   
							</td>
							<td width="10%"><font color="#C8CFF4" size="3">{{workOrder.zone}}</font></td>
						</tr>
					</table>  			
				</div>			
		</td></tr></table> 	  
	  </div>
	  
	  <div class="item4">
			<table width="100%">
				 <tr> 
					<td> <h5>TECHNICAL ALARMS 12 </h5><td>
					<td align='right'>
						<input type="text" size="35" placeholder="Search" ng-model="searchtechnicalAlarmfromgrid"> 
						<ul>
							 <li><p><img src="cormenu.jpg" width="15" height="15"></p> 
							  <ul>
								<li> <a href="createinc.jsp"  style="text-decoration: none"><font color="white">Incident Record</font></a></li>
								<li><a href="workorderTbl.jsp" style="text-decoration: none"><font color="white">Work Order</font></a></li>
								<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Environment</font></a></li>
								<li><a href="eventTbl.jsp"  style="text-decoration: none"><font color="white">Events</font></a></li>
								<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Road Works</font></a></li>
								<hr color = "#C8CFF4"  style="padding:1px; margin:1px;">
								<li><a href="ccgridmergeinc.jsp"  style="text-decoration: none"><font color="white">Merge up/down</font></a></li>
								<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Merge sideways</font></a></li>
							 </ul></li>
							</ul>					 
					 </td> 
				 </tr>
			 </table>	   
			<img src="alarmchart.JPG" width="60%" height="30%">		 
		    <br>
		<table width="100%">  <tr><td>
				 <table width="98%">
					<tr>
						<th width="20%"> <a href="#" ng-click="sortTypeta = 'startdate'; sortReverseta = !sortReverseta"><h4> Start Time <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </h4></a></th>
						<th width="15%"> <a href="#" ng-click="sortTypeta = 'alarmid'; sortReverseta = !sortReverseta"> <h4> Alarm ID <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
						<th width="33%"> <a href="#" ng-click="sortTypeta = 'description'; sortReverseta = !sortReverseta"> <h4> Description <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </h4></a></th>
						<th width="10%"> <a href="#" ng-click="sortTypeta = 'source'; sortReverseta = !sortReverseta"> <h4>Source <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
						<th width="12%"> <a href="#" ng-click="sortTypeta = 'zone'; sortReverseta = !sortReverseta"> <h4>Zone <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
						<th width="12%"> <a href="#" ng-click="sortTypeta = 'status'; sortReverseta = !sortReverseta"> <h4>Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					</tr>
				</table> 
			</td></tr>
			<tr><td>
				<div class='scrollwc'>
					<table border="1" width="100%">
						<tr ng-repeat="techalarm in technicalalarmrec | orderBy:sortTypeta:sortReverseta | filter:searchtechnicalAlarmfromgrid">
							<td width="20%"><font color="#C8CFF4" size="3">{{techalarm.startdate}}</font></td>
							<td width="15%"><font color="#C8CFF4" size="3">{{techalarm.alarmid}}</font></td>
							<td idth="33%"><font color="#C8CFF4" size="3">{{techalarm.description}}</font></td>
							<td width="10%">
								<font color="#C8CFF4" size="3">{{techalarm.source}}</font>
							</td>
							<td width="12%"><font color="#C8CFF4" size="3">{{techalarm.zone}}</font></td>
							<td width="12%">
							
							<div ng-if="techalarm.status==='open'"> <a class="buttonact"> {{techalarm.status  | uppercase}}</a></div>
							<div ng-if="techalarm.status!=='open'"><font color="#C8CFF4" size="3"> {{techalarm.status}}</font></div>
							
							</td>
						</tr>
					</table> 
				</div>
			</td></tr></table> 
	  </div>
	  

	  
	  <div class="item5">
			<table width="100%">
				 <tr> 
				 <td> <h5>ENVIRONMENTAL MONITORING LIST</h5><td>
				 <td align='right'>
					<input type="text" size="35" placeholder="Search" ng-model="searchEnvifromgrid"> 
						<ul>
						  <li><p><img src="cormenu.jpg" width="15" height="15"></p> 
						  <ul>
							<li> <a href="createinc.jsp"  style="text-decoration: none"><font color="white">Incident Record</font></a></li>
							<li><a href="workorderTbl.jsp" style="text-decoration: none"><font color="white">Work Order</font></a></li>
							<li><a href="techalarmTbl.jsp"  style="text-decoration: none"><font color="white">Technical Alarms</font></a></li>
							<li><a href="eventTbl.jsp"  style="text-decoration: none"><font color="white">Events</font></a></li>
							<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Road Works</font></a></li>
							<hr color = "#C8CFF4"  style="padding:1px; margin:1px;">
							<li><a href="ccgridmergeinc.jsp"  style="text-decoration: none"><font color="white">Merge up/down</font></a></li>
							<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Merge sideways</font></a></li>
							</ul></li>
						</ul>					 
				 </td></tr>
			 </table>
		   <br>
			<table width="100%">  <tr><td>
				<table width="98%">
					<tr>
						<th width="16%"> <a href="#" ng-click="sortTypenv = 'startime'; sortReversenv = !sortReversenv"><h4> Start Time <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
						<th width="17%"> <a href="#" ng-click="sortTypenv = 'endtime'; sortReversenv = !sortReversenv"><h4> End Time<i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </h4></a></th>
						<th width="12%"> <a href="#" ng-click="sortTypenv = 'alarmid'; sortReversenv = !sortReversenv"><h4> Alarm ID <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
						<th width="40%"> <a href="#" ng-click="sortTypenv = 'desc'; sortReversenv = !sortReversenv"><h4>Description <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
						<th width="10%"> <a href="#" ng-click="sortTypenv = 'status'; sortReversenv = !sortReversenv"><h4>Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					</tr>
				</table> 
			</td></tr>
			<tr><td>
				<div class='scroll'>
					<table border="1" width="100%">
						<tr ng-repeat="envmoni in environmonitorec | orderBy:sortTypenv:sortReversenv | filter:searchEnvifromgrid">
							<td width="16%"><font color="#C8CFF4" size="3">{{envmoni.startime}}</font></td>
							<td width="16%"><font color="#C8CFF4" size="3">{{envmoni.endtime}}</font></td>
							<td width="10%"><font color="#C8CFF4" size="3">{{envmoni.alarmid}}</font></td>
							<td width="40%"><font color="#C8CFF4" size="3">{{envmoni.desc}}</font></td>
							<td width="10%">
								<div ng-if="envmoni.status==='open'" > <a class="buttonact">{{envmoni.status | uppercase}}</a></div> 
								<div ng-if="envmoni.status!=='open'" ><font color="#C8CFF4" size="3">{{envmoni.status}}</font></div> 
							</td >
							
							</tr>
					</table> 
				</div>
			</td></tr></table> 			
	  </div>  
	</div>  
</div>
</div> 
</body>
</html>