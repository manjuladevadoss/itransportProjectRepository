<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no" />
    <title> Create IR Accident Sceense </title>
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
	<script type="text/javascript"  src="utility.js"></script> 
  	
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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>   -->
	<!-- end plus and minu menu  script -->
	
	<script src="http://localhost:8080/itrans/arcgis_4.11/init.js"></script>  
	<script src="basemap411acc.js"></script>  
  
 <style> 
 /* Begin Map CSS */ 
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
  max-height: 300px !important;
  max-width: 300px !important;
  background-color: #202B53;
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

/*End of Map CSS*/

      
      
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
.ircamebutton {
  color: #C8CFF4;
  font-family:  Roboto, Helvetica, sans-serif;
  box-shadow: 2px 2px 8px 0 rgba(0,0,0,0.5);
  border-radius: 13px;
  background-color:#2C3A77;
  border: solid 0px #2C3A77;
  width:40px;
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
.lane1Div {
	color : ;
	fontSize : 11px;
}

/* Camera display div 
#instruction {
        z-index: 99;
        position: absolute;
        top: 50px;
        left: -30%;
        padding: 5px;
        margin-left: -175px;
        height: 20px;
        width: 350px;
		visibility: hidden;  
  } */
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
	//Lane image change    
	  var newsrc = "laneup.JPG";
	  var newsrc1 = "laneup.JPG";
	  var newsrc2 = "laneup.JPG";
	  var newsrc3 = "laneup.JPG";
	  var newsrc4 = "laneup.JPG";
	  var newsrc5 = "laneup.JPG";
	  
	  // Add rows in LTA vehicle 
	  var index = 1;
	      function insertRowLtavehitbl(){
			    var table=document.getElementById("ltavehitbl");
                var row=table.insertRow(table.rows.length);
                
                var cell1=row.insertCell(0);
                var t1=document.createElement("select");
                    t1.id = "partnerVehNovec"+index;
                    cell1.appendChild(t1); 
                    var select1 = document.getElementById(t1.id);
					select1.setAttribute("style","height: 20px; width: 90px;font-size: 10px;"); 
					select1.options[select1.options.length] = new Option('', '0');
                    select1.options[select1.options.length] = new Option('Tower1', '1');
                    select1.options[select1.options.length] = new Option('Tower2', '2');
                    select1.options[select1.options.length] = new Option('Tower3', '3');

                var cell2=row.insertCell(1);
                var t2=document.createElement("input");
                    t2.id = "partnerNotiTimevec"+index;
					t2.setAttribute("style", "height: 20px; width: 90px;font-size: 10px;");
                    cell2.appendChild(t2);
					//style=""
                
                var cell3=row.insertCell(2);
                var t3=document.createElement("input");
                    t3.id = "partnerArrTimevec"+index;
					t3.setAttribute("style", "height: 20px; width: 90px;font-size: 10px;");
                    cell3.appendChild(t3);
                
                var cell4=row.insertCell(3);
                var t4=document.createElement("input");
                    t4.id = "partnerDepatTimevec"+index;
					t4.setAttribute("style", "height: 20px; width: 90px;font-size: 10px;");
                    cell4.appendChild(t4);
                
                var cell5=row.insertCell(4);
                var t5=document.createElement("input");
                    t5.id = "partnerDepatTimevec"+index;
					t5.setAttribute("style", "height: 20px; width: 90px;font-size: 10px;");
                    cell5.appendChild(t5);
          index++;
    }
		//Remove Row in LTA vehicle 
	function removeRowLtavehitbl(oButton) {
        var ltaVhiTbl = document.getElementById('ltavehitbl');
        var lastRow = ltaVhiTbl.rows.length;
        if (lastRow > 2) 
        ltaVhiTbl.deleteRow(lastRow - 1);
    }
	
	// Add rows in Partner LTA vehicle 
	  var index1 = 1;
	      function insertRowPartvehitbl(){
                var table=document.getElementById("partvehitbl");
                var row=table.insertRow(table.rows.length);
                
                var cell1=row.insertCell(0);
                var t1=document.createElement("select");
                    t1.id = "partnerTypepart"+index1;
                    cell1.appendChild(t1); 
                    var select1 = document.getElementById(t1.id);
					select1.setAttribute("style","height: 20px; width: 90px;font-size: 10px;"); 
					select1.options[select1.options.length] = new Option('', '0');
                    select1.options[select1.options.length] = new Option('Ambulance', '1');
                    select1.options[select1.options.length] = new Option('Ambulance1', '2');
                    select1.options[select1.options.length] = new Option('Ambulance2', '3');

                var cell2=row.insertCell(1);
                var t2=document.createElement("input");
                    t2.id = "partnerVehNopart"+index1;
					t2.setAttribute("style", "height: 20px; width: 90px;font-size: 10px;");
                    cell2.appendChild(t2);
					//style=""
                
                var cell3=row.insertCell(2);
                var t3=document.createElement("input");
                    t3.id = "partnerNotiTimepart"+index1;
					t3.setAttribute("style", "height: 20px; width: 90px;font-size: 10px;");
                    cell3.appendChild(t3);
                
                var cell4=row.insertCell(3);
                var t4=document.createElement("input");
                    t4.id = "partnerArrTimepart"+index1;
					t4.setAttribute("style", "height: 20px; width: 90px;font-size: 10px;");
                    cell4.appendChild(t4);
                
                var cell5=row.insertCell(4);
                var t5=document.createElement("input");
                    t5.id = "partnerDepatTimepart"+index1;
					t5.setAttribute("style", "height: 20px; width: 90px;font-size: 10px;");
                    cell5.appendChild(t5);
          index1++;
	}
		//Remove Row  in Partner LTA vehicle 
	function removeRowPartvehitbl(oButton) {
        var partVhiTbl = document.getElementById('partvehitbl');
        var lastRow = partVhiTbl.rows.length;
        if (lastRow > 2) 
        partVhiTbl.deleteRow(lastRow - 1);
    }
 
/*** Lane closed information */	  
function changeImage(imgid) {   
	if(imgid=="laneupimg1") {
		 if (newsrc == "laneup.JPG") {
			document.getElementById('laneupimg1').src='lanecross.JPG';
			newsrc  = "lanecross.JPG";
			document.getElementById("lsh1Div").style.color = "#E58080";
		document.getElementById("lsh1Div").style.fontSize = "11px";
		  }
		  else {
		   document.getElementById('laneupimg1').src='laneup.JPG';
		   newsrc  = "laneup.JPG";
		   document.getElementById("lsh1Div").style.color = "#A0E67F";
	  document.getElementById("lsh1Div").style.fontSize = "11px";
		  }		
		}
		
		if(imgid=="laneupimg2") {
		 if (newsrc1 == "laneup.JPG") {
			document.getElementById('laneupimg2').src='lanecross.JPG';
			newsrc1  = "lanecross.JPG";
			document.getElementById("lane4Div").style.color = "#E58080";
		document.getElementById("lane4Div").style.fontSize = "11px";
		  }
		  else {
		   document.getElementById('laneupimg2').src='laneup.JPG';
		   newsrc1  = "laneup.JPG";
		   document.getElementById("lane4Div").style.color = "#A0E67F";
	  document.getElementById("lane4Div").style.fontSize = "11px";
		  }		
		}
		
		if(imgid=="laneupimg3") {
		 if (newsrc2 == "laneup.JPG") {
			document.getElementById('laneupimg3').src='lanecross.JPG';
			newsrc2  = "lanecross.JPG";
			document.getElementById("lane3Div").style.color = "#E58080";
		document.getElementById("lane3Div").style.fontSize = "11px";
		  }
		  else {
		   document.getElementById('laneupimg3').src='laneup.JPG';
		   newsrc2  = "laneup.JPG";
		   document.getElementById("lane3Div").style.color = "#A0E67F";
	  document.getElementById("lane3Div").style.fontSize = "11px";
		  }		
		}
	
	 if(imgid=="laneupimg4") {
		 if (newsrc3 == "laneup.JPG") {
			document.getElementById('laneupimg4').src='lanecross.JPG';
			newsrc3  = "lanecross.JPG";
			document.getElementById("lane2Div").style.color = "#E58080";
		document.getElementById("lane2Div").style.fontSize = "11px";
		  }
		  else {
		   document.getElementById('laneupimg4').src='laneup.JPG';
		   newsrc3  = "laneup.JPG";
		   document.getElementById("lane2Div").style.color = "#A0E67F";
	  document.getElementById("lane2Div").style.fontSize = "11px";
		  }		
		}
		
		if(imgid=="laneupimg5") {
		 if (newsrc4 == "laneup.JPG") {
			document.getElementById('laneupimg5').src='lanecross.JPG';
			newsrc4  = "lanecross.JPG";
			document.getElementById("lane1Div").style.color = "#E58080";
		document.getElementById("lane1Div").style.fontSize = "11px";
		  }
		  else {
		   document.getElementById('laneupimg5').src='laneup.JPG';
		   newsrc4  = "laneup.JPG";
		   document.getElementById("lane1Div").style.color = "#A0E67F";
	  document.getElementById("lane1Div").style.fontSize = "11px";
		  }		
		}

		/* if(imgid=="laneupimg6") {
		 if (newsrc5 == "laneup.JPG") {
			document.getElementById('laneupimg6').src='lanecross.JPG';
			newsrc5  = "lanecross.JPG";
			document.getElementById("rsh1Div").style.color = "#E58080";
		document.getElementById("rsh1Div").style.fontSize = "11px";
		  }
		  else {
		   document.getElementById('laneupimg6').src='laneup.JPG';
		   newsrc5  = "laneup.JPG";
		   document.getElementById("rsh1Div").style.color = "#A0E67F";
		  }		
		}	*/
	}
/*** End of  Lane closed information */

/***  Accident Image display not move*/ 
//var x = document.getElementById('accimgid');
//x.style.display = "none";
//document.getElementById('accimgid').style.visibility = "hidden";;
  //document.getElementById("instruction").style.visibility = none;
/*
function showaccimage() {
	if (document.getElementById("instruction").style.display == "none") {
		console.log("div id is none");
		document.getElementById("instruction").style.visibility = "visible";
		document.getElementById("instruction").style.display = "block";
	} else {
		console.log("div id is block");
		document.getElementById("instruction").style.visibility = "hidden";
		document.getElementById("instruction").style.display = "none";
	} 
}*/
/***  End of Accident Image display */
		

</script>
  </head>
<body class="calcite-maps calcite-nav-top" onload="predictionwindow()">
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
  
     <div id="panelTopDiv"  style="background-color: #202B53;">
    <h2t> Incident Record - Accident </h2t>
    </div>  
	  
	       <div id="panelRightDiv" class="esri-widget">
    
         <br> 
		 <br> 
		 <br> 
		<!-- Start IR Creation -->
	  <div ng-show="showircreate">
	  
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
							   Incident<span data-target="#Collapseiconacc1" data-toggle="collapse" data-parent="#accordion2"><span class="glyphicon glyphicon-plus" style="float:right;"></span> </span>
						</h4>
					</div>
					
					<div class="panel-collapse collapse in" id="Collapseiconacc1">
						<div class="panel-body">
																
			<table id="incdetailtbl">
					<tr>
					 <th colspan="6"> Fill in the details of your IR  </th>
					 </tr>
					 <tr>
					  <td colspan="3">
						IR Type: <br>
						<select ng-model="irtypesel">
							<option ng-repeat="option in irtypelist" value="{{option.irtypeselid}}">{{option.irtypeselname}}</option>
						</select>
					  </td>
					  <td colspan="3"> Direction: <br>
						<select ng-model="irdirsel">
							<option ng-repeat="option in irdirlist" value="{{option.irdirid}}">{{option.irdirname}}</option>
						</select>
					  </td>
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
						<input type="text"  style="width:190px; height: 20px;"  ng-model="irlinkedtxt"/>
						<!-- <select ng-model="irlinked">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
							<option ng-repeat="option in irlinkedList" value="{{option.irlinkedid}}">{{option.irlinkedname}}</option>
						</select>
						 -->
					  </td>
					  <td colspan="3">
						Incident Sub Type<br>
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
					  <td colspan="3">
						Start Point: <br>
							<input type="text"  style="width:190px; height: 20px;"  ng-model="irstartpoint"/>
					  </td>
					  <td colspan="3">
						End Point: <br>
							<input type="text"  style="width:190px; height: 20px;"  ng-model="irendpoint"/>
					  </td>
					</tr>
					<tr>
					  <td colspan="3">
							Congestion End Point: <br><input type="text"  style="width:190px; height: 20px;" ng-model="ircogendpoint"/>
					  </td>
					  <td colspan="3">
						Person Incharge: <br>
							<input type="text"  style="width:190px; height: 20px;"  ng-model="irperincharge"/>
					  </td>
					</tr>
					<tr>
					  <td colspan="6">
					  Injuries <br>
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
					       
					   <!--   the image locaiton not move
					   <button class="ircamebutton"  onclick="showaccimage()" id="accIncidentimage" ><img  id="cameraimg" class="cameraimgcl" src="camera.JPG" width="25px" height="25px"></button>					        
								<div id="instruction">
									<img id= "accimgid" src="accimage.jpg" width="100px" height="100px">
								</div> -->
								
						<!-- move the image -->		
						<button class="ircamebutton" onclick="showmsg()"><img src="camera.JPG" width="25px" height="25px"></button>
						<div id="cameraimagediv">
							<div id="cameraimagedivheader">
								<img id= "accimgid" src="accimage.jpg" width="150px" height="150px">
							</div>
						</div>								
						   <!-- Show video
						    <button class="ircamebutton" id="video" ><img src="camera.JPG" width="25px" height="25px"></button>
						      <div id="instruction">    
					       	<div class="popup" onclick="popupvideo()">
		                    <div id="videodiv">
		                     <span class="popuptext" id="myPopup">		                        
									<a class="boxclose" id="boxclose" onclick="lightbox_close();"></a>
		                            <video id="VisaChipCardVideo" width="300" controls>
		                                  <source src="CTEAccVideo.mp4" type="video/mp4">
		                          </video>
		                        </div>       
		                     </span>
		                    </div>   
		            	</div>	 -->				       
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
							   Lane Blockage<span data-target="#Collapseiconacc2" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus" style="float:right;"></span></span>
						</h4>
					</div>
					
					<div class="panel-collapse collapse in" id="Collapseiconacc2">
						<div class="panel-body">
						&nbsp;  &nbsp; Block or Unblock Lanes 					
						<table  width="100%">
		<tr>
          <td align="Left">
	          <table>
	         <tr>
	    		<td>
				<img src="laneup.JPG" width="30px" height="30px" id="laneupimg1" onclick="changeImage('laneupimg1')">
				<input type="hidden"  id="laneupimg1ht" name="laneupimg1htxt" value="laneupimg1" size="5" readonly>
				<img src="vertibar.JPG" width="10px" height="30px">
				<font style="color:#8BD27A;font-size: 11px;"><div id="lsh1Div">LSH1</div></font>
				</td>
				<td align="center">								
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg2" onclick="changeImage('laneupimg2')"> <br>
					<input type="hidden"  id="laneupimg2ht" name="laneupimg2htxt" value="laneupimg2" size="5" readonly>
					<font style="color:#8BD27A;font-size: 11px;"><div id="lane4Div">&nbsp;&nbsp;&nbsp;4</div></font>
				</td>
				<td align="center">
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg3" onclick="changeImage('laneupimg3')"> <br>
					<input type="hidden"  id="laneupimg3ht" name="laneupimg3htxt" value="laneupimg3" size="5" readonly>
					<font style="color:#8BD27A;font-size: 11px;"><div id="lane3Div">&nbsp;&nbsp;&nbsp;3</div></font>
				</td>
			    <td align="center">
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg4" onclick="changeImage('laneupimg4')"> <br>
					<input type="hidden"  id="laneupimg4ht" name="laneupimg4htxt" value="laneupimg4" size="5" readonly>
					<font style="color:#8BD27A;font-size: 11px;"><div id="lane2Div">&nbsp;&nbsp;&nbsp;2</div></font>
				</td>
				<td align="center">
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg5" onclick="changeImage('laneupimg5')"> <br>
					<input type="hidden"  id="laneupimg5ht" name="laneupim5htxt" value="laneupimg5" size="5" readonly>
					<font style="color:#8BD27A;font-size: 11px;"><div id="lane1Div">&nbsp;&nbsp;&nbsp;1</div></font>
					 
				</td>
				<td align="center">
				 <!--    <img src="vertibar.JPG" width="10px" height="30px"> 
					<img src="laneup.JPG" width="30px" height="30px" id="laneupimg6" onclick="changeImage('laneupimg6')"> <br>
					<input type="hidden"  id="laneupimg6ht" name="laneupimg6htxt" value="laneupimg6" size="5" readonly>
					<font style="color:#8BD27A;font-size: 11px;"><div id="rsh1Div">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RSH1</div></font>  -->
	          </td>
			  <td align="center">
				<!--  <ul>
								  <li> (+) Add New lines 
								  <ul>
									<li> Add Lane</li>
									<li> Add Center Divider</li>
									<li> Add Left Shoulder</li>
									<li> Add Right Shoulder</li>
									</ul></li>
								</ul> -->
		          </td>
	        </tr>         
	          </table>
                 </table>
			
				<!-- The Modal for Action Plan -->
				&nbsp;&nbsp;  
				&nbsp; 
				<a href="#" class="buttonPredi" id="preTimeId" ng-model="preTime"  style="text-decoration:none;" > Prediction </a>
			
							
				<!--<select id="preTimeId" ng-model="preTime"  style="width: 125px;">
				<option  value="" selected="selected" hidden="hidden">Prediction</option>
					<option value="1"> 15 Minutes </option>
					<option value="2"> 30 Minutes </option>
					<option value="3"> 45 Minutes </option>
					<option value="4"> 60 Minutes </option>
				</select>  -->
				
<!-- The Modal -->
	<div id="myModal" class="modalInner">
	  <!-- Modal content -->
	  <div class="modal-content1">
		  <!-- <span class="close">&times;</span> -->
		<div class="modal-body">      
	<table id="confitbltop"  cellpadding= "10px">
		  <tr><td>
			  <table id="confitbl">
				<tr>
				  <th>Do Nothing</th>
				</tr>
				<tr>
				  <td><br></td>
				</tr>
				<tr>
				  <td><b>Delay Time 00.40hr</b></td>
				</tr>
			  </table>
		  </td>
		  <td>
			  <table id="confitbl">
				<tr>
				  <th>Plan 1</th>
				</tr>
				<tr>
					<td>
						<a href="#" id="myModalInnerLnk1"  ng-click="irpreditImpl2()" style="text-decoration:none;">VMS Messages  &nbsp; {{iraccscenario1vms.length}} </a> <br>
						<a href="#" id="myModalInnerLnk1"  ng-click="irpreditImpl2()" style="text-decoration:none;">Traffic Light  &nbsp; {{trafficlight.length}} </a>
					</td>
				</tr>
				<tr>
				  <td>  
						<b>Delay Time 00.20hr</b>
						<!-- <p id="hrSelectSce1"></p> -->			  
				  </td>
				</tr>
		
			  </table>
		  </td>
		  <td>
			  <table id="confitbl">
				<tr>
				  <th>Plan  2</th>
				</tr>
				<tr>
					<td><a href="#" id="myModalInnerLnk2"  ng-click="irpreditImpl2()" style="text-decoration:none;">VMS Messages  &nbsp; {{iraccscenario2vms.length}}  </a><br>  <br> </td>
				</tr>
				<tr>
				  <td> 
						<b>Delay Time 00.30hr</b>  <!-- <b><p id="hrSelectSce2"></p></b>  -->
						</td>
				</tr>

			  </table>
		</td> </tr> 
	  </table>
		</div>
	</div>
	</div>		
	
	<!--  Inner modal scenario 1  -->
	<div id="myModalInner1" class="modalInner">
		  <div class="modal-content">
			<div class="modal-body">   
		<table id="scenriotbl1"  cellpadding= "2px">
			  <tr><td>
				  <table id="confitbl">
					<tr>
					  <th>Plan 1</th>
					</tr>
					<tr> 
						<td><b>EQP ID &nbsp;&nbsp; MESSAGE </b> </td>
					</tr>
					<tr ng-repeat="irsce1 in iraccscenario1vms"> 
					  <td>
					  <input type="hidden" id="scenario1List" name="scenario1List" value='{{irsce1.irvmsequipid}}{{sep}}{{irsce1.irvmsaccmsg}}{{sep}}{{irsce1.longitude}}{{sep}}{{irsce1.latitude}}' size="5" readonly>
					  {{irsce1.irvmsequipid}} &nbsp;&nbsp;{{irsce1.irvmsaccmsg}}
					  </td>
					</tr>
					<tr>
					  <th>Traffic Light Time Change </th>
					</tr>
					<tr>
						 <td><b>EQP ID &nbsp;&nbsp; Time</b></td>
					</tr>
					<tr ng-repeat="irtrlight in trafficlight"> 
					  <td>
					   <input type="hidden" id="scenario1TrafficList" name="scenario1TrafficList" value='{{irtrlight.longitude}}{{sep}}{{irtrlight.latitude}}' size="5" readonly>
					  {{irtrlight.irtrlightid}} &nbsp;&nbsp;{{irtrlight.irtrlightmsg}}
					  </td>
					</tr>
					<tr>
						<td><center>
						<a href="#" class="buttonPreImp" id="sce1VmsView"  style="text-decoration:none;"> View VMS </a>
						<a href="#" class="buttonPredi" id="sce1ImpliId"  style="text-decoration:none;"> Implement </a>
						<a href="#" class="buttonPreRem" id="sce1ImpliIdRemove"  style="text-decoration:none;"> Remove </a>
						</center>
						</td>
					</tr>
				  </table>
			  </td>
			</tr>
		  </table>
		  
		  </div>
		</div>
  </div>
  
		<!--  Inner modal scenario 2 -->
	<div id="myModalInner2" class="modalInner">
		  <div class="modal-content">
			<div class="modal-body">   
				  <table id="scenriotbl1">
					<tr>
					  <th><center>Plan 2</center></th>
					</tr>
					<tr> 
						<td><b>EQP ID &nbsp;&nbsp; MESSAGE </b> </td>
					</tr>
					<tr ng-repeat="irsce2 in iraccscenario2vms"> 
					  <td>
					   <input type="hidden" id="scenario2List" name="scenario2List" value='{{irsce2.irvmsequipid}}{{sep}}{{irsce2.irvmsaccmsg}}{{sep}}{{irsce2.longitude}}{{sep}}{{irsce2.latitude}}' size="5" readonly>
					  {{irsce2.irvmsequipid}} &nbsp;&nbsp;{{irsce2.irvmsaccmsg}} 
					  </td>
					</tr>
					<tr>
						<td><center>
						<a href="#" class="buttonPreImp" id="sce2VmsView"  style="text-decoration:none;"> View VMS </a>
						<a href="#" class="buttonPredi"  id="sce2ImpliId"  style="text-decoration:none;"> Implement </a> 
						<a href="#" class="buttonPreRem" id="sce2ImpliIdRemove"  style="text-decoration:none;"> Remove </a></center>
						</td>
					</tr>
				  </table>	  
		  </div>
		</div>
  </div>
<!-- End of Modal  -->	

<!-- Modal onload event Start -->
	<div id="myModalLoad" class="modalInner">
	  <!-- Modal content -->
	  <div class="modal-content1">
		  <!-- <span class="close">&times;</span> -->
		<div class="modal-body">      
	<table id="confitbltop"  cellpadding= "10px">
		  <tr><td>
			  <table id="confitbl">
				<tr>
				  <th>Do Nothing</th>
				</tr>
				<tr>
				  <td><br></td>
				</tr>
				<tr>
				  <td><b>Delay Time 00.40hr</b></td>
				</tr>
			  </table>
		  </td>
		  <td>
		  
			  <table id="confitbl">
				<tr>
				  <td>  
						<table id="confitbl">
							<tr>
							  <th>Plan 1</th>
							</tr>
							<tr> 
								<td><b>EQP ID &nbsp;&nbsp; MESSAGE </b> </td>
							</tr>
							<tr ng-repeat="irsce1 in iraccscenario1vms"> 
							  <td>
							  <input type="hidden" id="scenario1List" name="scenario1List" value='{{irsce1.irvmsequipid}}{{sep}}{{irsce1.irvmsaccmsg}}{{sep}}{{irsce1.longitude}}{{sep}}{{irsce1.latitude}}' size="5" readonly>
							  {{irsce1.irvmsequipid}} &nbsp;&nbsp;{{irsce1.irvmsaccmsg}}
							  </td>
							</tr>
							<tr>
							  <th>Traffic Light Time Change </th>
							</tr>
							<tr>
								 <td><b>EQP ID &nbsp;&nbsp; Time</b></td>
							</tr>
							<tr ng-repeat="irtrlight in trafficlight"> 
							  <td>
							   <input type="hidden" id="scenario1TrafficList" name="scenario1TrafficList" value='{{irtrlight.longitude}}{{sep}}{{irtrlight.latitude}}' size="5" readonly>
							  {{irtrlight.irtrlightid}} &nbsp;&nbsp;{{irtrlight.irtrlightmsg}}
							  </td>
							</tr>
							<tr>
								<td><center>
								<a href="#" class="buttonPreImp" id="sce1VmsView"  style="text-decoration:none;"> View VMS </a>
								<a href="#" class="buttonPredi" id="sce1ImpliId"  style="text-decoration:none;"> Implement </a>
								<a href="#" class="buttonPreRem" id="sce1ImpliIdRemove"  style="text-decoration:none;"> Remove </a>
								</center>
								</td>
							</tr>
					  </table>
				  </td>
				</tr>
				<tr>
				  <td><b>Delay Time 00.30hr</b></td>
				</tr>
		
			  </table>
		  </td>
		  <td>
			  <table id="confitbl">				
				<tr>
				  <td> 
						<table id="scenriotbl1">
						<tr>
						  <th><center>Plan 2</center></th>
						</tr>
						<tr> 
							<td><b>EQP ID &nbsp;&nbsp; MESSAGE </b> </td>
						</tr>
						<tr ng-repeat="irsce2 in iraccscenario2vms"> 
						  <td>
						   <input type="hidden" id="scenario2List" name="scenario2List" value='{{irsce2.irvmsequipid}}{{sep}}{{irsce2.irvmsaccmsg}}{{sep}}{{irsce2.longitude}}{{sep}}{{irsce2.latitude}}' size="5" readonly>
						  {{irsce2.irvmsequipid}} &nbsp;&nbsp;{{irsce2.irvmsaccmsg}} 
						  </td>
						</tr>
						<tr>
							<td><center>
							<a href="#" class="buttonPreImp" id="sce2VmsView"  style="text-decoration:none;"> View VMS </a>
							<a href="#" class="buttonPredi"  id="sce2ImpliId"  style="text-decoration:none;"> Implement </a> 
							<a href="#" class="buttonPreRem" id="sce2ImpliIdRemove"  style="text-decoration:none;"> Remove </a></center>
							</td>
						</tr>
					  </table>	
				  </td>
				</tr>
				<tr>
				  <td><b>Delay Time 00.20hr</b></td>
				</tr>
			  </table>
		</td> </tr> 
	  </table>
		</div>
	</div>
	</div>	
<!-- Modal onload event End -->	
									
			
			
			
						</div>
					</div>
				  </div>
				  
				 <div class="panel panel-default">
					<div class="panel-heading active">
						<h4 class="panel-title">
							 &nbsp;  <span data-target="#Collapseiconacc3" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus" style="float:right;"></span></span>
						</h4>
					</div>
					
					<div class="panel-collapse collapse" id="Collapseiconacc3">
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
				<a href="#" style="text-decoration: none" ng-click="callircreate()"> <h3b>CREATE</h3b> </a>&nbsp;<h3b>></h3b>&nbsp;<h3a>RESPONSE</h3a>
			</td>
		</tr>
	</table> 
	
		 <div class='scrollResponse'> 
 		  
		  <div class="panel-group" id="accordion2">
     
     <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">           	             	
                    VMS Messages <span data-target="#Collapseiconacc4" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus" style="float:right;"></span></span>
            </h4>
        </div>
        
        <div class="panel-collapse collapse in" id="Collapseiconacc4">
        	<div class="panel-body">
            	<p>Recommended VMS Messages </p>
			<table width="100%" class="tablevms">  
			<tr>
				<th align="left" style="padding:5px;">Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </th>
				<th align="left">EQT ID <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></th>
				<th align="left">Recommended Display <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </th>					
			</tr>

			<tr ng-repeat="irvms in iraccvmsList"> 
				<td> 
					<!--  <div ng-if="irvms.irvmsstatus==='Failed'"> <span class="dotfail"></span><font color="#C8CFF4">  {{irvms.irvmsstatus}} </font></div>
					<div ng-if="irvms.irvmsstatus==='Implemented'"> <span class="dotimp"></span> <font color="#C8CFF4"> {{irvms.irvmsstatus}} </font></div>
					<div ng-if="irvms.irvmsstatus==='Not Active'">  <span class="dotnotact"></span><font color="#C8CFF4">  {{irvms.irvmsstatus}} </font> </div>  -->					
				<label class="containeradio">
					<font color="white">{{irvms.irvmsstatus}}</font>
  						<input type="radio" name="accvmssatus" id="accvmssatus" ng-model="accvmssatus">
  						<span class="radiocheckmark"></span>
				</label>
				</td>
			<td><div id="accvmsequipid" > <font color="#C8CFF4">  {{irvms.irvmsequipid}}  </font></div>
			<input type="hidden" id="accvmsequipidt" name="accvmsequipidt" value='{{irvms.irvmsequipid}}' size="5" readonly>
			</td>
			<td>
			<input type="hidden" name="accMessageDetail" id="accMessageDetail" value='{{irvms.irvmsaccmsg}}' size="5" readonly> 
			<!-- <textarea class="textareaVmsMsg" name="accMessageDetail" id="accMessageDetail" rows="3" cols="28" ng-model='irvms.irvmsaccmsg'>{{irvms.irvmsaccmsg}}</textarea>  -->
			<div class="textimageAccidentdiv" contentEditable="true" id="vmsMessageDetailAcc"> {{irvms.irvmsaccmsg}}
  				 <div ng-if="irvms.irvmsaccmsg.indexOf('Accident') === 0"> <img src="accimg1.JPG"  width="30px" height="30px"/> <img src="vms5.png"  width="30px" height="30px"/> </div>
				 <div ng-if="irvms.irvmsaccmsg.indexOf('Accident') === -1"> <img src="vms4.png"  width="30px" height="30px"/> </div> 
			</div>
			</td> 
				
	    </tr>		
			</table>
			<table width="100%"> 
				<tr>
					<td>
						<div aligh="right">
							<a href="#" class="buttonImp" id="accVmsMessage"  ng-click="irvmsMsgImpl()" style="text-decoration:none;"> Implement </a>
							<a href="#" class="buttonImpAll" id="accAllVmsMessage"  ng-click="irvmsMsgImplAll()" style="text-decoration:none;"> Implement All </a>
							<a href="#" class="buttonRem" id="remAccVmsMessage" ng-click="irvmsMsgRemoved()" style="text-decoration:none;"> Remove </a> 						
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
                   Canning Message<span data-target="#Collapseiconacc5" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
           <!-- <img src="horibar.JPG" height="auto" > -->
        </div>
        
        <div class="panel-collapse collapse" id="Collapseiconacc5">
        	<div class="panel-body">
            	<!-- <p>Canning Messages</p>  -->
            	<p>Enter Canning Messages</p>
			   <table width="100%" class="tablevms"> 
					<tr>
						<td>
							<textarea class = "textareaVmsMsg" rows="3" cols="55" ng-model="accCanningMsg"> </textarea>
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
                   OBU Messages <span data-target="#Collapseiconacc6" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
        </div>
        
        <div class="panel-collapse collapse" id="Collapseiconacc6">
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
						<td> 
						<div class="textimageAccidentdiv" contentEditable="true" ng-model="accAlertMsg" ng-click="enableText()" id="obuAlertTxtId"> {{accAlertMsg}} 
									<img src="alertzoneimg.PNG"  width="30px" height="30px"/> 
						</div>
						
						</td>						
						<td>KM
						<textarea class = "textareaVmsMsg" rows="1" cols="3" ng-model="accAlertMsgKM" ng-click="enableText()" > {{accAlertMsgKM}}</textarea></td>
						
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
						<td>
							  <div class="textimageAccidentdiv" contentEditable="true"  ng-model="accJamMsg"  id="obuJamTxtId" ng-click="enableText()" > {{accJamMsg}} 
							  	<img src="alertzoneimg.PNG"  width="30px" height="30px"/>
							  </div>
						</td>						
						<td>KM<textarea class = "textareaVmsMsg" rows="1" cols="3" ng-model="accJamMsgKM" ng-click="enableText()" > {{accJamMsgKM}}</textarea></td>	
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
						<td> 
						<div class="textimageAccidentdiv" contentEditable="true"  id="obuGuideTxtId" ng-model="accGuideMsg"  id="obuJamTxtId" ng-click="enableText()" > {{accGuideMsg}} 
							<img src="alertzoneimg.PNG"  width="30px" height="30px"/>
						</div>
						
						</td>						
						<td>KM<textarea class ="textareaVmsMsg" rows="1" cols="3" ng-model="accGuideMsgKM" ng-click="enableText()" > {{accGuideMsgKM}}</textarea></td>	
					</tr>					
				</table>
				<table width="100%"> 
				<tr>
					<td>
						<div align="right">
							
							<a href="#" class="buttonImp" id="buttonRem" ng-click="obuMsgdeact()" style="text-decoration:none;"> Implement All </a>
							<a href="#"  class="buttonRem" id="buttonImpFail" ng-click="obuMsgImpl()" style="text-decoration:none;"> Deactivate All </a> 
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
                    Congestion Routes Monitoring <span data-target="#Collapseiconacc7" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
            </h4>
        </div>
         
        <div class="panel-collapse collapse" id="Collapseiconacc7">
        	<div class="panel-body">
            	<p>Congestion Routes Monitoring </p>
            </div>
        </div>
     </div>
   
     <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">              	
                   Partners & Vehicle Response<span data-target="#Collapseiconacc8" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
        </div>
        
        <div class="panel-collapse collapse" id="Collapseiconacc8">
        	<div class="panel-body">
            	<p>Partners Vehicle Handling</p>
					<table width="100%" class="tablevms" id="partvehitbl">  
						<tr>
							<th align="left" style="padding:5px;"> Type <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4;"></i></th>
							<th align="left"> Vehicle No. </th>
							<th align="left"> Notify Time </th>
							<th align="left"> Arrival Time </th>	
							<th align="left"> Depature Time </th>								
						</tr>					
						<tr>
							<td>
							<select name="item2" ng-model="partnerTypepart"  id="partnerTypepart" style="height: 20px; width: 90px;font-size: 10px;">
								<option value="Ambulance">Ambulance</option>
								<option value="Ambulance">Ambulance2</option>
								<option value="Ambulance">Ambulance3</option>
							</select>
							
							</td>
							<td><input type="text" ng-click="" ng-model="partnerVehNopart" id="partnerVehNopart" style="height: 20px; width: 90px;font-size: 10px;"></td>
							<td><input type="text" ng-click="" ng-model="partnerNotiTimepart" id="partnerNotiTimepart" style="height: 20px; width: 90px;font-size: 10px;"></td>
							<td><input type="text" ng-click="" ng-model="partnerArrTimepart" id="partnerArrTimepart" style="height: 20px; width: 90px;font-size: 10px;"></td>
							<td><input type="text" ng-click="" ng-model="partnerDepatTimepart" id="partnerDepatTimepart" style="height: 20px; width: 90px;font-size: 10px;"></td>
						</tr>
					</table>
					<table width="100%"> 
						<tr>
							<td>
								<div align="right">
									<a href="#" class="buttonRem" id="buttonRem" onclick="removeRowPartvehitbl(this)" style="text-decoration:none;"> Remove </a> 
									<a href="#" class="buttonImp" id="buttonImp" onclick="insertRowPartvehitbl()" style="text-decoration:none;"> Add </a>
								</div>	
							</td>
						</tr>
				 </table>			
				<p>LTA Vechicles</p>
				<table width="100%" class="tablevms" id="ltavehitbl">  
						<tr>
							<th align="left" style="padding:5px;"> Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4;font-size: 12px;"></i></th>
							<th align="left"> Vehicle No. </th>
							<th align="left"> Parking Address</th>
							<th align="left"> Parking Lot No.</th>	
							<th align="left"> Notify Time </th>								
						</tr>					
						<tr>
							<td>
							<select name="item4" ng-model="partnerType3vec" id="partnerType3vec" style="height: 20px; width: 90px;font-size: 10px;">
								<option value="Tower1" >Tower1</option>
								<option value="Tower1">Tower2</option>
								<option value="Tower3">Tower3</option>
							</select>							
							</td>
							<td><input type="text" ng-click="" ng-model="partnerVehNovec" id="partnerVehNovec"  style="height: 20px; width: 90px;font-size: 10px;"></td>
							<td><input type="text" ng-click="" ng-model="partnerNotiTimevec" id="partnerNotiTimevec" style="height: 20px; width: 90px;font-size: 10px;"></td>
							<td><input type="text" ng-click="" ng-model="partnerArrTimevec" id="partnerArrTimevec" style="height: 20px; width: 90px;font-size: 10px;"></td>
							<td><input type="text" ng-click="" ng-model="partnerDepatTimevec" id="partnerDepatTimevec"  style="height: 20px; width: 90px;font-size: 10px;"></td>
						</tr>					
					</table>
					<table width="100%"> 
						<tr>
							<td> 
								<div align="right">
									<a href="#" class="buttonRem" id="buttonRem" onclick="removeRowLtavehitbl(this)" style="text-decoration:none;"> Remove </a> 
									<a href="#" class="buttonImp" id="buttonImp" onclick="insertRowLtavehitbl()" style="text-decoration:none;"> Add </a>
								</div>	
							</td>
						</tr>
				 </table>
				
            </div>
        </div>
     </div>
     <!-- value for TMD Messages -->
     				<div ng-repeat="tmdval in tmdmessages"> 		
						<input type="hidden" id="tmdeqipid" name="tmdeqipid" value='{{tmdval.equipid}}' size="10" readonly>
						<input type="hidden" id="tmdtimemsg" name="tmdtimemsg" value='{{tmdval.timemsg}}' size="10" readonly>
						<input type="hidden" id="tmdminmsg" name="tmdminmsg" value='{{tmdval.minmsg}}' size="10" readonly>
						<div ng-repeat = "str in tmdval.streetnames"> 
							<input type="hidden" id="tmdstrnames" name="tmdstrnames" value='{{str.name}}{{sep}}{{str.min}}' size="35" readonly>
						</div>
					</div>
	<!-- End of TMD Messages -->
    <div align="right"><a href="createincident.jsp" class="buttonCreateMrtInc" ng-click="addmrtincident()" style="text-decoration:none;"> SAVE </a></div> 
</div>		  	  
 </div> 	
	 </div>
	  <!-- end of IR Respnse -->
      </div>  
	  
		</div>
		
		</div>
	</div>  
</body>
<script>
/*** Modal Content for Action Plan Accident IR*/
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("preTimeId");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

scenarioselectionid = 0;
btn.onclick = function() {
  modal.style.display = "block";
  //Time Change 	
 /* scenarioselectionid = document.getElementById("preTimeId").selectedIndex;
  if(scenarioselectionid==1){
	   document.getElementById("hrSelectSce1").innerHTML = "Delay Time 1.10 hrs";
	   document.getElementById("hrSelectSce2").innerHTML = "Delay Time 1.30 hrs"
  }
  if(scenarioselectionid==2){
	   document.getElementById("hrSelectSce1").innerHTML = "Delay Time 1.25 hrs";
	   document.getElementById("hrSelectSce2").innerHTML = "Delay Time 1.45 hrs"
  }
  if(scenarioselectionid==3){
	   document.getElementById("hrSelectSce1").innerHTML = "Delay Time 1.40 hrs";
	   document.getElementById("hrSelectSce2").innerHTML = "Delay Time 2.00 hrs"
  }
  if(scenarioselectionid==4){
	   document.getElementById("hrSelectSce1").innerHTML = "Delay Time 1.55 hrs";
	   document.getElementById("hrSelectSce2").innerHTML = "Delay Time 2.15 hrs"
  }*/
  
}
function predictionwindow() {
	 modal.style.display = "block";
	 //all plan in one display
	  //myModalLoad.style.display = "block";	  
}

//inner modal  Scenario 1 onclick
var modalInner1 = document.getElementById("myModalInner1");

// Get the button that opens the modal
//var btn = document.getElementById("mySelect");
lnkInner1 = document.getElementById("myModalInnerLnk1");

// Get the <span> element that closes the modal
var spanInner1 = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
lnkInner1.onclick = function() {
  modalInner1.style.display = "block";
}

//inner modal Scenario 2 onclick
var modalInner2 = document.getElementById("myModalInner2");

// Get the button that opens the modal
//var btn = document.getElementById("mySelect");
lnkInner2 = document.getElementById("myModalInnerLnk2");

// Get the <span> element that closes the modal
var spanInner2 = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
lnkInner2.onclick = function() {
  modalInner2.style.display = "block";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none"; 
  }
   if (event.target == modalInner1) { 
   	modalInner1.style.display = "none";
  }
  if (event.target == modalInner2) { 
   	modalInner2.style.display = "none";
  }
}
/*** End Modal Content for Action Plan */ 
 

</script>
</html>