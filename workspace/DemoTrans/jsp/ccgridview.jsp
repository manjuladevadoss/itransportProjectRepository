<!DOCTYPE html>
<html lang="en">
<head>
  <title>ccgrid view each layer</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="grid.css">
	<link rel="stylesheet" href="dropdownlistStyle.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" >
	
	<!-- progresbar -->
	<link rel="stylesheet" href="progressbar.css">
	<link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Lato' >
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">  -->
 	
 	<link rel="stylesheet" href="css/bootstrap.min.css"> 
 	<script src="bootstrap.min.js"></script>
  	<script src="angular.min.js"></script>
  	<script type="text/javascript"  src="democontroller.js"></script> 
  	<script type="text/javascript"  src="jquery.js"></script> 
  	
  	<!-- progresbar -->
	<script type="text/javascript"  src="progressbar.js"></script> 
	
	<!--  Chart  -->
	<script src="chart/Chart.js"></script>
	<script src="chart/jquery-3.3.1.min.js"></script>
	<script src="chart/allchart.js"></script>
  	
 <style>
 h4 {
  height: 30px;
  width: 462px;
  color: #C8CFF4;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 24px;
  font-weight: 100;
  line-height: 30px;
}

h5 {
  color: #C8CFF4;
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
  color: #C8CFF4;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 18px;
}
</style>

<script></script>

</head>
<body>
<div class="container-fluid">
<div ng-app="ltaApp" ng-controller="ltaController">
	
	<div class="grid-container">  
	  <div class="item1">
		<table width="100%" style="background-color: rgba(49,53,81,0.5);"> 
			<tr> 
				<td> 
					<h4> <img src="titlelogobar.png" width="20px" height="18px">&nbsp; iTransport 2.0 </h4>
				</td> 
				<td align="right">
				
					 <input type="text" size="15" placeholder="Search" ng-model="searchIncidentfromgrid"> 
					     <!--   <div class="inner-addon left-addon" style="color:#C8CFF4;">
					                <input type="text" class="form-control" placeholder="Search" />
								</div> -->
					<img src="alarm.JPG" width="40" height="28"> 
								
				</td> 
			</tr>
		</table>
	  </div>
	  
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
							<a href="createventwin.jsp"  style="text-decoration:none;"> <h11>Click Here to New Event </h11></a>
						</td>
					</tr>
				</table> 	
				</div>
			 </td>
			<!--  <td> <a href="createinc.jsp#popup" style="text-decoration:none;"> <font Color="#4dd2ff"> Click here to Incident </font> </a> </td>  -->
				<td align='right'>
				
							<div class="inner-addon left-addon" style="color:#C8CFF4;">
					          <!--  <i class="glyphicon glyphicon-search"></i> -->
					          <input type="text" class="form-control" placeholder="Search" ng-model="searchIncidentfromgrid" />
       						</div>
			   </td> 
			   <td> 	
			   		<div class="dropdown" style="float:right;">
							 <i class="fa fa-align-justify fa_custom"></i>
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
									<img src="horibar1.JPG" style="padding:5px; height:18px;" >
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
								<th width="10%"> <a href="#" ng-click="sortType = 'irid'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"><font style="font-size:16px;color:#C8CFF4"> IR ID <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
								<th width="28%"> <a href="#" ng-click="sortType = 'type'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Type <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"> </i></font></a></th>
								<th width="20%"> <a href="#" ng-click="sortType = 'state'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Status <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
								<th width="10%"> <a href="#" ng-click="sortType = 'zone'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Zone <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font> </a></th>
								<th width="23%"> <a href="#" ng-click="sortType = 'roadname'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Road Name <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
								<th width="27%"> <a href="#" ng-click="sortType = 'lanes'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Lanes <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
							</tr>
						 </table> 
					</td></tr>
					<tr><td>  
						<div class='scrollinc'>
							<table width="100%"  id="inctbl">
									<tr ng-repeat="inc in incidentNewList | orderBy:sortType:sortReverseincfromgrid | filter:searchIncidentfromgrid">
										<td width="10%"><font color="#C8CFF4" size="2px">{{inc.irid}}</font></td>
										<td width="28%">
											<div ng-if="inc.type==='Accident'"><img src="accident.jpg"><font color="#C8CFF4" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Road Works'"><img src="roadwork.jpg"><font color="#C8CFF4" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Obstacle'"><img src="obstacle.jpg"><font color="#C8CFF4" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Break Down'"><img src="breakdown.jpg"><font color="#C8CFF4" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Heavy Traffic'"><img src="heavytraffic.jpg"><font color="#C8CFF4" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Mobile Road Works'"><img src="mobileroadwork.jpg"><font color="#C8CFF4" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Unattended Vehicle'"><img src="unattvehicle.jpg"><font color="#C8CFF4" size="2px"> {{inc.type}}</font></div>
											<div ng-if="inc.type==='Miscellaneous'"><img src="misce.jpg"><font color="#C8CFF4" size="2px"> {{inc.type}}</font></div>
										</td>
										
										<td width="20%">
											<font color="#C8CFF4" size="2px"> {{inc.state}}</font>
										</td>
										<td width="10%"><font color="#C8CFF4" size="2px"> {{inc.zone}}</font></td>
										<td width="23%"><font color="#C8CFF4" size="2px"> {{inc.roadname}}</font></td>
										<td width="27%"><font color="#C8CFF4" size="2px"> {{inc.lanes}}</font></td>
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
								<th width="10%"> <a href="#" ng-click="sortType = 'irid'; sortReverseroadwkfromgrid = !sortReverseroadwkfromgrid" style="text-decoration:none;"><font style="font-size:16px;color:#C8CFF4"> IR ID <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
								<th width="28%"> <a href="#" ng-click="sortType = 'type'; sortReverseroadwkfromgrid = sortReverseroadwkfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Type <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"> </i></font></a></th>
								<th width="20%"> <a href="#" ng-click="sortType = 'state'; sortReverseroadwkfromgrid = sortReverseroadwkfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Status <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
								<th width="10%"> <a href="#" ng-click="sortType = 'zone'; sortReverseroadwkfromgrid = sortReverseroadwkfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Zone <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font> </a></th>
								<th width="23%"> <a href="#" ng-click="sortType = 'roadname'; sortReverseroadwkfromgrid = sortReverseroadwkfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Road Name <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
								<th width="27%"> <a href="#" ng-click="sortType = 'lanes'; sortReverseroadwkfromgrid = sortReverseroadwkfromgrid" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Lanes <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
							</tr>
						 </table> 
					</td></tr>
					<tr><td>  
						<div class='scrollinc'>
							<table width="100%"  id="inctbl">
									<tr ng-repeat="rdwork in roadworkRec | orderBy:sortType:sortReverseroadwkfromgrid | filter:searchIncidentfromgrid">
										<td width="10%"><font color="#C8CFF4" size="2px">{{rdwork.irid}}</font></td>
										<td width="28%">											
											<img src="roadwork.jpg"><font color="#C8CFF4" size="2px"> {{rdwork.type}}</font>
										</td>
										
										<td width="20%">
											<font color="#C8CFF4" size="2px"> {{rdwork.state}}</font>
										</td>
										<td width="10%"><font color="#C8CFF4" size="2px"> {{rdwork.zone}}</font></td>
										<td width="23%"><font color="#C8CFF4" size="2px"> {{rdwork.roadname}}</font></td>
										<td width="27%"><font color="#C8CFF4" size="2px"> {{rdwork.lanes}}</font></td>
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
							<th width="20%"> <a href="#" ng-click="sortTypewo = 'date'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#C8CFF4" style="text-decoration:none;"> Date <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
							<th width="12%"> <a href="#" ng-click="sortTypewo = 'wonum'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#C8CFF4" style="text-decoration:none;"> Wonum <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
							<th width="30%"> <a href="#" ng-click="sortTypewo = 'descri'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#C8CFF4" style="text-decoration:none;"> Description <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
							<th width="20%"> <a href="#" ng-click="sortTypewo = 'status'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#C8CFF4" style="text-decoration:none;">Status <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
							<th width="10%"> <a href="#" ng-click="sortTypewo = 'zone'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#C8CFF4" style="text-decoration:none;">Zone <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
						</tr>
						</table>
				</td></tr>
				<tr><td> 				
						<div class='scrollwc'>
							<table width="100%"  id="inctbl">
								<tr ng-repeat="workOrder in workorderRec | orderBy:sortTypewo:sortReversewc | filter:searchIncidentfromgrid">
									<td width="20%"><font color="#C8CFF4" size="2px">{{workOrder.date}}</font></td>
									<td width="12%"><font color="#C8CFF4" size="2px">{{workOrder.wonum}}</font></td>
									<td width="30%"><font color="#C8CFF4" size="2px">{{workOrder.descri}}</font></td>
									<td width="20%">
										<div ng-if="workOrder.status==='ACTIVE'"> <a class="buttonact" style="color:black">{{workOrder.status}}</a></div> 
										<div ng-if="workOrder.status==='NOT ACTIVE'"> <a class="buttonnotact" style="color:black">{{workOrder.status}}</a></div> 
										<div ng-if="workOrder.status==='JOB DONE'"> <a class="buttonclose" style="color:black">{{workOrder.status}}</a></div> 
										<div ng-if="workOrder.status=='PENDING'"> <a class="buttonpending" style="color:black">{{workOrder.status}}</a></div>    
									</td>
									<td width="10%"><font color="#C8CFF4" size="2px">{{workOrder.zone}}</font></td>
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
							<th width="16%"> <a href="#" ng-click="sortTypenv = 'startime'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4"> Start Time <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
							<th width="17%"> <a href="#" ng-click="sortTypenv = 'endtime'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4"> End Time<i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i> </font></a></th>
							<th width="12%"> <a href="#" ng-click="sortTypenv = 'alarmid'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4"> Alarm ID <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
							<th width="40%"> <a href="#" ng-click="sortTypenv = 'desc'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4">Description <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
							<th width="10%"> <a href="#" ng-click="sortTypenv = 'status'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4">Status <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
						</tr>
					</table> 
				</td></tr>
				<tr><td>
					<div class='scroll'>
						<table  id="inctbl" width="100%">
							<tr ng-repeat="envmoni in environmonitorec | orderBy:sortTypenv:sortReversenv | filter:searchIncidentfromgrid">
								<td width="16%"><font color="#C8CFF4" size="2px">{{envmoni.startime}}</font></td>
								<td width="16%"><font color="#C8CFF4" size="2px">{{envmoni.endtime}}</font></td>
								<td width="10%"><font color="#C8CFF4" size="2px">{{envmoni.alarmid}}</font></td>
								<td width="40%"><font color="#C8CFF4" size="2px">{{envmoni.desc}}</font></td>
								<td width="10%">
									<div ng-if="envmoni.status==='open'" > <a class="buttonact" style="color:black">{{envmoni.status | uppercase}}</a></div> 
									<div ng-if="envmoni.status=='close'" > <a class="buttonclose" style="color:black">{{envmoni.status | uppercase}}</a></div> 
									<div ng-if="envmoni.status==='inprocess'" > <a class="buttonpending" style="color:black">{{envmoni.status | uppercase}}</a></div> 
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
							<th width="16%"> <a href="#" ng-click="sortTypenv = 'startime'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4"> Start Time <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
							<th width="17%"> <a href="#" ng-click="sortTypenv = 'endtime'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4"> End Time<i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i> </font></a></th>
							<th width="12%"> <a href="#" ng-click="sortTypenv = 'alarmid'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4"> Alarm ID <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
							<th width="40%"> <a href="#" ng-click="sortTypenv = 'desc'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4">Description <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
							<th width="10%"> <a href="#" ng-click="sortTypenv = 'status'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4">Status <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
						</tr>
					</table> 
				</td></tr>
				<tr><td>
					<div class='scroll'>
						<table  id="inctbl" width="100%">
							<tr ng-repeat="envmoni in environmonitorec | orderBy:sortTypenv:sortReversenv | filter:searchIncidentfromgrid">
								<td width="16%"><font color="#C8CFF4" size="2px">{{envmoni.startime}}</font></td>
								<td width="16%"><font color="#C8CFF4" size="2px">{{envmoni.endtime}}</font></td>
								<td width="10%"><font color="#C8CFF4" size="2px">{{envmoni.alarmid}}</font></td>
								<td width="40%"><font color="#C8CFF4" size="2px">{{envmoni.desc}}</font></td>
								<td width="10%">
									<div ng-if="envmoni.status==='open'" > <a class="buttonact" style="color:black">{{envmoni.status | uppercase}}</a></div> 
									<div ng-if="envmoni.status=='close'" > <a class="buttonclose" style="color:black">{{envmoni.status | uppercase}}</a></div> 
									<div ng-if="envmoni.status==='inprocess'" > <a class="buttonpending" style="color:black">{{envmoni.status | uppercase}}</a></div> 
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
								<th width="15%"> <a href="#" ng-click="sortType = 'type'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Type</font>   <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></a></th>
								<th width="20%"> <a href="#" ng-click="sortType = 'name'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Name </font><i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></a></th>
								<th width="20%"> <a href="#" ng-click="sortType = 'location'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Location</font> <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></a></th>
								<th width="10%"> <a href="#" ng-click="sortType = 'status'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Status</font> <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></a></th>
								<th width="20%"> <a href="#" ng-click="sortType = 'start'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Start</font> <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></a></th>
								<th width="30%"> <a href="#" ng-click="sortType = 'end'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">End </font><i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></a></th>
							</tr>
						</table> 
					</td></tr>
					<tr><td>
						<div class='scroll'>
							<table   id="inctbl"  width="100%">
								<tr ng-repeat="event in eventRec | orderBy:sortType:sortReverse | filter:searchIncidentfromgrid">
									<td width="15%"><font color="#C8CFF4" size="2px">{{event.type}}</font></td>
									<td width="20%"><font color="#C8CFF4" size="2px">{{event.name}}</font></td>
									<td width="20%"><font color="#C8CFF4" size="2px">{{event.location}}</font></td>
									<td width="10%"> 
										<div ng-if="event.status==='APPROVED'" > <a class="buttonappro"  style="color:black">{{event.status | uppercase}}</a></div> 
										<div ng-if="event.status==='PLANNING'" > <a class="buttonplan" style="color:black">{{event.status | uppercase}}</a></div> 
										<div ng-if="event.status==='LIVE'" > <a class="buttonact" style="color:black">{{event.status | uppercase}}</a></div> 
										<div ng-if="event.status==='OVER'" > <a class="buttonclose" style="color:black">{{event.status | uppercase}}</a></div> 
									</td>
									<td width="20%"><font color="#C8CFF4" size="2px">{{event.start}}</font></td>
									<td width="30%"><font color="#C8CFF4" size="2px">{{event.end}}</font></td>
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
				<input type="text" size="35" placeholder="Search" ng-model="searchworkorderfromgrid"> 
			 </td>
			 <td> 	
			   		<div class="dropdown" style="float:right;">
							<i class="fa fa-align-justify fa_custom"></i>
							<div class="dropdown-content" style="float:left;">
								<a href="incidentTbl.jsp"  style="text-decoration: none">Incident Record</a>
								<a href="techalarmTbl.jsp" style="text-decoration: none">Technical Alarms</a>
								<a href="envmonTbl.jsp"  style="text-decoration: none">Environment</a>
								<a href="eventTbl.jsp"  style="text-decoration: none">Events</a>
								<a href="envmonTbl.jsp"  style="text-decoration: none">Road Works</a>
								 	 <img src="horibar1.JPG" style="padding:5px; height:18px;" >
								<a href="ccgridmergeinc.jsp"  style="text-decoration: none">Merge up/down</a>
								<a href="ccgridmergeinc.jsp"  style="text-decoration: none">Merge sideways</a>
							 </div>
				  </div> 
			</td>
			    
			 </tr>
		</table>
		<table>
			<tr>
				<td>
				progress bar
				</td>
				<td>
				  <canvas id="myBarChart" style="width:120%; height:90%;"></canvas>
				</td>
			</tr>
		</table>
		
		<br>
		<table width="100%">  <tr><td>
			 <table width="98%" id="datatbl">
				<tr>
					<th width="20%"> <a href="#" ng-click="sortTypewo = 'date'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#C8CFF4" style="text-decoration:none;"> Date <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
					<th width="12%"> <a href="#" ng-click="sortTypewo = 'wonum'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#C8CFF4" style="text-decoration:none;"> Wonum <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
					<th width="30%"> <a href="#" ng-click="sortTypewo = 'descri'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#C8CFF4" style="text-decoration:none;"> Description <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
					<th width="20%"> <a href="#" ng-click="sortTypewo = 'status'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#C8CFF4" style="text-decoration:none;">Status <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
					<th width="10%"> <a href="#" ng-click="sortTypewo = 'zone'; sortReversewc = !sortReversewc"><font style="font-size:16px;color:#C8CFF4" style="text-decoration:none;">Zone <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
				</tr>
				</table>
		</td></tr>
		<tr><td> 				
				<div class='scrollwc'>
					<table width="100%"  id="inctbl">
						<tr ng-repeat="workOrder in workorderRec | orderBy:sortTypewo:sortReversewc | filter:searchworkorderfromgrid">
							<td width="20%"><font color="#C8CFF4" size="2px">{{workOrder.date}}</font></td>
							<td width="12%"><font color="#C8CFF4" size="2px">{{workOrder.wonum}}</font></td>
							<td width="30%"><font color="#C8CFF4" size="2px">{{workOrder.descri}}</font></td>
							<td width="20%">
								<div ng-if="workOrder.status==='ACTIVE'"> <a class="buttonact" style="color:black">{{workOrder.status}}</a></div> 
								<div ng-if="workOrder.status==='NOT ACTIVE'"> <a class="buttonnotact" style="color:black">{{workOrder.status}}</a></div> 
								<div ng-if="workOrder.status==='JOB DONE'"> <a class="buttonclose" style="color:black">{{workOrder.status}}</a></div> 
								<div ng-if="workOrder.status=='PENDING'"> <a class="buttonpending" style="color:black">{{workOrder.status}}</a></div>    
							</td>
							<td width="10%"><font color="#C8CFF4" size="2px">{{workOrder.zone}}</font></td>
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
						<input type="text" size="35" placeholder="Search" ng-model="searchtechnicalAlarmfromgrid"> 			 
					 </td> 
					 <td> 	
				   		<div class="dropdown" style="float:right;">
								  <i class="fa fa-align-justify fa_custom"></i>
								  <div class="dropdown-content" style="float:left;">
								<a href="incidentTbl.jsp" style="text-decoration: none">Incident Record</a>
								<a href="workorderTbl.jsp"  style="text-decoration: none">Work Order</a>
								<a href="envmonTbl.jsp"  style="text-decoration: none">Environment</a>
								<a href="eventTbl.jsp"  style="text-decoration: none">Events</a>
								<a href="envmonTbl.jsp"  style="text-decoration: none">Road Works</a>
								 	<img src="horibar1.JPG" style="padding:5px; height:18px;" >
								<a href="ccgridmergeinc.jsp"  style="text-decoration: none">Merge up/down</a>
								<a href="ccgridmergeinc.jsp"  style="text-decoration: none">Merge sideways</a>
								  </div>
							</div> 
					</td>
				 </tr>
			 </table>	   
		<table>
			<tr>
				<td>
				progress bar
					<!--  <div class="progress">
	    				<svg class="progress-circle" width="200px" height="200px" xmlns="http://www.w3.org/2000/svg">
		    				<circle class="progress-circle-back" cx="40" cy="40" r="34"></circle>
	        				<circle class="progress-circle-prog" cx="40" cy="40" r="34"></circle>
	    				</svg>
		  				<div class="progress-text" data-progress="0">0%</div>
	  				</div>	  
	  			-->
				</td>
				<td>
				 <canvas id="myChart" style="width:120%; height:90%;"></canvas>
				</td>
			</tr>
		</table>
			
				 
		    <br>
		<table width="100%">  <tr><td>
				 <table width="98%" id="datatbl">
					<tr>
						<th width="20%"> <a href="#" ng-click="sortTypeta = 'startdate'; sortReverseta = !sortReverseta"  style="text-decoration:none;"><font style="font-size:16px;color:#C8CFF4"> Start Time <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i> </font></a></th>
						<th width="15%"> <a href="#" ng-click="sortTypeta = 'alarmid'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4"> Alarm ID <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
						<th width="30%"> <a href="#" ng-click="sortTypeta = 'description'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4"> Description <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i> </font></a></th>
						<th width="10%"> <a href="#" ng-click="sortTypeta = 'source'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Source <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
						<th width="12%"> <a href="#" ng-click="sortTypeta = 'zone'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Zone <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
						<th width="12%"> <a href="#" ng-click="sortTypeta = 'status'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Status <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
					</tr>
				</table> 
			</td></tr>
			<tr><td>
				<div class='scrollwc'>
					<table  id="inctbl" width="100%">
						<tr ng-repeat="techalarm in technicalalarmrec | orderBy:sortTypeta:sortReverseta | filter:searchtechnicalAlarmfromgrid">
							<td width="20%"><font color="#C8CFF4" size="2px">{{techalarm.startdate}}</font></td>
							<td width="15%"><font color="#C8CFF4" size="2px">{{techalarm.alarmid}}</font></td>
							<td idth="30%"><font color="#C8CFF4" size="2px">{{techalarm.description}}</font></td>
							<td width="10%">
								<font color="#C8CFF4" size="2px">{{techalarm.source}}</font>
							</td>
							<td width="12%"><font color="#C8CFF4" size="2px">{{techalarm.zone}}</font></td>
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
				 <td> <h5>ENVIRONMENTAL MONITORING LIST</h5><td>
				 <td align='right'>
					<input type="text" size="35" placeholder="Search" ng-model="searchEnvifromgrid"> 			 
				 </td>
				 <td> 	
				   		<div class="dropdown" style="float:right;">
							<i class="fa fa-align-justify fa_custom"></i>
							<div class="dropdown-content" style="float:left;">
								<a href="incidentTbl.jsp" style="text-decoration: none">Incident Record</a>
								<a href="workorderTbl.jsp"  style="text-decoration: none">Work Order</a>
								<a href="techalarmTbl.jsp"  style="text-decoration: none">Technical Alarms</a>
								<a href="eventTbl.jsp"  style="text-decoration: none">Events</a>
								<a href="envmonTbl.jsp"  style="text-decoration: none">Road Works</a>
								 	 <img src="horibar1.JPG" style="padding:5px; height:18px;" >
								<a href="ccgridmergeinc.jsp"  style="text-decoration: none">Merge up/down</a>
								<a href="ccgridmergeinc.jsp"  style="text-decoration: none">Merge sideways</a>
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
						<th width="16%"> <a href="#" ng-click="sortTypenv = 'startime'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4"> Start Time <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
						<th width="17%"> <a href="#" ng-click="sortTypenv = 'endtime'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4"> End Time<i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i> </font></a></th>
						<th width="12%"> <a href="#" ng-click="sortTypenv = 'alarmid'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4"> Alarm ID <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
						<th width="40%"> <a href="#" ng-click="sortTypenv = 'desc'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4">Description <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
						<th width="10%"> <a href="#" ng-click="sortTypenv = 'status'; sortReversenv = !sortReversenv"><font style="font-size:16px;color:#C8CFF4">Status <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></font></a></th>
					</tr>
				</table> 
			</td></tr>
			<tr><td>
				<div class='scroll'>
					<table  id="inctbl" width="100%">
						<tr ng-repeat="envmoni in environmonitorec | orderBy:sortTypenv:sortReversenv | filter:searchEnvifromgrid">
							<td width="16%"><font color="#C8CFF4" size="2px">{{envmoni.startime}}</font></td>
							<td width="16%"><font color="#C8CFF4" size="2px">{{envmoni.endtime}}</font></td>
							<td width="10%"><font color="#C8CFF4" size="2px">{{envmoni.alarmid}}</font></td>
							<td width="40%"><font color="#C8CFF4" size="2px">{{envmoni.desc}}</font></td>
							<td width="10%">
								<div ng-if="envmoni.status==='open'" > <a class="buttonact" style="color:black">{{envmoni.status | uppercase}}</a></div> 
								<div ng-if="envmoni.status=='close'" > <a class="buttonclose" style="color:black">{{envmoni.status | uppercase}}</a></div> 
								<div ng-if="envmoni.status==='inprocess'" > <a class="buttonpending" style="color:black">{{envmoni.status | uppercase}}</a></div> 
							</td>
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