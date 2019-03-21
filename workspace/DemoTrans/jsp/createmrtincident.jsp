<!doctype html>
<html >
<title>Mrt incident</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="popupmrtinccreate.css">
	  <link rel="stylesheet" href="selectimagestyle.css">
	  <link rel="stylesheet" href="checkboxstyle.css">
	   <link rel="stylesheet" href="dropdownlistStylePopup.css">
	  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	  
	  
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	   <!-- end plus and minu menu  script -->
	 
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>





</style>
	
</head>

<body>
   <div ng-app="ltaApp" ng-controller="ltaController">
   <form>
<br>
<br>

 <div class="container-fluid">

<!-- Create Incident -->
<br>
<br>
<div id="popupmrtinccreate" class="overlay">
  <div class="popup">
    <div class="content">
	<table width="100%"><tr>
		<td><h4>Create </h4></td>
		<td>   <div align='right'> 
		<a href="createmrtinc.jsp" class="closebtn" ng-click="showincidentlist()"><i class="fa fa-close"></i></a> 
     	</div> </td>
	</tr>
	<tr>
		<td><h2> Incident</h2></td>
		<td> </td>
	</tr>
	</table>   
		 <hr color = "#C8CFF4"  style="padding:0px; margin:0px;">
	<div class='mrtincscroll'>
      <table width="100%">
        <tr>
          <td colspan="3">
            <h3>Status</h3> 
              <select ng-model="irstatus">
					<option  value="" selected="selected" hidden="hidden">Choose here</option>
					<option value="Confirmed">Confirmed</option>
					<option value="Over">Over</option>
					<option value="In Progress">In Progress</option>
					<option value="Notified">Notified</option>
					<option value="Other">Other</option>
				</select>
          </td>
          <td colspan="3"> <h3>Source </h3>
              <select ng-model="irsource">
			  <option  value="" selected="selected" hidden="hidden">Choose here</option>
					<option value="ERS">ERS</option>
					<option value="JEYE">JEYE</option>
					<option value="other">Other</option>
				</select>
          </td>
        </tr>
        <tr>
          <td colspan="3">
           <h3>Start Time</h3>
		
			<div style="width: 150px;">
				<div id="picker"> </div>
					<input type="text" placeholder="Start Time"  ng-model="irstarttime"/>
			</div>			
          </td>
          <td colspan="3">
            <h3>End Time </h3>
         
			<div style="width: 150px;">
				<div id="picker1"> </div>
					<input type="text"  placeholder="End Time"  ng-model="irendtime"/>
			</div>			
          </td>
        </tr>

		<tr>
          <td colspan="6">
		   <br><hr color = "#C8CFF4"  style="padding:0px; margin:0px;">
          </td>
        </tr>
		
		<tr>
					<td colspan="3">
						<h3>MRT / LRT Line</h3> 
					</td>
					<td colspan="3">
						<h3>Both Direction </h3>
					</td>						
				</tr>
				
				<tr>
					<td colspan="3">
						<select ng-model="direction" class="selectcls">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
							<option value="ewline">East West Line</option>
							<option value="nsline">North South Line</option>
							<option value="neline">North East LIne</option>
							<option value="cline">Circle Line</option>
							<option value="dline">Downtown Line</option>
						</select>
						

					</td>
					<td colspan="3">
								  <div>
									<input id="checkbox-5" class="checkbox-custom" name="checkbox-5" type="checkbox">		<label for="checkbox-5" class="checkbox-custom-label"></label>
								</div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<h3>Start Station</h3>
					</td>
					<td colspan="3">
						<h3>End Station</h3>
					</td>					
				</tr>
				<tr>
					<td colspan="3">
						<select ng-model="startstation" class="selectcls">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
							<option value="ns1">NS1-Jurong East</option>
							<option value="ns28">NS28-Marina South Pier</option>
							<option value="ne1">NE1-HarbourFront</option>
							<option value="ne17">NE17-Punggol</option>
							<option value="cc1">CC1-Dhoby Ghaut</option>
							<option value="cc29">CC29-HarbourFront</option>
							<option value="dt1">DT1-Bukit Panjang</option>
							<option value="dt32">DT32-Expo</option>
						</select>
					</td colspan="3"> 
					<td>
						<select ng-model="endstation" class="selectcls">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
							<option value="ns1">NS1-Jurong East</option>
							<option value="ns28">NS28-Marina South Pier</option>
							<option value="ne1">NE1-HarbourFront</option>
							<option value="ne17">NE17-Punggol</option>
							<option value="cc1">CC1-Dhoby Ghaut</option>
							<option value="cc29">CC29-HarbourFront</option>
							<option value="dt1">DT1-Bukit Panjang</option>
							<option value="dt32">DT32-Expo</option>
						</select>

					</td>
					
				</tr>
		
		
		<tr>
          <td colspan="6">
		   <br><hr color = "#C8CFF4"  style="padding:0px; margin:0px;">
          </td>
        </tr>
		<tr>
          <td colspan="3">
            <input id="checkbox-1" class="checkbox-custom" name="checkbox-1" type="checkbox">
			<label for="checkbox-1" class="checkbox-custom-label">Simulated 34 </label> 
           </td>
          <td colspan="3"> 
			<input id="checkbox-2" class="checkbox-custom" name="checkbox-2" type="checkbox">
			<label for="checkbox-2" class="checkbox-custom-label">Important</label> 
          </td>
        </tr>
		<tr>
          <td colspan="3">
          	<input id="checkbox-3" class="checkbox-custom" name="checkbox-3" type="checkbox">
			<label for="checkbox-3" class="checkbox-custom-label">VRS</label> 
          </td>
          <td colspan="3"> 
		    <input id="checkbox-4" class="checkbox-custom" name="checkbox-4" type="checkbox">
			<label for="checkbox-4" class="checkbox-custom-label">LTM</label> 
          </td>
        </tr>
		<tr>
          <td colspan="6">
		   <br><hr color = "#C8CFF4"  style="padding:0px; margin:0px;">
          </td>
        </tr>
		<tr>
          <td colspan="6">
		   <h3>Alarms / Alerts</h3>
          </td>
        </tr>
		<tr>
          <td colspan="6">
		     <input type="text"  placeholder="Alert" ng-model="irimgcap">
          </td>
        </tr>
      </table>
	  
	  			<table width="100%"><tr>
		<td> <div align='right'>  
     	<a href="createmrtincidentresponse.jsp#popupmrtresponse" class="buttonCreateMrtInc"  ng-click="addincident()"> Create </a>
		<!-- <a href="#popup" class="button1a" id="button1a"  ng-click="showincidentlist()"> Close</a>  -->
     	</div> </td>
	</tr></table> 
	  </div>
	  


    </div>
  </div>
</div>


  </div>
</div>
 
<!-- end of Create Incident -->
</form>
  </body>
</html>