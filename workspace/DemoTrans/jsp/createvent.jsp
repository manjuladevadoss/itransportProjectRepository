<!doctype html>
<html >
<title>Event Creation</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="popupevent.css">
	 	  <link rel="stylesheet" href="dropdownlistStyle.css">
	 	  <link rel="stylesheet" href="dropdownlistStylePopup.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
  	 
 <!-- Date and time picker css and js --> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
   <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment-with-locales.min.js"></script> 
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	 <!--   <link href="datetimepicker.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="datetimejquery.js"></script>
   <script type="text/javascript" src="datetimepicker.js"></script>  --> 
	 <!-- end Date and time picker css and js --> 
   
   <!-- start plus and minu menu  script -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<!-- end plus and minu menu script-->
		
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* toggle plus and Minus background color*/
.panel-heading.active {
    background-color: #202B53;
    color: #C8CFF4;  
    border : none;
}
.panel-title { 
 font-size: 16px;
  padding-bottom:6px;
}
.panel-body {
    background-color: #202B53;
    color: #C8CFF4; 
    font-size: 12px;
}
.panel, .panel-group .panel-heading+.panel-collapse>.panel-body{
    border: none;
}
.glyphicon {
    font-size: 10px;
}
.panel-title{
  border: solid #37478A;
  /*border-style: solid; */
    border-left-width: 0px;
    border-right-width: 0px;
    border-top-width: 0px;
    border-bottom-width: 3px;
}
/* toggle plus and Minus */


</style>
</head>
 <script>
$(document).ready(function(){
	$('.collapse').on('shown.bs.collapse', function(){
		$(this).parent().find(".glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus");
	}).on('hidden.bs.collapse', function(){
		$(this).parent().find(".glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus");
	});       
});
</script>

<body>
 <div class="container-fluid"> 
   <div ng-app="ltaApp" ng-controller="ltaController">
   <form ng-submit="addevent()">
   <!-- Create Event -->
<br>
<br>


<div id="createventpopup" class="overlay">
  <table id="inctitletbl">
  	<tr>
		<td> <h2t>Events {{eventname1}}  {{eventypeselected}}</h2t></td>
	</tr>
	</table>
  <div class="popup">
    <div class="contentEventCreate">
    
	<table width="100%" id="incdetailtbl"><tr>
		<td> <h3a> Details </h3a> </td>
		<td> <div align='right'>  

		<a href="eventTbl.jsp" class="closebtn" ng-click="showincidentlist()" style="text-decoration: none"> <i class="fa fa-close"></i></a> </div>
     	</td>
	</tr></table>   
	
	<br>
	
	
	<div class='scrollcreatevent'>
	
	<div class="panel-group" id="accordion2">
       <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">               	
                    Event Details <span data-target="#Collapseiconone" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
            </h4>
			
        </div>
        <div class="panel-collapse collapse in" id="Collapseiconone">
        	<div class="panel-body">
      <table width="100%" id="eventdetailtbl">
		<tr>
	      <td colspan="2">
          	Fill in the detail of the Event 			
          </td>
	  </tr>
		<tr>
	      <td>
          	Event Name <br>
			<input type="text"  placeholder="Event Name" ng-model="eventname" ng-change="changeventname()" >
          </td>
	      <td>
            Organizer <br>
			<input type="text"  placeholder="Oganizer" ng-model="eventorganizer">
          </td>
	  
	  </tr>
        <tr>
          <td> Start Time <br>
				<input type="text"  placeholder="Start Time" ng-model="eventstarttime">                  
          </td>
		  <td> End Time <br>
				<input type="text"  placeholder="end Time" ng-model="eventendtime"> 
          </td>
        </tr>
        <tr>
          <td>
            Event Supporter <br>
            <input type="text"  placeholder="supporter" ng-model="eventsupp">
          </td>
          <td>
            Event Owner <br>
            <input type="text" placeholder="owner"  ng-model="eventowner">
          </td>
        </tr>

        <tr>
          <td>
            Event Type <br>
                <select ng-model="eventype" ng-change="changeoptions()">
                	<option  value="" selected="selected" hidden="hidden">Choose here</option>
					<option value="F1">F1</option>
					<option value="Concert">Concert</option>
					<option value="Summit">Summit</option>
				</select>
          </td>
          <td>
            Spectators <br>
            <input type="text"  placeholder="spectator" ng-model="eventspec">
          </td>
        </tr>
		
		<tr>
          <td>
            Hotline Opening <br>
			<input type="text"  placeholder="opening" ng-model="eventhotlineope">
          </td>
          <td>
            Hotline Closing <br>
            <input type="text"  placeholder="closing" ng-model="eventhotlineclo">
          </td>
        </tr>
		<tr>
          <td>
            Person(s) in Charge<br>
			<input type="text"  placeholder="in charge" ng-model="eventincharge">
          </td>
          <td>
            Command Post Number <br>
            <input type="text"  placeholder="post no" ng-model="eventpostno">
          </td>
        </tr>
		<tr>
          <td>
            Event Bubble Position<br>
			<input type="text"  placeholder="in charge" ng-model="eventbubbleposi">
          </td>
          <td>
            Event Bubble Size <br>
            <input type="text"  placeholder="post no" ng-model="eventbubblesize">
          </td>
        </tr>		
      </table>
            </div>
        </div>
     </div>
	 
	    <div class="panel panel-default">
    	<div class="panel-heading active">
					<h4 class="panel-title">               	
							Road Closure <span data-target="#Collapseicontwo" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
					</h4>
					
				</div>
				<div class="panel-collapse collapse" id="Collapseicontwo">
					<div class="panel-body">
					
						<table width="100%" id="eventdetailtbl"> 
						<tr>
						  <td>Road Name</td>
						  <td>Open Time</td>
						  <td>Close Time</td>
						</tr>
						<tr style="height:2px;">
						  <td> <input type="text" style="width:130px;" placeholder="road name" ng-model="eventroadname"></td>
						  <td><input type="text"  style="width:130px;" placeholder="{{eventstarttime}}" ng-model="eventroadname"></td>
						  <td><input type="text"  style="width:130px;" placeholder="{{eventendtime}}" ng-model="eventroadname"> </td>
						</tr>
						</table>
		Lanes Closure
		<table  width="100%">
		<tr>
          <td align="Left">
	          <table>
	         <tr>
	    		<td>
				<img src="laneup.JPG" width="30px" height="30px">
				<img src="vertibar.JPG" width="10px" height="30px">
				</td>
				<td align="center">								
					<img src="lanecross.JPG" width="30px" height="30px">
				</td>
				<td align="center">
					<img src="laneup.JPG" width="30px" height="30px">
				</td>
			    <td align="center">
					<img src="laneup.JPG" width="30px" height="30px">
				</td>
				<td align="center">
					 <img src="lanecross.JPG" width="30px" height="30px">
					 
				</td>
				<td align="center">
				    <img src="vertibar.JPG" width="10px" height="30px"> 
					 <img src="laneup.JPG" width="30px" height="30px">
	          </td>
	          	<!-- 		<td align="center">
					<ul>
					  <li> (+) Add New lines 
					  <ul>
						<li> Add Lane</li>
						<li> Add Center Divider</li>
						<li> Add Left Shoulder</li>
						<li> Add Right Shoulder</li>
						</ul></li>
					</ul>  -->
	          </td>
	        </tr>
				
			<tr>
	          <td align="center">
				<font color="#A0E67F">LSH1</font>
				</td>
				<td align="center">
					<font color="#E58080">4</font>
				</td>
				<td align="center">
					<font color="#A0E67F">3</font>
				</td>
			    <td align="center">
					<font color="#A0E67F">2</font>
				</td>
				<td align="center">
					 <font color="#E58080">1</font>
				</td>
				<td align="center">
					<font color="#A0E67F">RSH1</font>
	          </td>
	           
	          	<td align="center">
				<ul>
					  <li> (+) Add New lines 
					  <ul>
						<li> Add Lane</li>
						<li> Add Center Divider</li>
						<li> Add Left Shoulder</li>
						<li> Add Right Shoulder</li>
						</ul></li>
					</ul>
				
				<ul>
					  <li> (-) Remove lines 
					  <ul style="width:150px;">
						<li> Remove Lane</li>
						<li> Remove Center Divider</li>
						<li> Remove Left Shoulder</li>
						<li> Remove Right Shoulder</li>
						</ul></li>
					</ul>
	          </td>
	        </tr>
	          
	          </table>
                 </table>
						<br>
						<table width="100%" class="eventclosuretable">
						<tr>
							<td> 
								<a href="createvent.jsp#createventpopup"  class="buttonUpload" ng-click=""> Upload Road Closure </a>
								&nbsp;<a href="createvent.jsp#createventpopup" class="buttonRemove"  ng-click=""> Remove Road Closure</a> 
								<a href="createvent.jsp#createventpopup"  class="buttonClosure" ng-click=""> Add Road Closure</a> 
							</td>
							</tr>
						</table> 
						
				</div>
			</div>
     </div>
     
     
     
	 </div>
	 		<table width="100%">
				<tr>
					<td > <div align="right">
						<a href="createventresponse.jsp#createventresponsepopup" class="buttonCreateEventInc"  ng-click="addevent()"> Create </a> </div>
					</td>
					</tr>
			</table> 	 
	 
	 </div>

    </div>
  </div>
</div>
  </div>
</div>

</form>
  </body>
 
  
</html>