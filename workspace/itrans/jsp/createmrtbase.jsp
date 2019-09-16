<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no" />
    <title> Create IR MRT  </title>
  	<link rel="stylesheet" href="http://localhost:8080/itrans/arcgis_4.11/esri/themes/light/main.css" />
  	<link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="mrtinc.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" >
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		
	<link rel="stylesheet" href="checkboxstyle1.css">
	<link rel="stylesheet" href="dropdownlistStylePopup.css">  <!-- dropdown inside the popup add lane view-->
	 <link rel="stylesheet" href="dropdownlistStyle.css"> <!-- dropdown inside status,source add lane view-->
	 <link rel="stylesheet" href="radiobuttonstyle.css">
	  
 	<script type="text/javascript"  src="jquery.js"></script> 
 	<script type="text/javascript" src="bootstrap.min.js"></script>
 	<script type="text/javascript" src="popper.min.js"></script>
  	<script src="angular.min.js"></script>
  	<script type="text/javascript"  src="democontroller.js"></script> 
  	
  	<!-- Start Date and Time -->
	  	<link rel="stylesheet" href="bootstrap-datetimepicker.min.css">
	 <!-- End of  Date and Time --> 
	 	 
	 <!-- Start Date and Time -->
	 	<script src="bootstrap-datetimepicker.min.js"></script>
 	 <!-- End of Date and Time --> 
	  
  	<script  type="text/javascript" src="angular.min.js"></script>
  	<script type="text/javascript" src="democontroller.js"></script>  
    
	<!-- start plus and minu menu  script -->
    <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  -->
	<!-- end plus and minu menu  script -->
	
	<script src="http://localhost:8080/itrans/arcgis_4.11/init.js"></script>  
	<script src="basemap411mrt.js"></script>  
  
 <style>  
	html,
      body,
      #viewDiv {
        position: absolute;
        left: 0;
       right: 0.1px;
        top: 0;
        bottom: 0;
        height: 100%; /* allow space for sublayer switcher */
	
      }
      #instruction {
        z-index: 99;
        position: absolute;
        top: 55px;
        left: 50%;
        padding: 5px;
        margin-left: -175px;
        height: 20px;
        width: 350px;
      }

      .esri-layer-list {
        width: 310px;
      }
	  
	#panelTopDiv {
	   position: absolute;
        /*top: 12px;*/
        left: 62px;
        width: 80%;
        padding: 0 12px 0 12px;
        background-color: #202B53;
        border: 1px solid #202B53;
        color: black;
      }
	#panelRightDiv {      
        background-color: #f5f5f5;
        position: absolute;
        right: 0;
        height: 100%;
        width: 550px;
        font-size: 12px;
		background-color: #202B53;
      }
      	#mrtlinediv {
		  top: 150px;
		  left: 10px;
		  position: absolute;
		 /* z-index: 9;*/
		  border: solid 0px;
		  background-color:none;
		  width: 600px;
		  height: 550px;
		  border-radius: 13px;
		  text-align: center;
		}

/* popup window font and background color*/
.esri-view-width-xlarge .esri-popup__main-container,
.esri-view-width-large .esri-popup__main-container,
.esri-view-width-medium .esri-popup__main-container
{
  max-height: 100px !important;
  max-width: 300px !important;
  background-color: black;
  color: white;
    font-size: 14px;
    font-family: Roboto, Helvetica, sans-serif;
    line-height: 1.3em;
}

/*Remove the zoom button popup window*/
.esri-popup__main-container .esri-popup__footer
 {
  display: none;
} 

/*Remove dock and close button popupwindow*/
.esri-popup__main-container .esri-popup__header-buttons {
    display: none;
}

/*change color in middle triangular button popupwindow*/
.esri-popup--aligned-top-center .esri-popup__pointer-direction {
background-color: black;
}
      
h3 {
  color: #C8CFF4;
  font-size: 15px; padding: 10px;
}

h4 {
  color: #C8CFF4;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 18px;
  padding: 10px;
}
h5 {
  color: #C8CFF4;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 15px;
   padding: 10px;
}
.checkmark {
     left: 10;
}
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
    font-size: 13px;
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
 .textareaVmsMsg { 
 font-size: 1em;
 color: #C8CFF4;
 font-family: Roboto, Helvetica, sans-serif;
 font-weight: bold;
 background-color: #2C3A77;
 border-radius: 8px;
 border: none;
}
.mrtclosedbutton {
  color: #C8CFF4;
  font-family:  Roboto, Helvetica, sans-serif;
  box-shadow: 2px 2px 8px 0 rgba(0,0,0,0.5);
  border-radius: 13px;
  background-color:#356D85;
  border: solid 0px #356D85;
  width:160px;
  height:30px
}

.mrtresetbutton {
  color: #C8CFF4;
  font-family:  Roboto, Helvetica, sans-serif;
  box-shadow: 2px 2px 8px 0 rgba(0,0,0,0.5);
  border-radius: 13px;
  background-color:#356D85;
  border: solid 0px #356D85;
  width:100px;
  height:30px
}

    </style>

 
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
  </head>
<body class="calcite-maps calcite-nav-top">
	<div class="container-fluid">
		<div ng-app="ltaApp" ng-controller="ltaController">
		<!--
		<table width="100%" border="1"> 
		<tr>
		<td> </td>
		</tr>
		</table>  -->
  
	  <div id="main" class claro>
	   <div id="viewDiv"> </div>  
	  
	  <!-- mrt route selection div -->
	  <div ng-show="mrtincflag">
	    <div id="instruction"> 
	           <div id="mrtlinediv">    	 
			<table   width="100%;" class="mrtinctable"> 
				<tr>
					<td colspan="2"> 
					    <h4>MRT Service Disruption  {{mrtsselected}} -{{mrteselected}} </h4> 					
						<h5>Create a MRT Service Disruption IR. Start By defining a start point and end point.</h5>
					</td>
				</tr>
				<tr>
					<td align="right">
						<h3>MRT / LRT Line</h3>  
						 <select ng-model="direction" class="selectcls" ng-change="mrtlinesel()" ng-options="o as o for o in stations">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
    					 </select>
    					 <div ng-show="hidetextbox">
    					 	<input type="text" name="directionid" id="directionid" ng-model="directionid" >
    					 </div> 
					</td>
					
					<td align="right">
						<h3>Both Direction: </h3> 
						<label class="contentlabel" style="font-size:17px;">
						  <input type="checkbox" ng-model="bothdir">
						 <span class="checkmark"></span>
						</label>
					</td>						
				</tr>
				<tr>
					<td>
						<h3>Start Station</h3> 
						<select ng-model="startstation" class="selectcls" ng-change="mrtssel()"  ng-options="o as o for o in mrtline">
							<option value=""  selected="selected" hidden="hidden">Choose here</option>
						</select>		
					</td>
					<td>
						<h3>End Station</h3> 
						<select ng-model="endstation" class="selectcls" ng-change="mrtesel()"  ng-options="o as o for o in mrtlinend">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
    				 </select>

						
					</td>					
				</tr>

				<tr>
				<td> 
					<br>
					<div id="createdir" align="right">
						<a href="#" class="buttonCreateMrtInc" id="createmrtincid" ng-click="createmrtinc()" style="text-decoration:none;">  CREATE </a>
							<!-- <button  class="buttonCreateMrtInc"  ng-click="createmrtinc()" style="text-decoration:none;"> CREATE </button> -->
					</div>
				</td> 
				<td> 
					<br>
					<button type="button" class="buttonCan"  id="buttonCan" ng-click="cancelmrtinc()">CANCEL</button>	&nbsp;&nbsp;&nbsp;				 
				</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;&nbsp;</td>
				</tr>
	 	 </table>  
		</div> 
		</div>
</div>
	  <!--  end of mrt route selection div -->
	  
	  
	  <!--  Mrt creation top and right side panel div -->
<div ng-show="mrtinccreateflag"> 
	  <div id="instruction">    
					       <!--  <button class="mrtclosedbutton" id="mrtclosepoint" >MRT Closed Points  </button>
					        <button id="vms" >VMS Picture Symbol</button>
					        <button id="line" >Draw a Line </button>
					        
					       <button id="rdclose" > Road closure Automatic Line </button>
					       <button id="rdclosepoint" >Road Closure Entry Exit Picture Symbol  </button> 
					       <button id="undo" class="mrtresetbutton" >Reset  </button>  -->
				      </div>   
     <div id="panelTopDiv"  style="background-color: #202B53;">
    	<h4>MRT Service Disruption  </h4> 
    </div>  
	  
	       <div id="panelRightDiv" class="esri-widget">
    
         <br> 
		 <br> 
		 <br> 
						<!-- Start Creation option-->
				<table width="100%" id="incdetailtbl">
						<tr>
							<td><h3a>&nbsp;CREATE </h3a></td>
						</tr>
					</table> 				
<div class='mrtincscroll'> 
	
	<table width="100%">
        <tr>
          <td>
	<div class="panel-group" id="accordion2">
		 <div class="panel panel-default">
	    	<div class="panel-heading active">
	        	<h4 class="panel-title">
	                 Incident <span data-target="#Collapseiconmrt1" data-toggle="collapse" data-parent="#accordion2"> </span>
	            </h4>
	        </div>
	        
	        <div class="panel-collapse collapse in" id="Collapseiconmrt1">
	        <div class="panel-body">
			<table width="100%" id="mrtdetailtbl">
					<tr>
					  <td>					  
						Status: <br>
						  &nbsp;&nbsp;<select ng-model="mrtStatus" style="font-size: 15px; height: 25px; ">
								<option ng-repeat="option in mrtStatusList" value="{{option.mrtstaid}}">{{option.name}}</option>
							</select>
					  </td>
					  <td> Source <br>
						  &nbsp;&nbsp;<select ng-model="mrtSource">
						  <option ng-repeat="option1 in mrtSourceList" value="{{option1.mrtsouid}}">{{option1.name}}</option>
							</select>
					  </td>
					</tr>
					<tr>
					  <td>
					   Start Time:	<br>				
								&nbsp;&nbsp;<input type="text" placeholder="Start Time"  ng-model="irstarttime"/>
					  </td>
					  <td>
					<!-- 	End Time: <br>
								&nbsp;&nbsp;<input type="text"  placeholder="End Time"  ng-model="irendtime"/>  -->		
					  </td>
					</tr>
							
					 </table>

							</div>
						</div>
					 </div>
					 
					 <div class="panel panel-default">
						<div class="panel-heading active">
							<h4 class="panel-title">
								  <span data-target="#Collapseiconmrt2" data-toggle="collapse" data-parent="#accordion2"> </span>
							</h4>
						</div>
						
						<div class="panel-collapse collapse in" id="Collapseiconmrt2">
							<div class="panel-body">
							 <table width="100%" id="mrtdetailtbl"> 
							<tr>
								<td>
									MRT / LRT Line <br>
									<select ng-model="direction" class="selectcls" ng-options="o as o for o in stations" ng-change="mrtlinesel()">
										 <option value=""  selected="selected"></option>
									 </select>  
								</td>
								<td >
									Both Direction:	 <br>										
									<label class="contentlabel">
									  <input type="checkbox" ng-model="bothdir">
									  <span class="checkmark"></span>
									</label>
								</td>
							</tr>				
							<tr>
									<td>
									Start Station: <br>
								 <select ng-model="startstation" class="selectcls" ng-options="o as o for o in mrtline" ng-change="setStartStation()">
									 <option value=""  selected="selected"></option>
								 </select>
								</td>
								<td >
									End Station: <br>
								 <select ng-model="endstation" class="selectcls" ng-options="o as o for o in mrtlinend"  ng-change="setendStation()">
									<option value=""  selected="selected"></option>
								 </select>
								</td>					
							</tr>
						</table>
							</div>
						</div>
					 </div>
					 
				<!--  		<div class="panel panel-default">
						<div class="panel-heading active">
							<h4 class="panel-title">
								  <span data-target="#Collapseiconmrt3" data-toggle="collapse" data-parent="#accordion2"> </span>
							</h4>
						</div>
						
						<div class="panel-collapse collapse in" id="Collapseiconmrt3">
							<div class="panel-body">
								<table width="50%">
									<tr>
									  <td>          
										<label class="contentlabel"> Simulated 
										  <input type="checkbox" ng-model="mrtsimu">
										  <span class="checkmark" size=""></span>
										</label>
										</td>
										<td>
										<label class="contentlabel"> Important 
										  <input type="checkbox" ng-model="mrtimpo">
										  <span class="checkmark"></span>
										</label>
									   </td>
									   </tr>
									   <tr>
									  <td>
										 <label class="contentlabel" > VRS 
										  <input type="checkbox" ng-model="mrtvrs">
										  <span class="checkmark"></span>
										</label>
										</td>
										<td>
										<label class="contentlabel"> LTM
										  <input type="checkbox"  ng-model="mrtltm">
										  <span class="checkmark"></span>
										</label>
									  </td>
									</tr>      
									</table>  
							</div>
						</div>
					 </div> -->
					 
					 <div class="panel panel-default">
						<div class="panel-heading active">
							<h4 class="panel-title">
								  <span data-target="#Collapseiconmrt4" data-toggle="collapse" data-parent="#accordion2"> </span>
							</h4>
						</div>
						
						<div class="panel-collapse collapse in" id="Collapseiconmrt4">
							<div class="panel-body">
								<table width="100%"  id="mrtdetailtbl">
								<tr>
								  <td>
								   <h3b> Alarms / Alerts</h3b> 
								  </td>
								</tr>
								<tr>
								  <td>
									 <font style="color:#7CFC00 "><input type="text" style="width:350.81px;" placeholder="Alert" ng-model="mrtincalrmalert">  </font>
								  </td>
								</tr>
							  </table>
							</div>
						</div>
					 </div>
				 </div>
				 </td></tr>
				 </table>	 
</div>  
			  <table width="100%">
				<tr>
				<td> <div align='right'>   
					<div id="createdir1">
				<a href="#" class="buttonCreateMrtInc"  ng-click="addmrtincident()" style="text-decoration:none;"> CREATE </a> &nbsp;&nbsp;
				</div>
				<!-- <a href="#popup" class="button1a" id="button1a"  ng-click="showincidentlist()"> Close</a>  -->
				</div> </td>
				</tr>
			</table> 
	

      </div>  
</div>
	  <!--  end of mrt creation top and right side panel div -->
		</div>
		
		</div>
	</div>  
</body>
</html>