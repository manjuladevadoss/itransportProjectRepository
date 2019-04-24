<!DOCTYPE html>  
<html>  
<head>  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
    <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no">  
    <title>MRT Stations eastwest line</title>  
    
    <!-- Map Css -->
    <link rel="stylesheet" href="https://js.arcgis.com/3.28/dijit/themes/claro/claro.css">
    <link rel="stylesheet" href="https://js.arcgis.com/3.28/esri/css/esri.css">
    <link rel="stylesheet" href="mrtmap.css">
    <!-- Map Css -->
	
	<link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="mrtinc.css"> 
	<link rel="stylesheet" href="checkboxstyle.css">
	 
	<!-- start plus and minu menu  script -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<!-- End plus and minu menu  script -->
 
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
	
	html, body, #mapDiv {  
        padding: 0;  
        margin: 0; 
		height:800px;						
    }
    </style> 

	 
 	<script src="bootstrap.min.js"></script>
  	<script src="jquery.js"></script>
	<script src="angular.min.js"></script>
  	<script src="democontroller.js"></script>  

    <!-- Map JS -->
    <script src="http://js.arcgis.com/3.28/"></script>  
    <script src="mrtmap.js"></script>  
    <!-- Map JS -->
	
	 <!-- Plus and minu menu  script -->	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	 <!-- end plus and minu menu  script -->	
    
	<script>  
     
    </script>  
</head>  
<body> 
<div class="container-fuide">
	<div ng-app="ltaApp" ng-controller="ltaController">
		<table  width="100%;" style="background-color: #202B53;" align="left">
			<tr>
				<td colspan="2"  height="80;">
					<h2t> MRT Service Disruption </h2t>
				</td>
			</tr>
			<tr>
				<td width="70%;" height="95% !important;" >
					<div id="mapDiv"></div>
				</td>
				<td width="30%;" height="95% !important;" valign="top">
				<!-- Start Creation option-->
				<div ng-show="createFlag">
					<table width="100%" id="incdetailtbl">
						<tr>
							<td><h3a>CREATE </h3a></td>
						</tr>
					</table> 				
					<!-- <div class='mrtincscroll'>  -->
	
	<table width="100%">
        <tr>
          <td>
	<div class="panel-group" id="accordion2">
		 <div class="panel panel-default">
	    	<div class="panel-heading active">
	        	<h4 class="panel-title">
	                 Incident <span data-target="#Collapseicon1" data-toggle="collapse" data-parent="#accordion2"> </span>
	            </h4>
	           <!-- <img src="horibar.JPG" height="auto" > -->
	        </div>
	        
	        <div class="panel-collapse collapse in" id="Collapseicon1">
	        <div class="panel-body">
			<table width="100%" id="mrtdetailtbl">
					<tr>
					  <td>					  
						Status: <br>
						  <select ng-model="irstatus" style="font-size: 15px; height: 25px; ">
								<option  value="" selected="selected" hidden="hidden">Choose here</option>
								<option value="Confirmed">Confirmed</option>
								<option value="Over">Over</option>
								<option value="In Progress">In Progress</option>
								<option value="Notified">Notified</option>
								<option value="Other">Other</option>
							</select>
					  </td>
					  <td> Source <br>
						  <select ng-model="irsource">
						  <option  value="" selected="selected" hidden="hidden">Choose here</option>
								<option value="ERS">ERS</option>
								<option value="JEYE">JEYE</option>
								<option value="other">Other</option>
							</select>
					  </td>
					</tr>
					<tr>
					  <td>
					   Start Time:
					
						<div style="width: 150px;">
							<div id="picker"> </div>
								<input type="text" placeholder="Start Time"  ng-model="irstarttime"/>
						</div>			
					  </td>
					  <td>
						End Time: 
					 
						<div style="width: 150px;">
							<div id="picker1"> </div>
								<input type="text"  placeholder="End Time"  ng-model="irendtime"/>
						</div>			
					  </td>
					</tr>
							
					 </table>

							</div>
						</div>
					 </div>
					 
					 <div class="panel panel-default">
						<div class="panel-heading active">
							<h4 class="panel-title">
								  <span data-target="#Collapseicon2" data-toggle="collapse" data-parent="#accordion2"> </span>
							</h4>
						   <!-- <img src="horibar.JPG" height="auto" > -->
						</div>
						
						<div class="panel-collapse collapse in" id="Collapseicon2">
							<div class="panel-body">
							 <table width="100%" id="mrtdetailtbl"> 
							<tr>
								<td>
									MRT / LRT Line <br>
									 <select ng-model="direction" class="selectcls" ng-options="o as o for o in stations" ng-change="mrtlinesel()">
										 <option value=""  selected="selected">{{mrtlsselected}}</option>
									 </select>
								</td>
								<td >
									Both Direction:	 <br>										
									<label class="contentlabel">
									  <input type="checkbox">
									  <span class="checkmark"></span>
									</label>
								</td>
							</tr>				
							<tr>
									<td>
									Start Station: <br>
								 <select ng-model="startstation" class="selectcls" ng-options="o as o for o in mrtline">
									 <option value=""  selected="selected">{{mrtsselected}}</option>
								 </select>
								</td>
								<td >
									End Station: <br>
								 <select ng-model="endstation" class="selectcls" ng-options="o as o for o in mrtlinend">
									<option value=""  selected="selected">{{mrteselected}}</option>
								 </select>
								</td>					
							</tr>
						</table>
							</div>
						</div>
					 </div>
					 
						<div class="panel panel-default">
						<div class="panel-heading active">
							<h4 class="panel-title">
								  <span data-target="#Collapseicon3" data-toggle="collapse" data-parent="#accordion2"> </span>
							</h4>
						   <!-- <img src="horibar.JPG" height="auto" > -->
						</div>
						
						<div class="panel-collapse collapse in" id="Collapseicon3">
							<div class="panel-body">
										   <table width="50%">
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
									</table>
							</div>
						</div>
					 </div>
					 
					 <div class="panel panel-default">
						<div class="panel-heading active">
							<h4 class="panel-title">
								  <span data-target="#Collapseicon4" data-toggle="collapse" data-parent="#accordion2"> </span>
							</h4>
						   <!-- <img src="horibar.JPG" height="auto" > -->
						</div>
						
						<div class="panel-collapse collapse in" id="Collapseicon4">
							<div class="panel-body">
								<table width="100%"  id="mrtdetailtbl">
								<tr>
								  <td>
								   <h3b> Alarms / Alerts</h3b> 
								  </td>
								</tr>
								<tr>
								  <td>
									 <font style="color:green"><input type="text" style="width:350.81px;" placeholder="Alert" ng-model="irimgcap"></font>
								  </td>
								</tr>
							  </table>
							</div>
						</div>
					 </div>
				 </div>
				 </td></tr>
				 </table>
	 
	  <!-- </div>  -->
			  <table width="100%">
				<tr>
				<td> <div align='right'>  
				<a href="#" class="buttonCreateMrtInc"  ng-click="addincident()" style="text-decoration:none;"> CREATE </a>
				<!-- <a href="#popup" class="button1a" id="button1a"  ng-click="showincidentlist()"> Close</a>  -->
				</div> </td>
				</tr>
			</table> 	
		</div>			
				<!--******** end of Create option -->

				<!--******** Start Response option -->
				<div ng-show="responseFlag">
					<table width="100%" id="incresponsetbl">
						<tr>
							<td>
								<a href="#" style="text-decoration: none" ng-click="callmrtircreate()"> <h3b> CREATE  </h3b> </a> &nbsp; <h3b> > </h3b>   &nbsp;   <h3a>RESPONSE</h3a>
							</td>
						</tr>
					</table> 
				</div>
				<!--******** End of Response option -->
				</td>
			</tr>	
		</table>
	</div>
 </div>
</body>  
</html> 