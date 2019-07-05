<html lang="en">
<head>
  <title>ccgrid view</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="grid.css">
	<link rel="stylesheet" href="dropdownlistStyle.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" >  
		
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
	
	<table width="100%" style="background-color: rgba(49,53,81,0.5);"> 
			<tr> 
				<td> 
					<h4> <img src="titlelogobar.png" width="20px" height="18px">&nbsp; i-Transport 2.0 </h4>
				</td> 
				<td align="right">
				
					 <!--  <input type="text" size="15" placeholder="Search" ng-model="searchIncidentfromgrid"> 
					      <div class="inner-addon left-addon" style="color:#C8CFF4;">
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
					          <div class="inner-addon left-addon" style="color:#C8CFF4;">
					          	<i class="glyphicon glyphicon-search"></i> 
					          </div> 
					          -->
					          <input type="text"  style="padding-left: 10px;" placeholder="Search" ng-model="searchIncidentfromgrid" />
       						
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
		
			</div>
			
			<!-- ***************** -->
			<!-- Road Work -->
			<div ng-show="showrdwork">
		
			</div>
			
			
			<!-- ******************* -->
			<div ng-show="showworkorder">
	
			</div>
			
			<div ng-show="showenv">

			</div>
			
			<div ng-show="showtech">

			</div>
			

	
			 <table>
			     <tr> 
			     	<td align="center"> <h10> {{noofeventToday}} </h10> <br><h12>Events(s) Today </h12> </td>
				 	<td align="center"> <h10> {{noofeventUpcome}} </h10> <br> <h12> &nbsp;&nbsp; &nbsp;&nbsp;  Upcoming Event </h12> </td>
				  </tr>
			  </table>
			<table width="100%"> <tr><td>
						 <table width="100%" id="datatbl">
							<tr>
								<th width="13%" align="center"> <a href="#" ng-click="sortType = 'type'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Type</font>   <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></a></th>
								<th width="20%" align="center"> <a href="#" ng-click="sortType = 'name'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Name </font><i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></a></th>
								<th width="18%" align="center"> <a href="#" ng-click="sortType = 'location'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Location</font> <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></a></th>
								<th width="12%" align="center"> <a href="#" ng-click="sortType = 'status'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Status</font> <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></a></th>
								<th width="21%" align="center"> <a href="#" ng-click="sortType = 'start'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">Start</font> <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></a></th>
								<th width="34%" align="center"> <a href="#" ng-click="sortType = 'end'; sortReverse = !sortReverse" style="text-decoration:none;"> <font style="font-size:16px;color:#C8CFF4">End </font><i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></a></th>
								<th> </th>
							</tr>
						</table> 
					</td></tr>
					<tr><td>
						<div class='scrollinc'>
							<table   id="inctbl"  width="100%">
								<tr ng-repeat="event in eventRec | orderBy:sortType:sortReverse | filter:searchIncidentfromgrid">
									<td width="13%" align="left"><font color="#C8CFF4" size="2px">{{event.type}}</font></td>
									<td width="20%" align="left"><font color="#C8CFF4" size="2px">{{event.name}}</font></td>
									<td width="20%" align="left"><font color="#C8CFF4" size="2px">{{event.location}}</font></td>
									<td width="10%" align="left"> 
										<div ng-if="event.status==='APPROVED'" > <a class="buttonappro"  style="color:black">{{event.status | uppercase}}</a></div> 
										<div ng-if="event.status==='PLANNING'" > <a class="buttonplan" style="color:black">{{event.status | uppercase}}</a></div> 
										<div ng-if="event.status==='LIVE'" > <a class="buttonact" style="color:black">{{event.status | uppercase}}</a></div> 
										<div ng-if="event.status==='OVER'" > <a class="buttonclose" style="color:black">{{event.status | uppercase}}</a></div> 
									</td>
									<td width="20%" align="left"><font color="#C8CFF4" size="2px">{{event.start}}</font></td>
									<td width="32%" align="left"><font color="#C8CFF4" size="2px">{{event.end}}</font></td>
								</tr>
							</table> 
						</div>
					</td></tr>
			</table>   			
			
		</div>				  
	  
	  <div class="item3" ng-style="divItem3">

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
 
	  </div>
	  
	  <div class="item4" ng-style="divItem4">
   
		<table>
			<tr>
				<td><!--  progress bar  --> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; </td>
				<td> <div id="linechartContainer" style="height: 100px; width:20%;"></div>  </td>
			</tr>
		</table>
			
				 
		    <br>

	  </div>
	  

	  
	  <div class="item5" ng-style="divItem5">

		   <br>
 			
	  </div>  
	</div>  
</div>
</div> 
</body>
</html>