<!doctype html>
<html >
<title>incident Record</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="incident.css">
	 <link rel="stylesheet" href="dropdownstyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
  	   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

table td{
	padding:4px;
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
<div class="content">
   <div ng-app="ltaApp" ng-controller="ltaController">

   <table width="100%">
     <tr > 
     <td> <h5>Incident Record </h5> <td>
		<td>
		<div align='right'> 
			<p> <input type="text" size="35" placeholder="Search" ng-model="searchIncident">  </P>
			
		</div> 
	   </td> 
	   <td>
		   <div class="dropdown">
			<p>&nbsp;<img src="cormenu.jpg" width="15" height="15"> </p>
				<div class="dropdown-content">
					<a href="workorderTbl.jsp">Work Order</a>
					<a href="techalarmTbl.jsp">Technical Alarms</a>
					<a href="envmonTbl.jsp">Environment</a>
					<a href="eventTbl.jsp">Events</a>
					<a href="envmonTbl.jsp">Road Works</a>
					 <hr color = "#C8CFF4"  style="padding:0px; margin:0px;">
					<a href="envmonTbl.jsp">Merge up/down</a>
					<a href="envmonTbl.jsp">Merge sideways</a>
				</div>
			</div>
		</td>
	 </tr>
	 </table>
    <br>
<table width="100%"> 
	 <tr><td>
		<table width="98%">  
			<tr>
				<th width="10%"> <a href="#" ng-click="sortType = 'irid'; sortReverse = !sortReverse"><h4> IR ID <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
				<th width="28%"> <a href="#" ng-click="sortType = 'type'; sortReverse = !sortReverse"> <h4>Type <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
				<th width="20%"> <a href="#" ng-click="sortType = 'state'; sortReverse = !sortReverse"> <h4>State <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
				<th width="10%"> <a href="#" ng-click="sortType = 'zone'; sortReverse = !sortReverse"> <h4>Zone <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4> </a></th>
				<th width="23%"> <a href="#" ng-click="sortType = 'roadname'; sortReverse = !sortReverse"> <h4>Road Name <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
				<th width="27%"> <a href="#" ng-click="sortType = 'lanes'; sortReverse = !sortReverse"> <h4>Lanes <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
			</tr>
	 	 </table> </td></tr>
	 <tr><td> 	
		 <div class='scroll'>
			 <table border="1" width="100%">  
			  <tbody>
					<tr ng-repeat="incident in incidentRec | orderBy:sortType:sortReverse | filter:searchIncident">
						<td width="10%"><font color="#C8CFF4" size="3">{{incident.irid}}<font color="#C8CFF4" size="3"></td>
						<td width="28%">
							<div ng-if="incident.type==='Accident'"><img src="accident.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
							<div ng-if="incident.type==='Road Works'"><img src="roadwork.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
							<div ng-if="incident.type==='Obstacle'"><img src="obstacle.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
							<div ng-if="incident.type==='Break Down'"><img src="breakdown.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
							<div ng-if="incident.type==='Heavy Traffic'"><img src="heavytraffic.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
							<div ng-if="incident.type==='Mobile Road Works'"><img src="mobileroadwork.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
							<div ng-if="incident.type==='Unattended Vehicle'"><img src="unattvehicle.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
							<div ng-if="incident.type==='Miscellaneous'"><img src="misce.jpg"><font color="#C8CFF4" size="3">{{incident.type}}</font></div>
						</td>
						<td width="20%"><font color="#C8CFF4" size="3">{{incident.state}}</font></td>
						<td width="10%"><font color="#C8CFF4" size="3">{{incident.zone}}</font></td>
						<td width="23%"><font color="#C8CFF4" size="3">{{incident.roadname}}</font></td>
						<td width="27%"><font color="#C8CFF4" size="3">{{incident.lanes}}</font></td>
					</tr>
				</tbody>	
			</table> 
		</div> 
	 </td></tr>
 </table>   
  
<br>

	<a href="createinc.jsp#popup" class="button1"> Create Incident </a>
    <a href="cc.jsp" class="button1"> Common Control</a>
    
      </div>
     </div>
 </div>
   </div>
  </body>
</html>

