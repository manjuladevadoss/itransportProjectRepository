<!doctype html>
<html >
<title>Workorder</title>
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

#wotbl {
  border-collapse: collapse;
  padding: 3px;
}

#wotbl td {
  border: 0px solid #ddd;
  color: white;
  padding: 5px;
}

#wotbl th #wotbl tr {
  color: white;
  padding: 5px;
}

#wotbl tr:nth-child(odd){
 background-image: linear-gradient( 90deg,	rgba(55,63,97,1) , rgba(25,31,57,1));
  border: 1px solid;
  color: radial-gradient(circle, #293E78 0%, #14192D 100%);
}

#wotbl tr:nth-child(even){
 background-image: linear-gradient( 90deg,	rgba(55,63,97,1) , rgba(25,31,57,1));
  border: 1px solid;
  color: radial-gradient(circle, #293E78 0%, #14192D 100%);
}

#wotbl tr:hover {
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
	     <td> <h10>WORK ORDER </h10> </td>
	     <td>
			<div align='right'> 
			<input type="text" size="35" placeholder="Search" ng-model="searchworkorderfromgrid"> 				
			</div> 
		   </td> 
			<td> 	
			   		<div class="dropdown" style="float:left;">
						<i class="fa fa-align-justify fa_custom"></i>
							  <div class="dropdown-content" style="float:left;">
							<a href="incidentTbl.jsp">Incident Record</a>
							<a href="techalarmTbl.jsp" style="text-decoration: none">Technical Alarms</a>
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
								<th width="20%"> <a href="#" ng-click="sortTypewo = 'date'; sortReversewc = !sortReversewc"><font style="font-size:18px;color:#C8CFF4" style="text-decoration:none;"> Date <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
								<th width="12%"> <a href="#" ng-click="sortTypewo = 'wonum'; sortReversewc = !sortReversewc"><font style="font-size:18px;color:#C8CFF4" style="text-decoration:none;"> Wonum <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
								<th width="30%"> <a href="#" ng-click="sortTypewo = 'descri'; sortReversewc = !sortReversewc"><font style="font-size:18px;color:#C8CFF4" style="text-decoration:none;"> Description <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
								<th width="20%"> <a href="#" ng-click="sortTypewo = 'status'; sortReversewc = !sortReversewc"><font style="font-size:18px;color:#C8CFF4" style="text-decoration:none;">Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
								<th width="10%"> <a href="#" ng-click="sortTypewo = 'zone'; sortReversewc = !sortReversewc"><font style="font-size:18px;color:#C8CFF4" style="text-decoration:none;">Zone <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></font></a></th>
							</tr>
						</table> 
					</td></tr>
					<tr><td>
						<div class='scrollwcindiv'>
							<table  id="wotbl" width="100%">
								<tr ng-repeat="workOrder in workorderRec | orderBy:sortTypewo:sortReversewc | filter:searchworkorderfromgrid">
								<td width="20%"><font color="#C8CFF4" size="3">{{workOrder.date}}</font></td>
								<td width="12%"><font color="#C8CFF4" size="3">{{workOrder.wonum}}</font></td>
								<td width="30%"><font color="#C8CFF4" size="3">{{workOrder.descri}}</font></td>
								<td width="20%">
									<div ng-if="workOrder.status==='ACTIVE'"> <a class="buttonact" style="color:black">{{workOrder.status}}</a></div> 
									<div ng-if="workOrder.status==='NOT ACTIVE'"> <a class="buttonnotact" style="color:black">{{workOrder.status}}</a></div> 
									<div ng-if="workOrder.status==='JOB DONE'"> <a class="buttonclose" style="color:black">{{workOrder.status}}</a></div> 
									<div ng-if="workOrder.status=='PENDING'"> <a class="buttonpending" style="color:black">{{workOrder.status}}</a></div>    
								</td>
							<td width="10%"><font color="#C8CFF4" size="3">{{workOrder.zone}}</font></td>
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

