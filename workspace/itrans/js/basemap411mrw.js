
      var map, view;

      require([
        "esri/Map",
        "esri/views/MapView","esri/Graphic", 
        "esri/layers/WMTSLayer","esri/geometry/Extent", 
        "esri/widgets/LayerList", "esri/views/draw/Draw",
		'esri/layers/WMSLayer',
		"esri/views/MapView",
		"esri/layers/BaseDynamicLayer",
		"esri/geometry/geometryEngine"
      ], function(Map, MapView,Graphic, WMTSLayer,Extent, LayerList, Draw, WMSLayer, MapView, BaseDynamicLayer,geometryEngine) {
        layer = 
          new WMTSLayer({
          url: "http://192.168.99.100:32769/services/wmts?service",
          activeLayer: {
            id: "osm-bright"
          },
          version: "1.0.0",
          tileMatrixSet: "2x",
          format: "png",
          style: "default",
          serviceMode: "KVP"
        });
        
   
        var CustomWMSLayer = BaseDynamicLayer.createSubclass({
          properties: {
            mapUrl: null,
            mapParameters: null
          },

          // Override the getImageUrl() method to generate URL
          // to an image for a given extent, width, and height.
          getImageUrl: function(extent, width, height) {
            var urlVariables = this._prepareQuery(
              this.mapParameters,
              extent,
              width,
              height
            );
            var queryString = this._joinUrlVariables(urlVariables);
            return this.mapUrl + "?" + queryString;
          },

          // Prepare query parameters for the URL to an image to be generated
          _prepareQuery: function(queryParameters, extent, width, height) {
            var wkid = extent.spatialReference.isWebMercator
              ? 3857
              : extent.spatialReference.wkid;
            var replacers = {
              width: width,
              height: height,
              wkid: wkid,
              xmin: extent.xmin,
              xmax: extent.xmax,
              ymin: extent.ymin,
              ymax: extent.ymax
            };

            var urlVariables = this._replace({}, queryParameters, replacers);
            return urlVariables;
          },

          // replace the url variables with the application provided values
          _replace: function(urlVariables, queryParameters, replacers) {
            Object.keys(queryParameters).forEach(function(key) {
              urlVariables[key] = Object.keys(replacers).reduce(function(
                previous,
                replacerKey
              ) {
                return previous.replace(
                  "{" + replacerKey + "}",
                  replacers[replacerKey]
                );
              },
              queryParameters[key]);
            });

            return urlVariables;
          },

          // join the url parameters
          _joinUrlVariables: function(urlVariables) {
            return Object.keys(urlVariables).reduce(function(previous, key) {
              return (
                previous + (previous ? "&" : "") + key + "=" + urlVariables[key]
              );
            }, "");
          }
        });
        // *******************************************************
        // end of custom dynamic layer
        // *******************************************************

		var cctvLayer = new CustomWMSLayer({
          mapUrl: "http://10.180.8.110:8088/geoserver/singaporedb/wms",
          mapParameters: {
            SERVICE: "WMS",
            REQUEST: "GetMap",
            FORMAT: "image/png",
            TRANSPARENT: "TRUE",
            STYLES: "gis_ptz_attr_style",
            VERSION: "1.3.0",
		  LAYERS: "gis_ptz_attr",
            WIDTH: "{width}",
            HEIGHT: "{height}",
            CRS: "EPSG:{wkid}",
            BBOX: "{xmin},{ymin},{xmax},{ymax}"
          },

          title: "CCTV"
        });	
		var vmsLayer = new CustomWMSLayer({
          mapUrl: "http://10.180.8.110:8088/geoserver/singaporedb/wms",
          mapParameters: {
            SERVICE: "WMS",
            REQUEST: "GetMap",
            FORMAT: "image/png",
            TRANSPARENT: "TRUE",
            STYLES: "",
            VERSION: "1.3.0",
            LAYERS: "vms",
            WIDTH: "{width}",
            HEIGHT: "{height}",
            CRS: "EPSG:{wkid}",
            BBOX: "{xmin},{ymin},{xmax},{ymax}"
          },

          title: "VMS"
        });	
		
		var glideLayer = new CustomWMSLayer({
	          mapUrl: "http://10.180.8.110:8088/geoserver/singaporedb/wms",
	          mapParameters: {
	            SERVICE: "WMS",
	            REQUEST: "GetMap",
	            FORMAT: "image/png",
	            TRANSPARENT: "TRUE",
	            STYLES: "",
	            VERSION: "1.3.0",
	            LAYERS: "gis_glide_site",
	            WIDTH: "{width}",
	            HEIGHT: "{height}",
	            CRS: "EPSG:{wkid}",
	            BBOX: "{xmin},{ymin},{xmax},{ymax}"
	          },
	          title: "Glide"
	        });
		
		var detectCamera = new CustomWMSLayer({
	          mapUrl: "http://10.180.8.110:8088/geoserver/singaporedb/wms",
	          mapParameters: {
	            SERVICE: "WMS",
	            REQUEST: "GetMap",
	            FORMAT: "image/png",
	            TRANSPARENT: "TRUE",
	            STYLES: "gis_detectcam_style",
	            VERSION: "1.3.0",
	            LAYERS: "detcam_group",
	            WIDTH: "{width}",
	            HEIGHT: "{height}",
	            CRS: "EPSG:{wkid}",
	            BBOX: "{xmin},{ymin},{xmax},{ymax}"
	          },

	          title: "DCam"
	        });
		
		// Speed Link Layer way layer
		var speedLinkLayer = new CustomWMSLayer({
          mapUrl: "http://10.180.8.110:8088/geoserver/singaporedb/wms",
          mapParameters: {
            SERVICE: "WMS",
            REQUEST: "GetMap",
            FORMAT: "image/png",
            TRANSPARENT: "TRUE",
            STYLES: "gis_speedlink_style",
            VERSION: "1.3.0",
            LAYERS: "gis_speedlink",
            WIDTH: "{width}",
            HEIGHT: "{height}",
            CRS: "EPSG:{wkid}",
            BBOX: "{xmin},{ymin},{xmax},{ymax}"
          },
          title: "TSpeed"
		});
		
		// Webcamera Layer 	
		var webCamera = new CustomWMSLayer({
			mapUrl: "http://10.180.8.110:8088/geoserver/singaporedb/wms",
			mapParameters: {
			  SERVICE: "WMS",
			  REQUEST: "GetMap",
			  FORMAT: "image/png",
			  TRANSPARENT: "TRUE",
			  STYLES: "gis_webcam_style",
			  VERSION: "1.3.0",
			  LAYERS: "gisdbo_gis_webcam",//
			  WIDTH: "{width}",
			  HEIGHT: "{height}",
			  CRS: "EPSG:{wkid}",
			  BBOX: "{xmin},{ymin},{xmax},{ymax}"
			},
			title: "WCam"
		  }); 
		
		/*** Onload Mobile road work road display*/	
		var mrwLaneLayer = new CustomWMSLayer({
			mapUrl: "http://10.180.8.110:8088/geoserver/singaporedb/wms",
			mapParameters: {
			  SERVICE: "WMS",
			  REQUEST: "GetMap",
			  FORMAT: "image/png",
			  TRANSPARENT: "TRUE",
			  STYLES: "mrw_road_line_style",
			  VERSION: "1.3.0",
			  LAYERS: "gisdbo_gis_carriageway",
			  WIDTH: "{width}",
			  HEIGHT: "{height}",
			  CRS: "EPSG:{wkid}",
			  BBOX: "{xmin},{ymin},{xmax},{ymax}"
			},
			title: "RoadworkLane"
		  });
		
		cctvLayer.visible = false;
		vmsLayer.visible = false;
		glideLayer.visible = false;
		cctvLayer.visible = false;
		detectCamera.visible = false;
		speedLinkLayer.visible = false;
		mrwLaneLayer.visible = false;
		webCamera.visible = false;
		//layer.visible = true;
		map = new Map({
          //center: [103.84347,1.32858],
		   basemap: {
            baseLayers: [layer,mrwLaneLayer,speedLinkLayer]
          },
          layers: [vmsLayer,detectCamera,webCamera,cctvLayer,glideLayer]
        });
	
        view = new MapView({
          container: "viewDiv",
          map: map,
         // center: [103.836862, 1.329735],
		 center: [103.925745, 1.309649],
		  zoom: 12      
        });
	   
        // To draw a line
        draw = new Draw({
		  view: view
        });
        
        /* Start draw line function */
        document.getElementById("draw_line").onclick = function() {
			drawline();
            /*action = draw.create("polyline");
            view.focus();
            action.on(
              [
                "vertex-add",
                "vertex-remove",
                "cursor-update",
                "redo",
                "undo",
                "draw-complete"
              ],
              createGraphic
            );*/
        }
      /*  function createGraphic(event) {
             vertices = event.vertices;
             graphic = new Graphic({
              geometry: {
                type: "polyline",
                paths: vertices,
                spatialReference: view.spatialReference
              },
              symbol: {
                type: "simple-line", // autocasts as new SimpleFillSymbol
                color: [237, 28, 36],
                width: 0.5,
              }
            });
            view.graphics.add(graphic);
          }*/

//*** Start the start and end point - draw a graphcis point points to  road name


// add the button for the draw tool on the map left side
view.ui.add("draw-point", "top-left");
view.ui.add("draw_line", "top-left");
		
//draw single point on mouse click on the map
document.getElementById("draw-point").onclick = function() {
	enableCreatePoint(draw, view);
  };

  function enableCreatePoint(draw, view) {
	var action = draw.create("point");
	// PointDrawAction.draw-complete
	// Create a point when user clicks on the view or presses "C" key.

	action.on("draw-complete", function(evt) {
	  createPointGraphic(evt.coordinates);
	  
	});
  }

  function createPointGraphic(coordinates) {

	// view.graphics.removeAll();
	var point = {
	  type: "point", // autocasts as /Point
	  x: coordinates[0],
	  y: coordinates[1],
	  spatialReference: view.spatialReference
	};

	var graphic = new Graphic({
	  geometry: point,
	  symbol: {
		type: "simple-marker", // autocasts as SimpleMarkerSymbol
		style: "circle",
		color: "blue",
		size: "16px",
		xoffset: 4,
		yoffset: 10,
		outline: {
		  // autocasts as SimpleLineSymbol
		  color: [255, 255, 0],
		  width: 2
		}
	  }
	});
	
	view.graphics.add(graphic);
	updateRoadName();
  }  
//*** end of  Start the start and end point - draw a graphcis point  points to  road name*/
//end of start and end point icon dipsplay

//update road name startpoint and end point using 
var erd;
function updateRoadName(p) {
	document.getElementById("sroadname").value = "Singlap Road" ;
	erd = setInterval(updateEroad,6000);
}
function updateEroad() {
	document.getElementById("eroadname").value = "Mountabtten Rd" ;
	clearInterval(erd);

}


/*** Remove particular vms message */
     document.getElementById("mrwvmsMsgRemoved").onclick = function() { 
		view.graphics.removeAll();
		clearFinalInterval();
		clearMovingFinalInterval();
		vmsIdDisplay();
	 }
/**** End of Remove particular vms message */  
//Onload   
vmsIdDisplay();
/*** VMS message, id, langi and lati details **/
// Start VMS image on load
function vmsIdDisplay() {
	var details = document.getElementsByName("mrwvmsmsgt");
	var geometrypoints = document.getElementsByName("mrwlatilong");
	for(i=0;i<details.length;i++) {
		var idvms = details[i].value;
	//	alert("idvms : " + idvms);
		var selemsg = details[i].value;
		var sepIndex = selemsg.indexOf("$");
		var mrwvmsMsg = selemsg.substring(0, sepIndex);
		var mrwvmsEqipId = selemsg.substring(sepIndex+1, selemsg.length);

		var longilati = geometrypoints[i].value;
		var sepIndexLoLa = longilati.indexOf("$");
		var mrwlogi = longilati.substring(0, sepIndexLoLa);
		var mrwloti = longilati.substring(sepIndexLoLa+1, longilati.length);
		//alert("mrwlogi : " + mrwlogi + "  mrwloti" + mrwloti);
		var vmspoint1 = {
			type: "point", // autocasts as new Point()                   			 
			longitude: mrwlogi,
			latitude: mrwloti
		}; 
		var mrwvehPictureSymbol1 = {
			  type: "picture-marker",
			  url: "rvm_img.JPG",
			  width: "25",
			  height: "13"
		}			   
		var vmspictureGraphicVmsImage = new Graphic({
			geometry: vmspoint1,
			symbol: mrwvehPictureSymbol1,
			popupTemplate: {
				title: mrwvmsEqipId,
				 content: mrwvmsMsg                   	  
			}
		});
		view.graphics.addMany([vmspictureGraphicVmsImage]);   	// print only vms image	
	}
}
/*** end of vms image on load **/

/*** Start VMS message on the map using interval after create the road work **/
var interval1, interval2, interval3, interval4, interval5, interval6;
var vmspictureGraphicVmsText;

document.getElementById("mrwVmsImp").onclick = function() {
	//Draw auto line on the rood
	view.graphics.removeAll();  
	drawline();
	vmsIdDisplay();
	//VMS message display based on the moving icon

	//vms text message on the map based on the timing
	interval1 = setInterval(vmsMessageDispaly1, 3000);	
	interval2 = setInterval(vmsMessageDispaly2, 11000);	
	interval3 = setInterval(vmsMessageDispaly3, 22000);	
	interval4 = setInterval(vmsMessageDispaly4, 29000);	
	interval5 = setInterval(vmsMessageDispaly5, 39000);	
	clrinterval = setInterval(clearFinalInterval, 43000); 	
	
	//Moving Icon Display
	movingIconDisplay();	
}



	function vmsMessageDispaly1(){ 		
		//displayVmsMessage(0);
		displayVmsMessage(vmsMsgdata1);
	}

	function vmsMessageDispaly2(){
		clearInterval(interval1); 		
		displayVmsMessage(vmsMsgdata2);	
	} 
	
	function vmsMessageDispaly3(){
		clearInterval(interval2); 
		displayVmsMessage(vmsMsgdata3);
	}
	function vmsMessageDispaly4(){
		clearInterval(interval3); 
		displayVmsMessage(vmsMsgdata4);
	}
	function vmsMessageDispaly5(){
		clearInterval(interval4); 
		displayVmsMessage(vmsMsgdata5);
	}


	function clearFinalInterval(){
		clearInterval(interval1); 		
		clearInterval(interval2); 
		clearInterval(interval3); 
		clearInterval(interval4);
		clearInterval(interval5);
		clearInterval(clrinterval);
		removeVmsMessage();
		//displayVmsMessage(vmsMsgdata3);
	}
/** end of vms message on the map **/

	//vms point 
/*	var vmsMsgdata = [
		{"logi": "103.92464", "lati": "1.3113622", "vmsmsg": "Litter Picking long Ln1"},
		{"logi": "103.9094703", "lati": "1.3082692", "vmsmsg": "Litter Picking long Ln1"},
		{"logi": "103.9019901","lati": "1.3039255", "vmsmsg": "Litter Picking long Ln1"},
		{"logi": "103.8895556","lati": "1.3002632", "vmsmsg": "Litter Picking long Ln1"}
	];
*/
	var vmsMsgdata1 = [
		{"logi": "103.92464", "lati": "1.3113622", "vmsmsg": "Litter Picking long Ln1"},
		{"logi": "103.9094703", "lati": "1.3082692", "vmsmsg": "Litter Picking long Ln1"}
	];
	
	var vmsMsgdata2 = [
		{"logi": "103.92464", "lati": "1.3113622", "vmsmsg": "Litter Picking long Ln1"},
		{"logi": "103.9094703", "lati": "1.3082692", "vmsmsg": "Litter Picking long Ln1"},
		{"logi": "103.9019901","lati": "1.3039255", "vmsmsg": "Litter Picking long Ln1"},
	];

	var vmsMsgdata3 = [
		{"logi": "103.92464", "lati": "1.3113622", "vmsmsg": "Litter Picking long Ln1"},
		{"logi": "103.9094703", "lati": "1.3082692", "vmsmsg": "Litter Picking long Ln1"},
		{"logi": "103.9019901","lati": "1.3039255", "vmsmsg": "Litter Picking long Ln1"},
		{"logi": "103.8895556","lati": "1.3002632", "vmsmsg": "Litter Picking long Ln1"}
	];

	var vmsMsgdata4 = [
		
		{"logi": "103.9094703", "lati": "1.3082692", "vmsmsg": "Litter Picking long Ln1"},
		{"logi": "103.9019901","lati": "1.3039255", "vmsmsg": "Litter Picking long Ln1"},
		{"logi": "103.8895556","lati": "1.3002632", "vmsmsg": "Litter Picking long Ln1"}
	];

	var vmsMsgdata5 = [
		{"logi": "103.9019901","lati": "1.3039255", "vmsmsg": "Litter Picking long Ln1"},
		{"logi": "103.8895556","lati": "1.3002632", "vmsmsg": "Litter Picking long Ln1"}
	];


/** show vms message on the  map */
function displayVmsMessage(vmsMsgdata){
	//view.graphics.remove(vmspictureGraphicVmsText);  
	view.graphics.removeAll();  
	drawline();
	vmsIdDisplay();
	

	for (i in vmsMsgdata) { 
		logi = vmsMsgdata[i].logi ;
		lati = vmsMsgdata[i].lati ;
				
		vmsmsg = vmsMsgdata[i].vmsmsg;
		//console.log("vmsmsg :" + vmsmsg + "      logi["+ i + "] :" + logi + " lati["+ i + "] :" + lati);
		var vmspoint = {
			type: "point", // autocasts as new Point()                   			 
			longitude: logi,
			latitude: lati
		}; 
	/*	var vmsTextSymbol = {
		   type: "text",  // autocasts as new TextSymbol()
		   color: "#202B53",
		   haloColor: "white",
		   haloSize: "0px",
		   text: vmsmsg,
		   xoffset: 4,
		   yoffset: 10,
		   font: {  // autocast as new Font()
				  size: 8,
				  weight: "bold"
				}
		 };		*/

		 var mrwMessageImagePictureSymbol1 = {
			type: "picture-marker",
			url: "litterpicking.JPG",
			width: "100",
			height: "35",
			xoffset: 4,
			yoffset: 30,
	  }

		vmspictureGraphicVmsText = new Graphic({
		   geometry: vmspoint,
		   symbol: mrwMessageImagePictureSymbol1
		});	
		view.graphics.addMany([vmspictureGraphicVmsText]); 			
	}
}

/**Lastvms Remove VMS message on the map change the color**/
function removeVmsMessage(){  
	view.graphics.removeAll();  
	//drawline();
	mrwLaneLayer.visible = false;
	vmsIdDisplay(); 
	
}

/*** Moving icon water vehicle */
//Moving Icon point 
	var movingIcondata = [
		{"logi": "103.925745","lati": "1.309649"},
		{"logi": "103.925525","lati": "1.310344"},
		{"logi": "103.925281","lati": "1.310690"},
		{"logi": "103.9246401","lati": "1.3113624"},
		{"logi": "103.924332","lati": "1.311735"},		 
		{"logi": "103.9237142","lati": "1.3123578"},
		{"logi": "103.922836","lati": "1.311942"},
		{"logi": "103.9205104","lati": "1.3113841"},
		{"logi": "103.9161265","lati": "1.3097458"},
		{"logi": "103.912317","lati": "1.3089701"},
		{"logi": "103.9085518","lati": "1.3082027"},
		{"logi": "103.9068805","lati": "1.3072516"},
		{"logi": "103.904935","lati": "1.3059509"},
		{"logi": "103.9025278","lati": "1.3044001"},
		{"logi": "103.9005097","lati": "1.3031741"},
		{"logi": "103.8971268","lati": "1.3019824"}, 
		{"logi": "103.8938274","lati": "1.3009662"},
		{"logi": "103.8909051","lati": "1.2999841"},
		{"logi": "103.8878191","lati": "1.3007663"}    
    ];
	
	
var vehiInterval1, vehiInterval2,vehiInterval3, vehiInterval4, vehiInterval5,vehiInterval6,vehiInterval7, vehiInterval8;
var vehiInterval9, vehiInterval10, vehiInterval11,vehiInterval12,vehiInterval13, vehiInterval14, vehiInterval15,vehiInterval16, vehiInterval17;
var vehiInterval18, vehiIntervalFinal
var vehipictureGraphic = "";
function movingIconDisplay(){
	//vehiInterval1 = setInterval(moveIconDisplay1, 2050);
	vehiInterval2 = setInterval(moveIconDisplay2, 3000);
	vehiInterval3 = setInterval(moveIconDisplay3, 4000);
	vehiInterval4 = setInterval(moveIconDisplay4, 6000);
	vehiInterval5 = setInterval(moveIconDisplay5, 10000);
	vehiInterval6 = setInterval(moveIconDisplay6, 12000);
	vehiInterval7 = setInterval(moveIconDisplay7, 14000);
	vehiInterval8 = setInterval(moveIconDisplay8, 16000);
	vehiInterval9 = setInterval(moveIconDisplay9, 18000);
	vehiInterval10 = setInterval(moveIconDisplay10, 20000);
	vehiInterval11 = setInterval(moveIconDisplay11, 22000); 
	vehiInterval12 = setInterval(moveIconDisplay12, 24000); 
	vehiInterval13 = setInterval(moveIconDisplay13, 26000);
	vehiInterval14 = setInterval(moveIconDisplay14, 28000);
	vehiInterval15 = setInterval(moveIconDisplay15, 30000);
	vehiInterval16 = setInterval(moveIconDisplay16, 33000);
	vehiInterval17 = setInterval(moveIconDisplay17, 35000);
	vehiInterval18 = setInterval(moveIconDisplay18, 37000);
	vehiInterval19 = setInterval(moveIconDisplay19, 39000);
	vehiIntervalFinal = setInterval(clearMovingFinalInterval, 43000); 	
}

function moveIconDisplay1(){
	displayMoveIcon(0);
}
function moveIconDisplay2(){
	clearInterval(vehiInterval1);
	displayMoveIcon(1);	
}
function moveIconDisplay3(){
	clearInterval(vehiInterval2);
	displayMoveIcon(2);
}
function moveIconDisplay4(){
clearInterval(vehiInterval3);
	displayMoveIcon(3);
}
function moveIconDisplay5(){
	clearInterval(vehiInterval4);
	displayMoveIcon(4);
}
function moveIconDisplay6(){
	clearInterval(vehiInterval5);
	displayMoveIcon(5);
}
function moveIconDisplay7(){
	clearInterval(vehiInterval6);
	displayMoveIcon(6);
}
function moveIconDisplay8(){
	clearInterval(vehiInterval7);
	displayMoveIcon(7);
}
function moveIconDisplay9(){
	clearInterval(vehiInterval8);
	displayMoveIcon(8);
}
function moveIconDisplay10(){
	clearInterval(vehiInterval9);
	displayMoveIcon(9);
}
function moveIconDisplay11(){
	clearInterval(vehiInterval10);
	displayMoveIcon(10);
} 
function moveIconDisplay12(){
	clearInterval(vehiInterval11);
	displayMoveIcon(11);
}
function moveIconDisplay13(){
	clearInterval(vehiInterval12);
	displayMoveIcon(12);
}
function moveIconDisplay14(){
	clearInterval(vehiInterval13);
	displayMoveIcon(13);
}
function moveIconDisplay15(){
	clearInterval(vehiInterval14);
	displayMoveIcon(14);
}

function moveIconDisplay16(){
	clearInterval(vehiInterval15);
	displayMoveIcon(15);
}

function moveIconDisplay17(){
	clearInterval(vehiInterval16);
	displayMoveIcon(16);
}

function moveIconDisplay18(){
	clearInterval(vehiInterval17);
	displayMoveIcon(17);
}
function moveIconDisplay19(){
	clearInterval(vehiInterval18);
	displayMoveIcon(18);
}

function clearMovingFinalInterval(){
	removeMoveIcon();
	removeLine();
	mrwLaneLayer.visible = false;
	clearInterval(vehiInterval2);
	clearInterval(vehiInterval3);
	clearInterval(vehiInterval4);
	clearInterval(vehiInterval5);
	clearInterval(vehiInterval6);
	clearInterval(vehiInterval7);
	clearInterval(vehiInterval8);
	clearInterval(vehiInterval9);
	clearInterval(vehiInterval10);
	clearInterval(vehiInterval11);
	clearInterval(vehiInterval12);
	clearInterval(vehiInterval13);
	clearInterval(vehiInterval14);
	clearInterval(vehiInterval15);
	clearInterval(vehiInterval16);
	clearInterval(vehiInterval17);
	clearInterval(vehiInterval18);
	clearInterval(vehiInterval19);
	clearInterval(vehiIntervalFinal);
}

//display moving icon
function displayMoveIcon(id){
	view.graphics.remove(vehipictureGraphic); 
	for (i in movingIcondata) { 
		var logi = movingIcondata[i].logi ;
		var lati = movingIcondata[i].lati ;
		
		if(i==id) {
		console.log(i + " " + logi + " " + lati + " ");
			var vmspoint = {
				type: "point", // autocasts as new Point()                   			 
				longitude: logi,
				latitude: lati
			}; 
		var vehiPictureSymbol1 = {
			  type: "picture-marker",
			  url: "sweepingicon.png",
			  width: "30",
			  height: "25"
		}		
		vehipictureGraphic = new Graphic({
			geometry: vmspoint,
			symbol: vehiPictureSymbol1
		});	
		view.graphics.addMany([vehipictureGraphic]);
		break;
		}		
	}
}
//Remove moving icon	
function removeMoveIcon(){
	view.graphics.remove(vehipictureGraphic); 
}
/*** end of Moving icon water vehicle */

/*** Draw line between start and end point */
var polylineGraphic;
function drawline() {
	mrwLaneLayer.visible = true;
}
  //Remove moving icon	
function removeLine(){
	view.graphics.remove(polylineGraphic); 
}      
/*** End of Draw line between start and end point */

		//map.add(wmsLayer);  
        view.when(function() {
        //view.extent = layer.fullExtent;
		view.extent = new Extent({
		 // xmin: 103.630760,
		//  ymin:  1.266575,
		  xmin: 103.866673,
		  ymin:  1.310829,	
		  xmax: 103.963800,
		  ymax:  1.418752,
		  spatialReference: {
			wkid: 4326
		  }
		});
        var layerList = new LayerList({
            view: view
          });
          view.ui.add(layerList, "bottom-left");
        }); 

      });
		   
	
	   









/*
//Old Moving icon points
var movingIcondata = [
		{"logi": "103.909102","lati": "1.308378"},
		{"logi": "103.908437","lati": "1.308217"},
		{"logi": "103.908051","lati": "1.307917"},
		{"logi": "103.907697","lati": "1.307745"},
		{"logi": "103.907426","lati": "1.307555"},
		{"logi": "103.907069","lati": "1.307322"},
		{"logi": "103.905316","lati": "1.306140"},
		{"logi": "103.904849","lati": "1.305834"},
		{"logi": "103.903119","lati": "1.304693"},
		{"logi": "103.901306","lati": "1.303524"},
		{"logi": "103.900029","lati": "1.302891"},
		{"logi": "103.898259","lati": "1.302247"},
		{"logi": "103.894472","lati": "1.301174"},
		{"logi": "103.892294","lati": "1.300466"},	
		{"logi": "103.8906241","lati": "1.300115"},
		{"logi": "103.8895556","lati": "1.3002632"}
    ];			
*/

  
/*// Draw a line without layer creation using geo server.
	  function drawline() {
	   var polyline = {
			type: "polyline", // autocasts as new Polyline()
			paths: [[103.909102, 1.308378],[103.908437, 1.308217],[103.908051, 1.307917],
					[103.907697, 1.307745],[103.907426, 1.307555],[103.907069, 1.307322],
					[103.906106, 1.306644],[103.903119, 1.304693],[103.901306, 1.303524],
					[103.900029, 1.302891],[103.898259, 1.302247],[103.894472, 1.301174],
					[103.892294, 1.300466],[103.8906241, 1.300115],[103.8895556, 1.3002632]]
			};
			// Create a symbol for drawing the line
			var lineSymbol = {
				type: "simple-line", // autocasts as SimpleLineSymbol()
				color: [226, 119, 40],
				width: 2
			};
			polylineGraphic = new Graphic({
				geometry: polyline,
				symbol: lineSymbol,
				// attributes: lineAtt,
				popupTemplate: {
				// autocasts as new PopupTemplate()
				title: "Road sweeping"
				}
			});
			view.graphics.addMany([polylineGraphic]);	
	}   */

	
     /*   document.getElementById("line").onclick = function() {
            action = draw.create("polyline");
            view.focus();
            action.on(
              [
                "vertex-add",
                "vertex-remove",
                "cursor-update",
                "redo",
                "undo",
                "draw-complete"
              ],
              createGraphic
            );
        }
        function createGraphic(event) {
             vertices = event.vertices;
             graphic = new Graphic({
              geometry: {
                type: "polyline",
                paths: vertices,
                spatialReference: view.spatialReference
              },
              symbol: {
                type: "simple-line", // autocasts as new SimpleFillSymbol
                color: [237, 28, 36],
                width: 1,
              }
            });
            view.graphics.add(graphic);
          }*/
  /* end of draw line function */

/*

  // Start end point icon display 
function drawstartendpoint(){

	var stpoint = {
		type: "point", // autocasts as new Point()                   			 
		longitude: 103.92464,
		latitude: 1.3113622
	}; 

startPointGraphic = new Graphic({
	geometry: stpoint,
	  symbol: {
		type: "simple-marker", // autocasts as SimpleMarkerSymbol
		style: "circle",
		color: "blue",
		size: "16px",
		xoffset: 10,
		yoffset: 10,
		outline: {
		  // autocasts as SimpleLineSymbol
		  color: [255, 255, 0],
		  width: 2
		}
	  }
});	

var endpoint = {
	type: "point", // autocasts as new Point()                   			 
	longitude: 103.8895556,
	latitude:  1.3002632
}; 

endPointGraphic = new Graphic({
	geometry: endpoint,
	  symbol: {
		type: "simple-marker", // autocasts as SimpleMarkerSymbol
		style: "circle",
		color: "blue",
		size: "16px",
		xoffset: 10,
		yoffset: 10,
		outline: {
		  // autocasts as SimpleLineSymbol
		  color: [255, 255, 0],
		  width: 2
		}
	  }
});	
view.graphics.addMany([startPointGraphic, endPointGraphic]); 
}
*/

/* //using create button
document.getElementById("CreateMrwId").onclick = function() {
	//Draw auto line on the rood
	drawline();
	vmsIdDisplay();
	//VMS message display based on the moving icon

	//vms text message on the map based on the timing
	interval1 = setInterval(vmsMessageDispaly1, 3000);	
	interval2 = setInterval(vmsMessageDispaly2, 21000);	
	interval3 = setInterval(vmsMessageDispaly3, 29000);	
	interval4 = setInterval(vmsMessageDispaly4, 36000);	
	clrinterval = setInterval(clearFinalInterval, 37000); 	
	
	//Moving Icon Display
	movingIconDisplay();	
}*/