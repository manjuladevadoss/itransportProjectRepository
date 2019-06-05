<!DOCTYPE html>
<html lang="en">
<head>
  <title>Create New Event </title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no"/>
     
     <script type="text/javascript" src="jquery.js"></script>
     
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" >
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
	<script type="text/javascript" src="bootstrap.min.js"></script>
 	<script type="text/javascript" src="popper.min.js"></script>
		
	<link rel="stylesheet" href="checkboxstyle1.css">
	<link rel="stylesheet" href="dropdownlistStylePopup.css">  <!-- dropdown inside the popup add lane view-->
	<link rel="stylesheet" href="dropdownlistStyle.css"> <!-- dropdown inside status, source add lane view-->
	<!--    <link rel="stylesheet" href="bootstrap.min.css"> -->
	<link rel="stylesheet" href="mrtinc.css">
	
	<!-- start plus and minu menu  script -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<!-- end plus and minu menu  script -->
	
	<!-- Map Css -->
    <link rel="stylesheet" href="https://js.arcgis.com/3.28/dijit/themes/claro/claro.css">
    <link rel="stylesheet" href="https://js.arcgis.com/3.28/esri/css/esri.css">
    <link rel="stylesheet" href="mrtmap.css">
    <!-- Map Css --> 
    
	 <!-- Start Date and Time -->
	  	<link rel="stylesheet" href="bootstrap-datetimepicker.min.css">
	 <!-- End of  Date and Time --> 
	 	 
	 <!-- Start Date and Time -->
	 	<script src="bootstrap-datetimepicker.min.js"></script>
 	 <!-- End of Date and Time --> 
	  
  	<script  type="text/javascript" src="angular.min.js"></script>
  	<script type="text/javascript" src="democontroller.js"></script>  
    
	<!-- start plus and minu menu  script -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<!-- end plus and minu menu  script -->
	
	<!-- Map JS -->
    <script src="http://js.arcgis.com/3.28/"></script>  
    <script src="eventmap.js"></script>  
    <!-- Map JS -->
	
	
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

/* table.incdetailtblscroll tbody {
  display: block; 
    height: 400px;
    overflow-y: auto;
    overflow-x: hidden;
}*/
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

input[type=text] {
  font-family: Roboto, Helvetica, sans-serif;
  color: white;
}
</style>

</head>

<script>
<!-- Date and Time Picker  -->


// accordions div tag
	  $(document).ready(function(){
		  $('.form_datetime').datepicker({format: 'yyyy-mm-dd hh:ii'});
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
<body class="claro">
<div class="container-fluid">
<div ng-app="ltaApp" ng-controller="ltaController">
	
	<table width="100%;" style="background-color: #202B53;">
		<tr>
			<td colspan="2"  height="30;" vertical-align ="middle;">
				 <h2t> Event - {{eventname}} </h2t>
			</td>
		</tr>
		<tr>
			<td width="60%;"  height="95% !important;">
			    <div id="info1">          
		          	<button id="Circle" class="buttoneventbub"> + Add Event Bubble</button>  
		      	</div>		      	
		      	<div id="info2">
		        	<button id="Line"  class="buttoneventclo"> + Add Road Closure</button>
		      	</div> 
				<!-- Start Traffic Video  -->				
		      	<div id="infovideodiv">          
		          	<button id="Circle" class="buttonvideo"> 
			          	<div class="popup" onclick="popupvideo()">Traffic Video
		                    <div id="videodiv">
		                     <span class="popuptext" id="myPopup">
		                            <a class="boxclose" id="boxclose" onclick="lightbox_close();"></a>
		                            <video id="VisaChipCardVideo" width="300" controls>
		                                  <source src="CTEvideo.mp4" type="video/mp4">
		                          </video>
		                        </div>       
		                     </span>
		            	</div> 
		          	</button>  
		      	</div>
				<!--  End of Traffic Video  -->
		      	<div id="vmsmsgdiv">
				  	<div id="vmsmsgdivheader"><h1> {{eventvmseqipid}} <h1> 
				    	 <h2> {{eventVmsMsg}} </h2>
					</div>
				</div>
				
				<div id="vmsmsgdiv1">
				  	<div id="vmsmsgdivheader1"><h1> {{eventvmseqipid1}} <h1> 
				    	 <h2> {{eventVmsMsg1}} </h2>
					</div>
				</div>
				<div id="vmsmsgdiv2">
				  	<div id="vmsmsgdivheader2"><h1> {{eventvmseqipid2}} <h1> 
				    	 <h2> {{eventVmsMsg2}} </h2>
					</div>
				</div>
				<div id="vmsmsgdiv3">
				  	<div id="vmsmsgdivheader3"><h1> {{eventvmseqipid3}} <h1> 
				    	 <h2> {{eventVmsMsg3}} </h2>
					</div>
				</div>
							
				 <!-- MAP dispaly on this div mapDiv --> 
		     	<div id="mapDiv">
		     	     <div id="bottomPanel">
            			<div id="timeInfo">
              				<div id="timeSliderDiv"></div>
            			</div>
          			</div>
		     	</div>  
			</td>
			<td width="40%;"  height="95% !important;" valign="top">
	<!-- Start IR Creation -->
	  <div ng-show="showeventcreateFlag">
	  <!-- <div class="item3" style="background-color: #202B53;"> -->
	  
	  	<table width="100%" id="incdetailtbl"> 
		<tr>
			<td><h3a>CREATE </h3a>&nbsp;<h3b>></h3b>&nbsp;<h3b>RESPONSE</h3b></td>
		</tr>
	</table>
	  
			
	 <!-- <div class='incscroll'>   -->
<!-- event creation -->
<div class='scrollResponse'>
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
				<input type="text"  placeholder="end Time" ng-model="eventendtime1"> 
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
					<option ng-repeat="option in eventypeList" value="{{option.eventypeid}}">{{option.name}}</option>
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
					<div ng-show="roadcloseflag">
						<table width="100%" id="eventdetailtbl"> 
						<tr>
						  <td>Road Name</td>
						  <td>Open Time</td>
						  <td>Close Time</td>
						</tr>
						<tr style="height:2px;">
						  <td> <input type="text" style="width:130px;" placeholder="road name" ng-model="eventroadname"></td>
						  <td><input type="text"  style="width:130px;" placeholder="{{eventstarttime}}" ng-model="eventstarttimecl"></td>
						  <td><input type="text"  style="width:130px;" placeholder="{{eventendtime}}" ng-model="eventendtimecl"> </td>
						</tr>
						</table>
						
						</div>
		Lanes Closure <br><br>
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
					  <li> (+) Add New lanes 
					  <ul>
						<li> Add Lane</li>
						<li> Add Center Divider</li>
						<li> Add Left Shoulder</li>
						<li> Add Right Shoulder</li>
						</ul></li>
					</ul>
				
				<ul>
					  <li> (-) Remove lanes 
					  <ul style="width:150px;">
						<li> Remove Lane</li>
						<li> Remove Center Divider</li>
						<li> Remove Left Shoulder</li>
						<li> Remove Right Shoulder</li>
						</ul></li>
					</ul>
	          </td>
	          </td>
	        </tr>         
	          </table>
                 </table>
						<br>
						<table width="100%" class="eventclosuretable">
						<tr>
							<td> 
								<a href="#"  class="buttonUpload" ng-click="showroadclosedata()" style="text-decoration:none;"> Upload Road Closure </a>
								&nbsp;<a href="#" class="buttonRemove"  ng-click="removeroadclosedata()" style="text-decoration:none;"> Remove Road Closure</a> 
								<!-- <a href="createventwin.jsp"  class="buttonClosure" ng-click=""> Add Road Closure</a> -->			 								 		    
							</td>
							</tr>
						</table> 
						
				</div>
			</div>
     </div>
     
	 </div>	
	 </div>
	 	 		<table width="100%">
				<tr>
					<td> 
						<div align="right">
							<a href="#" class="buttonCreateEventInc"  ng-click="calleventresponse()" style="text-decoration:none;"> Create </a> &nbsp;&nbsp;
						</div>
					</td>
					</tr>
			</table> 
	  </div>
	<!-- end of Create IR -->
	
	<!-- Start of IR  Response -->
	<div ng-show="showeventresFlag">

	<table width="100%">
		<tr>
			<td> <a href="#"  style="text-decoration:none;" ng-click="calleventcreate()"><h3b>DETAILS</h3b></a> <h3b>></h3b> <h3a>RESPONSE</h3a> </td>
		</tr>
	</table>   
	
	 <div class='scrollResponse'> 
 	<div class="panel-group" id="accordion2">
	       <div class="panel panel-default">
	    	<div class="panel-heading active">
	        	<h4 class="panel-title">               	
	                    VMS Plans <span data-target="#Collapseiconthree" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
	            </h4>
				
	        </div>
	        <div class="panel-collapse collapse" id="Collapseiconthree">
	        	<div class="panel-body">
            	<p>Recommended VMS Messages </p>
				<table width="100%" class="tablevms">  
				<tr>
					<th align="left">Recommended Display <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
					<th align="left"> Time <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
					<th align="left">EQT ID <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
					<th align="left"> </th>		
				</tr>
				<tr>
					<td><textarea class="textareaeventVmsMsg" rows="3" cols="40"  ng-model="eventVmsMsg" ng-click="enableText()" > </textarea></td>
					<td>
					<input type="text" ng-model="eventVmsdisplaytime" style =" width: 120px; height: 35px; background-color: #2C3A77; color: #FFF; border : none; border-radius: 8px;">
					</td>
					<td> {{eventvmseqipid}}</td>
					<td> <a href="#" onclick="showmsg(1)" style="text-decoration:none;"> <img src="editicon.png" width="17px" height="17px"> </a></td>
					
				</tr>
				<tr>
					<td><textarea class="textareaeventVmsMsg" rows="3" cols="40" ng-model="eventVmsMsg1" ng-click="enableText()" > </textarea></td>
					<td>
					<input type="text" ng-model="eventVmsdisplaytime1"  style =" width: 120px; height: 35px; background-color: #2C3A77; color: #FFF; border : none; border-radius: 8px;">
					</td>
					<td>{{eventvmseqipid1}}</td>
					<td> <a href="#" onclick="showmsg(2)" style="text-decoration:none;"> <img src="editicon.png" width="17px" height="17px"></a> </td>				
				</tr>	
				<tr>
					<td><textarea class="textareaeventVmsMsg" rows="3" cols="40" ng-model="eventVmsMsg2" ng-click="enableText()" > </textarea></td>
					<td>
					<input type="text" ng-model="eventVmsdisplaytime2"  style =" width: 120px; height: 35px; background-color: #2C3A77; color: #FFF; border : none; border-radius: 8px;">
					</td>
					<td>{{eventvmseqipid2}}</td>
					<td> <a href="#" onclick="showmsg(3)" style="text-decoration:none;"> <img src="editicon.png" width="17px" height="17px"></a> </td>				
				</tr>
				<tr>
					<td><textarea class="textareaeventVmsMsg" rows="3" cols="40" ng-model="eventVmsMsg3" ng-click="enableText()" > </textarea></td>
					<td>
					<input type="text" ng-model="eventVmsdisplaytime3"  style =" width: 120px; height: 35px; background-color: #2C3A77; color: #FFF; border : none; border-radius: 8px;">
					</td>
					<td>{{eventvmseqipid3}}</td>
					<td> <a href="#" onclick="showmsg(4)" style="text-decoration:none;"> <img src="editicon.png" width="17px" height="17px"></a> </td>				
				</tr>
				</table>
				<table width="100%"> 
						<tr>
							<td>
							<div align="right">	<a href="#" class="buttonadd" id="buttonadd" ng-click="parterMsgAdd()" style="text-decoration:none;"> New VMS Plan</a>
								<a href="#" class="buttondelete" id="buttondelete" ng-click="parterMsgRemove()" style="text-decoration:none;"> Remove </a> 									
							</div>
							</td>
						</tr>
				 </table>
				 
				VMS Set
				<table width="100%" class="tablevms">  
				<tr>
					<th align="left">Set <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
					<th align="left"> Time <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
					<th align="left">EQT ID <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
				</tr>
				<tr>
					<td> 1</td>
					<td> 12/5/2019 10:30:32 - 16:00:00</td>
					<td> <a href="#" ng-click="showvmsequipmsg('568231')" style="text-decoration:none;"> TIP 568231 </a></td>
				</tr>
				<tr>
					<td> 2</td>
					<td> 16/4/2019 11:00:30 - 17:00:00</td>
					<td> <a href="#" ng-click="showvmsequipmsg('825231')" style="text-decoration:none;"> TIP 825231 </a> </td>					
				</tr>	
				</table>
				 
	            </div>
	        </div>
	     </div>
		 
		  <div class="panel panel-default">
		    	<div class="panel-heading active">
							<h4 class="panel-title">               	
								Canning Messages <span data-target="#Collapseiconfour" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
							</h4>
							
				</div>
			
			
			<div class="panel-collapse collapse" id="Collapseiconfour">
	        	<div class="panel-body">
	            	<p>Canning Messages</p>
			   <table width="100%"> 
					<tr>
						<td>
						<p>Enter a Canning Message</p>
						
							<textarea class="textareaeventcanMsg" rows="3" cols="55" ng-model="eventcanningMsg"> </textarea>
							<a href="#" class="buttoneveImp" id="buttoneveImp" ng-click="canMsgSend()"> Send </a>	
						</td>
					</tr>
			 </table>
	            </div>
        	</div>						
	     </div>
	     
	     <div class="panel panel-default">
		    	<div class="panel-heading active">
							<h4 class="panel-title">               	
								OBU Messages <span data-target="#Collapseiconfive" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
							</h4>
							
				</div>
			<div class="panel-collapse collapse" id="Collapseiconfive">
				<div class="panel-body">
				<p>OBU Messages</p>
					<table width="100%" class="tableventOBU">  
						<tr>
							<th colspan="3" bgcolor="Red"> Alert </th>
						</tr>
						<tr>					
							<td> 
								<div ng-if="obuMsgStatus==='Failed'"> <span class="dotfail"></span> {{obuMsgStatus}} </div>
								<div ng-if="obuMsgStatus==='Implemented'"> <span class="dotimp"></span> {{obuMsgStatus}} </div>
								<div ng-if="obuMsgStatus==='Not Active'">  <span class="dotnotact"></span> {{obuMsgStatus}} </div>					
							</td>
							<td> <textarea class = "textareaeventObuMsg" rows="3" cols="45" ng-model="eventObuMsgAlert" ng-click="enableText()"> {{eventObuMsgAlert}} </textarea></td>						
							<td>KM Marking 
							<textarea class = "textareaeventObuMsg" rows="1" cols="3" ng-model="eventObuMsgAlertkm" ng-click="enableText()"> {{eventObuMsgAlertkm}}</textarea></td>
							
						</tr>
						<tr>
							<th colspan="3" bgcolor="yellow"> Jam</th>
						</tr>
						<tr>
							<td> 
								<div ng-if="obuMsgStatus==='Failed'"> <span class="dotfail"></span> {{obuMsgStatus}} </div>
								<div ng-if="obuMsgStatus==='Implemented'"> <span class="dotimp"></span> {{obuMsgStatus}} </div>
								<div ng-if="obuMsgStatus==='Not Active'">  <span class="dotnotact"></span> {{obuMsgStatus}} </div>						
							</td>
							<td> <textarea class ="textareaeventObuMsg" rows="3" cols="45" ng-model="eventObuMsgJam" ng-click="enableText()" > {{eventObuMsgJam}}</textarea></td>						
							<td>KM Marking<textarea class = "textareaeventObuMsg" rows="1" cols="3" ng-model="eventObuMsgJamkm" ng-click="enableText()" > {{eventObuMsgJamkm}}</textarea></td>	
						</tr>
						<tr>
							<th colspan="3" bgcolor="Green"> Guide</th>
						</tr>	
						<tr>
							<td> 
								<div ng-if="obuMsgStatus==='Failed'"> <span class="dotfail"></span> {{obuMsgStatus}} </div>
								<div ng-if="obuMsgStatus==='Implemented'"> <span class="dotimp"></span> {{obuMsgStatus}} </div>
								<div ng-if="obuMsgStatus==='Not Active'"> <span class="dotnotact"></span> {{obuMsgStatus}} </div>						
							</td>
							<td> <textarea class = "textareaeventObuMsg" rows="3" cols="45" ng-model="eventObuMsgGuide" ng-click="enableText()"> {{eventObuMsgGuide}}</textarea></td>						
							<td>KM Marking<textarea class = "textareaeventObuMsg" rows="1" cols="3" ng-model="eventObuMsgGuidekm" ng-click="enableText()"> {{eventObuMsgGuidekm}}</textarea></td>	
						</tr>					
					</table>
					<!--  <table width="100%"> 
					<tr>
						<td> <div align="right">
							<a href="#" class="buttoneveRem" id="buttoneveRem" ng-click="obuMsgdeact()" style="text-decoration:none;"> Deactivate All </a> 
							<a href="#" class="buttoneveImp" id="buttoneveImp" ng-click="obuMsgImpl()" style="text-decoration:none;"> Implement All </a>	
							</div>
						</td>
					</tr>
					</table>  -->		
				</div>
			</div>
	     </div>
	     
	     <div class="panel panel-default">
		    	<div class="panel-heading active">
							<h4 class="panel-title">               	
								Sub IR <span data-target="#Collapseiconsix" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
							</h4>
							
				</div>
			<div class="panel-collapse collapse" id="Collapseiconsix">
				<div class="panel-body">
								Sub Incident Record information
				</div>
			</div>
	     </div>
	     
	     <div class="panel panel-default">
		    	<div class="panel-heading active">
							<h4 class="panel-title">               	
								Contacts <span data-target="#Collapseiconseven" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
							</h4>
							
				</div>
			<div class="panel-collapse collapse" id="Collapseiconseven">
				<div class="panel-body">
						Contact Details		
				</div>
			</div>
	     </div>
		  <div class="panel panel-default">
		    	<div class="panel-heading active">
							<h4 class="panel-title">               	
								Road Closure Monitoring <span data-target="#Collapseiconeight" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
							</h4>
							
				</div>
			<div class="panel-collapse collapse" id="Collapseiconeight">
				<div class="panel-body">
						Road closure monitoring information		
				</div>
			</div>
	     </div>	
	     
	     <div class="panel panel-default">
		    	<div class="panel-heading active">
							<h4 class="panel-title">               	
								Notes <span data-target="#Collapseiconnine" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
							</h4>
							
				</div>
			<div class="panel-collapse collapse" id="Collapseiconnine">
				<div class="panel-body">
						<p> Add Notes to this event </p>
						
					<table width="100%" class="tablevms">  
						<tr>
							<th align="left"> Notes </th>
							<th align="left"> Author </th>
						</tr>					
						<tr>
							<td>
								<textarea class = "textareanote" rows="2" cols="50" ng-model="eventNotes" ng-click="enableText()" > note1
								</textarea>
							</td>
							<td>
								<input type="text" ng-click="" ng-model="eventNotesAuthor" 
								style =" width: 100px; height: 35px; background-color: #2C3A77; color: #FFF; border : none; border-radius: 8px;">
							
							</td>
						</tr>
						
					</table>
					<table width="100%"> 
						<tr>
							<td> 
								<div > <div align="right">
									<a href="#" class="buttondelete" id="buttondelete" ng-click="eventDeleteNotes()" style="text-decoration:none;"> Delete Note </a> 
									<a href="#" class="buttonadd" id="buttonadd" ng-click="eventAddNewNotes()" style="text-decoration:none;"> Add a New Note</a>	
									</div>
								</div>
							</td>
						</tr>
				 </table>
				</div>
			</div>
	     </div>	     
	     
		 </div>
	 </div> 
	 	<table width="100%" class="eventclosuretable">
			<tr>
				<td colspan="3"> 
					<div align="right">
						<a href="ccgridview.jsp" class="buttonCreateventInc" ng-click="addevent()" style="text-decoration:none;"> SAVE </a> &nbsp;&nbsp;
					</div>
				</td>
			</tr>
		</table>
	 
	
	 </div>
	  <!-- end of IR Respnse -->
 
			</td>
		</tr>
	</table>

</div>
</div> 
</body>
</html>