<!doctype html>
<html >
<title>Event Creation</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="popupevent.css">
	 	 <link rel="stylesheet" href="dropdownstyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	  <!-- <link rel="stylesheet" href="event.css"> -->
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
  	 
 <!-- Date and time picker css and js --> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
   <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment-with-locales.min.js"></script> 
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	    <link href="datetimepicker.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="datetimejquery.js"></script>
   <script type="text/javascript" src="datetimepicker.js"></script>
	 <!-- end Date and time picker css and js --> 
   
   <!-- start plus and minu menu  script -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	 
	<!-- end plus and minu menu script-->
	
	
	
   
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* width */
::-webkit-scrollbar {
  width: 8px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 100px #43498F; 
  border-radius: 3px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #202B53; 
  border-radius: 3px;
}
::-webkit-scrollbar-corner {
  background: #202B53; 
  border-radius: 3px;
}




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
   <form>
   <!-- Create Event -->
<br>
<br>


<div id="createventpopup" class="overlay">
  <div class="popup">
    <div class="contentEventCreate">
	<table width="100%"><tr>
		<td> <h3>DETAILS </h3> </td>
		<td> <div align='right'>  

		<a href="eventTbl.jsp#popup" class="closebtn" ng-click="showincidentlist()" style="text-decoration: none"> <i class="fa fa-close"></i></a> </div>
     	</td>
	</tr></table>   
	
	
	
	
	<div class='scrollcreatevent'>
	
	<div class="panel-group" id="accordion2">
       <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">               	
                    Event Details <span data-target="#Collapseiconone" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
            </h4>
			
        </div>
        <div class="panel-collapse collapse" id="Collapseiconone">
        	<div class="panel-body">
			<hr color = "#C8CFF4" style="padding:0px; margin:5px;">
				<h3>Fill in the detail of the Event </h3>	
      <table width="100%">

		<tr>
	      <td>
          	<h6>Event Name</h6>
			<input type="text"  placeholder="Event Name" ng-model="eventname">
          </td>
	      <td>
            <h6>Organizer</h6> 
			<input type="text"  placeholder="Oganizer" ng-model="eventorganizer">
          </td>
	  
	  </tr>
        <tr>
          <td> <h6>Start Time </h6>
          
          	<div style="width: 190px;">
				<div id="picker2"> </div>
					<input type="hidden"  placeholder="End Time"  ng-model="eventstarttime"/>
			</div>
		<!-- 	<input type="text"  placeholder="Start Time" ng-model="eventstarttime">  -->
          
          
          </td>
		  <td> <h6>End Time </h6>
		    <div style="width: 190px;">
				<div id="picker3"> </div>
					<input type="hidden"  placeholder="End Time"  ng-model="eventendtime"/>
			</div>
		<!--  	<input type="text"  placeholder="end Time" ng-model="eventendtime"> -->
          </td>
        </tr>
        <tr>
          <td>
            <h6>Event Supporter</h6>
            <input type="text"  placeholder="supporter" ng-model="eventsupp">
          </td>
          <td>
            <h6>Event Owner </h6>
            <input type="text" placeholder="owner"  ng-model="eventowner">
          </td>
        </tr>

        <tr>
          <td>
            <h6>Event Type </h6>
                <select ng-model="eventype">
                	<option  value="" selected="selected" hidden="hidden">Choose here</option>
					<option value="F1">F1</option>
					<option value="Concert">Concert</option>
					<option value="Summit">Summit</option>
				</select>
          </td>
          <td>
            <h6>Spectators </h6>
            <input type="text"  placeholder="spectator" ng-model="eventspec">
          </td>
        </tr>
		
		<tr>
          <td>
            <h6>Hotline Opening </h6>
			<input type="text"  placeholder="opening" ng-model="eventhotlineope">
          </td>
          <td>
            <h6>Hotline Closing </h6>
            <input type="text"  placeholder="closing" ng-model="eventhotlineclo">
          </td>
        </tr>
		<tr>
          <td>
            <h6>Person(s) in Charge</h6>
			<input type="text"  placeholder="in charge" ng-model="eventincharge">
          </td>
          <td>
            <h6>Command Post Number </h6>
            <input type="text"  placeholder="post no" ng-model="eventpostno">
          </td>
        </tr>
		<tr>
          <td>
            <h6>Event Bubble Position</h6>
			<input type="text"  placeholder="in charge" ng-model="eventbubbleposi">
          </td>
          <td>
            <h6>Event Bubble Size </h6>
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
					
						<table width="100%">
						<tr>
						  <td colspan="3"><h3>Road Closures </h3></td>
						</tr>
						<tr >
						  <td colspan="3"><hr color = "#C8CFF4"  style="padding:0px; margin:0px;"></td>
						</tr>
						<tr>
						  <td><h6>Road Name</h6></td>
						  <td><h6>Open Time</h6></td>
						  <td><h6>Close Time</h6></td>
						</tr>
						<tr style="height:2px;">
						  <td> <input type="text"  placeholder="road name" ng-model="eventroadname"></td>
						  <td><h6>{{eventstarttime}}</h6></td>
						  <td><h6>{{eventendtime}} </h6></td>
						</tr>
						</table>
					  
					   <h6>Lanes Closure</h6> 
						<h6>LSH1  4 3 2 1  RSH1</h6>
						<h6>(+)add new lines</h6>
						<h6>(-)remove lines</h6>
						<h6>Add road closure for this event </h6> 
						
						<table width="100%" class="eventclosuretable"><tr>
							<td> 
							<a href="#popup" class="buttonUpload" ng-click=""> Upload Road Closure </a>
							&nbsp;<a href="#popup" class="buttonRemove"  ng-click=""> Remove Road Closure</a> 
							<a href="#popup" class="buttonClosure" ng-click=""> Add Road Closure</a> 
							</td>
						</tr>
						<tr>
							<td colspan="3"> <div align="right">
							<a href="eventTbl.jsp#popup" class="buttonCreateEventInc"  ng-click="addevent()"> Create </a> </div>
							</td>
						</tr>
						</table> 
						
				</div>
			</div>
     </div>
	 </div>
	 </div>

    </div>
  </div>
</div>
  </div>
</div>

</form>
  </body>
 
  
</html>