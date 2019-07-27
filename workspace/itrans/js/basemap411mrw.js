
      var map, view;

      require([
        "esri/Map",
        "esri/views/MapView","esri/Graphic", 
        "esri/layers/WMTSLayer","esri/geometry/Extent", 
        "esri/widgets/LayerList", "esri/views/draw/Draw",
		'esri/layers/WMSLayer',
		"esri/views/MapView",
        "esri/layers/BaseDynamicLayer"
      ], function(Map, MapView,Graphic, WMTSLayer,Extent, LayerList, Draw, WMSLayer, MapView, BaseDynamicLayer) {
        layer = 
          new WMTSLayer({
          url: "http://192.168.99.100:32768/services/wmts?service",
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
          mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
          mapParameters: {
            SERVICE: "WMS",
            REQUEST: "GetMap",
            FORMAT: "image/png",
            TRANSPARENT: "TRUE",
            STYLES: "",
            VERSION: "1.3.0",
            LAYERS: "cctv",
            WIDTH: "{width}",
            HEIGHT: "{height}",
            CRS: "EPSG:{wkid}",
            BBOX: "{xmin},{ymin},{xmax},{ymax}"
          },

          title: "CCTV"
        });	
		var vmsLayer = new CustomWMSLayer({
          mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
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
	          mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
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
	          mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
	          mapParameters: {
	            SERVICE: "WMS",
	            REQUEST: "GetMap",
	            FORMAT: "image/png",
	            TRANSPARENT: "TRUE",
	            STYLES: "gis_detectcam_style",
	            VERSION: "1.3.0",
	            LAYERS: "gisdbo_gis_ea_fels_attr",
	            WIDTH: "{width}",
	            HEIGHT: "{height}",
	            CRS: "EPSG:{wkid}",
	            BBOX: "{xmin},{ymin},{xmax},{ymax}"
	          },

	          title: "DCam"
	        });
		
		// Speed Link Layer way layer
		var speedLinkLayer = new CustomWMSLayer({
          mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
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
		
		cctvLayer.visible = false;
		vmsLayer.visible = false;
		glideLayer.visible = false;
		cctvLayer.visible = false;
		detectCamera.visible = false;
		speedLinkLayer.visible = false;
		//layer.visible = true;
		map = new Map({
          //center: [103.84347,1.32858],
		   basemap: {
            baseLayers: [layer]
          },
          layers: [cctvLayer,vmsLayer,glideLayer,speedLinkLayer,detectCamera]
        });
		
	
        view = new MapView({
          container: "viewDiv",
          map: map,
         // center: [103.836862, 1.329735],
		 center: [103.866673, 1.310829],
          zoom: 12        
        });
       
        // To draw a line
        draw = new Draw({
          view: view
        });
        
        /* Start draw line function */
        document.getElementById("line").onclick = function() {
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
                width: 0.5,
              }
            });
            view.graphics.add(graphic);
          }

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

 
/*** Remove particular vms message */
     document.getElementById("mrwvmsMsgRemoved").onclick = function() { 
      if(seleMsgNo==0) {  
        view.graphics.remove([pictureGraphicText]);
      } 
     }
/**** End of Remove particular vms message */     
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
			  url: "rvm_img.png",
			  width: "20",
			  height: "20"
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
document.getElementById("CreateMrwId").onclick = function(){
	//Draw auto line on the rood
	drawline();
	vmsIdDisplay();
	
	//vms text message on the map based on the timing
	interval1 = setInterval(vmsMessageDispaly1, 2000);	
	interval2 = setInterval(vmsMessageDispaly2, 4000);	
	interval3 = setInterval(vmsMessageDispaly3, 8000);	
	interval4 = setInterval(vmsMessageDispaly4, 12000);	
	interval5 = setInterval(vmsMessageDispaly5, 15000);	
	interval6 = setInterval(clearFinalInterval, 19000); 	
	//Moving Icon Display
	movingIconDisplay();	
}
	
	function vmsMessageDispaly1(){ 
		displayVmsMessage(0);
	}

	function vmsMessageDispaly2(){		
		clearInterval(interval1); 	
		displayVmsMessage(1);
	}
	
	function vmsMessageDispaly3(){
		clearInterval(interval2); 	
		displayVmsMessage(2);
	}

	function vmsMessageDispaly4(){
		clearInterval(interval3); 	
		displayVmsMessage(3);
	}
	function vmsMessageDispaly5(){
		clearInterval(interval4); 	
		displayVmsMessage(4);
	}

	function clearFinalInterval(){
		removeVmsMessage();
		clearInterval(interval5);
		clearInterval(interval6);
	}
/** end of vms message on the map **/

	//vms point 
	var vmsMsgdata = [
		{"logi": "103.9094703", "lati": "1.3082692", "vmsmsg": "Road sweeping along Ln1"},
		{"logi": "103.9054419","lati": "1.3064163", "vmsmsg": "Road sweeping along Ln1"},
		{"logi": "103.9019901","lati": "1.3039255", "vmsmsg": "Road sweeping along Ln1"},
		{"logi": "103.8906241","lati": "1.300115", "vmsmsg": "Road sweeping along Ln1"},
		{"logi": "103.8895556","lati": "1.3002632", "vmsmsg": "Road sweeping along Ln1"}
    ];
/** show vms message on the  map */
function displayVmsMessage(id){
	view.graphics.remove(vmspictureGraphicVmsText);  
	for (i in vmsMsgdata) { 
		logi = vmsMsgdata[i].logi ;
		lati = vmsMsgdata[i].lati ;
		vmsmsg = vmsMsgdata[i].vmsmsg;
		if(i==id) {
			var vmspoint = {
				type: "point", // autocasts as new Point()                   			 
				longitude: logi,
				latitude: lati
			}; 
		var vmsTextSymbol = {
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
		 };		
			vmspictureGraphicVmsText = new Graphic({
					   geometry: vmspoint,
					   symbol: vmsTextSymbol
			});	
			view.graphics.addMany([vmspictureGraphicVmsText]); 
		}		
	}
}

/**Lastvms Remove VMS message on the map change the color**/
function removeVmsMessage(){  
	view.graphics.remove(vmspictureGraphicVmsText);  
}

/*** Moving icon water vehicle */
//Moving Icon point 
	var movingIcondata = [
		{"logi": "103.909102","lati": "1.308378"},
		{"logi": "103.908437","lati": "1.308217"},
		{"logi": "103.908051","lati": "1.307917"},
		{"logi": "103.907697","lati": "1.307745"},
		{"logi": "103.907426","lati": "1.307555"},
		{"logi": "103.907069","lati": "1.307322"},
		{"logi": "103.906106","lati": "1.306644"},
		{"logi": "103.903119","lati": "1.304693"},
		{"logi": "103.901306","lati": "1.303524"},
		{"logi": "103.900029","lati": "1.302891"},
		{"logi": "103.898259","lati": "1.302247"},
		{"logi": "103.894472","lati": "1.301174"},
		{"logi": "103.892294","lati": "1.300466"},	
		{"logi": "103.8906241","lati": "1.300115"},
		{"logi": "103.8895556","lati": "1.3002632"}
    ];
	
	
var vehiInterval1, vehiInterval2,vehiInterval3, vehiInterval4, vehiInterval5,vehiInterval6,vehiInterval7, vehiInterval8;
var vehiInterval9, vehiInterval10, vehiInterval11,vehiInterval2,vehiInterval13, vehiInterval14, vehiInterval15, vehiIntervalFinal
var vehipictureGraphic = "";
function movingIconDisplay(){
	vehiInterval1 = setInterval(moveIconDisplay1, 2050);
	vehiInterval2 = setInterval(moveIconDisplay2, 3000);
	vehiInterval3 = setInterval(moveIconDisplay3, 4000);
	vehiInterval4 = setInterval(moveIconDisplay4, 5000);
	vehiInterval5 = setInterval(moveIconDisplay5, 6000);
	vehiInterval6 = setInterval(moveIconDisplay6, 7000);
	vehiInterval7 = setInterval(moveIconDisplay7, 8000);
	vehiInterval8 = setInterval(moveIconDisplay8, 9000);
	vehiInterval9 = setInterval(moveIconDisplay9, 12000);
	vehiInterval10 = setInterval(moveIconDisplay10, 13000);
	vehiInterval11 = setInterval(moveIconDisplay11, 14000);
	vehiInterval12 = setInterval(moveIconDisplay12, 15000);
	vehiInterval13 = setInterval(moveIconDisplay13, 17000);
	vehiInterval14 = setInterval(moveIconDisplay14, 15000);
	vehiInterval15 = setInterval(moveIconDisplay15, 17000);
	vehiIntervalFinal = setInterval(clearMovingFinalInterval, 19000); 	
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
function clearMovingFinalInterval(){
	removeMoveIcon();
	removeLine();
	clearInterval(vehiInterval15);
	clearInterval(vehiIntervalFinal);
}

//display moving icon
function displayMoveIcon(id){
	view.graphics.remove(vehipictureGraphic); 
	for (i in movingIcondata) { 
		var logi = movingIcondata[i].logi ;
		var lati = movingIcondata[i].lati ;
		
		if(i==id) {
			var vmspoint = {
				type: "point", // autocasts as new Point()                   			 
				longitude: logi,
				latitude: lati
			}; 
		var vehiPictureSymbol1 = {
			  type: "picture-marker",
			  url: "watervehicle.png",
			  width: "24",
			  height: "20"
		}		
		vehipictureGraphic = new Graphic({
			geometry: vmspoint,
			symbol: vehiPictureSymbol1
		});	
		view.graphics.addMany([vehipictureGraphic]); 
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
	  	 
  