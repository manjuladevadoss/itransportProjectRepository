<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no" />
    <title> Create Traffic Alert  </title>
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

  	<script  type="text/javascript" src="angular.min.js"></script>
  	<script type="text/javascript" src="democontroller.js"></script>  
    
	<!-- start plus and minu menu  script -->
 <!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  -->
	<!-- end plus and minu menu  script -->
	
	<script src="http://localhost:8080/itrans/arcgis_4.11/init.js"></script>  
	<script src="basemap411ta.js"></script>  
  
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
        width: 600px;
        font-size: 12px;
		background-color: #202B53;
      }

/* popup window font and background color*/
.esri-view-width-xlarge .esri-popup__main-container,
.esri-view-width-large .esri-popup__main-container,
.esri-view-width-medium .esri-popup__main-container
{
  max-height: 200px !important;
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

/** Traffic alert Table format */
#datatbl {
  border-collapse: collapse;
  width: 100%;
}

#datatbl td, #datatbl th {
  border: 0px solid green;
  padding: 3px;
  color: white;
  font-family: Roboto, Helvetica, sans-serif;
   font-size: 10px;
 /* background-color: #202B53;*/
}

#inctbl {
  border-collapse: collapse;
  width: 100%;
}

#inctbl td, #inctbl th {
  border: 0px solid #ddd;
  padding: 3px;
  font-family: Roboto, Helvetica, sans-serif;
   font-size: 12px;
  color: white;
}

#inctbl tr:nth-child(odd){
  background-image: linear-gradient( 90deg,	rgba(55,63,97,1) , rgba(25,31,57,1));
  border: 1px solid #293E78;
 /* color: radial-gradient(circle, #293E78 0%, #14192D 100%);*/
}

#inctbl tr:nth-child(even){
  background-image: linear-gradient( 90deg,	rgba(55,63,97,1) , rgba(25,31,57,1));
  border: 1px solid #293E78;
  /*color: radial-gradient(circle, #293E78 0%, #14192D 100%);*/
}

#inctbl tr:hover {
	background-image: linear-gradient( 90deg,	rgba(98,55,55,1) , rgba(39,26,57,1)); 
}

#inctbl th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}

/** reduce hr tag top and bottom space */
hr {
    -moz-box-sizing: border-box;
    -moz-float-edge: margin-box;
    border: 1px inset;
    color: gray;
    display: block;
    height: 2px;
    margin: 0.5em auto;
}

/* Start Traffic Video */ 
    #videodiv {
        position: absolute;
                z-index: 9;
                background-color: #f1f1f1;
                text-align: center;
                width:100px; 
                top:100px; 
				 left:200px; 
/* opacity: 0.5; */  /* To change transparent color*/ 
                }
/* end of traffic video */

/* Popup  window */
.popup {
  position: relative;
  display: inline-block;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* The actual popup */
.popup .popuptext {
  visibility: hidden;
  width: 300px;
  height: 60px;
  background-color: #555;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 0px 0;
  position: absolute;
  z-index: 1;
  bottom: 105%;
  left: 50%;
  margin-left: -80px;
}

/* Toggle this class - hide and show the popup */
.popup .show {
  visibility: visible;
  -webkit-animation: fadeIn 1s;
  animation: fadeIn 1s;
}

/*popup window  with video display */
#boxclose {
  float: right;
  cursor: pointer;
  color: #fff;
  border: 1px solid #AEAEAE;
  border-radius: 3px;
  background: #222222;
  font-size: 15px;
  font-weight: bold;
  display: inline-block;
  line-height: 0px;
  padding: 7px 3px;
  position: absolute;
  right: 2px;
  top: 2px;
  z-index: 1002;
  opacity: 0.9;
}

.boxclose:before {
  content: "×";
}

#fade:hover ~ #boxclose {
  display:none;
}

.test:hover ~ .test2 {
  display: none;
}
/* end of popup window with video display */

/*Right click Menu*/
#items{
	list-style:none;
	margin:0px;
	margin-top:2px;
	padding-left:3px;
	padding-right:5px;
	padding-bottom:3px;
	color: #ffffff;
}
		
#cntnr{
	display:none;
	position:fixed;
	border:1px solid #2D50AE;
	width:80px;       	  
	background: #202B53;
	box-shadow: 3px 3px 2px #202B53;
	border-radius:4px;
}
		
li{
	padding: 1px;
	padding-left:5px;
	color: #ffffff;
	/*font: 3px Roboto, Helvetica, sans-serif;*/
}
		
#items :hover{
	/*color: green; */
	background:orange;
	border-radius:2px;
}

/*Scroll div Menu*/
div.scrollev {
     /* width:790px; */
      overflow-y:auto;
	  overflow-x: auto;
      height:150px;
}
</style>

 <script> 
    // Popup  window  When the user clicks on div, open the popup
    function popupvideo() {
        //popup window
        var popup = document.getElementById("myPopup");
        popup.classList.toggle("show");
        
        //video in popup window
        var lightBoxVideo = document.getElementById("VisaChipCardVideo");
        lightBoxVideo.play();
    }
    // End of Popup  window 

// popup window with Video display
window.document.onkeydown = function(e) {
  if (!e) {
    e = event;
  }
  if (e.keyCode == 27) {
    lightbox_close();
  }
}

function lightbox_close() {
  var lightBoxVideo = document.getElementById("VisaChipCardVideo");
  lightBoxVideo.pause();
}
// End of popup window with video display  
   </script>
   
<script>
   	 $(document).bind("contextmenu",function(e){
    	  e.preventDefault();
    	  console.log(e.pageX + "," + e.pageY);
    	  $("#cntnr").css("left",e.pageX);
    	  $("#cntnr").css("top",e.pageY);
    	 // $("#cntnr").hide(100);        
    	  $("#cntnr").fadeIn(200,startFocusOut());      
    	});

    	function startFocusOut(){
    	  $(document).on("click",function(){
    	  $("#cntnr").hide();        
    	  $(document).off("click");
    	  });
    	}

    	$("#items > li").click(function(){
    	$("#op").text("You have selected "+$(this).text());
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

     <div id="panelTopDiv"  style="background-color: #202B53;">
    <h2t> Traffic Alert List </h2t> <br>
    </div>  
	  
	       <div id="panelRightDiv" class="esri-widget">
    
         <br> 
		 <br> 
		 <br> 
		<font style="font-size:18px;color:#ffffff">&nbsp;<b>Traffic Alerts</b></font>
		&nbsp; &nbsp; <hr>
		 
		 <!-- Right click  menu -->		
	    <div id='cntnr'>
              <ul id='items'>
                <li>
                  <table>
                      <tr> 
						<td><a href="createaccbase.jsp" target="_blank" style="text-decoration:none;"> <font style="color:#C8CFF4">True</font></a> </td>
					   </tr>
                    </table>
                </li>
                <li>
                  <table>
                      <tr> 
						<td><a href="#"  target="_self" style="text-decoration:none;"><font style="color:#C8CFF4">False</font></a> </td>
					   </tr>
                    </table>
                </li>
              </ul>
        </div>
		<!-- End of Right click  menu -->
		 
		 
		 
				<table width="100%">  	
				<tr><td>
				
				 <table width="98%" id="datatbl">
					<tr>
						<th width="10%"> <a href="#" ng-click="sortTypenv = 'startime'; sortReversenv = !sortReversenv"><font style="color:#ffffff">Status</font></a></th>
						<th width="15%"> <a href="#" ng-click="sortTypenv = 'endtime'; sortReversenv = !sortReversenv"><font style="color:#ffffff">Time</font></a></th>
						<th width="16%"> <a href="#" ng-click="sortTypenv = 'alarmid'; sortReversenv = !sortReversenv"><font style="color:#ffffff">Alert ID</font></a></th>
						<th width="14%"> <a href="#" ng-click="sortTypenv = 'desc'; sortReversenv = !sortReversenv"><font style="color:#ffffff">Road Name</font></a></th>
						<th width="7%"> <a href="#" ng-click="sortTypenv = 'status'; sortReversenv = !sortReversenv"><font style="color:#ffffff">From</font></a></th>
						<th width="4%"> <a href="#" ng-click="sortTypenv = 'status'; sortReversenv = !sortReversenv"><font style="color:#ffffff">To</font></a></th>
						<th width="8%"> <a href="#" ng-click="sortTypenv = 'status'; sortReversenv = !sortReversenv"><font style="color:#ffffff">Zone</font></a></th>
						<th width="17%"> <a href="#" ng-click="sortTypenv = 'status'; sortReversenv = !sortReversenv"><font style="color:#ffffff">Description</font></a></th>
						<th width="10%"> <a href="#" ng-click="sortTypenv = 'status'; sortReversenv = !sortReversenv"><font style="color:#ffffff">Source</font></a></th>
					</tr>
				</table> 
			</td></tr>
			<tr><td>
				<div class='scrollev'>
					<table  id="inctbl" width="100%">
						<tr ng-repeat="tralert in trafficalert | orderBy:sortTypenv:sortReversenv | filter:searchEnvifromgrid">
							<td width="10%"><font color="#ffffff" size="2px">{{tralert.status}}</font></td>
							<td width="15%"><font color="#ffffff" size="2px">{{tralert.time}}</font></td>
							<td width="16%"><font color="#ffffff" size="2px">{{tralert.alertid | uppercase}}</font></td>
							<td width="16%"><font color="#ffffff" size="2px">{{tralert.rname}}</font></td>
							<td width="5%"><font color="#ffffff" size="2px">{{tralert.from}}</font></td>
							<td width="5%"><font color="#ffffff" size="2px">{{tralert.to}}</font></td>
							<td width="7%"><font color="#ffffff" size="2px">{{tralert.zone}}</font></td>
							<td width="18%"><font color="#ffffff" size="2px">{{tralert.desc}}</font></td>
							<td width="12%"><font color="#ffffff" size="2px">{{tralert.source}}</font></td>
						</tr>
					</table> 
				</div>
			</td></tr>
			</table> 
			<br>
	<font style="font-size:18px;color:#ffffff">&nbsp;<b>Video</b></font>
		&nbsp; &nbsp; <hr>
		
		
		       <div class="popup" onclick="popupvideo()"> <font style="font-size:14px;color:#ffffff">&nbsp;Pre-Recorded Video of Traffic Alert. </font>
                    <div id="videodiv">
                     <span class="popuptext" id="myPopup">
                         
                            <video id="VisaChipCardVideo" width="300" controls>
                                  <source src="accvideo.mp4" type="video/mp4">
                          </video>
                        </div>       
                     </span>
            </div>  
			
			
		
      </div>  
	  
		</div>
		
		</div>
	</div>  
</body>
</html>