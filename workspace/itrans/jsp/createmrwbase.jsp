<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no" />
    <title> Create IR Mobile Road Work  </title>
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
 <!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  -->
	<!-- end plus and minu menu  script -->
	
	<script src="http://localhost:8080/itrans/arcgis_4.11/init.js"></script>  
	<script src="basemap411mrw.js"></script>  
  
 <style>  
/*Start  map */	
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
        top: 50px;
        left: 15%;
        padding: 5px;
        margin-left: -175px;
        height: 20px;
        width: 350px;
      }
	  #instruction1 {
		z-index: 99;
        position: absolute;
        top: 50px;
        right: 20%;
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
/*End map */

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
.irresetbutton {
  color: #C8CFF4;
  font-family:  Roboto, Helvetica, sans-serif;
  box-shadow: 2px 2px 8px 0 rgba(0,0,0,0.5);
  border-radius: 13px;
  background-color:#356D85;
  border: solid 0px #356D85;
  width:80px;
  height:30px
}
.iractionbutton {
  color: #C8CFF4;
  font-family:  Roboto, Helvetica, sans-serif;
  box-shadow: 2px 2px 8px 0 rgba(0,0,0,0.5);
  border-radius: 13px;
  background-color:#356D85;
  border: solid 0px #356D85;
  width:90px;
  height:30px
}

.tablevms tr:hover {
background-image: linear-gradient( 90deg,	rgba(98,55,55,1) , rgba(39,26,57,1));
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
	  <div id="instruction">    
					       <button class="irresetbutton" id="line"> Add Route </button>
					        <button class="irresetbutton" id="mrwlocation"> RoadWork </button>
				      </div>  
 <div id="instruction1">
 <button class="irresetbutton" id="undo" >Reset  </button>
</div> 
     <div id="panelTopDiv"  style="background-color: #202B53;">
    <h2t> Incident Record - Mobile Road Work </h2t> <br>
    </div>  
	  
	       <div id="panelRightDiv" class="esri-widget">
    
         <br> 
		 <br> 
		
		 <br> 
		<!-- Start IR Creation -->
	  <div ng-show="showmrwcreate">
	  
	  	<table width="100%" id="incdetailtbl"> 
		<tr>
			<td><h3a>CREATE </h3a>&nbsp;<h3b>></h3b>&nbsp;<h3b>RESPONSE</h3b></td>
		</tr>
	</table>
	  
			
	 <div class='scrollIr'> 

			<div class="panel-group" id="accordion2">	
				 <div class="panel panel-default">
					<div class="panel-heading active">
						<h4 class="panel-title">
							   Incident<span data-target="#Collapseicon1" data-toggle="collapse" data-parent="#accordion2"><span class="glyphicon glyphicon-plus" style="float:right;"></span> </span>
						</h4>
					</div>
					
					<div class="panel-collapse collapse in" id="Collapseicon1">
						<div class="panel-body">
																
			<table id="incdetailtbl">
					<tr>
					 <th colspan="6"> Fill in the details of your IR  </th>
					 </tr>
					 <tr>
					  <td colspan="3">
						State: <br>
								<input type="text" placeholder="Start Time"  ng-model="mrwstate"/>
					  </td>
					  <td colspan="3"> Source: <br>
								<input type="text" placeholder="Start Time"  ng-model="mrwsource"/>
					  </td>
					</tr>
					<tr>
					  <td colspan="3">
					   Start Time:
						<div style="width: 150px;">
							<div id="picker"> </div>
								<input type="text" placeholder="Start Time"  ng-model="mrwstarttime"/>
						</div>			
					  </td>
					  <td colspan="3">
						End Time: 
					 
						<div style="width: 150px;">
							<div id="picker1"> </div>
								<input type="text"  placeholder="End Time"  ng-model="mrwendtime"/>
						</div>			
					  </td>
					</tr>
					<tr>
					  <td colspan="3">
						Contractor Name
						<br>
						<input type="text"  placeholder="End Time"  ng-model="mrwcontname"/>
					  </td>
					  <td colspan="3">
						Work Permit No<br>
						<input type="text"  placeholder="End Time"  ng-model="mrwperno"/>
					  </td>
					</tr>
					
					<tr>
					  <td colspan="3">
						Supervisor Name <br>
							<input type="text"  placeholder="End Time"  ng-model="mrwsupvisorname"/>
					  </td>
					  <td colspan="3">
						Supervisor HP<br>
						<input type="text"  placeholder="End Time"  ng-model="mrwsupvisorhp"/>
					  </td>
					</tr>
					<tr>
					  <td colspan="6">
							Comments <br>
							<textarea class="textareamrwcomment" rows="3" cols="40"  ng-model="mrwcomment"> </textarea>
					  </td>
					</tr>
				   <tr>
					  <td colspan="6">
						Vehicle Number <br>
						<input type="text"  placeholder="End Time"  ng-model="mrwvehicleno"/>
					  </td>
					</tr>
					
				 </table>
				 
				 <br><br>
				 <table width="50%" id="incblocktbl">
					<tr>
					  <td>          
						<label class="contentlabel"> Simulated 
						  <input type="checkbox" ng-model="mrwsimul">
						  <span class="checkmark" size=""></span>
						</label>
						</td>
						<td>
						<label class="contentlabel"> Important 
						  <input type="checkbox" ng-model="mrwimpor">
						  <span class="checkmark"></span>
						</label>
					   </td>
					    <td>
						 <label class="contentlabel"> VRS 
						  <input type="checkbox" ng-model="mrwvrs">
						  <span class="checkmark"></span>
						</label>
						</td>
						<td>
						<label class="contentlabel"> LTM
						  <input type="checkbox" ng-model="mrwltm">
						  <span class="checkmark"></span>
						</label>
					  </td>
					   </tr>
					      
					</table> 
						</div>
					</div>
				  </div> 
			</div>
			 </div> 
			
			<div align="right">  
				<a href="#" class="buttonCreateMrtInc"  ng-click="callmrwresponse()" style="text-decoration:none;"> CREATE </a>&nbsp;  &nbsp; 
			</div>
	  </div>
	<!-- end of Create IR -->
	
	<!-- Start of IR  Response -->
	<div ng-show="showmrwresponse">
		
	<table width="100%" id="incresponsetbl">
		<tr>
			<td>
				<a href="#" style="text-decoration: none" ng-click="callmrwcreate()"> <h3b>&nbsp;&nbsp;CREATE</h3b> </a>&nbsp;<h3b>></h3b>&nbsp;<h3a>RESPONSE</h3a>
			</td>
		</tr>
	</table> 
	
		 <div class='scrollResponse'> 
 		  
		  <div class="panel-group" id="accordion2">
     
     <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">           	             	
                    VMS Messages <span data-target="#Collapseicon4" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus" style="float:right;"></span></span>
            </h4>
        </div>
        
        <div class="panel-collapse collapse in" id="Collapseicon4">
        	<div class="panel-body">
            	<p>Recommended VMS Messages </p>
			<table width="100%" class="tablevms">  
			<tr>
				<th align="left" style="padding:5px;">Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </th>
				<th align="left">EQT ID <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></th>
				<th align="left">Recommended Display <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </th>
				<th align="left"></th>		
			</tr>
			<tr ng-repeat="irmrwvms in irmrwvmsList"> 
				<td> 
					<div ng-if="irmrwvms.irmrwvmsstatus==='Implement'"> 
						<label class="containeradio">
							{{irmrwvms.irmrwvmsstatus}}
  							<input type="radio" name="irmrwvmssatus" id="irmrwvmssatus" ng-model="irmrwvmssatus">
  								<span class="radiocheckmark"></span>
							</label>  
					</div>
					<div ng-if="irmrwvms.irmrwvmsstatus==='Not Implement'">  
						<label class="containeradio">
							<font color="white"> {{irmrwvms.irmrwvmsstatus}} </font>
  							<input type="radio" name="irmrwvmssatus" id="irmrwvmssatus" ng-model="irmrwvmssatus">
  								<span class="radiocheckmark"></span>
						</label>
					</div>
				</td>
			<td>
				<div id="vmsequipid">
				<font color="white">
						{{irmrwvms.irvmsequipid}}
				
				</font></div>
			</td>
			<td>
				
				<div class="textimagediv" contentEditable="true" id="vmsMessageDetail1"> {{irmrwvms.irmrwvmsmsg}} 
  					<img src="waterplant.JPG"  width="30px" height="30px"/>
				</div>
				    
			
			</td>
			<td> <i class="material-icons" style="font-size:8px;color:#C8CFF4;">border_color</i> </td>	
	     </tr>
				
			</table>
			<table width="100%"> 
				<tr>
					<td>
						<div align="right">
							
							<button class="buttonImp" id="mrwVmsMessage" onclick="mrwvmsMsgImpl()" style="text-decoration:none;"> Implement </button>
							<a href="#" class="buttonRem" id="buttonRem" onclick="mrwvmsMsgRemoved()" style="text-decoration:none;"> Remove </a> 
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
                   Canning Message<span data-target="#Collapseicon5" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
        </div>
        
        <div class="panel-collapse collapse" id="Collapseicon5">
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
                   OBU Messages <span data-target="#Collapseicon6" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
        </div>
        
        <div class="panel-collapse collapse" id="Collapseicon6">
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
					<td>
						<div align="right">
							<a href="#" class="buttonRem" id="buttonRem" ng-click="obuMsgdeact()" style="text-decoration:none;"> Deactivate All </a> 
							<a href="#" class="buttonImp" id="buttonImp" ng-click="obuMsgImpl()" style="text-decoration:none;"> Implement All </a>
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
                    Congestion Routes Monitoring <span data-target="#Collapseicon7" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
            </h4>
        </div>
         
        <div class="panel-collapse collapse" id="Collapseicon7">
        	<div class="panel-body">
            	<p>Congestion Routes Monitoring </p>
            </div>
        </div>
     </div>
   
     <div align="right"><a href="#" class="buttonCreateMrtInc" ng-click="addmrwincident()" style="text-decoration:none;"> SAVE </a></div> 
</div>		  	  
 </div> 
	 </div>
	  <!-- end of IR Respnse -->
      </div>  
	  
		</div>
		
		</div>
	</div>  
</body>
</html>