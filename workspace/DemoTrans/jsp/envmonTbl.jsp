<!doctype html>
<html >
<title>Environment</title>
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

#envitbl {
  border-collapse: collapse;
  padding: 3px;
}

#envitbl td {
  border: 0px solid #ddd;
  color: white;
  padding: 5px;
}

#envitbl th #envitbl tr {
  color: white;
  padding: 5px;
}

#envitbl tr:nth-child(odd){
 background-image: linear-gradient( 90deg,	rgba(55,63,97,1) , rgba(25,31,57,1));
  border: 1px solid;
  color: radial-gradient(circle, #293E78 0%, #14192D 100%);
}

#envitbl tr:nth-child(even){
 background-image: linear-gradient( 90deg,	rgba(55,63,97,1) , rgba(25,31,57,1));
  border: 1px solid;
  color: radial-gradient(circle, #293E78 0%, #14192D 100%);
}

#envitbl tr:hover {
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
	     <td> <h10>ENVIRONMENTAL MONITORING LIST </h10> </td>
	     <td>
			<div align='right'> 
			<input type="text" size="35" placeholder="Search" ng-model="searchEnvifromgrid"> 				
			</div> 
		   </td>
			<td> 	
			   		<div class="dropdown" style="float:left;">
						<i class="fa fa-align-justify fa_custom"></i>
							  <div class="dropdown-content" style="float:left;">
							<a href="incidentTbl.jsp">Incident Record</a>
							<a href="workorderTbl.jsp"  style="text-decoration: none">Work Order</a>
							<a href="techalarmTbl.jsp">Technical Alarms</a>
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
								<th width="16%"> <a href="#" ng-click="sortTypenv = 'startime'; sortReversenv = !sortReversenv"><font style="font-size:18px;color:#C8CFF4"> Start Time <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
								<th width="17%"> <a href="#" ng-click="sortTypenv = 'endtime'; sortReversenv = !sortReversenv"><font style="font-size:18px;color:#C8CFF4"> End Time<i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </font></a></th>
								<th width="12%"> <a href="#" ng-click="sortTypenv = 'alarmid'; sortReversenv = !sortReversenv"><font style="font-size:18px;color:#C8CFF4"> Alarm ID <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
								<th width="40%"> <a href="#" ng-click="sortTypenv = 'desc'; sortReversenv = !sortReversenv"><font style="font-size:18px;color:#C8CFF4">Description <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
								<th width="10%"> <a href="#" ng-click="sortTypenv = 'status'; sortReversenv = !sortReversenv"><font style="font-size:18px;color:#C8CFF4">Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
							</tr>
						</table> 
					</td></tr>
					<tr><td>
						<div class='scrollwcindiv'>
							<table  id="envitbl" width="100%">
								<tr ng-repeat="envmoni in environmonitorec | orderBy:sortTypenv:sortReversenv | filter:searchEnvifromgrid">
									<td width="16%"><font color="#C8CFF4" size="3">{{envmoni.startime}}</font></td>
									<td width="16%"><font color="#C8CFF4" size="3">{{envmoni.endtime}}</font></td>
									<td width="10%"><font color="#C8CFF4" size="3">{{envmoni.alarmid}}</font></td>
									<td width="40%"><font color="#C8CFF4" size="3">{{envmoni.desc}}</font></td>
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
						
		</td></tr></table>
	
   </div> 
</div>

</body>
</html>

