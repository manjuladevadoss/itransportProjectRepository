<html>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="initial-scale=1,maximum-scale=1,user-scalable=no"
    />
	<!-- <meta http-equiv="refresh" content="160" />  -->
    <title> Incident Creation </title>
    <link rel="shortcut icon" href="/Sopra_Steria_logo.ico" type="image/x-icon">
	  <link rel="stylesheet" href="http://localhost:8080/itrans/arcgis_4.11/esri/themes/light/main.css" />
	  <link rel="stylesheet" href="http://localhost:8080/itrans/arcgis_4.11/esri/css/main.css">
  	 <script type="text/javascript" src="jquery.js"></script>
    <style>
      html,
      body,
      #viewDiv {
        padding: 0;
        margin: 0;
        height: 100%;
        width: 100%;
	  }
	  
	  #instruction {
        z-index: 99;
        position: absolute;
        top: 80px;
        left: 10%;
        padding: 5px;
        margin-left: -175px;
        height: 20px;
        width: 350px;
	  }
	  .esri-layer-list {
        width: 310px;
	  }
	  .irresetbutton {
  color: #C8CFF4;
  font-family:  Roboto, Helvetica, sans-serif;
  font-size: 10px;
  box-shadow: 2px 2px 8px 0 rgba(0,0,0,0.5);
  border-radius: 5px;
  background-color:#356D85;
  border: solid 0px #356D85;
  width:60px;
  height:20px
}
        #items{
		  list-style:none;
		  margin:0px;
		  margin-top:2px;
		  padding-left:3px;
		  padding-right:5px;
		  padding-bottom:3px;
		}
		
		#cntnr{
		  display:none;
		  position:fixed;
		  border:1px solid #202B53;
		  width:210px;       
		  
		  background: #202B53;
		  box-shadow: 3px 3px 2px #202B53;
		  border-radius:4px;
		}
		
		li{
		  padding: 3px;
		  padding-left:10px;
		  font: 10px/12px Roboto, Helvetica, sans-serif;
		
		}
		
		#items :hover{
		  /*color: green; */
		  background:orange;
		  border-radius:2px;
		}
		
/* Start of map info template */				
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
/* End of map info template */		
    </style>

	<script src="http://localhost:8080/itrans/arcgis_4.11/init.js"></script>  
	<script src="basemap411irselect.js"></script>   
    <script>
    function bisMainWindow() {
      var windowObjectReference2;  
      var protocol = window.location.protocol;
      var domain = window.location.hostname;
      var port = window.location.port
      var c =":";
      var s = "//"
     if(windowObjectReference2 == null || windowObjectReference2.closed) {
	    	var strpage3 = "/itrans/bischartline.html";
		    var value3 = protocol.concat(s,domain,c,port,strpage3);
		    //alert("bis url " + value3);
		    windowObjectReference2 = window.open(
		    	  value3,			
		  	      "bis",
		  	      "top=100,left=100,width=520,height=430,resizable,scrollbars,status,toolbar=true,menubar=true");
		  }else {
				windowObjectReference2.focus();
    	}
    }
    window.onload = bisMainWindow;
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
  <body  >
		<div class="container-fluid">
		<div ng-app="ltaApp" ng-controller="ltaController">	  
		<div id="main" class claro>
	<div id="viewDiv"> 
	<button class="irresetbutton" id="draw-rectangle"> PolyLine </button>
	<button class="irresetbutton" id="reset"> Reset </button>   
	</div>
            <div id='cntnr'>
              <ul id='items'>
                <li>
                  <table>
                      <tr> 
						<td><img src="accident.png" width="25" height = "25"> </td>
						<td><a href="createaccbase.jsp" target="_blank" style="text-decoration:none;"><font style="color:#C8CFF4">Accident</font></a> </td>
					   </tr>
                    </table>
                </li>
                <li>
                  <table>
                      <tr> 
						<td><img src="obstacle.png" width="25" height = "25"> </td>
						<td><a href="#" style="text-decoration:none;"><font style="color:#C8CFF4">Obstacle</font></a> </td>
					   </tr>
                    </table>
                </li>
                <li>
                    <table>
                      <tr> 
						<td><img src="roadwork.png" width="25" height = "25"> </td>
						<td>
							<!--<a ng-href="{{mrwCreate()}}" ng_click = "mrwCreate();" style="text-decoration:none;"><font style="color:#C8CFF4">Road Works</font></a> <br> -->
							 <a href="createmrwbase.jsp"  target="_blank" style="text-decoration:none;"><font style="color:#C8CFF4">Road Work</font></a>
							
						</td>
					   </tr>
                    </table>
                </li>  
                <li>
                    <table>
                      <tr> 
						<td><img src="heavytraffic.png" width="28" height = "25"> </td>
						<td><a href="#" style="text-decoration:none;"><font style="color:#C8CFF4">Heavy Traffic</font></a> </td>
					   </tr>
                    </table>
                </li>  
                <li>              
	                <table>
	                      <tr> 
							<td><img src="mobileroadwork.png" width="25" height = "25"> </td>
							<td>
								<!--  <a href="javascript:mrwCreate()"  ng_click = "mrwCreate();" style="text-decoration:none;"><font style="color:#C8CFF4">Mobile Road Works</font></a>  -->
								<a href="createmrwbase.jsp"  target="_blank" style="text-decoration:none;"><font style="color:#C8CFF4">Mobile Road Works</font></a> 
							</td>
						   </tr>
	                </table>
                </li>  
                <li>
                    <table>
                      <tr> 
						<td><img src="mrtimage1.png" width="25" height = "25"> </td>
						<td><a href="createmrtbase.jsp" target="_blank" style="text-decoration:none;"><font style="color:#C8CFF4">MRT Break Down</font></a> </td>
					   </tr>
                    </table>
                </li>  
                <li>
                	<table>
                      <tr> 
						<td><img src="unattvehicle.png" width="25" height = "25"> </td>
						<td><a href="#" style="text-decoration:none;"><font style="color:#C8CFF4">Unattended Vehicle</font></a> </td>
					   </tr>
                    </table>
                </li>  
                <li>
                	<table>
                      <tr> 
						<td><img src="misce.png" width="23" height = "25"> </td>
						<td><a href="#" style="text-decoration:none;"><font style="color:#C8CFF4">Miscellaneous</font></a> </td>
					   </tr>
                    </table>
               </li>  
              </ul>
			</div>	
			</div>	
		</div>	
	</div>				
  </body>
</html>