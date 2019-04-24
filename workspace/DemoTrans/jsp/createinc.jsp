<!doctype html>
<html >
<title>incident Record </title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="popupinccreate.css">
	 <link rel="stylesheet" href="dropdownlistStyle.css">
	  <link rel="stylesheet" href="selectimagestyle.css">
	  <link rel="stylesheet" href="checkboxstyle1.css">
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
.dropdown-content {
 min-width: 180px;
 }
 .dropdown-content a {
  min-width: 180px;
 }
 
 /* toggle plus and Minus background color*/
.panel-heading.active {
    background-color: #202B53;
  /* color: #C8CFF4;   
    border : none;*/ 
}
.panel-title { 
 font-size: 16px;
  padding-bottom:6px;
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
   <div ng-app="ltaApp" ng-controller="ltaController">
   <form>
   <table align="center"> 
	<tr>	
		<td> 
			<div class="dropdown">
					<i class="fa fa-align"><h2t> Create Incident</h2t> </i>
				<div class="dropdown-content" >
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Accident IR')" style="text-decoration:none;"><img src="accident.jpg"> Accident</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Obstacle IR')" style="text-decoration:none;"><img src="obstacle.jpg"> Obstacle</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Heavy Traffic IR')" style="text-decoration:none;"><img src="heavytraffic.jpg"> Heavy Traffic</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Road Works IR')" style="text-decoration:none;"><img src="roadwork.jpg"> Road Works</a>
                <a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Mobile Road Works IR')" style="text-decoration:none;"><img src="mobileroadwork.jpg"> Mobile Road Works</a>
                <a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Break Down IR')" style="text-decoration:none;"><img src="breakdown.jpg"> Break Down</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Unattended Vehicle IR')" style="text-decoration:none;"><img src="unattvehicle.jpg"> Unattended Vehicle</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Miscellaneous IR')" style="text-decoration:none;"><img src="misce.jpg"> Miscellaneous</a> 
				</div>
			</div> 
		
		
		<!-- <div class="dropdown">
				<a class="button2" href="">&nbsp;Create Incident&nbsp; </a>
	 			<div class="dropdown-content" ng-model="irtypeselected">			 
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Accident')" style="text-decoration:none;"><img src="accident.jpg"> Accident</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Obstacle')" style="text-decoration:none;"><img src="obstacle.jpg"> Obstacle</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Heavy Traffic')" style="text-decoration:none;"><img src="heavytraffic.jpg"> Heavy Traffic</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Road Works')" style="text-decoration:none;"><img src="roadwork.jpg"> Road Works</a>
                <a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Mobile Road Works')" style="text-decoration:none;"><img src="mobileroadwork.jpg"> Mobile Road Works</a>
                <a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Break Down')" style="text-decoration:none;"><img src="breakdown.jpg"> Break Down</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Unattended Vehicle')" style="text-decoration:none;"><img src="unattvehicle.jpg"> Unattended Vehicle</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Miscellaneous')" style="text-decoration:none;"><img src="misce.jpg"> Miscellaneous</a>  
	  			</div>
			</div>  -->	
		</td>
		
	</tr> 
	</table>										
<br>
<br>

 <div class="container-fluid">

<!-- Create Incident -->
<br>
<br>
<div id="popupcreateinc" class="overlay">
  <table id="inctitletbl">
  	<tr>
		<td> <h2t>{{irtype}}</h2t></td>
	</tr>
	</table>
  <div class="popup">
    <div class="content">

	<table width="100%" id="incdetailtbl">
		<tr>
			<td><h3a>CREATE </h3a></td>
			<td>   <div align='right'> 
			<a href="createinc.jsp" class="closebtn" ng-click="showincidentlist()" style="text-decoration:none;"><i class="fa fa-close"></i></a> 
	     	</div> </td>
		</tr>
	</table>   
		 
	<div class='incscroll'>
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
	     	<a href="createincresponse.jsp#popupresponseinc" class="buttonCreateMrtInc"  ng-click="addincident()" style="text-decoration:none;"> CREATE </a>
			<!-- <a href="#popup" class="button1a" id="button1a"  ng-click="showincidentlist()"> Close</a>  -->
	     	</div> </td>
	     	</tr>
		</table> 
    </div>
  </div>
</div>
<!--  create popup 1st screen -->

  </div>
</div>
 
<!-- end of Create Incident -->
</form>
  </body>
</html>