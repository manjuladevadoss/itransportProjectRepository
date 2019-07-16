<html>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="initial-scale=1,maximum-scale=1,user-scalable=no"
    />
    <title> Incident Creation </title>
  	<link rel="stylesheet" href="http://localhost:8080/itrans/arcgis_4.11/esri/themes/light/main.css" />
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
		  font: 14px/16px Roboto, Helvetica, sans-serif;
		
		}
		
		#items :hover{
		  /*color: green; */
		  background:orange;
		  border-radius:2px;
		}
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
	    	var strpage3 = "/itrans/bisheader.jsp";
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
  <body>
    <div id="viewDiv"> </div>
                <div id='cntnr'>
              <ul id='items'>
                <li>
                  <table>
                      <tr> 
						<td><img src="accident.png" width="28" height = "28"> </td>
						<td><a href="createaccbase.jsp" target="_blank" style="text-decoration:none;"><font style="color:#C8CFF4">Accident</font></a> </td>
					   </tr>
                    </table>
                </li>
                <li>
                  <table>
                      <tr> 
						<td><img src="obstacle.png" width="30" height = "30"> </td>
						<td><a href="#" style="text-decoration:none;"><font style="color:#C8CFF4">Obstacle</font></a> </td>
					   </tr>
                    </table>
                </li>
                <li>
                    <table>
                      <tr> 
						<td><img src="roadwork.png" width="30" height = "30"> </td>
						<td><a href="createmrwbase.jsp" target="_blank" style="text-decoration:none;"><font style="color:#C8CFF4">Road Works</font></a> </td>
					   </tr>
                    </table>
                </li>  
                <li>
                    <table>
                      <tr> 
						<td><img src="heavytraffic.png" width="30" height = "30"> </td>
						<td><a href="#" style="text-decoration:none;"><font style="color:#C8CFF4">Heavy Traffic</font></a> </td>
					   </tr>
                    </table>
                </li>  
                <li>              
	                <table>
	                      <tr> 
							<td><img src="mobileroadwork.png" width="30" height = "30"> </td>
							<td><a href="createmrwbase.jsp" target="_blank" style="text-decoration:none;"><font style="color:#C8CFF4"> Mobile Road Works</font></a> </td>
						   </tr>
	                </table>
                </li>  
                <li>
                    <table>
                      <tr> 
						<td><img src="mrtimage1.png" width="30" height = "30"> </td>
						<td><a href="createmrtbase.jsp" target="_blank" style="text-decoration:none;"><font style="color:#C8CFF4">MRT Break Down</font></a> </td>
					   </tr>
                    </table>
                </li>  
                <li>
                	<table>
                      <tr> 
						<td><img src="unattvehicle.png" width="30" height = "30"> </td>
						<td><a href="#" style="text-decoration:none;"><font style="color:#C8CFF4">Unattended Vehicle</font></a> </td>
					   </tr>
                    </table>
                </li>  
                <li>
                	<table>
                      <tr> 
						<td><img src="misce.png" width="28" height = "28"> </td>
						<td><a href="#" style="text-decoration:none;"><font style="color:#C8CFF4">Miscellaneous</font></a> </td>
					   </tr>
                    </table>
               </li>  
              </ul>
            </div>

					
  </body>
</html>