<!doctype html>
<html >
<title>TechnicalAlarm</title>
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

#talarmtbl {
  border-collapse: collapse;
  padding: 3px;
}

#talarmtbl td {
  border: 0px solid #ddd;
  color: white;
  padding: 5px;
}

#talarmtbl th #talarmtbl tr {
  color: white;
  padding: 5px;
}

#talarmtbl tr:nth-child(odd){
 background-image: linear-gradient( 90deg,	rgba(55,63,97,1) , rgba(25,31,57,1));
  border: 1px solid;
  color: radial-gradient(circle, #293E78 0%, #14192D 100%);
}

#talarmtbl tr:nth-child(even){
 background-image: linear-gradient( 90deg,	rgba(55,63,97,1) , rgba(25,31,57,1));
  border: 1px solid;
  color: radial-gradient(circle, #293E78 0%, #14192D 100%);
}

#talarmtbl tr:hover {
background-color: #A0522D;
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
	     <td> <h10>TECHNICAL ALARM </h10> </td>
	     <td>
			<div align='right'> 
			<input type="text" size="35" placeholder="Search" ng-model="searchtechnicalAlarmfromgrid"> 				
			</div> 
		   </td>		   
		   		<td> 	
			   		<div class="dropdown" style="float:left;">
						<i class="fa fa-align-justify fa_custom"></i>
							  <div class="dropdown-content" style="float:left;">
							<a href="incidentTbl.jsp">Incident Record</a>
							<a href="workorderTbl.jsp"  style="text-decoration: none">Work Order</a>
							<a href="envmonTbl.jsp"  style="text-decoration: none">Environment</a>
							<a href="eventTbl.jsp">Events</a>
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
								<th width="20%"> <a href="#" ng-click="sortTypeta = 'startdate'; sortReverseta = !sortReverseta"  style="text-decoration:none;"><font style="font-size:18px;color:#C8CFF4"> Start Time <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </font></a></th>
								<th width="15%"> <a href="#" ng-click="sortTypeta = 'alarmid'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:18px;color:#C8CFF4"> Alarm ID <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
								<th width="30%"> <a href="#" ng-click="sortTypeta = 'description'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:18px;color:#C8CFF4"> Description <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </font></a></th>
								<th width="10%"> <a href="#" ng-click="sortTypeta = 'source'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:18px;color:#C8CFF4">Source <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
								<th width="12%"> <a href="#" ng-click="sortTypeta = 'zone'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:18px;color:#C8CFF4">Zone <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
								<th width="12%"> <a href="#" ng-click="sortTypeta = 'status'; sortReverseta = !sortReverseta"  style="text-decoration:none;"> <font style="font-size:18px;color:#C8CFF4">Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
							</tr>
						</table> 
					</td></tr>
					<tr><td>
						<div class='scrollwcindiv'>
							<table  id="talarmtbl" width="100%">
								<tr ng-repeat="techalarm in technicalalarmrec | orderBy:sortTypeta:sortReverseta | filter:searchtechnicalAlarmfromgrid">
									<td width="20%"><font color="#C8CFF4" size="3">{{techalarm.startdate}}</font></td>
									<td width="15%"><font color="#C8CFF4" size="3">{{techalarm.alarmid}}</font></td>
									<td idth="30%"><font color="#C8CFF4" size="3">{{techalarm.description}}</font></td>
									<td width="10%">
										<font color="#C8CFF4" size="3">{{techalarm.source}}</font>
									</td>
									<td width="12%"><font color="#C8CFF4" size="3">{{techalarm.zone}}</font></td>
									<td width="12%">
										<div ng-if="techalarm.status==='open'" > <a class="buttonact" style="color:black">{{techalarm.status | uppercase}}</a></div> 
										<div ng-if="techalarm.status=='close'" > <a class="buttonclose" style="color:black">{{techalarm.status | uppercase}}</a></div> 
										<div ng-if="techalarm.status==='in progress'" > <a class="buttonpending" style="color:black"> {{techalarm.status | uppercase}}</a></div> 							
									</td>
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

