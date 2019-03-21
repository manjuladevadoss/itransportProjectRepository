<!DOCTYPE html>
<html lang="en">
<head>
  <title>ccgridmergeinc</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="bootstrap.min.css">
	   <link rel="stylesheet" href="incident.css">
	 <link rel="stylesheet" href="demo.css">
	 <link rel="stylesheet" href="dropdownlistStyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <style>
 /* start grid */
.item1 { grid-area: header; }
.item2 { grid-area: menu; }
.item3 { grid-area: main; }
.item4 { grid-area: footer; }

.grid-container {
  display: grid;
  grid-template-areas:
    'header header'
    'menu main'
    'menu footer';
  grid-gap: 10px;
   background-color: #43498F;
  padding: 10px;
}

.grid-container > div {
  background-color: rgba(255, 255, 255, 0.8);
  padding: 10px 10px;
  background-color: #202B53; 
}
/* end grid */

.buttonact{
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 2px 1px;
  cursor: pointer;
  font-size: .7em;
  color: black;
  font-family: Roboto, Helvetica, sans-serif;
 font-weight: bold;
  border: 2px solid #33FF33;
  border-radius: 2px/2px;
  background:#33FF33;
}

.buttonnotact{
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 2px 1px;
  cursor: pointer;
  border-radius: 2px/2px;
  font-family: Roboto, Helvetica, sans-serif;
  font-weight: bold;
  font-size:.7em;
  color: black;
  border: 2px solid red;
  background:red;
}

div.scroll {
     /* width:790px; */
      overflow-y:scroll;
	  overflow-x: hidden;
      height:600px;
}

/* Search bar with icon*/
input[type=text] {
  box-sizing: border-box;
  border: 1px solid  #202B53;
  border-radius: 4px;
  font-size: 12px;
  color: #C8CFF4;
  height: 25px;
  width: 220px;
  font-family: Roboto, Helvetica, sans-serif;
  background-color: #131A32;
  background-image: url('searchicon.png');
  background-position: 10px 10px; 
  background-repeat: no-repeat;
  padding: 13px 25px 22px 28px;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
}

table td{
	padding:4px;
}

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
							<h4> <img src="cormenu.jpg" width="14" height="14"> iTransport 2.0 </h4>
						</td> 
						<td >
							<div align="right"><input type="text" size="15" placeholder="Search" ng-model="searchIncidentfromgrid"><img src="alarm.JPG" width="40" height="28"></div>	
												
							<!-- serach icon in the text box <input type="text" size="25" placeholder="Search" id="funkystyling"  ng-model="searchIncident">	  -->
											
						</td> 
					</tr>
				</table>
			</div>
		<div class="item2">
		   <table width="100%">
			 <tr > 
			 <td> <h5>INCIDENT RECORD</h5> <td>	
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
								<li><a href="ccgrid.jsp"  style="text-decoration: none"><font color="white">Split Panels</font></a></li>
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
					<!--  <tr class= "myHeader navbar-fixed-top">
						<th> <a href="#" ng-click="sortType = 'irid'; sortReverse = !sortReverse"><h4> IRID </h4></a></th>
						<th> <a href="#" ng-click="sortType = 'type'; sortReverse = !sortReverse"><h4> Type </h4></a></th>
						<th> <a href="#" ng-click="sortType = 'state'; sortReverse = !sortReverse"><h4> State</h4></a></th>
						<th> <a href="#" ng-click="sortType = 'zone'; sortReverse = !sortReverse"> <h4>Zone </h4></a></th>
						<th> <a href="#" ng-click="sortType = 'roadname'; sortReverse = !sortReverse"> <h4>Road Name </h4></a></th>
						<th> <a href="#" ng-click="sortType = 'lanes'; sortReverse = !sortReverse"><h4>Lanes </h4></a></th>
					</tr> -->
						<tr ng-repeat="inc in incidentNewList | orderBy:sortType:sortReverse | filter:searchIncidentfromgrid">
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
			</div>
				 </td></tr>
			 </table>    
		<a href="createinc.jsp#popup"> Create Incident </a>
		</div>

		<div class="item3">
						<table width="100%">
			 <tr > 
			 <td> <h5>WORK ORDER</h5><td>
			<td align='right'>
				<input type="text" size="35" placeholder="Search" ng-model="searchworkorderfromgrid"> 
				<ul>
					  <li><p><img src="cormenu.jpg" width="15" height="15"></p> 
					  <ul>
						<li> <a href="incidentTbl.jsp"  style="text-decoration: none"><font color="white">Incident Record</font></a></li>
						<li><a href="techalarmTbl.jsp" style="text-decoration: none"><font color="white">Technical Alarms</font></a></li>
								<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Environment</font></a></li>
								<li><a href="eventTbl.jsp"  style="text-decoration: none"><font color="white">Events</font></a></li>
								<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Road Works</font></a></li>
								<hr color = "#C8CFF4" style="padding:1px; margin:1px;">
								<li><a href="ccgridmergeinc.jsp"  style="text-decoration: none"><font color="white">Merge up/down</font></a></li>
								<li><a href="envmonTbl.jsp"  style="text-decoration: none"><font color="white">Merge sideways</font></a></li>
						</ul></li>
					</ul>					 
			   </td> 
			 </tr>
			 </table>
		   <br>
		   <img src="workorderchart.JPG" width="60%" height="30%">
		   <br><br><br>
		   
			 <table border="1" width="100%">
				<tr>
					<th> <a href="#" ng-click="sortType = 'date'; sortReverse = !sortReverse"><h4> Date <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th> <a href="#" ng-click="sortType = 'wonum'; sortReverse = !sortReverse"><h4> Wonum <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th> <a href="#" ng-click="sortType = 'descri'; sortReverse = !sortReverse"><h4> Description <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th> <a href="#" ng-click="sortType = 'status'; sortReverse = !sortReverse"><h4>Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th> <a href="#" ng-click="sortType = 'zone'; sortReverse = !sortReverse"><h4>Zone <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
				</tr>
					<tr ng-repeat="workOrder in workorderRec | orderBy:sortType:sortReverse | filter:searchworkorderfromgrid">
						<td><p>{{workOrder.date}}</p></td>
						<td><p>{{workOrder.wonum}}</p></td>
						<td><p>{{workOrder.descri}}</p></td>
						<td>
						<div ng-if="workOrder.status==='ACTIVE'" > <a class="buttonact">{{workOrder.status}}</a></div> 
						<div ng-if="workOrder.status==='NOT ACTIVE'" > <a class="buttonnotact">{{workOrder.status}} nmn</a></div> 
						
						
						</td>
						<td><p>{{workOrder.zone}}</p></td>
					</tr>
			</table>
		</div>
	 
		<div class="item4">
			<table width="100%">
			 <tr> 
			 <td> <h5>ENVIRONMENTAL MONITORING LIST</h5><td>
			 <td align='right'>
				<input type="text" size="35" placeholder="Search" ng-model="searchEnvifromgrid"> 
				<ul>
					  <li><p><img src="cormenu.jpg" width="15" height="15"></p> 
					  <ul>
						<li> <a href="incidentTbl.jsp"  style="text-decoration: none"><font color="white">Incident Record</font></a></li>
						<li><a href="workorderTbl.jsp" style="text-decoration: none"><font color="white">Work Order</font></a></li>
						<li><a href="techalarmTbl.jsp"  style="text-decoration: none"><font color="white">Technical Alarms</font></a></li>
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
		   <br>
			 <table border="1" width="100%">
				<tr>
					<th> <a href="#" ng-click="sortType = 'date'; sortReverse = !sortReverse"><h4> Date <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th> <a href="#" ng-click="sortType = 'wonum'; sortReverse = !sortReverse"><h4> Wonum <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </h4></a></th>
					<th> <a href="#" ng-click="sortType = 'descri'; sortReverse = !sortReverse"><h4> Description <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </h4></a></th>
					<th> <a href="#" ng-click="sortType = 'status'; sortReverse = !sortReverse"><h4>Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
					<th> <a href="#" ng-click="sortType = 'zone'; sortReverse = !sortReverse"><h4>Zone <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h4></a></th>
				</tr>
					<tr ng-repeat="workOrder in workorderRec | orderBy:sortType:sortReverse | filter:searchEnvifromgrid">
						<td><p>{{workOrder.date}}</p></td>
						<td><p>{{workOrder.wonum}}</p></td>
						<td><p>{{workOrder.descri}}</p></td>
						<td>
						<div ng-if="workOrder.status==='ACTIVE'" > <a class="buttonact">{{workOrder.status}}</a></div> 
						<div ng-if="workOrder.status==='NOT ACTIVE'" > <a class="buttonnotact">{{workOrder.status}}</a></div> 
						</td>
						<td><p>{{workOrder.zone}}</p></td>
					</tr>
			</table> 
		</div>
	
	</div>
</div>

   </div> 
</body>
</html>
