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
	<link rel="stylesheet" href="eventmap.css"> 
    <script type="text/javascript"  src="eventmap.js"></script>
	<!-- End of Map View -->
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no"/>
    
    
		  <!-- start plus and minu menu  script -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	   <!-- end plus and minu menu  script -->
	
 <style>
/* toggle plus and Minus background color*/
.panel-heading.active {
    
	background-color: #202B53;
 /* color: #C8CFF4;   
    border : none;*/ 
}
.panel-title { 
 font-size: 18px;
  padding-bottom:6px;
  color: #C8CFF4; 
}
.panel-body {
    background-color: #202B53 ;
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
.dropdown-content {
 min-width: 180px;
 }
 .dropdown-content a {
  min-width: 180px;
 }

  /*   #map {
        height: 200%;
        margin: 0;
        padding: 0;
		width:100%;
      } */
 
table.incdetailtblscroll tbody {
  display: block; 
    height: 400px;
    overflow-y: auto;
    overflow-x: hidden;
}
table.incdetailtblscroll  {
  border-collapse: collapse;
  width: 100%;
}

table.incdetailtblscroll  td, table.incdetailtblscroll th {
  padding: 10px;
  color: #C8CFF4; 
  font-size: 13px;
  width: 25% ;
  background: none; 
}

</style>

</head>
    <script>

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
	
	
	<table width="100%;" style="background-color: #202B53;">
		<tr>
			<td colspan="2"  height="80;">
				 <h2t> Incident Record </h2t>
			</td>
		</tr>
		<tr>
			<td width="70%;"  height="95% !important;">
			  <div id="info1">          
		          	<button id="Circle" class="buttoneventbub"> + Add Event Bubble</button>  
		      	</div>  
		      	<div id="info2">
		        	<button id="Line"  class="buttoneventclo"> + Add Road Closure</button>
		      	</div> 
		     	<div id="mapDiv"></div>  
			</td>
			<td width="30%;"  height="95% !important;" valign="top">
	<!-- Start IR Creation -->
	  <div ng-show="showircreate">
	  <!-- <div class="item3" style="background-color: #202B53;"> -->
	  
	  	<table width="100%" id="incdetailtbl"> 
		<tr>
			<td><h3a>CREATE </h3a></td>
		</tr>
	</table>
	  
			
	 <!-- <div class='incscroll'>   -->

			<div class="panel-group" id="accordion2">	

			
				 <div class="panel panel-default">
					<div class="panel-heading active">
						<h4 class="panel-title">
							   Incident<span data-target="#Collapseiconone" data-toggle="collapse" data-parent="#accordion2"> </span>
						</h4>
					</div>
					
					<div class="panel-collapse collapse in" id="Collapseiconone">
						<div class="panel-body">
																
			<table class="incdetailtblscroll">
			<tbody>
					<tr>
					 <th colspan="6"> Fill in the details of your IR  </th>
					 </tr>
					 
					 <tr>
					  <td colspan="3">
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
					</tbody>
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
				<table>
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
					  </td>
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
				

						</div>
					</div>
				  </div> 
				  <table>
				<tr>
					<td align='right'>   
						<a href="#" class="buttonCreateMrtInc"  ng-click="callirresponse()" style="text-decoration:none;"> CREATE </a>
					</td>
				</tr>
				</table> 
			</div>
			
			
			
			<!-- </div> -->
			
		
		<!-- </div>	 -->
	<!-- </div> -->

	  </div>
	<!-- end of Create IR -->
	
	<!-- Start of IR  Response -->
	<div ng-show="showirresponse">
		
	<table width="100%" id="incresponsetbl">
		<tr>
			<td>
				<a href="createirwintbl.jsp" style="text-decoration: none" ng-click="callircreate()"> <h3b> CREATE  </h3b> </a> &nbsp; <h3b> > </h3b>   &nbsp;   <h3a>RESPONSE</h3a>
			</td>
		</tr>
	</table> 
	
		<!-- <div class='scrollResponse'>  -->
 		  
		  <div class="panel-group" id="accordion2">
     
     <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">           	             	
                    VMS Messages <span data-target="#Collapseiconfour" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus" style="float:right;"></span></span>
            </h4>
			<!-- <img src="horibar.JPG" height="auto" > -->
        </div>
        
        <div class="panel-collapse collapse in" id="Collapseiconfour">
        	<div class="panel-body">
            	<p>Recommended VMS Messages </p>
			<table width="100%" class="tablevms">  
			<tr>
				<th align="left" style="padding:5px;">Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </th>
				<th align="left">EQT ID <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></th>
				<th align="left">Recommended Display <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </th>
				<th align="left"></th>		
			</tr>
			<tr>
				<td> 
				<div ng-if="vmsMsgStatus==='Failed'"> <span class="dotfail"></span> {{vmsMsgStatus}} </div>
				<div ng-if="vmsMsgStatus==='Implemented'"> <span class="dotimp"></span> {{vmsMsgStatus}} </div>
				<div ng-if="vmsMsgStatus==='Not Active'">  <span class="dotnotact"></span> {{vmsMsgStatus}} </div>
				
				
				</td>
				<td>TIP_758092</td>
				<td><textarea class = "textareaVmsMsg" rows="3" cols="28"  placeholder="Heavy Traffic at Dunearn Road" ng-model="recommMsg" ng-click="enableText()" > </textarea></td>
				<td> <i class="material-icons" style="font-size:8px;color:#C8CFF4;">border_color</i> </td>
				
			</tr>	
			</table>
			<table width="100%"> 
				<tr>
					<td align="right">
						<a href="#" class="buttonRem" id="buttonRem" ng-click="vmsMsgRemoved()" style="text-decoration:none;"> Remove </a> 
						<a href="#" class="buttonImp" id="buttonImp" ng-click="vmsMsgImpl()" style="text-decoration:none;"> Implement </a>	
					</td>
				</tr>
	 	 </table>
            </div>
        </div>
     </div>
     <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">
                   Canning Message<span data-target="#Collapseiconfive" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
           <!-- <img src="horibar.JPG" height="auto" > -->
        </div>
        
        <div class="panel-collapse collapse" id="Collapseiconfive">
        	<div class="panel-body">
            	<!-- <p>Canning Messages</p>  -->
            	<p>Enter Canning Messages</p>
			   <table width="100%" class="tablevms"> 
					<tr>
						<td>
							<textarea class = "textareaVmsMsg" rows="3" cols="55" placeholder="This road has heavy traffic, please Note." ng-model="canningMsg"> </textarea>
							<a href="#" class="buttonImp" id="buttonImp" ng-click="canMsgSend()"> Send </a>						
						</td>
					</tr>
			 </table>
            </div>
        </div>
     </div>
       <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">
                   OBU Messages <span data-target="#Collapseiconsix" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
            <!-- <img src="horibar.JPG" height="auto" > -->
        </div>
        
        <div class="panel-collapse collapse" id="Collapseiconsix">
        	<div class="panel-body">
           	
          	<p>OBU Message </p>
				<table width="100%" class="tablevms" >  
					<tr>
						<th colspan="3" bgcolor="#EE5656" style="padding:5px;"> Alert </th>
					</tr>
					<tr>					
						<td> 
							<div ng-if="obuMsgStatus==='Failed'"> <span class="dotfail"></span> {{obuMsgStatus}} </div>
							<div ng-if="obuMsgStatus==='Implemented'"> <span class="dotimp"></span> {{obuMsgStatus}} </div>
							<div ng-if="obuMsgStatus==='Not Active'">  <span class="dotnotact"></span> {{obuMsgStatus}} </div>					
						</td>
						<td> <textarea class = "textareaVmsMsg" rows="3" cols="42" ng-model="recommMsg" ng-click="enableText()"  placeholder="Message to be displayed on OBU"> {{obuMsg}} </textarea></td>						
						<td>KM Marking 
						<textarea class = "textareaVmsMsg" rows="1" cols="3" ng-model="markalert" ng-click="enableText()" placeholder="1.2" > {{obuMsg}}</textarea></td>
						
					</tr>
					<tr>
						<th colspan="3" bgcolor="#ECD641" style="padding:5px;"> Jam</th>
					</tr>
					<tr>
						<td> 
							<div ng-if="obuMsgStatus==='Failed'"><h6> <span class="dotfail"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Implemented'"><h6> <span class="dotimp"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Not Active'"><h6>  <span class="dotnotact"></span> {{obuMsgStatus}} </h6></div>						
						</td>
						<td> <textarea class = "textareaVmsMsg" rows="3" cols="42" ng-model="jamMsg" ng-click="enableText()" placeholder="Message to be displayed on OBU" > {{obuMsg}}</textarea></td>						
						<td>KM Marking<textarea class = "textareaVmsMsg" rows="1" cols="3" ng-model="markjam" ng-click="enableText()" placeholder="1.2" > {{obuMsg}}</textarea></td>	
					</tr>
					<tr>
						<th colspan="3" bgcolor="#41EC42" style="padding:5px;"> Guide</th>
					</tr>	
					<tr >
						<td> 
							<div ng-if="obuMsgStatus==='Failed'"><h6> <span class="dotfail"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Implemented'"><h6> <span class="dotimp"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Not Active'"><h6>  <span class="dotnotact"></span> {{obuMsgStatus}} </h6></div>						
						</td>
						<td> <textarea class = "textareaVmsMsg" rows="3" cols="42" ng-model="guideMsg" ng-click="enableText()"  placeholder="Message to be displayed on OBU" > {{obuMsg}}</textarea></td>						
						<td>KM Marking<textarea class = "textareaVmsMsg" rows="1" cols="3" ng-model="markguide" ng-click="enableText()" placeholder="1.2" > {{obuMsg}}</textarea></td>	
					</tr>					
				</table>
				<table width="100%"> 
				<tr>
					<td align="right">
						<a href="#" class="buttonRem" id="buttonRem" ng-click="obuMsgdeact()" style="text-decoration:none;"> Deactivate All </a> 
						<a href="#" class="buttonImp" id="buttonImp" ng-click="obuMsgImpl()" style="text-decoration:none;"> Implement All </a>	
					</td>
				</tr>
				</table> 
          	
            </div>
        </div>
     </div>
     
     <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">               	
                    Conjestion Routes Monitoring <span data-target="#Collapseiconseven" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
            </h4>
           <!-- <img src="horibar.JPG" height="auto" > -->
        </div>
         
        <div class="panel-collapse collapse" id="Collapseiconseven">
        	<div class="panel-body">
            	<p>Conjestion Routes Monitoring </p>
            </div>
        </div>
     </div>
   
     <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">              	
                   Partners & Vehicle Response<span data-target="#Collapseiconeight" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
        </div>
        
        <div class="panel-collapse collapse" id="Collapseiconeight">
        	<div class="panel-body">
            	<p>Partners Vehicle Handling</p>
					<table width="100%" class="tablevms">  
						<tr>
							<th align="left" style="padding:5px;"> Type <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4;"></i></th>
							<th align="left"> Vehicle No. </th>
							<th align="left"> Notify Time </th>
							<th align="left"> Arrival Time </th>	
							<th align="left"> Depature Time </th>								
						</tr>					
						<tr>
							<td>
							<select name="item2" ng-model="partnerTypepart" style="height: 20px; width: 90px;font-size: 10px;">
								<option value="Ambulance" >Ambulance</option>
								<option value="Ambulance">Ambulance2</option>
								<option value="Ambulance">Ambulance3</option>
							</select>
							
							</td>
							<td><input type="text" ng-click="" ng-model="partnerVehNopart" placeholder="RX23293" style="height: 20px; width: 90px;font-size: 10px;"></td>
							<td><input type="text" ng-click="" ng-model="partnerNotiTimepart" placeholder="1/24/2018 12:00" style="height: 20px; width: 90px;font-size: 10px;"></td>
							<td><input type="text" ng-click="" ng-model="partnerArrTimepart" placeholder="1/24/2018 12:00" style="height: 20px; width: 90px;font-size: 10px;"></td>
							<td><input type="text" ng-click="" ng-model="partnerDepatTimepart" placeholder="1/24/2018 16:00" style="height: 20px; width: 90px;font-size: 10px;"></td>
						</tr>
					</table>
					<table width="100%"> 
						<tr>
							<td align="right">
								<a href="#" class="buttonRem" id="buttonRem" ng-click="parterMsgRemove()" style="text-decoration:none;"> Remove </a> 
								<a href="#" class="buttonImp" id="buttonImp" ng-click="parterMsgAdd()" style="text-decoration:none;"> Add </a>	
							</td>
						</tr>
				 </table>			
				<p>LTA Vechicles</p>
				<table width="100%" class="tablevms">  
						<tr>
							<th align="left" style="padding:5px;"> Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4;font-size: 12px;"></i></th>
							<th align="left"> Vehicle No. </th>
							<th align="left"> Parking Address</th>
							<th align="left"> Parking Lot No.</th>	
							<th align="left"> Notify Time </th>								
						</tr>					
						<tr>
							<td>
							<select name="item4" ng-model="partnerType3vec" style="height: 20px; width: 90px;font-size: 10px;">
								<option value="Tower1" >Tower1</option>
								<option value="Tower1">Tower2</option>
								<option value="Tower3">Tower3</option>
							</select>
							
							</td>
							<td><input type="text" ng-click="" ng-model="partnerVehNovec" placeholder="RX23293" style="height: 20px; width: 90px;font-size: 10px;"></td>
							<td><input type="text" ng-click="" ng-model="partnerNotiTimevec" placeholder="Bedok AVe 3" style="height: 20px; width: 90px;font-size: 10px;"></td>
							<td><input type="text" ng-click="" ng-model="partnerArrTimevec" placeholder="46" style="height: 20px; width: 90px;font-size: 10px;"></td>
							<td><input type="text" ng-click="" ng-model="partnerDepatTimevec" placeholder="1/24/2018 16:00" style="height: 20px; width: 90px;font-size: 10px;"></td>
						</tr>					
					</table>
					<table width="100%"> 
						<tr>
							<td align="right">
								<a href="#" class="buttonRem" id="buttonRem" ng-click="parterMsgRemove()" style="text-decoration:none;"> Remove </a> 
								<a href="#" class="buttonImp" id="buttonImp" ng-click="parterMsgAdd()" style="text-decoration:none;"> Add </a>	
							</td>
						</tr>
				 </table>
				
            </div>
        </div>
     </div>
    <div align="right"><a href="createinc.jsp" class="buttonCreateMrtInc" ng-click="addmrtincident()" style="text-decoration:none;"> SAVE </a></div> 
</div>		  	  
	
	  
	 <!-- </div> -->
	
	
	
	
	 </div>
	  <!-- end of IR Respnse -->
	  
	  
			</td>
		</tr>
	</table>

</div>
</div> 
</body>
</html>