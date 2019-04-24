<!doctype html>
<html >
<title>Mrt incident</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="popupmrtinccreate.css">
	 <link rel="stylesheet" href="checkboxstyle1.css">
	  <link rel="stylesheet" href="selectimagestyle.css">
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
  <table id="inctitletbl">
  	<tr>
		<td> <h2t>MRT IR </h2t></td>
	</tr>
	</table>
  <div class="popup">
    <div class="content">
	<table width="100%" id="incdetailtbl">
		<tr>
		<td><h3a>CREATE </h3a></td>
		<td>   <div align='right'> 
		<a href="createmrtinc.jsp" class="closebtn" ng-click="showincidentlist()" style="text-decoration:none;"><i class="fa fa-close"></i></a> 
     	</div> </td>
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
	 
	  </div>
	  
	  <table width="100%">
		  	<tr>
			<td> <div align='right'>  
	     	<a href="createmrtincidentresponse.jsp#popupmrtresponse" class="buttonCreateMrtInc"  ng-click="addincident()" style="text-decoration:none;"> CREATE </a>
			<!-- <a href="#popup" class="button1a" id="button1a"  ng-click="showincidentlist()"> Close</a>  -->
	     	</div> </td>
	     	</tr>
		</table> 
    </div>
  </div>
</div>


  </div>
</div>
 
<!-- end of Create Incident -->
</form>
  </body>
</html>