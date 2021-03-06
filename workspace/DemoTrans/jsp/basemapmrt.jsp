<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
    <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no">  
    <title>MRT Stations</title>  
    
    <!-- Map Css -->
    <link rel="stylesheet" href="https://js.arcgis.com/3.28/dijit/themes/claro/claro.css">
    <link rel="stylesheet" href="https://js.arcgis.com/3.28/esri/css/esri.css">
    <link rel="stylesheet" href="mrtmap.css">
    <!-- Map Css -->
	
	<link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="mrtinc.css"> 
	<link rel="stylesheet" href="checkboxstyle.css">
	 
	<!-- start plus and minu menu  script -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<!-- End plus and minu menu  script -->
 
 <!-- local map -->
   <link rel="stylesheet" href="http://localhost:8080/gis/3.28/dijit/themes/claro/claro.css">
  <link rel="stylesheet" href="http://localhost:8080/gis/3.28/esri/css/esri.css">
 <!-- end of local map -->
 
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
		background-color: #202B53;
		color: #C8CFF4; 
		font-size: 15px;
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
	

	#mrtlinediv {
		  top: 200px;
		  left: 500px;
		  position: absolute;
		  z-index: 9;
		  border: solid 0px;
		  background-color:none;
		  width: 530px;
		  height: 550px;
		  border-radius: 13px;
		  text-align: center;
		}
h3 {
  color: #C8CFF4;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 16px;
  margin-left: 15px;
}
h4 {
  color: #C8CFF4;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 20px;
  margin-left: 15px;
}
h5 {
  color: #C8CFF4;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 12px;
  margin-left: 15px;
}

.contentlabel {
	margin-left: 15px;
}
 
#map_root {
    height: 620px !important;
}

  </style> 
   
   

  <script src="http://localhost:8080/gis/3.28/init.js"></script>

  <script>
    require([
      "esri/map", 
      "esri/layers/WMTSLayer", 
      "esri/layers/WMTSLayerInfo",
      "esri/geometry/Extent", 
      "esri/layers/TileInfo", 
      "esri/SpatialReference",
      "dojo/parser",
      "dijit/layout/BorderContainer", 
      "dijit/layout/ContentPane", 
      "dojo/domReady!"
    ], function(
        Map, WMTSLayer, WMTSLayerInfo,
        Extent, TileInfo, SpatialReference,
        parser
      ) {
      parser.parse();

      var map = new Map("map", {
        center: [47.075,-52.93],
        zoom: 11
      });

      var tileInfo = new TileInfo({
        "dpi": 96,
        "format": "format/png",
        "compressionQuality": 0,
        "spatialReference": new SpatialReference({
          "wkid": 4326
        }),
        "rows": 512,
        "cols": 512,
        "origin": {
          "x": -180,
          "y": 90
        },
        "lods": [{
          "level": "0",
          "scale": 236663484.36365247,
          "resolution": 0.5624999999999999
          }, {
          "level": "1",
          "scale": 118331742.18182631,
          "resolution": 0.28125000000000017
          }, {
          "level": "2",
          "scale": 59165871.090913124,
          "resolution": 0.140625
          }, {
          "level": "3",
          "scale": 29582935.545456562,
          "resolution": 0.0703125
          }, {
          "level": "4",
          "scale": 14791467.772728289,
          "resolution": 0.03515625000000002
          }, {
          "level": "5",
          "scale": 395733.8863641415,
          "resolution": 0.017578125000000003
          }, {
          "level": "6",
          "scale": 3697866.94318207,
          "resolution": 0.008789062499999998
          }, {
          "level": "7",
          "scale": 1848933.471591035,
          "resolution": 0.004394531249999999
          }, {
          "level": "8",
          "scale": 924466.7357955176,
          "resolution": 0.002197265625
          }, {
          "level": "9",
          "scale": 462233.3678977588,
          "resolution": 0.0010986328125
          }, {
          "level": "10",
          "scale": 231116.6839488794,
          "resolution": 0.00054931640625
          }, {
          "level": "11",
          "scale": 115558.3419744397,
          "resolution": 0.000274658203125
          }]
      });
      var tileExtent = new Extent(-180, -90, 180, 90, new SpatialReference({
        wkid: 4326
      }));

      var layerInfo = new WMTSLayerInfo({
        tileInfo: tileInfo,
        fullExtent: tileExtent,
        initialExtent: tileExtent,
        identifier: "osm-bright",
        //identifier: "klokantech-basic",
        tileMatrixSet: "1x",
        format: "png",
        style: "default"
      });

      var resourceInfo = {
        version: "1.0.0",
        layerInfos: [layerInfo],
        copyright: "earthdata"
      };

      var options = {
        serviceMode: "KVP",
        resourceInfo: resourceInfo,
        layerInfo: layerInfo
      };

      wmtsLayer = new WMTSLayer("http://192.168.99.100:32770/services/wmts/1.0.0/", options);
      map.addLayer(wmtsLayer);
    });
  </script>

 
 	<script src="bootstrap.min.js"></script>
  	<script src="jquery.js"></script>
	<script src="angular.min.js"></script>
  	<script src="democontroller.js"></script>  

    <!-- Map JS -->
 <!--   <script src="http://js.arcgis.com/3.28/"></script>  
    <script src="mrtmap.js"></script>   -->
    <!-- Map JS -->
	
	 <!-- Plus and minu menu  script -->	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	 <!-- end plus and minu menu  script -->	

</head>  
<body>  
<div ng-app="ltaApp" ng-controller="ltaController">
    <div ng-show="mrtincflag">
	<div id="mapDiv1">
	<img src="roadmap.jpg" width="100%;" height="1000px;"/>
	<!-- <div class="container-fuide">
	<div class="bs-example">   -->
		<div id="mrtlinediv">    
		 
			<table   width="100%;" class="mrtinctable"> 
				<tr>
					<td colspan="2"> <h4>MRT Service Disruption  </h4> </td>
				</tr>
				<tr>
					<td  colspan="2">
						<h5>Create a MRT Service Disruption IR. Start By defining a start point and end point.</h5>
					</td>
				</tr>
				<tr>
					<td align="right">
						<h3>MRT / LRT Line</h3> 
					</td>
					<td align="right">
						<h3>Both Direction: </h3>
					</td>						
				</tr>
				
				<tr>
					<td>
					
						 <select ng-model="direction" class="selectcls" ng-change="mrtlinesel()" ng-options="o as o for o in stations">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
    					 </select>
    					 <div ng-show="hidetextbox">
    					 	<input type="text" name="directionid" id="directionid" ng-model="directionid" >
    					 </div> 
					</td>
					<td>
					   <label class="contentlabel" style="font-size:17px;">
						  <input type="checkbox" ng-model="bothdir">
						  <span class="checkmark"></span>
						</label>
					</td>
				</tr>
				<tr>
					<td>
						<h3>Start Station</h3>
					</td>
					<td>
						<h3>End Station</h3>
					</td>					
				</tr>
				<tr>
					<td>
					
					 <select ng-model="startstation" class="selectcls" ng-change="mrtssel()"  ng-options="o as o for o in mrtline">
							<option value=""  selected="selected" hidden="hidden">Choose here</option>
    				 </select>
					</td>
					<td>
					 <select ng-model="endstation" class="selectcls" ng-change="mrtesel()"  ng-options="o as o for o in mrtlinend">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
    				 </select>

					</td>
					
				</tr>
				<tr>
				<td> 
					<br>
					<div id="createdir" align="right">
						<a href="#" class="buttonCreateMrtInc"  ng-click="createmrtinc()" style="text-decoration:none;"> CREATE </a>
					</div>
				</td> 
				<td> 
					<br>
					<button type="button" class="buttonCan"  id="buttonCan" onclick="myFunction()">CANCEL</button>	&nbsp;&nbsp;&nbsp;				 
				</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;&nbsp;</td>
				</tr>
	 	 </table>  
	<!--	</div>
    
    </div>  -->
</div> 
</div>

</div>

<div ng-show="mrtinccreateflag">
<div class="container-fuide">
			<table  width="100%;" style="background-color: #202B53;" align="left">
			<tr>
				<td colspan="2" height="20%" >
					<h2t> MRT Service Disruption &nbsp;&nbsp; {{mrtsselected}} to {{mrteselected}}</h2t>
				</td>
			</tr>
			<tr>
				<td  width="60%;"  height="100% !important;" >
				   
				 <div width="60%;"  height="100%">
					  <div id="map">       
					  
					  </div>   
				 </div>
				</td>
				<td  width="40%;"  height="95% !important;" valign="top">
				<!-- Start Creation option-->
				<table width="100%" id="incdetailtbl">
						<tr>
							<td><h3a>&nbsp;CREATE </h3a></td>
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
						  &nbsp;&nbsp;<select ng-model="mrtStatus" style="font-size: 15px; height: 25px; ">
								<option ng-repeat="option in mrtStatusList" value="{{option.mrtstaid}}">{{option.name}}</option>
							</select>
					  </td>
					  <td> Source <br>
						  &nbsp;&nbsp;<select ng-model="mrtSource">
						  <option ng-repeat="option1 in mrtSourceList" value="{{option1.mrtsouid}}">{{option1.name}}</option>
							</select>
					  </td>
					</tr>
					<tr>
					  <td>
					   Start Time:	<br>				
								&nbsp;&nbsp;<input type="text" placeholder="Start Time"  ng-model="irstarttime"/>
					  </td>
					  <td>
					<!-- 	End Time: <br>
								&nbsp;&nbsp;<input type="text"  placeholder="End Time"  ng-model="irendtime"/>  -->		
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
										 <option value=""  selected="selected"></option>
									 </select>  
								</td>
								<td >
									Both Direction:	 <br>										
									<label class="contentlabel">
									  <input type="checkbox" ng-model="bothdir">
									  <span class="checkmark"></span>
									</label>
								</td>
							</tr>				
							<tr>
									<td>
									Start Station: <br>
								 <select ng-model="startstation" class="selectcls" ng-options="o as o for o in mrtline" ng-change="setStartStation()">
									 <option value=""  selected="selected"></option>
								 </select>
								</td>
								<td >
									End Station: <br>
								 <select ng-model="endstation" class="selectcls" ng-options="o as o for o in mrtlinend"  ng-change="setendStation()">
									<option value=""  selected="selected"></option>
								 </select>
								</td>					
							</tr>
						</table>
							</div>
						</div>
					 </div>
					 
				<!--  		<div class="panel panel-default">
						<div class="panel-heading active">
							<h4 class="panel-title">
								  <span data-target="#Collapseicon3" data-toggle="collapse" data-parent="#accordion2"> </span>
							</h4>
						</div>
						
						<div class="panel-collapse collapse in" id="Collapseicon3">
							<div class="panel-body">
								<table width="50%">
									<tr>
									  <td>          
										<label class="contentlabel"> Simulated 
										  <input type="checkbox" ng-model="mrtsimu">
										  <span class="checkmark" size=""></span>
										</label>
										</td>
										<td>
										<label class="contentlabel"> Important 
										  <input type="checkbox" ng-model="mrtimpo">
										  <span class="checkmark"></span>
										</label>
									   </td>
									   </tr>
									   <tr>
									  <td>
										 <label class="contentlabel" > VRS 
										  <input type="checkbox" ng-model="mrtvrs">
										  <span class="checkmark"></span>
										</label>
										</td>
										<td>
										<label class="contentlabel"> LTM
										  <input type="checkbox"  ng-model="mrtltm">
										  <span class="checkmark"></span>
										</label>
									  </td>
									</tr>      
									</table>  
							</div>
						</div>
					 </div> -->
					 
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
									 <font style="color:#7CFC00 "><input type="text" style="width:350.81px;" placeholder="Alert" ng-model="mrtincalrmalert">  </font>
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
					<div id="createdir1">
				<a href="#" class="buttonCreateMrtInc"  ng-click="addmrtincident()" style="text-decoration:none;"> CREATE </a> &nbsp;&nbsp;
				</div>
				<!-- <a href="#popup" class="button1a" id="button1a"  ng-click="showincidentlist()"> Close</a>  -->
				</div> </td>
				</tr>
			</table> 	
				
				<!--******** end of Create option -->
				</td>
			</tr>	
		</table>

 </div>
</div>
	</div>
</body>  
</html> 