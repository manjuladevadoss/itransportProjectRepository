<!DOCTYPE html>
<html lang="en">
<head>
  <title>Create IR Map</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="gridwin.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" >
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		
	<link rel="stylesheet" href="checkboxstyle1.css">
	<link rel="stylesheet" href="dropdownlistStylePopup.css">  <!-- dropdown inside the popup add lane view-->
	 <link rel="stylesheet" href="dropdownlistStyle.css"> <!-- dropdown inside status,source add lane view-->
	  
 	<script src="bootstrap.min.js"></script>
  	<script src="angular.min.js"></script>
  	<script type="text/javascript"  src="democontroller.js"></script> 
  	<script type="text/javascript"  src="jquery.js"></script> 
  	
  	<!--  Map View -->
	<link rel="stylesheet" href="https://js.arcgis.com/3.28/esri/css/esri.css">
	<script src="https://js.arcgis.com/3.28/"></script>
	<!-- End of Map View -->
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no"/>
    
    
		  <!-- start plus and minu menu  script -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	   <!-- end plus and minu menu  script -->
	
	
	
 <style>
     #map {
        height: 100%;
        margin: 0;
        padding: 0;
		width:100%;
      }
	  
.dropdown-content {
 min-width: 180px;
 }
 .dropdown-content a {
  min-width: 180px;
 }
 

</style>

</head>
    <script>
	//Map tag
      var map;
      require(["esri/map", "dojo/domReady!"], function(Map) {
        map = new Map("map", {
          basemap: "dark-gray",  //For full list of pre-defined basemaps, navigate to http://arcg.is/1JVo6Wd
          center: [103.706, 1.318], // longitude, latitude
          zoom: 12
        });
      });
	 // Map Tag
	  </script>
	  <script>
// accordions div tag
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
	
	<div class="grid-container">  
	  <div class="item1"  style="background-color:  #161F37; box-shadow: 0 2px 4px 0 rgba(0,0,0,0.5);">
			<h2t> MRT IR </h2t>
	  </div>
	  
	  <div class="item2" >
			<div id="map" ></div>
	  </div>		  
	 
	  <!-- Start IR Creation -->
	  <div ng-show="showircreate">
	  <div class="item3">
	  
	  	<table width="100%" id="incdetailtbl">
		<tr>
			<td><h3a>CREATE </h3a></td>
		</tr>
	</table>
	  
			<!-- <div class='incscroll'>  -->
				<table width="100%">
					<tr><td>
					  

			<div class="panel-group" id="accordion2">	 
				 <div class="panel panel-default">
					<div class="panel-heading active">
						<h4 class="panel-title">
							   Incident<span data-target="#Collapseiconone" data-toggle="collapse" data-parent="#accordion2"> </span>
						</h4>
					</div>
					
					<div class="panel-collapse collapse in" id="Collapseiconone">
						<div class="panel-body">
									<!-- <p>Canning Messages</p>  -->
							
			<table width="100%" id="incdetailtbl">
					<tr>
					  <td colspan="3">
					  Fill in the details of your IR  <br><br>
						Status: <br>
						  <select ng-model="irstatus">
								<option  value="" selected="selected" hidden="hidden">Choose here</option>
								<option value="Confirmed">Confirmed</option>
								<option value="Over">Over</option>
								<option value="In Progress">In Progress</option>
								<option value="Notified">Notified</option>
								<option value="Other">Other</option>
							</select>
					  </td>
					  <td colspan="3"> Source: <br>
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
					   Start Time:
					
						<div style="width: 150px;">
							<div id="picker"> </div>
								<input type="text" placeholder="Start Time"  ng-model="irstarttime"/>
						</div>			
					  </td>
					  <td colspan="3">
						End Time: 
					 
						<div style="width: 150px;">
							<div id="picker1"> </div>
								<input type="text"  placeholder="End Time"  ng-model="irendtime"/>
						</div>			
					  </td>
					</tr>

					<tr>
					  <td colspan="3">
						Linked IR <br>
						  <select ng-model="irlinked">
								<option  value="" selected="selected" hidden="hidden">Choose here</option>
								<option value="ir372">IR 372</option>
								<option value="ir542">IR 542</option>
								<option value="ir 645">IR 645</option>
								<option value="other">other</option>
							</select>
						
					  </td>
					  <td colspan="3">
						Accident Type<br>
							<select ng-model="acctype">
								<option  value="" selected="selected" hidden="hidden">Choose here</option>
								<option value="collision">Collision</option>
								<option value="Slip Roads">Slip Roads</option>
								<option value="other">other</option>
							</select>
					  </td>
					</tr>
					
					<tr>
					  <td colspan="3">
						State of Roadway <br>
						  <select ng-model="rdway">
								<option  value="" selected="selected" hidden="hidden">Choose here</option>
								<option value="Damp / Wet">Damp / Wet</option>
								<option value="other">other</option>
							</select>
						
					  </td>
					  <td colspan="3">
						Type of Danger<br>
							<select ng-model="danger">
								<option  value="" selected="selected" hidden="hidden">Choose here</option>
								<option value="vehonfire">Veh. on fire</option>
								<option value="other">other</option>
							</select>
					  </td>
					</tr>
					<tr>
					  <td colspan="6">
						Slight: <input style="width:50.81px; height: 20px;" type="text"  placeholder="5"  ng-model="slight"/> 
						Serious: <input type="text"  style="width:50.81px; height: 20px;" placeholder="5"  ng-model="serious"/> 
						Fatal <input type="text"  style="width:50.81px; height: 20px;" placeholder="4"  ng-model="fatal"/>
					  </td>
					</tr>
				   <tr>
					  <td colspan="6">
						Image Captured <br>
						<select ng-model="imgcap">
								<option  value="" selected="selected" hidden="hidden">Choose here</option>
								<option value="#124641">#124641</option>
								<option value="#548641">#548641</option>
							</select>
							<img src="camera.JPG" width="25px" height="25px">
					  </td>
					</tr>
					
					<tr>
					  <td colspan="6">
						Damage to government Property <br>
						<textarea class="textareaincomments" rows="3" cols="48" ng-model="damagedetail">lamp post was damaged </textarea>
					  </td>
					</tr>
					 </table>
						</div>
					</div>
				  </div> 
				  
				  <div class="panel panel-default">
					<div class="panel-heading active">
						<h4 class="panel-title">
							   Lane Blockage<span data-target="#Collapseicontwo" data-toggle="collapse" data-parent="#accordion2"> </span>
						</h4>
					</div>
					
					<div class="panel-collapse collapse in" id="Collapseicontwo">
						<div class="panel-body">
						Block or Unblock Lanes 
				<table  width="100%">
					<tr>
					  <td align="center">
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
						</tr>
						  
						  </table>
					  <td>
					</tr>
					<tr>
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
					  </td>
					</tr> 
					</table>

						</div>
					</div>
				  </div>
				  
				 <div class="panel panel-default">
					<div class="panel-heading active">
						<h4 class="panel-title">
							   <span data-target="#Collapseiconthree" data-toggle="collapse" data-parent="#accordion2"> </span>
						</h4>
					</div>
					
					<div class="panel-collapse collapse in" id="Collapseiconthree">
						<div class="panel-body">
					<table width="50%" id="incblocktbl">
					<tr>
					  <td>          
						<label class="contentlabel"> Simulated 
						  <input type="checkbox">
						  <span class="checkmark" size=""></span>
						</label>
						</td>
						<td>
						<label class="contentlabel"> Important 
						  <input type="checkbox">
						  <span class="checkmark"></span>
						</label>
					   </td>
					   </tr>
					   <tr>
					  <td>
						 <label class="contentlabel"> VRS 
						  <input type="checkbox">
						  <span class="checkmark"></span>
						</label>
						</td>
						<td>
						<label class="contentlabel"> LTM
						  <input type="checkbox" >
						  <span class="checkmark"></span>
						</label>
					  </td>
					</tr>
					 <tr>
					  <td>
						 <label class="contentlabel"> Escalate via SMS  
						  <input type="checkbox">
						  <span class="checkmark"></span>
						</label>
						</td>
						<td>
					  </td>
					</tr>        
					</table>
						 		       <table width="100%">
				<tr>
					<td> <div align='right'>  
						<a href="#" class="buttonCreateMrtInc"  ng-click="callirresponse()" style="text-decoration:none;"> CREATE </a>
							<!-- <a href="#popup" class="button1a" id="button1a"  ng-click="showincidentlist()"> Close</a>  -->
					</div> </td>
				</tr>
				</table> 

						</div>
					</div>
				  </div> 
			</div>
				 </td></tr>
							 
				 </table>
		
		<!-- </div>	 -->
	</div>

	  </div>
	  <!-- end of Create IR -->
	<div ng-show="showirresponse">
	  <div class="item3">
	response window
	
	<table width="100%" id="incdetailtbl">
		<tr>
			<td>
				<a href="createirwin.jsp" style="text-decoration: none" ng-click="callircreate()"> <h3b>CREATE  </h3b> </a> &nbsp; <h3b> > </h3b>   &nbsp;   <h3a>RESPONSE</h3a>
			</td>
		</tr>
	</table> 
	
	</div>
	 </div>
	  <!-- Start IR Respnse -->
	</div>  
</div>
</div> 
</body>
</html>