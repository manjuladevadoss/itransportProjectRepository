<!DOCTYPE html>
<html lang="en">
<head>
  <title>Create IR</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="mrtinc.css">
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
	<link rel="stylesheet" href="mrtmap.css">
	<script src="https://js.arcgis.com/3.28/"></script>
    <script type="text/javascript"  src="irmap.js"></script>
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
#irDiv2 {  
    padding: 0;  
    margin: 0; 
	background: url("roadmap.jpg");
		/*height:auto;*/
}
	#irlinediv {
		  top: 200px;
		  left: 500px;
		  position: absolute;
		  z-index: 9;
		  border: solid 0px;
		  background-color:none;
		  width: 530px;
		  height: 550px;
		  border-radius: 13px;
		  text-align: center;
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

	//Lane image change    

	  var newsrc = "laneup.JPG";
	  var newsrc1 = "laneup.JPG";
	  var newsrc2 = "laneup.JPG";
	  var newsrc3 = "laneup.JPG";
	  var newsrc4 = "laneup.JPG";
	  var newsrc5 = "laneup.JPG";

	  //document.getElementById("lsh1Div").style.color = "#A0E67F";

	  function changeImage(imgid) {
	  	if(imgid=="laneupimg1") {
	  	 if (newsrc == "laneup.JPG") {
	  		document.getElementById('laneupimg1').src='lanecross.JPG';
	  		newsrc  = "lanecross.JPG";
	  		document.getElementById("lsh1Div").style.color = "#E58080";
	  	  }
	  	  else {
	  	   document.getElementById('laneupimg1').src='laneup.JPG';
	  	   newsrc  = "laneup.JPG";
	  	   document.getElementById("lsh1Div").style.color = "#A0E67F";
	  	  }		
	  	}
	  	
	  	if(imgid=="laneupimg2") {
	  	 if (newsrc1 == "laneup.JPG") {
	  		document.getElementById('laneupimg2').src='lanecross.JPG';
	  		newsrc1  = "lanecross.JPG";
	  		document.getElementById("lane4Div").style.color = "#E58080";
	  	  }
	  	  else {
	  	   document.getElementById('laneupimg2').src='laneup.JPG';
	  	   newsrc1  = "laneup.JPG";
	  	   document.getElementById("lane4Div").style.color = "#A0E67F";
	  	  }		
	  	}
	  	
	    	if(imgid=="laneupimg3") {
	  	 if (newsrc2 == "laneup.JPG") {
	  		document.getElementById('laneupimg3').src='lanecross.JPG';
	  		newsrc2  = "lanecross.JPG";
	  		document.getElementById("lane3Div").style.color = "#E58080";
	  	  }
	  	  else {
	  	   document.getElementById('laneupimg3').src='laneup.JPG';
	  	   newsrc2  = "laneup.JPG";
	  	   document.getElementById("lane3Div").style.color = "#A0E67F";
	  	  }		
	  	}
	    
	      if(imgid=="laneupimg4") {
	  	 if (newsrc3 == "laneup.JPG") {
	  		document.getElementById('laneupimg4').src='lanecross.JPG';
	  		newsrc3  = "lanecross.JPG";
	  		document.getElementById("lane2Div").style.color = "#E58080";
	  	  }
	  	  else {
	  	   document.getElementById('laneupimg4').src='laneup.JPG';
	  	   newsrc3  = "laneup.JPG";
	  	   document.getElementById("lane2Div").style.color = "#A0E67F";
	  	  }		
	  	}
	  	
	  	if(imgid=="laneupimg5") {
	  	 if (newsrc4 == "laneup.JPG") {
	  		document.getElementById('laneupimg5').src='lanecross.JPG';
	  		newsrc4  = "lanecross.JPG";
	  		document.getElementById("lane1Div").style.color = "#E58080";
	  	  }
	  	  else {
	  	   document.getElementById('laneupimg5').src='laneup.JPG';
	  	   newsrc4  = "laneup.JPG";
	  	   document.getElementById("lane1Div").style.color = "#A0E67F";
	  	  }		
	  	}
	  	if(imgid=="laneupimg6") {
	  	 if (newsrc5 == "laneup.JPG") {
	  		document.getElementById('laneupimg6').src='lanecross.JPG';
	  		newsrc5  = "lanecross.JPG";
	  		document.getElementById("rsh1Div").style.color = "#E58080";
	  	  }
	  	  else {
	  	   document.getElementById('laneupimg6').src='laneup.JPG';
	  	   newsrc5  = "laneup.JPG";
	  	   document.getElementById("rsh1Div").style.color = "#A0E67F";
	  	  }		
	  	}
	  }
    </script>
<body>
<div class="container-fluid">
<div ng-app="ltaApp" ng-controller="ltaController">
	
<div ng-show="irtypeflag">
	 <div id="irDiv2">
		 <img src="roadmap.jpg" width="100%;" height="1000px;"/>   
	<div id="irlinediv">	
	<table align="center"> 
			<tr>	
				<td> 
					<div class="dropdown">
						<i class="fa fa-align"><h2t> Create Incident</h2t> </i>
						<div class="dropdown-content" >
							<a href="#" ng-click="createirdetail('Accident')" style="text-decoration:none;"><img src="accident.jpg"> Accident</a>
							<a href="#" ng-click="createirdetail('Obstacle IR')" style="text-decoration:none;"><img src="obstacle.jpg"> Obstacle</a>
							<a href="#" ng-click="createirdetail('Heavy Traffic IR')" style="text-decoration:none;"><img src="heavytraffic.jpg"> Heavy Traffic</a>
							<a href="#" ng-click="createirdetail('Road Works IR')" style="text-decoration:none;"><img src="roadwork.jpg"> Road Works</a>
			                <a href="#" ng-click="createirdetail('Mobile Road Works IR')" style="text-decoration:none;"><img src="mobileroadwork.jpg"> Mobile Road Works</a>
			                <a href="#" ng-click="createirdetail('Break Down IR')" style="text-decoration:none;"><img src="breakdown.jpg"> Break Down</a>
							<a href="#" ng-click="createirdetail('Unattended Vehicle IR')" style="text-decoration:none;"><img src="unattvehicle.jpg"> Unattended Vehicle</a>
							<a href="#" ng-click="createirdetail('Miscellaneous IR')" style="text-decoration:none;"><img src="misce.jpg"> Miscellaneous</a> 
						</div>
					</div> 
				</td>
			</tr> 
		</table>
		</div>
	</div>
</div>
	
<div ng-show="irdetailflag">
	<!-- main page -->
	<table width="100%;" style="background-color: #202B53;">
		<tr>
			<td colspan="2">
				 <h2t> Incident Record - {{irtypeselected}} </h2t>
			</td>
		</tr>
		<tr>
			<td width="60%;"  height="95% !important;">
		     	<div id="mapDiv">
			     	<div id="infocctvcamera">          
	         			<button id="Circle" class="buttoncctvcamera"> View cctv & Roadworks </button>   
	      			 </div>
		     	</div>  
			</td>
			<td width="40%;"  height="95% !important;" valign="top">
	<!-- Start IR Creation -->
	  <div ng-show="showircreate">
	  
	  	<table width="100%" id="incdetailtbl"> 
		<tr>
			<td><h3a>CREATE </h3a></td>
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
						Status: <br>
						<select ng-model="irstatus">
							<option ng-repeat="option in irstatusList" value="{{option.irstatusid}}">{{option.irstatusname}}</option>
						</select>
					  </td>
					  <td colspan="3"> Source: <br>
						<select ng-model="irsource">
							<option ng-repeat="option in irsourceList" value="{{option.irsourceid}}">{{option.irsourcename}}</option>
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
								<input type="text"  placeholder="End Time"  ng-model="irendtime1"/>
						</div>			
					  </td>
					</tr>
					<tr>
					  <td colspan="3">
						Linked IR <br>
						<select ng-model="irlinked">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
							<option ng-repeat="option in irlinkedList" value="{{option.irlinkedid}}">{{option.irlinkedname}}</option>
						</select>
					  </td>
					  <td colspan="3">
						Accident Type<br>
						 <select ng-model="acctype">
						 	<option  value="" selected="selected" hidden="hidden">Choose here</option>
							<option ng-repeat="option in acctypeList" value="{{option.acctypeid}}">{{option.acctypename}}</option>
						</select>
					  </td>
					</tr>
					
					<tr>
					  <td colspan="3">
						State of Roadway <br>
						<select ng-model="rdway">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
							<option ng-repeat="option in rdwayList" value="{{option.rdwayid}}">{{option.rdwayname}}</option>
						</select>
					  </td>
					  <td colspan="3">
						Type of Danger<br>
						<select ng-model="danger">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
							<option ng-repeat="option in dangerList" value="{{option.dangerid}}">{{option.dangername}}</option>
						</select>
					  </td>
					</tr>
					<tr>
					  <td colspan="6">
						Slight: <input style="width:50.81px; height: 20px;" type="text"  ng-model="slight"/> 
						Serious: <input type="text"  style="width:50.81px; height: 20px;" ng-model="serious"/> 
						Fatal <input type="text"  style="width:50.81px; height: 20px;"  ng-model="fatal"/>
					  </td>
					</tr>
				   <tr>
					  <td colspan="6">
						Image Captured <br>
						<select ng-model="imgcap">
						  <option  value="" selected="selected" hidden="hidden">Choose here</option>
						  <option ng-repeat="option in imgcapList" value="{{option.imgcapid}}">{{option.imgcapname}}</option>
						</select>							
						<img src="camera.JPG" width="25px" height="25px">
					  </td>
					</tr>
					
					<tr>
					  <td colspan="6">
						Damage to government Property <br>
						<textarea class="textareaincomments" rows="3" cols="48" ng-model="damagedetail">{{damagedetail}}</textarea>
					  </td>
					</tr>
				 </table>
						</div>
					</div>
				  </div> 
				  
				  <div class="panel panel-default">
					<div class="panel-heading active">
						<h4 class="panel-title">
							   Lane Blockage<span data-target="#Collapseicon2" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus" style="float:right;"></span></span>
						</h4>
					</div>
					
					<div class="panel-collapse collapse in" id="Collapseicon2">
						<div class="panel-body">
						Block or Unblock Lanes 
						
						<table  width="100%">
		<tr>
          <td align="Left">
	          <table>
	         <tr>
	    		<td>
				<img src="laneup.JPG" width="30px" height="30px" id="laneupimg1" onclick="changeImage('laneupimg1')">
				<img src="vertibar.JPG" width="10px" height="30px">
				<div id="lsh1Div">LSH1</div>
				</td>
				<td align="center">								
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg2" onclick="changeImage('laneupimg2')"> <br>
					<div id="lane4Div">&nbsp;&nbsp;&nbsp;4</div>
				</td>
				<td align="center">
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg3" onclick="changeImage('laneupimg3')"> <br>
					<div id="lane3Div">&nbsp;&nbsp;&nbsp;3</div>
				</td>
			    <td align="center">
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg4" onclick="changeImage('laneupimg4')"> <br>
					<div id="lane2Div">&nbsp;&nbsp;&nbsp;2</div>
				</td>
				<td align="center">
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg5" onclick="changeImage('laneupimg5')"> <br>
					<div id="lane1Div">&nbsp;&nbsp;&nbsp;1</div>
					 
				</td>
				<td align="center">
				    <img src="vertibar.JPG" width="10px" height="30px"> 
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg6" onclick="changeImage('laneupimg6')"> <br>
					<div id="rsh1Div">&nbsp;&nbsp;&nbsp;RSH1</div>
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
		          </td>
	        </tr>         
	          </table>
                 </table>
			
						</div>
					</div>
				  </div>
				  
				 <div class="panel panel-default">
					<div class="panel-heading active">
						<h4 class="panel-title">
							 &nbsp;  <span data-target="#Collapseicon3" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus" style="float:right;"></span></span>
						</h4>
					</div>
					
					<div class="panel-collapse collapse" id="Collapseicon3">
						<div class="panel-body">
					  <table width="50%" id="incblocktbl">
					<tr>
					  <td>          
						<label class="contentlabel"> Simulated 
						  <input type="checkbox" ng-model="irsimul">
						  <span class="checkmark" size=""></span>
						</label>
						</td>
						<td>
						<label class="contentlabel"> Important 
						  <input type="checkbox" ng-model="irimpor">
						  <span class="checkmark"></span>
						</label>
					   </td>
					   </tr>
					   <tr>
					  <td>
						 <label class="contentlabel"> VRS 
						  <input type="checkbox" ng-model="irvrs">
						  <span class="checkmark"></span>
						</label>
						</td>
						<td>
						<label class="contentlabel"> LTM
						  <input type="checkbox" ng-model="irltm">
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

			</div>
			 </div> 
					<div align="right">  
						<a href="#" class="buttonCreateMrtInc"  ng-click="callirresponse()" style="text-decoration:none;"> CREATE </a>&nbsp;  &nbsp; 
					</div>
	  </div>
	<!-- end of Create IR -->
	
	<!-- Start of IR  Response -->
	<div ng-show="showirresponse">
		
	<table width="100%" id="incresponsetbl">
		<tr>
			<td>
				<a href="#" style="text-decoration: none" ng-click="callircreate()"> <h3b>&nbsp;&nbsp;CREATE</h3b> </a>&nbsp;<h3b>></h3b>&nbsp;<h3a>RESPONSE</h3a>
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
			<!-- <img src="horibar.JPG" height="auto" > -->
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
	<!-- 		 <tr>
				<td> 
					<div ng-if="irvmsMsgStatus==='Failed'"> <span class="dotfail"></span> {{irvmsMsgStatus}} </div>
					<div ng-if="irvmsMsgStatus==='Implemented'"> <span class="dotimp"></span> {{irvmsMsgStatus}} </div>
					<div ng-if="irvmsMsgStatus==='Not Active'">  <span class="dotnotact"></span> {{irvmsMsgStatus}} </div>
				</td>
				<td>{{irequipid}}</td>
				<td><textarea class = "textareaVmsMsg" rows="3" cols="28" ng-model="irrecommMsg" ng-click="enableText()"> {{irrecommMsg}} </textarea></td>
				<td> <i class="material-icons" style="font-size:8px;color:#C8CFF4;">border_color</i> </td>				
			</tr>
		 -->	
			<tr ng-repeat="irvms in iraccvmsList"> 
				<td> 
					<div ng-if="irvms.irvmsstatus==='Failed'"> <span class="dotfail"></span> {{irvms.irvmsstatus}} </div>
					<div ng-if="irvms.irvmsstatus==='Implemented'"> <span class="dotimp"></span> {{irvms.irvmsstatus}} </div>
					<div ng-if="irvms.irvmsstatus==='Not Active'">  <span class="dotnotact"></span> {{irvms.irvmsstatus}}  </div>
				</td>
			<td>{{irvms.irvmsequipid}}</td>
			<td><textarea class = "textareaVmsMsg" rows="3" cols="28" ng-model='irvms.irvmsaccmsg'></textarea></td>
			<td> <i class="material-icons" style="font-size:8px;color:#C8CFF4;">border_color</i> </td>	
	</tr>
				
			</table>
			<table width="100%"> 
				<tr>
					<td>
						<div align="right">
							<a href="#" class="buttonRem" id="buttonRem" ng-click="irvmsMsgRemoved()" style="text-decoration:none;"> Remove </a> 
							<a href="#" class="buttonImp" id="buttonImp" ng-click="irvmsMsgImpl()" style="text-decoration:none;"> Implement </a>
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
           <!-- <img src="horibar.JPG" height="auto" > -->
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
            <!-- <img src="horibar.JPG" height="auto" > -->
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
                    Conjestion Routes Monitoring <span data-target="#Collapseicon7" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
            </h4>
           <!-- <img src="horibar.JPG" height="auto" > -->
        </div>
         
        <div class="panel-collapse collapse" id="Collapseicon7">
        	<div class="panel-body">
            	<p>Conjestion Routes Monitoring </p>
            </div>
        </div>
     </div>
   
     <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">              	
                   Partners & Vehicle Response<span data-target="#Collapseicon8" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
        </div>
        
        <div class="panel-collapse collapse" id="Collapseicon8">
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
							<td>
								<div align="right">
									<a href="#" class="buttonRem" id="buttonRem" ng-click="parterMsgRemove()" style="text-decoration:none;"> Remove </a> 
									<a href="#" class="buttonImp" id="buttonImp" ng-click="parterMsgAdd()" style="text-decoration:none;"> Add </a>
								</div>	
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
							<td> 
								<div align="right">
									<a href="#" class="buttonRem" id="buttonRem" ng-click="parterMsgRemove()" style="text-decoration:none;"> Remove </a> 
									<a href="#" class="buttonImp" id="buttonImp" ng-click="parterMsgAdd()" style="text-decoration:none;"> Add </a>
								</div>	
							</td>
						</tr>
				 </table>
				
            </div>
        </div>
     </div>
    <div align="right"><a href="createinc.jsp" class="buttonCreateMrtInc" ng-click="addmrtincident()" style="text-decoration:none;"> SAVE </a></div> 
</div>		  	  
 </div> 
	 </div>
	  <!-- end of IR Respnse -->
	  
	  
			</td>
		</tr>
	</table>

</div>

</div>
</div> 
</body>
</html>