<!doctype html>
<html >
<title>incident Record</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="popup.css">
	 <link rel="stylesheet" href="dropdownstyle.css">
	  <link rel="stylesheet" href="selectimagestyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	  <link rel="stylesheet" href="demo.css">
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
	 
	 
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
h4 {
  font-family: Roboto, Helvetica, sans-serif;
  color: #C8CFF4;
  font-weight: bold;
  font-size: 16px;
}

.button1 {
  font-size: .7em;
  padding: 4px 15px;
  color: #202B53;
  border: 2px solid #C8CFF4;
  border-radius: 40px/60px;
  background:#C8CFF4;
}
.button2 {
  font-size: 1em;
  padding: 10px 45px;
  color: #202B53;
  border: 2px solid #C8CFF4;
  border-radius: 40px/60px;
  background:#C8CFF4;
}

.content {
  max-width: 800px;
  margin: auto;
  background: #202B53;
  padding: 5px;

}
h6 {
  font-family: Roboto, Helvetica, sans-serif;
  color: #C8CFF4;
  font-size: 13px;
}

</style>


		
</head>

<body>

   <div ng-app="ltaApp" ng-controller="ltaController">
   <form>
   <table align="left"> 
	<tr>	
		<td> 
			<div class="dropdown">
				 <a class="button2" href="">Create Incident </a>
	 			 <div class="dropdown-content" ng-model="irtypeselected">
				<a href="createinc.jsp#popup1" value="Accident" type="submit" ng-click="visiblecreatebutton()"><img src="accident.jpg">Accident</a>
				<a href="createinc.jsp#popup1" value="Obstacle" type="submit" ng-click="visiblecreatebutton()"><img src="obstacle.jpg">Obstacle</a>
				<a href="createinc.jsp#popup1" value="Heavy Traffic" type="submit" ng-click="visiblecreatebutton()"><img src="heavytraffic.jpg">Heavy Traffic</a>
				<a href="createinc.jsp#popup1" value="Road Works" type="submit" ng-click="visiblecreatebutton()"><img src="roadwork.jpg">Road Works</a>
                <a href="createinc.jsp#popup1" value="Mobile Road Works" type="submit" ng-click="visiblecreatebutton()"><img src="mobileroadwork.jpg">Mobile Road Works</a>
                <a href="createinc.jsp#popup1" value="Break Down" type="submit" ng-click="visiblecreatebutton()"><img src="breakdown.jpg">Break Down</a>
				<a href="createinc.jsp#popup1" value="Unattended Vehicle" type="submit" ng-click="visiblecreatebutton()"><img src="unattvehicle.jpg">Unattended Vehicle</a>
				<a href="createinc.jsp#popup1" value="Miscellaneous" type="submit" ng-click="visiblecreatebutton()"><img src="misce.jpg">Miscellaneous</a>  
	  			</div>
			</div>
		</td>
		
	</tr> 
	
	
</table>
<br>
<br>



 <div class="container-fluid">

   
<!-- display List of Incident -->
<div ng-show="showList"> 
 <div class="bs-example">
<div class="content">
	<table width="100%">
     <tr > 

		<td>
		<div align='right'> 
			<font color="white" size="2">Search <input type="text" size="35" placeholder="Search" ng-model="searchIncident">  </font>
			
		</div> 
	   </td> 
	   <td>
		   <div class="dropdown">
			<font color="white" size="2">Menu <img src="cormenu.jpg" width="15" height="15"> </font>
				<div class="dropdown-content">
					<a href="workorderTbl.jsp">Work Order</a>
					<a href="techalarmTbl.jsp">Technical Alarms</a>
					<a href="envmonTbl.jsp">Environment</a>
					<a href="eventTbl.jsp">Events</a>
					<a href="envmonTbl.jsp">Road Works</a>
						 <hr color = "#C8CFF4">
					<a href="envmonTbl.jsp">Merge up/down</a>
					<a href="envmonTbl.jsp">Merge sideways</a>
				</div>
			</div>
		</td>
	 </tr>
	 </table>
	 <br>
<table border="1" width="100%">
		<tr>
			<th> <a href="#" ng-click="sortType = 'irid'; sortReverse = !sortReverse"><h4> IRID </h4></a></th>
			<th> <a href="#" ng-click="sortType = 'type'; sortReverse = !sortReverse"><h4> Type </h4></a></th>
			<th> <a href="#" ng-click="sortType = 'state'; sortReverse = !sortReverse"><h4> State</h4></a></th>
			<th> <a href="#" ng-click="sortType = 'zone'; sortReverse = !sortReverse"> <h4>Zone </h4></a></th>
			<th> <a href="#" ng-click="sortType = 'roadname'; sortReverse = !sortReverse"> <h4>Road Name </h4></a></th>
			<th> <a href="#" ng-click="sortType = 'lanes'; sortReverse = !sortReverse"><h4>Lanes </h4></a></th>
		</tr>
			<tr ng-repeat="inc in incidentNewList | orderBy:sortType:sortReverse | filter:searchIncident">
				<td><font color="#C8CFF4" size="3">{{inc.irid}}</font></td>
				<td>
					<div ng-if="inc.type==='Accident'"><img src="accident.jpg"><font color="#C8CFF4" size="3">{{inc.type}}</font></div>
					<div ng-if="inc.type==='Road Works'"><img src="roadwork.jpg"><font color="#C8CFF4" size="3">{{inc.type}}</font></div>
					<div ng-if="inc.type==='Obstacle'"><img src="obstacle.jpg"><font color="#C8CFF4" size="3">{{inc.type}}</font></div>
					<div ng-if="inc.type==='Break Down'"><img src="breakdown.jpg"><font color="#C8CFF4" size="3">{{inc.type}}</font></div>
					<div ng-if="inc.type==='Heavy Traffic'"><img src="heavytraffic.jpg"><font color="#C8CFF4" size="3">{{inc.type}}</font></div>
					<div ng-if="inc.type==='Mobile Road Works'"><img src="mobileroadwork.jpg"><font color="#C8CFF4" size="3">{{inc.type}}</font></div>
					<div ng-if="inc.type==='Unattended Vehicle'"><img src="unattvehicle.jpg"><font color="#C8CFF4" size="3">{{inc.type}}</font></div>
					<div ng-if="inc.type==='Miscellaneous'"><img src="misce.jpg"><font color="#C8CFF4" size="3">{{inc.type}}</font></div>
				</td>
				<td><font color="#C8CFF4" size="3">{{inc.state}}</font></td>
				<td><font color="#C8CFF4" size="3">{{inc.zone}}</font></td>
				<td><font color="#C8CFF4" size="3">{{inc.roadname}}</font></td>
				<td><font color="#C8CFF4" size="3">{{inc.lanes}}</font></td>
			</tr>
	</table> 
	<!--
	<button type="submit" ng-click="hideincidentlist()" class="button button3">Hide Incident List</button> <br>
	<a href="incidentTbl.jsp" ng-click="hideincidentlist()">Hide Incident List href <a>
	-->
</div>
</div>
</div>

<!-- End display List of Incident -->

<!-- Create Incident -->
<br>
<br>



<div id="popup1" class="overlay">
  <div class="popup">
    <div class="content">
	<table width="100%"><tr>
		<td><h4>Create</h4></td>
		<td> <div align='right'>  <div ng-show="createbuttonshow"> 
     	<a href="#popup" class="button1" id="Button1" ng-click="addincident()"> Create </a>
		<a href="#popup" class="button1" id="Button1"  ng-click="showincidentlist()"> Close</a> </div>
     	</div> </td>
	</tr></table>   
    <h3>Incident</h3>
		 <hr color = "#C8CFF4">
      <table width="100%">

		<tr>
	      <td>
          	<h3>Fill in the detail of your IR.</h3>
			<select ng-model="irtype">
			<div ng-if="irtypeselected==='Accident'">
				<option value="Accident" selected>Accident</option>
				<div>
				<option value="Obstacle">Obstacle</option>
				<option value="Heavy Traffic">Heavy Traffic</option>
				<option value="Road Works">Road Works</option>
                <option value="Mobile Road Works">Mobile Road Works</option>
                <option value="Break Down">Break Down</option>
				<option value="Unattended Vehicle">Unattended Vehicle</option>
				<option value="Miscellaneous">Miscellaneous</option>           
           </select>
          </td>
		  <td></td>
	  
	  </tr>
        <tr>
          <td>
            <h6>Status</h6> 
              <select ng-model="irstatus">
					<option value="Confirmed">Confirmed</option>
					<option value="Over">Over</option>
					<option value="In Progress">In Progress</option>
					<option value="Notified">Notified</option>
					<option value="Other">Other</option>
				</select>
          </td>
          <td> <h6>Source </h6>
              <select ng-model="irsource">
					<option value="ERS">ERS</option>
					<option value="JEYE">JEYE</option>
					<option value="other">Other</option>
				</select>
          </td>
        </tr>
        <tr>
          <td>
            <h6>Start Time </h6>
		
			<div style="width: 190px;">
				<div id="picker"> </div>
					<input type="text" placeholder="Start Time"  ng-model="irstarttime"/> {{irstarttime}}
			</div>
	
          </td>
          <td>
            <h6>End Time </h6>
         
			<div style="width: 190px;">
				<div id="picker1"> </div>
					<input type="text"  placeholder="End Time"  ng-model="irendtime"/> {{irendtime}}
			</div>
          </td>
        </tr>

        <tr>
          <td>
            <h6>Linked IR </h6>
            <input type="text" placeholder="linked IR" ng-model="irlinked">
          </td>
          <td>
            <h6>Image Captured </h6>
            <input type="text"  placeholder="End Time" ng-model="irimgcap">
          </td>
        </tr>
        <tr>
          <td colspan="2">
           <h6> Comments </h6>
            <input type="text" size="100" placeholder="linked IR" ng-model="ircomments">
          </td>
        </tr>
        <tr>
          <td>
           <br><h6>Location Information</h6> 
		   <h6>Road Name:&nbsp;{{irroadname}} </h6>
		   <h6>Location Type:&nbsp;{{irloctype}} </h6>
		   <h6>Direction:&nbsp;{{irdirection}}</h6> 
		   
          </td>
          <td>
            <h6>Start Point:&nbsp;{{irspoint}}</h6>
			<h6>End Point:&nbsp;{{irepoint}} </h6>
          </td>
        </tr>
      </table>
	  <h6>Lane Blockage 9090</h6>
	  <hr color = "#C8CFF4">
	  
	   <h6>Block or Unbklock Lanes</h6> 
		<table width="80%">
		<tr>
	      <td> 
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
	      <td> 
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
	      <td> 
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
	      <td> 
	      		<div class="select-sim" >
				  <div class="options">
				    <div class="option">
				      <input type="radio" name="color" value="cross" id="lane3_1"  />
				      <label for="lane3_1">
				        <img src="cross.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				    <div class="option">
				      <input type="radio" name="color" value="arrow" id="lane3_2" checked/>
				      <label for="lane3_2">
				        <img src="uparrow.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				   <div class="option">
				      <input type="radio" name="color" value="traffic" id="lane3_3" />
				      <label for="lane3_3">
				       <img src="traffic.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
					<div class="option">
				      <input type="radio" name="color" value="traffic1" id="lane3_4" />
				      <label for="lane3_4">
				      <img src="traffic1.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				  </div>
				</div>
	      </td>
	      <td> 
	      		<div class="select-sim" >
				  <div class="options">
				    <div class="option">
				      <input type="radio" name="LaneSellane4_1" value="cross" id="lane4_1"  />
				      <label for="lane4_1">
				        <img src="cross.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				    <div class="option">
				      <input type="radio" name="LaneSellane4_2" value="arrow" id="lane4_2" checked/>
				      <label for="lane4_2">
				        <img src="uparrow.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				   <div class="option">
				      <input type="radio" name="LaneSellane4_3" value="traffic" id="lane4_3" />
				      <label for="lane4_3">
				       <img src="traffic.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
					<div class="option">
				      <input type="radio" name="LaneSellane4_4" value="traffic1" id="lane4_4" />
				      <label for="lane4_4">
				      <img src="traffic1.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				  </div>
				</div>
	      </td>
	      <td> 
	      		<div class="select-sim" >
				  <div class="options">
				    <div class="option">
				      <input type="radio" name="LaneSelrsh1" value="cross" id="rsh1"  />
				      <label for="rsh1">
				        <img src="cross.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				    <div class="option">
				      <input type="radio" name="LaneSelrsh2" value="arrow" id="rsh2" checked/>
				      <label for="rsh2">
				        <img src="uparrow.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				   <div class="option">
				      <input type="radio" name="LaneSelrsh3" value="traffic" id="rsh3" />
				      <label for="rsh3">
				       <img src="traffic.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
					<div class="option">
				      <input type="radio" name="LaneSelrsh4" value="traffic1" id="rsh4" />
				      <label for="rsh4">
				      <img src="traffic1.JPG" alt="Girl in" style="width:19px;height:19px;">
				      </label>
				    </div>
				  </div>
				</div>
	      </td>
		</tr>
		<tr>
		 <td><h6>LSH1</h6> </td>
		  <td><h6>4</h6></td>
		  <td><h6>3</h6> </td>
		  <td><h6>2 </h6></td>
		  <td><h6> 1</h6> </td>
		  <td><h6> RSH1</h6></td>
		</tr>
	
		</table>
		
		

		
		<h6>(+)add new lines</h6>
		 <hr color = "#C8CFF4">
	 <table width="100%">
		<tr>
	      <td>Simulated</td>
		  <td>VRS </td>
		</tr>
		<tr>
	      <td> Escalate via SMS</td>
		  <td>Important LTM </td>
		</tr>
		<tr rowspan="2">
	      <td>LTM </td>
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