<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no" />
    <title> Create Event  </title>
  	<link rel="stylesheet" href="http://localhost:8080/itrans/arcgis_4.11/esri/themes/light/main.css" />
  	<link rel="shortcut icon" href="/Sopra_Steria_logo.ico" type="image/x-icon">
  	<link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="mrtinc.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" >
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">  
		
	<link rel="stylesheet" href="checkboxstyle1.css">
	<link rel="stylesheet" href="dropdownlistStylePopup.css">  <!-- dropdown inside the popup add lane view-->
	<link rel="stylesheet" href="dropdownlistStyle.css"> <!-- dropdown inside status,source add lane view-->
	<link rel="stylesheet" href="radiobuttonstyle.css"> 

  	<!-- Start Date and Time -->
	  	<link rel="stylesheet" href="bootstrap-datetimepicker.min.css">
	 <!-- End of  Date and Time -->   
 	
 	<script type="text/javascript"  src="jquery.js"></script> 
	<script type="text/javascript"  src="jquery.min.js"></script> 
	<script type="text/javascript" src="bootstrap.min.js"></script>
 	<!--<script type="text/javascript" src="popper.min.js"></script>  -->
  	 <script  type="text/javascript" src="angular.min.js"></script> 
  	<script type="text/javascript"  src="democontroller.js"></script> 
  	
  	 <!-- Start Date and Time -->
	 	<script src="bootstrap-datetimepicker.min.js"></script>
 	 <!-- End of Date and Time --> 
    
	<!-- start plus and minu menu  script -->
     <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  -->
	<!-- end plus and minu menu  script -->
	
	<script src="http://localhost:8080/itrans/arcgis_4.11/init.js"></script>  
	<script src="basemap411eve.js"></script>  
  
 <style>  
 /*Start map */
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
        top: 75px;
        left: 15%;
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
        width: 580px;
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
  font-size: .8em;
  color: #C8CFF4;
  font-family:  Roboto, Helvetica, sans-serif;
  box-shadow: 2px 2px 8px 0 rgba(0,0,0,0.5);
  border-radius: 13px;
  background-color:#356D85;
  border: solid 0px #356D85;
  width:50px;
  height:25px
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

input[type=text] {
  font-family: Roboto, Helvetica, sans-serif;
  color: white;
}

/* Timer Instruction */
#timerinstruction {
	z-index: 99;
    position: absolute;
    top: 660px;
    left: 30%;
    padding: 5px;
    margin-left: -175px;
    height: 20px;
    width: 580px;
}

.timerbutton {
  color: #C8CFF4;
  font-family:  Roboto, Helvetica, sans-serif;
  font-size: .8em;
  box-shadow: 2px 2px 8px 0 rgba(0,0,0,0.5);
  border-radius: 13px;
  background-color:#356D85;
  border: solid 0px #356D85;
  width:50px;
  height:15px;
}

.hourbutton {
  color: #C8CFF4;
  font-family:  Roboto, Helvetica, sans-serif;
  font-size: .7em;
  box-shadow: 2px 2px 8px 0 rgba(0,0,0,0.5);
  border-radius: 13px;
  background-color:#356D85;
  border: solid 0px #356D85;
  width:48px;
  height:25px;
}
.daybutton {
  color: #C8CFF4;
  font-family:  Roboto, Helvetica, sans-serif;
  font-size: .7em;
  box-shadow: 2px 2px 8px 0 rgba(0,0,0,0.5);
  border-radius: 13px;
  background-color:#356D85;
  border: solid 0px #356D85;
  width:75px;
  height:25px;
}
.timerconbutton {
  color: #C8CFF4;
  font-family:  Roboto, Helvetica, sans-serif;
  font-size: .8em;
  box-shadow: 2px 2px 8px 0 rgba(0,0,0,0.5);
  border-radius: 13px;
  background-color:#356D85;
  border: solid 0px #356D85;
  width:20px;
  height:25px;
}
mark { 
  background-color: #356D85;
  color: white;
}

#resptbl {
  border-collapse: collapse;
  width: 100%;
}

#resptbl td, #resptbl th {
  padding: 1px;
  color: #C8CFF4; 
  font-size: 13px;
  background: none; 
}


</style>

 
 <script>
 
 $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
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
  </head>
<body class="calcite-maps calcite-nav-top">
	<div class="container-fluid">
		<div ng-app="ltaApp" ng-controller="ltaController" id="unique">
		<!--
		<table width="100%" border="1"> 
		<tr>
		<td> </td>
		</tr>
		</table>  -->
  
	<div id="main" class claro>
	<div id="viewDiv"> </div>    
	<div id="instruction">    	        
		<button class="irresetbutton" id="draw-point"> Point </button>   
		<button class="irresetbutton" id="rdclosepoint">Symbol </button>	
		<button class="irresetbutton" id="rdclose"> Line </button>
		<button class="irresetbutton" id="showTimer" ng-click="showTimerOption()">Timer </button>	       
	</div>  
	  
	<div id="timerinstruction" ng-show="showTimer">  
			
				<table align="center">			
						<tr>
							<td>
								<font style="font-size:12px;"><mark>Day</mark></font>
								<select class="daybutton" ng-model="timeDisplayday" ng-change="selday()" placeholder="Day">
									<option ng-repeat="option in displayDayList" value="{{option.dayid}}">{{option.dayname}}</option>
								</select>&nbsp;
								<font style="font-size:12px;"><mark>Time</mark></font>
								<select class="hourbutton" ng-model="vmsTimeDisplayHour" placeholder="Hour">
									<option ng-repeat="option in displayHrList" value="{{option.hrname}}">{{option.hrname}}</option>
								</select> <font style="font-size:12px;"><mark>:</mark></font>
								<select class="hourbutton" ng-model="vmsTimeDisplayMinu" placeholder="Minutes">
									<option ng-repeat="option in displayminuList" value="{{option.minuname}}">{{option.minuname}}</option>
								</select>
								<select class="hourbutton" ng-model="vmsTimeDisplayampm" placeholder="am/pm">
									<option ng-repeat="option in displayampmList" value="{{option.ampmname}}">{{option.ampmname}}</option>
								</select>
								<input type="hidden" id="distime" name="distime" ng-model = "distime" value='{{vmsTimeDisplayDay}}{{sep}}{{vmsTimeDisplayHour}}:{{vmsTimeDisplayMinu}}{{sep}}{{vmsTimeDisplayampm}}' >
								&nbsp;
								<button class="hourbutton" id="vmsMsgdis"> Show </button>
							</td>	
						</tr>
					</table>
	</div>  


      <div id="panelTopDiv"  style="background-color: #202B53;">
    		<h2t> Event - {{eventname}} </h2t>
      </div>  
	  
	   <div id="panelRightDiv" class="esri-widget">  
         <br> 
		 <br> 
		 <br> 
<!-- Start IR Creation -->
	  <div ng-show="showeventcreateFlag">
	  <!-- <div class="item3" style="background-color: #202B53;"> -->
	  
	<table width="100%" id="incdetailtbl"> 
		<tr>
			<td><h3a> &nbsp;CREATE </h3a>&nbsp;<h3b>></h3b>&nbsp;
			<a href="#" ng-click="calleventresponse()" style="text-decoration:none;"> <h3b>RESPONSE</h3b></a>
			</td>
		</tr>
	</table>
	  
			
	 <!-- <div class='incscroll'>   -->
<!-- event creation -->
<div class='scrolleventCreate'>
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
            Organiser <br>
			<input type="text"  placeholder="Oganizer" ng-model="eventorganizer">
          </td>
	  
	  </tr>
        <tr>
          <td> Start Date <br>
				<input type="text" id="eventstartdate"  placeholder="Start Time" ng-model="eventstartdate" readonly class="form_datetime"> 			 	                
          </td>
		  <td> End Date <br>
				<input type="text"  placeholder="end Time" ng-model="eventenddate"> 
          </td>
		</tr>
		
		<tr>
			<td>
			  Start Time <br>
			  <input type="text"  placeholder="opening" ng-model="eventhotlineope">
			</td>
			<td>
			  End Time <br>
			  <input type="text"  placeholder="closing" ng-model="eventhotlineclo"> 
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
            Person(s) in Charge<br>
			<input type="text"  placeholder="in charge" ng-model="eventincharge">
          </td>
          <td>
            Hotline <br>
            <input type="text"  placeholder="post no" ng-model="eventpostno">
          </td>
        </tr>
		<tr>
          <td>
            Start Point<br>
			<input type="text"  placeholder="Start point" id="eventstartpoint" ng-model="eventstartpoint">
          </td>
          <td>
			End Point <br>
            <input type="text"  placeholder="End point" id="eventendpoint" ng-model="eventendpoint">
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
						  <td> <input type="text" style="width:200px;" placeholder="road name" ng-model="eventroadname"></td>
						  <td><input type="text"  style="width:80px;" placeholder="{{eventstartdate}}" ng-model="eventstartdatecl"></td>
						  <td><input type="text"  style="width:80px;" placeholder="{{eventendtime}}" ng-model="eventendtimecl"> </td>
						</tr>
						</table>
						
						</div>
		Lanes Closure <br><br>
		<!--  <table  width="100%"> 
		<tr>
          <td align="Left">   -->
	          <table>
	         <tr>
	    	
				<td align="center">								
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg2" onclick="changeImage('laneupimg2')"> <br>
					<div id="lane4Div">&nbsp;&nbsp;&nbsp;<font style="font-size:10px;">4</font></div>
				</td>
				<td align="center">
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg3" onclick="changeImage('laneupimg3')"> <br>
					<div id="lane3Div">&nbsp;&nbsp;&nbsp;<font style="font-size:10px;">3</font></div>
				</td>
			    <td align="center">
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg4" onclick="changeImage('laneupimg4')"> <br>
					<div id="lane2Div">&nbsp;&nbsp;&nbsp;<font style="font-size:10px;">2</font></div>
				</td>
				<td align="center">
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg5" onclick="changeImage('laneupimg5')"> <br>
					<div id="lane1Div">&nbsp;&nbsp;&nbsp;<font style="font-size:10px;">1</font></div>
					 
				</td>

			  <td align="center">
				<ul>
					  <li> <font color="white">(+) Add New lanes </font> 
					  <ul>
						<li> Add Lane</li>
						<li> Add Center Divider</li>
						<li> Add Left Shoulder</li>
						<li> Add Right Shoulder</li>
						</ul></li>
					</ul>
				
				<ul>
					  <li><font color="white"> (-) Remove lanes  </font>
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
              <!--    </table>   -->
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
							<a href="#" class="buttonCreateventInc"  ng-click="calleventresponse()" style="text-decoration:none;"> CREATE </a> &nbsp;&nbsp;							   
						</div>
					</td>
					</tr>
			</table> 
	  </div>
	<!-- end of Create IR -->
	
	<!-- Start of IR  Response -->
	<div ng-show="showeventresFlag">

	<table width="100%" id="resptbl">
		<tr>
			<td> <a href="#"  style="text-decoration:none;" ng-click="calleventcreate()"><h3b>DETAILS</h3b></a> <h3b>></h3b> <h3a>RESPONSE</h3a> </td>
		</tr>
	</table> 
	
	 <div class='scrolleventResponse'> 
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
						<th align="left"> Date <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
						<th align="left"> Time </th>	
						<th align="left">EQT ID <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
							
					</tr>
					<tr colspan="4">
						<th align="left">Advanced Message </th>
					</tr>
					<tr ng-repeat="eventdata in eventvms | limitTo : noDisplayData : startData">
						<td>				
							<textarea class="textareaeventVmsMsg" rows="3" cols="25" id="eventVmsMsg"  ng-click="enableText()" >{{eventdata.eventvmsmsg}}</textarea>							
						</td>
						<td>						
							<input type="text" value= '{{eventdata.eventdate}}' style =" width: 85px; height: 35px; background-color: #2C3A77; color: #FFF; border : none; border-radius: 8px;">						
						</td>
						<td> 							
							<input type="text"  value= '{{eventdata.eventtime}}' style =" width: 130px; height: 35px; background-color: #2C3A77; color: #FFF; border : none; border-radius: 8px;">  							
						</td>
						<td>	
							<!-- <input type="hidden" id="seletedid" name="seletedid" value= '{{eventdata.eventeqid}}{{sep}}{{eventdata.eventdate}}{{sep}}{{eventdata.eventtime}}{{sep}}{{eventdata.eventvmsmsg}}' > -->  							
							<input type="hidden" id="seletedadid" name="seletedadid" value= '{{eventdata.eventeqid}}{{sep}}{{eventdata.eventdate}}' >  							
								<font color="#C8CFF4">{{eventdata.eventeqid}}</font>					
						</td>					
					</tr>
				</table>
				<div align="right">
					<a class="buttoneveImp"  id="vmsids" href="#" style="text-decoration:none;"> Implement </a>
					<a class="buttoneveNext"  href="#" ng-click="shownextpg()" style="text-decoration:none;"> Next </a>
				</div>
				<table width="100%" class="tablevms">				
					<tr colspan="4">
						<th align="left">Actual Message </th>
					</tr>				
					<tr ng-repeat="eventdatact in eventvms | limitTo : noDisplayData : startDataact">
						<td>											
							<textarea class="textareaeventVmsMsg" rows="3" cols="25" id="eventVmsMsg"  ng-click="enableText()" >{{eventdatact.eventvmsmsg}}</textarea>							
						</td>
						<td>						
							<input type="text" value= '{{eventdatact.eventdate}}' style =" width: 85px; height: 35px; background-color: #2C3A77; color: #FFF; border : none; border-radius: 8px;">													
						</td>
						<td> 		
							<input type="text"  value= '{{eventdatact.eventtime}}' style =" width: 130px; height: 35px; background-color: #2C3A77; color: #FFF; border : none; border-radius: 8px;">  														
						</td>
						<td>
							<!-- <input type="hidden" id="seletedactid" name="seletedactid" value= '{{eventdatact.eventeqid}}{{sep}}{{eventdatact.eventdate}}{{sep}}{{eventdatact.eventtime}}{{sep}}{{eventdatact.eventvmsmsg}}' >  --> 				
							<input type="hidden" id="seletedacid" name="seletedacid" value= '{{eventdatact.eventeqid}}{{sep}}{{eventdatact.eventdate}}' >  				
							<div id="evevmsequipid"><font color="#C8CFF4">{{eventdatact.eventeqid}}</font></div>													
						</td>					
					</tr>				
					
				</table>
						
						<div align="right">
							<a class="buttoneveImp"  id="vmsactids" href="#" style="text-decoration:none;"> Implement </a>
							<a class="buttoneveNext"  href="#" ng-click="shownextpgact()" style="text-decoration:none;"> Next </a></div>
						
				 
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
	            	Canning Messages
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
								<div ng-if="obuMsgStatus==='Failed'"> <span class="dotfail"></span> <font color="#C8CFF4">{{obuMsgStatus}} </font>></div>
								<div ng-if="obuMsgStatus==='Implemented'"> <span class="dotimp"></span> <font color="#C8CFF4">{{obuMsgStatus}}</font> </div>
								<div ng-if="obuMsgStatus==='Not Active'">  <span class="dotnotact"></span> <font color="#C8CFF4">{{obuMsgStatus}}</font> </div>					
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
								<div ng-if="obuMsgStatus==='Failed'"> <span class="dotfail"></span> <font color="#C8CFF4">{{obuMsgStatus}} </font></div>
								<div ng-if="obuMsgStatus==='Implemented'"> <span class="dotimp"></span> <font color="#C8CFF4">{{obuMsgStatus}} </font></div>
								<div ng-if="obuMsgStatus==='Not Active'">  <span class="dotnotact"></span> <font color="#C8CFF4">{{obuMsgStatus}}</font> </div>						
							</td>
							<td> <textarea class ="textareaeventObuMsg" rows="3" cols="45" ng-model="eventObuMsgJam" ng-click="enableText()" > {{eventObuMsgJam}}</textarea></td>						
							<td>KM Marking<textarea class = "textareaeventObuMsg" rows="1" cols="3" ng-model="eventObuMsgJamkm" ng-click="enableText()" > {{eventObuMsgJamkm}}</textarea></td>	
						</tr>
						<tr>
							<th colspan="3" bgcolor="Green"> Guide</th>
						</tr>	
						<tr>
							<td> 
								<div ng-if="obuMsgStatus==='Failed'"> <span class="dotfail"></span> <font color="#C8CFF4">{{obuMsgStatus}} </font></div>
								<div ng-if="obuMsgStatus==='Implemented'"> <span class="dotimp"></span><font color="#C8CFF4"> {{obuMsgStatus}} </font></div>
								<div ng-if="obuMsgStatus==='Not Active'"> <span class="dotnotact"></span><font color="#C8CFF4"> {{obuMsgStatus}} </font></div>						
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
							<a href="#" class="buttonCreateventInc" ng-click="addevent()" style="text-decoration:none;"> SAVE </a>	
							<a href="#" class="buttonCreateMrtInc" ng-click="overEvent()" style="text-decoration:none;"> OVER </a>
						<a href="#" class="buttonCreateventInc" ng-click="closeEvent()" style="text-decoration:none;"> CLOSE </a> &nbsp;&nbsp;						
					</div>
				</td>
			</tr>
		</table>
	 </div>
	  <!-- end of IR Respnse -->					
      </div>  
	  
		</div>
		
		</div>
	</div>  
</body>
</html>