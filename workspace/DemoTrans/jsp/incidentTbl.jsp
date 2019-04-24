<!doctype html>
<html >
<title>Incident</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="grid.css">
	 <link rel="stylesheet" href="dropdownlistStyle.css">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.dropdown-content a:hover {color: #274A92; font-weight: bold;}

#incidenttbl {
  border-collapse: collapse;
  padding: 3px;
}

#incidenttbl td {
  border: 0px solid #ddd;
  color: white;
  padding: 5px;
}

#incidenttbl th #wotbl tr {
  color: white;
  padding: 5px;
}

#incidenttbl tr:nth-child(odd){
 background-image: linear-gradient( 90deg,	rgba(55,63,97,1) , rgba(25,31,57,1));
  border: 1px solid;
  color: radial-gradient(circle, #293E78 0%, #14192D 100%);
}

#incidenttbl tr:nth-child(even){
 background-image: linear-gradient( 90deg,	rgba(55,63,97,1) , rgba(25,31,57,1));
  border: 1px solid;
  color: radial-gradient(circle, #293E78 0%, #14192D 100%);
}

#incidenttbl tr:hover {
background-image: linear-gradient( 90deg,	rgba(98,55,55,1) , rgba(39,26,57,1));
}
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
		<table width="70%" align="Center" id="evenmaintbl" cellpadding="10px" style="border: 2px solid #274A92;">  
		<tr><td>
		 <table width="100%" >
	     <tr> 
	     <td> <h10>INCIDENT </h10> </td>
	     <td>
			<div align='right'> 
			<input type="text" size="35" placeholder="Search" ng-model="searchIncidentfromgrid"> 				
			</div> 
		   </td>
		   	<td> 	
			   		<div class="dropdown" style="float:left;">
						<i class="fa fa-align-justify fa_custom"></i>
							  <div class="dropdown-content" style="float:left;">
							<a href="workorderTbl.jsp"  style="text-decoration: none">Work Order</a>
							<a href="techalarmTbl.jsp">Technical Alarms</a>
							<a href="eventTbl.jsp">Events</a>
							<a href="envmonTbl.jsp">Environment</a>
							<a href="envmonTbl.jsp"  style="text-decoration: none">Road Works</a>
					 	</div>
					</div> 
			</td> 
		 </tr>
		 </table>
		</td></tr>
		
		<tr><td>
			<table width="100%">  <tr><td>
						 <table width="100%">
							<tr>
								<th width="10%"> <a href="#" ng-click="sortType = 'irid'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"><font style="font-size:18px;color:#C8CFF4"> IR ID <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
								<th width="28%"> <a href="#" ng-click="sortType = 'type'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:18px;color:#C8CFF4">Type <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"> </i></font></a></th>
								<th width="20%"> <a href="#" ng-click="sortType = 'state'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:18px;color:#C8CFF4">Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
								<th width="10%"> <a href="#" ng-click="sortType = 'zone'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:18px;color:#C8CFF4">Zone <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font> </a></th>
								<th width="23%"> <a href="#" ng-click="sortType = 'roadname'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:18px;color:#C8CFF4">Road Name <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
								<th width="27%"> <a href="#" ng-click="sortType = 'lanes'; sortReverseincfromgrid = !sortReverseincfromgrid" style="text-decoration:none;"> <font style="font-size:18px;color:#C8CFF4">Lanes <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
							</tr>
						</table> 
					</td></tr>
					<tr><td>
						<div class='scrollwcindiv'>
							<table  id="incidenttbl" width="100%">
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
										<td width="20%">
											<div ng-if="inc.state==='notified'"> <a class="buttonact" style="color:black">{{inc.state | uppercase}}</a></div> 
											<div ng-if="inc.state==='confirmed'"> <a class="buttonnotact" style="color:black">{{inc.state | uppercase}}</a></div> 
											<div ng-if="inc.state==='over'"> <a class="buttonclose" style="color:black">{{inc.state | uppercase}}</a></div> 
											<div ng-if="inc.state=='in progress'"> <a class="buttonpending" style="color:black">{{inc.state | uppercase}}</a></div>
										</td>
										<td width="10%"><font color="#C8CFF4" size="3"> {{inc.zone}}</font></td>
										<td width="23%"><font color="#C8CFF4" size="3"> {{inc.roadname}}</font></td>
										<td width="27%"><font color="#C8CFF4" size="3"> {{inc.lanes}}</font></td>
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

