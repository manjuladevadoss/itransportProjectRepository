<!doctype html>
<html >
<title>incident Record</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="popupinccreate.css">
	 <link rel="stylesheet" href="dropdownstyle.css">
	  <link rel="stylesheet" href="selectimagestyle.css">
	  <link rel="stylesheet" href="checkboxstyle.css">
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
   <table align="left"> 
	<tr>	
		<td> 
			<div class="dropdown">
				<a class="button2" href="">&nbsp;Create Incident&nbsp; </a>
	 			<div class="dropdown-content" ng-model="irtypeselected">			 
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Accident')"><img src="accident.jpg"> Accident</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Obstacle')"><img src="obstacle.jpg"> Obstacle</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Heavy Traffic')"><img src="heavytraffic.jpg"> Heavy Traffic</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Road Works')"><img src="roadwork.jpg"> Road Works</a>
                <a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Mobile Road Works')"><img src="mobileroadwork.jpg"> Mobile Road Works</a>
                <a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Break Down')"><img src="breakdown.jpg"> Break Down</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Unattended Vehicle')"><img src="unattvehicle.jpg"> Unattended Vehicle</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Miscellaneous')"><img src="misce.jpg"> Miscellaneous</a>  
	  			</div>
			</div>
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
  <div class="popup">
    <div class="content">
	<table width="100%"><tr>
		<td><h4>Create</h4></td>
		<td>   <div align='right'> 
		<a href="#popup" class="closebtn" ng-click="showincidentlist()"><i class="fa fa-close"></i></a> 
     	</div> </td>
	</tr>
	<tr>
		<td><h3> Incident</h3></td>
		<td> </td>
	</tr>
	</table>   
		 <hr color = "#C8CFF4"  style="padding:0px; margin:0px;">
	<div class='incscroll'>
      <table width="100%">
        <tr>
          <td colspan="3">
            <h3>Status</h3> 
              <select ng-model="irstatus">
					<option  value="" selected="selected" hidden="hidden">Choose here</option>
					<option value="Confirmed">Confirmed</option>
					<option value="Over">Over</option>
					<option value="In Progress">In Progress</option>
					<option value="Notified">Notified</option>
					<option value="Other">Other</option>
				</select>
          </td>
          <td colspan="3"> <h3>Source </h3>
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
            <h3>Start Time </h3>
		
			<div style="width: 150px;">
				<div id="picker"> </div>
					<input type="text" placeholder="Start Time"  ng-model="irstarttime"/>
			</div>
	
          </td>
          <td colspan="3">
            <h3>End Time </h3>
         
			<div style="width: 150px;">
				<div id="picker1"> </div>
					<input type="text"  placeholder="End Time"  ng-model="irendtime"/>
			</div>
          </td>
        </tr>

        <tr>
          <td colspan="3">
            <h3>Linked IR </h3>
            <input type="text" placeholder="linked IR" ng-model="irlinked">
          </td>
          <td colspan="3">
            <h3>Image Captured </h3>
            <input type="text"  placeholder="End Time" ng-model="irimgcap">
          </td>
        </tr>
        <tr>
          <td colspan="6">
           <h3> Comments </h3>
            <input type="text" size="100" placeholder="linked IR" ng-model="ircomments">
          </td>
        </tr>
        <tr>
          <td colspan="3">
           <br><h3>Location Information</h3> 
		   <h3>Road Name:&nbsp;{{irroadname}} </h3>
		   <h3>Location Type:&nbsp;{{irloctype}} </h3>
		   <h3>Direction:&nbsp;{{irdirection}}</h3> 
		   
          </td>
          <td colspan="3">
            <h3>Start Point:&nbsp;{{irspoint}}</h3>
			<h3>End Point:&nbsp;{{irepoint}} </h3>
          </td>
        </tr>
		<tr>
          <td colspan="6">
           <h3>Lane Blockage </h3>
		   <hr color = "#C8CFF4"  style="padding:0px; margin:0px;">
			<h3>Block or Unbklock Lanes</h3> 
          </td>
        </tr>
		
		<tr>
          <td align="center">
           	    <div class="select-sim" >
				  <div class="options">
				    <div class="option">
				      <input type="checkbox" name="color" value="cross" id="lsh1"  />
				      <label for="lsh1">
				        <img src="cross.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				    <div class="option">
				      <input type="checkbox" name="color" value="arrow" id="lsh2" checked/>
				      <label for="lsh2">
				        <img src="arrow1.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				   <div class="option">
				      <input type="checkbox" name="color" value="traffic" id="lsh3" />
				      <label for="lsh3">
				       <img src="arrow1.jpg" alt="Girl in" style="width:20px;height:20px;">
				      </label>
				    </div>
					<div class="option">
				      <input type="checkbox" name="color" value="traffic1" id="lsh4" />
				      <label for="lsh4">
				      <img src="arrow1.jpg" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				  </div>
				</div>
				</td>
				<td align="center">
				<div class="select-sim" >
				  <div class="options">
				    <div class="option">
				      <input type="radio" name="color" value="cross" id="lane1_1"  />
				      <label for="lane1_1">
				        <img src="cross.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				    <div class="option">
				      <input type="radio" name="color" value="arrow" id="lane1_2" checked/>
				      <label for="lane1_2">
				        <img src="uparrow.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				   <div class="option">
				      <input type="radio" name="color" value="traffic" id="lane1_3" />
				      <label for="lane1_3">
				       <img src="traffic.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
					<div class="option">
				      <input type="radio" name="color" value="traffic1" id="lane1_4" />
				      <label for="lane1_4">
				      <img src="traffic1.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				  </div>
				</div>
				</td>
				<td align="center">
				<div class="select-sim" >
				  <div class="options">
				    <div class="option">
				      <input type="radio" name="color" value="cross" id="lane2_1"  />
				      <label for="lane2_1">
				        <img src="cross.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				    <div class="option">
				      <input type="radio" name="color" value="arrow" id="lane2_2" checked/>
				      <label for="lane2_2">
				        <img src="uparrow.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				   <div class="option">
				      <input type="radio" name="color" value="traffic" id="lane2_3" />
				      <label for="lane2_3">
				       <img src="traffic.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
					<div class="option">
				      <input type="radio" name="color" value="traffic1" id="lane2_4" />
				      <label for="lane2_4">
				      <img src="traffic1.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				  </div>
				</div>
          </td>
		    <td align="center">
           	    <div class="select-sim" >
				  <div class="options">
				    <div class="option">
				      <input type="radio" name="color" value="cross" id="lsh1"  />
				      <label for="lsh1">
				        <img src="cross.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				    <div class="option">
				      <input type="radio" name="color" value="arrow" id="lsh2" checked/>
				      <label for="lsh2">
				        <img src="uparrow.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				   <div class="option">
				      <input type="radio" name="color" value="traffic" id="lsh3" />
				      <label for="lsh3">
				       <img src="traffic.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
					<div class="option">
				      <input type="radio" name="color" value="traffic1" id="lsh4" />
				      <label for="lsh4">
				      <img src="traffic1.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				  </div>
				</div>
				</td>
				<td align="center">
				<div class="select-sim" >
				  <div class="options">
				    <div class="option">
				      <input type="radio" name="color" value="cross" id="lane1_1"  />
				      <label for="lane1_1">
				        <img src="cross.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				    <div class="option">
				      <input type="radio" name="color" value="arrow" id="lane1_2" checked/>
				      <label for="lane1_2">
				        <img src="uparrow.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				   <div class="option">
				      <input type="radio" name="color" value="traffic" id="lane1_3" />
				      <label for="lane1_3">
				       <img src="traffic.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
					<div class="option">
				      <input type="radio" name="color" value="traffic1" id="lane1_4" />
				      <label for="lane1_4">
				      <img src="traffic1.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				  </div>
				</div>
				</td>
				<td align="center">
				<div class="select-sim" >
				  <div class="options">
				    <div class="option">
				      <input type="radio" name="color" value="cross" id="lane2_1"  />
				      <label for="lane2_1">
				        <img src="cross.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				    <div class="option">
				      <input type="radio" name="color" value="arrow" id="lane2_2" checked/>
				      <label for="lane2_2">
				        <img src="uparrow.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				   <div class="option">
				      <input type="radio" name="color" value="traffic" id="lane2_3" />
				      <label for="lane2_3">
				       <img src="traffic.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
					<div class="option">
				      <input type="radio" name="color" value="traffic1" id="lane2_4" />
				      <label for="lane2_4">
				      <img src="traffic1.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				  </div>
				</div>
          </td>
        </tr>
		
		<tr>
          <td align="center">
			<h3>LSH1</h3>
			</td>
			<td align="center">
				<h3>4</h3>
			</td>
			<td align="center">
				<h3>3</h3>
			</td>
		    <td align="center">
				<h3>2</h3>
			</td>
			<td align="center">
				<h3> 1</h3> 
			</td>
			<td align="center">
				<h3> RSH1</h3>
          </td>
        </tr>
		<tr>
          <td colspan="6" align="center">			
					<ul>
					  <li><h3> (+) Add New lines</h3> 
					  <ul>
						<li> Add Lane</li>
						<li> Add Center Divider</li>
						<li> Add Left Shoulder</li>
						<li> Add Right Shoulder</li>
						</ul></li>
					</ul>					 
          </td>
        </tr>
		<tr>
          <td colspan="6">
		   <hr color = "#C8CFF4"  style="padding:0px; margin:0px;">
          </td>
        </tr>
		<tr>
          <td colspan="3">
            <input id="checkbox-1" class="checkbox-custom" name="checkbox-1" type="checkbox" >
			<label for="checkbox-1" class="checkbox-custom-label">Simulated</label> 
           </td>
          <td colspan="3"> 
			<input id="checkbox-2" class="checkbox-custom" name="checkbox-2" type="checkbox" >
			<label for="checkbox-2" class="checkbox-custom-label">VRS</label> 
          </td>
        </tr>
		<tr>
          <td colspan="3">
          	<input id="checkbox-3" class="checkbox-custom" name="checkbox-3" type="checkbox" >
			<label for="checkbox-3" class="checkbox-custom-label">Escalate via SMS</label> 
          </td>
          <td colspan="3"> 
		    <input id="checkbox-4" class="checkbox-custom" name="checkbox-4" type="checkbox" >
			<label for="checkbox-4" class="checkbox-custom-label">Important LTM</label> 
          </td>
        </tr>
		<tr rowspan="6">
	      <td>
		  	<input id="checkbox-5" class="checkbox-custom" name="checkbox-5" type="checkbox" >
			<label for="checkbox-5" class="checkbox-custom-label">LTM</label> 
		  </td>
		</tr>
      </table>
	  
	  			<table width="100%"><tr>
		<td> <div align='right'>  
     	<a href="createincresponse.jsp#popupresponseinc" class="buttonCreateMrtInc"  ng-click="addincident()"> Create </a>
		<!-- <a href="#popup" class="button1a" id="button1a"  ng-click="showincidentlist()"> Close</a>  -->
     	</div> </td>
	</tr></table> 
	  </div>
	  


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