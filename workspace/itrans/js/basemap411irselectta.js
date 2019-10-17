
      var map, view;

      require([
        "esri/Map",
        "esri/views/MapView","esri/Graphic", 
        "esri/layers/WMTSLayer","esri/geometry/Extent", 
        "esri/widgets/LayerList", "esri/views/draw/Draw",
		'esri/layers/WMSLayer',
		"esri/views/MapView",
        "esri/layers/BaseDynamicLayer",
		"esri/geometry/geometryEngine",
    "esri/geometry/Polygon",
      ], function(Map, MapView,Graphic, WMTSLayer,Extent, LayerList, Draw, WMSLayer, MapView, BaseDynamicLayer,geometryEngine,Polygon) {
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
		var carriagewayLayer = new CustomWMSLayer({
          mapUrl: "http://10.180.8.110:8088/geoserver/singaporedb/wms",
          mapParameters: {
            SERVICE: "WMS",
            REQUEST: "GetMap",
            FORMAT: "image/png",
            TRANSPARENT: "TRUE",
            STYLES: "gis_carriageway_majorroad_style",
            VERSION: "1.3.0",
            LAYERS: "gisdbo_gis_carriageway",
            WIDTH: "{width}",
            HEIGHT: "{height}",
            CRS: "EPSG:{wkid}",
            BBOX: "{xmin},{ymin},{xmax},{ymax}"
          },
          title: "Carriageway"
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
          title: "Link Speed"
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
	            LAYERS: "gisdbo_gis_ea_fels_attr",
	            WIDTH: "{width}",
	            HEIGHT: "{height}",
	            CRS: "EPSG:{wkid}",
	            BBOX: "{xmin},{ymin},{xmax},{ymax}"
	          },

	          title: "DET Cam"
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
		
		// Traffic Speed Data Layer1
		var trafficSpeedLayer1 = new CustomWMSLayer({
          mapUrl: "http://10.180.8.110:8088/geoserver/singaporedb/wms",
          mapParameters: {
            SERVICE: "WMS",
            REQUEST: "GetMap",
            FORMAT: "image/png",
            TRANSPARENT: "TRUE",
            STYLES: "gis_speedlink_data_style",
            VERSION: "1.3.0",
            LAYERS: "gis_speedlink_data",
            WIDTH: "{width}",
            HEIGHT: "{height}",
            CRS: "EPSG:{wkid}",
            BBOX: "{xmin},{ymin},{xmax},{ymax}"
          },
          title: "Link Speed"
        });

		var trafficSpeedLayer2 = new CustomWMSLayer({
          mapUrl: "http://10.180.8.110:8088/geoserver/singaporedb/wms",
          mapParameters: {
            SERVICE: "WMS",
            REQUEST: "GetMap",
            FORMAT: "image/png",
            TRANSPARENT: "TRUE",
            STYLES: "gis_speedlink_data_style1",
            VERSION: "1.3.0",
            LAYERS: "gis_speedlink_data",
            WIDTH: "{width}",
            HEIGHT: "{height}",
            CRS: "EPSG:{wkid}",
            BBOX: "{xmin},{ymin},{xmax},{ymax}"
          },
          title: "Link Speed2"
        });

		var trafficSpeedLayer3 = new CustomWMSLayer({
          mapUrl: "http://10.180.8.110:8088/geoserver/singaporedb/wms",
          mapParameters: {
            SERVICE: "WMS",
            REQUEST: "GetMap",
            FORMAT: "image/png",
            TRANSPARENT: "TRUE",
            STYLES: "gis_speedlink_data_style2",
            VERSION: "1.3.0",
            LAYERS: "gis_speedlink_data",
            WIDTH: "{width}",
            HEIGHT: "{height}",
            CRS: "EPSG:{wkid}",
            BBOX: "{xmin},{ymin},{xmax},{ymax}"
          },
          title: "Link Speed3"
        });
		
		
		cctvLayer.visible = false;
		vmsLayer.visible = false;
		carriagewayLayer.visible = false;
		speedLinkLayer.visible = false;
		detectCamera.visible = false;
		glideLayer.visible = false;
			trafficSpeedLayer1.visible = false;
		trafficSpeedLayer2.visible = false;
		trafficSpeedLayer3.visible = false;
		
		map = new Map({
          //center: [103.84347,1.32858],
		basemap: {
            baseLayers: [layer,trafficSpeedLayer2,trafficSpeedLayer3,speedLinkLayer]
        },
          layers: [cctvLayer,vmsLayer,glideLayer,trafficSpeedLayer1,detectCamera]
        });
		
		
        view = new MapView({
          container: "viewDiv",
          map: map,
          center: [103.836862, 1.329735],
          zoom: 12        
        });
       
        // To draw a line
        draw = new Draw({
          view: view
        });

		//map.add(wmsLayer);  
        view.when(function() {
        //view.extent = layer.fullExtent;
		view.extent = new Extent({
		  xmin: 103.630760,
		  ymin:  1.266575,
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
          view.ui.add("draw-rectangle", "top-left");
          view.ui.add("reset", "top-left");
        });

/*** Onload Display **/
iconLocation()
showSpeedLkLr();
/*** Onload Speed Layer display */
var speedLayerInterval_1, speedLayerInterval_2, speedLayerInterval_3 ;
var speedLayerIntervalClr_1, speedLayerIntervalClr_2, speedLayerIntervalClr_3 ;

function showSpeedLkLr(){
  speedLayerInterval_1 = setInterval(speedLayer1, 5000);	
  speedLayerInterval_2 = setInterval(speedLayer2, 10000);
  speedLayerInterval_3 = setInterval(speedLayer3, 15000);
  //speedLayerIntervalClr_1 = setInterval(speedLayerClr1, 8000);	

  
  //speedLayerIntervalClr_2 = setInterval(speedLayerClr2, 13000);	

  
  //speedLayerIntervalClr_3 = setInterval(speedLayerClr3, 18000);	

  //speedLayerInterval_4 = setInterval(speedLayer4, 21000);
  //speedLayerIntervalClr_4 = setInterval(speedLayerClr4, 23000);	
}

function speedLayer1(){ 
  console.log("layer1");
    trafficSpeedLayer1.visible = true;			
    trafficSpeedLayer2.visible = false;	
    trafficSpeedLayer3.visible = false;
}
  
function speedLayer2(){	
  console.log("layer2");
  trafficSpeedLayer2.visible = true;
  trafficSpeedLayer1.visible = false;		
  trafficSpeedLayer3.visible = false;
}

function speedLayer3(){
  console.log("layer3");
  trafficSpeedLayer3.visible = true;
  trafficSpeedLayer2.visible = false;
  trafficSpeedLayer1.visible = false;	
}

function speedLayerClr2(){
  clearInterval(speedLayerInterval_2);
  clearInterval(speedLayerIntervalClr_2);
}



function speedLayerClr1(){
  clearInterval(speedLayerInterval_1);
  clearInterval(speedLayerIntervalClr_1);
}
function speedLayerClr3(){
  clearInterval(speedLayerInterval_3);
  clearInterval(speedLayerIntervalClr_3);
}

function speedLayer4(){  
  trafficSpeedLayer1.visible = false;	
  trafficSpeedLayer2.visible = false;
  trafficSpeedLayer3.visible = false;
  speedLinkLayer.visible = true;
}

function speedLayerClr4(){
  clearInterval(speedLayerInterval_4);
  clearInterval(speedLayerIntervalClr_4);
  speedLinkLayer.visible = false;
  showSpeedLkLr();
}

/*** Onload Incident Icon Display */
	var htIconPictureGraphic, unVIconPictureGraphic;
	
	var incidentIconList = [
		{"logi": "103.822766", "lati": "1.278674", "imgfile" : "heavytraffic.png"},
		{"logi": "103.897955", "lati": "1.297171", "imgfile" : "unattvehicle.png"},
		{"logi": "103.934441", "lati": "1.330996", "imgfile" : "roadwork.png"},
		{"logi": "103.727822", "lati": "1.374733", "imgfile" : "accident.png"},
		{"logi": "103.881117", "lati": "1.401208", "imgfile" : "breakdown.png"}		
    ];
	

	//heavy traffic 
	//Lower Delta Rd Exit (AYE) 

	//Unattended Vehicle
	//Stil Rd 5th Exit (ECP)

	//Road Work
	//Bedok North Ave 3(PIE)
//Accident
//Sungei Tengah Exit(KJE)
//, 103.727701


	function iconLocation() {  // Icon display
		
		// Heavy Traffic Icon
		var htIconpoint = {
			type: "point", // autocasts as new Point()
            longitude: 103.875029,
            latitude: 1.280973                       
       }; 
    var htTitle = "<b>Heavy Traffic</b>"
    var htContent = "<center>Heavy Traffic in MCE </center>"
    
	   var htIconPictureSymbol = {
			type: "picture-marker",
            url: "heavytraffic.png",  //Lower Delta Rd Exit (AYE)
            width: "22",
            height: "22"
      }
	  htIconPictureGraphic = new Graphic({
		geometry: htIconpoint,
		symbol: htIconPictureSymbol,
    popupTemplate: {
      // autocasts as new PopupTemplate()
      title: htTitle,
      content: htContent    
    }
      });    

		// Unattended Vehicle Icon
		var unVIconpoint = {
			type: "point", // autocasts as new Point()
            longitude: 103.897955,
            latitude: 1.297171                       
       };     
	   var unVIconPictureSymbol = {
			type: "picture-marker",
            url: "unattvehicle.png",  //Stil Rd 5th Exit (ECP)
            width: "22",
            height: "22"
      }

    var unTitle = "<b>Unattended vehicle</b>"
    var unContent = "<center>Unattended vehicle ECP - Stil Rd 5th Exit </center>"
	  unVIconPictureGraphic = new Graphic({
      geometry: unVIconpoint,
      symbol: unVIconPictureSymbol,
      popupTemplate: {
        title: unTitle,
        content: unContent    
      }
      });		
		 
		// Road Work Icon
		var rwIconpoint = {
			type: "point", // autocasts as new Point()
            longitude: 103.934441,
            latitude: 1.330996                       
       };     
     var rwTitle = "<b>Roadworks<b>";
     var rwContent = "<center>Roadworks on PIE Bedok North Ave 3</center>";
     var rwIconPictureSymbol = {
		 type: "picture-marker",
            url: "roadwork.png",  //Sungei Tengah Exit(KJE)
            width: "22",
            height: "22"
      }
	  rwIconPictureGraphic = new Graphic({
		geometry: rwIconpoint,
    symbol: rwIconPictureSymbol,
    popupTemplate: {
      // autocasts as new PopupTemplate()
      title: rwTitle,
      content: rwContent    
    }
      });		
	
	// Accident Icon
		var accIconpoint = {
			type: "point", // autocasts as new Point()
            longitude: 103.727822,
            latitude: 1.374733                       
       };     
	   var accIconPictureSymbol = {
			type: "picture-marker",
            url: "accident.png",  //Seletar Link (TPE)
            width: "22",
            height: "22"
      }

    var accTitle = "<b>Accident<b>";
    var accContent = "<center>Accident on KJE Sungei Tengah Exit</center>";
	  accIconPictureGraphic = new Graphic({
		geometry: accIconpoint,
    symbol: accIconPictureSymbol,
    popupTemplate: {
      title: accTitle,
      content: accContent    
    }
      });

//New incident Accident Icon created after the 
		var accIconpoint1 = {
				type: "point", // autocasts as new Point()
				longitude: 103.858249, //103.858056,
	            latitude: 1.378062                       
	       };     
		   var accIconPictureSymbol1 = {
				type: "picture-marker",
	            url: "accident.png",  //Seletar Link (TPE)
	            width: "22",
	            height: "22",
	      }

	    var accTitle = "<b>Accident<b>";
	    var accContent = "<center>Accident on KJE Sungei Tengah Exit</center>";
		  accIconPictureGraphic1 = new Graphic({
			geometry: accIconpoint1,
	    symbol: accIconPictureSymbol1,
	    popupTemplate: {
	      title: accTitle,
	      content: accContent    
	    }
	      });

//New incident Mobile road work Icon created after the		  
			var rwIconpoint1 = {
					type: "point", // autocasts as new Point()
		            longitude: 103.92464,
		            latitude: 1.3113622                      
		       };     
		     var rwTitle = "<b>Roadworks<b>";
		     var rwContent = "<center>Roadworks on PIE Bedok North Ave 3</center>";
		     var rwIconPictureSymbol1 = {
				 type: "picture-marker",
		            url: "roadwork.png",  //Sungei Tengah Exit(KJE)
		            width: "22",
		            height: "22"
		      }
			  rwIconPictureGraphic1 = new Graphic({
				geometry: rwIconpoint1,
		    symbol: rwIconPictureSymbol1,
		    popupTemplate: {
		      // autocasts as new PopupTemplate()
		      title: rwTitle,
		      content: rwContent    
		    }
	});	      

		  
	// breakdown Icon
		var bdIconpoint = {
			type: "point", // autocasts as new Point()
            longitude: 103.881117,
            latitude: 1.401208                       
       };     
	   var bdIconPictureSymbol = {
			type: "picture-marker",
            url: "breakdown.png",  //Bedok North Ave 3(PIE)
            width: "22",
            height: "22"
      }
    
    var bdTitle = "<b>Breakdown<b>";
    var bdContent = "<center>Breakdown	(TPE) - Seletar Link </center>";
	  bdIconPictureGraphic = new Graphic({
		geometry: bdIconpoint,
    symbol: bdIconPictureSymbol,      
    popupTemplate: {
      title: bdTitle,
      content: bdContent    
    }
      });		 	 
		view.graphics.addMany([htIconPictureGraphic, unVIconPictureGraphic,rwIconPictureGraphic,accIconPictureGraphic,bdIconPictureGraphic,accIconPictureGraphic1,rwIconPictureGraphic1]);
      }

	
/**reset */
	document.getElementById("reset").onclick = function() {
		  view.graphics.removeAll();
		  iconLocation()
	}
/** polyline draw function **/

document.getElementById("draw-rectangle").onclick = function() {
  view.graphics.removeAll();
  iconLocation()

  // creates and returns an instance of PolyLineDrawAction
  const action = draw.create("polyline");

  // focus the view to activate keyboard shortcuts for sketching
  view.focus();

  // listen polylineDrawAction events to give immediate visual feedback
  // to users as the line is being drawn on the view.
  action.on(
    [
      "vertex-add",
      "vertex-remove",
      "cursor-update",
      "redo",
      "undo",
      "draw-complete"
    ],
    updateVertices
  );
};

// Checks if the last vertex is making the line intersect itself.
function updateVertices(event) {
  // create a polyline from returned vertices
  if (event.vertices.length > 1) {
    const result = createGraphic(event);

    // if the last vertex is making the line intersects itself,
    // prevent the events from firing
    if (result.selfIntersects) {
      event.preventDefault();
    }
  }
}

// create a new graphic presenting the polyline that is being drawn on the view
function createGraphic(event) {
  const vertices = event.vertices;
  
  view.graphics.removeAll();
  iconLocation();
  // a graphic representing the polyline that is being drawn
  const graphic = new Graphic({
    geometry: {
      type: "polyline",
      paths: vertices,
      spatialReference: view.spatialReference
    },
    symbol: {
      type: "simple-line", // autocasts as new SimpleFillSymbol
      color: [4, 90, 141],
      width: 2,
    }
  });

  // check if the polyline intersects itself.
 const intersectingSegment = getIntersectingSegment(graphic.geometry);


view.graphics.add(graphic);
  // return intersectingSegment
  return {
    selfIntersects: intersectingSegment
  }; 
}

// function that checks if the line intersects itself
function isSelfIntersecting(polyline) {
  if (polyline.paths[0].length < 3) {
    return false;
  }
  const line = polyline.clone();

  //get the last segment from the polyline that is being drawn
  const lastSegment = getLastSegment(polyline);
  line.removePoint(0, line.paths[0].length - 1);

  // returns true if the line intersects itself, false otherwise
  return geometryEngine.crosses(lastSegment, line);
}

// Checks if the line intersects itself. If yes, change the last
// segment's symbol giving a visual feedback to the user.
function getIntersectingSegment(polyline) {

  return null;
}

// Get the last segment of the polyline that is being drawn
function getLastSegment(polyline) {
  const line = polyline.clone();
  const lastXYPoint = line.removePoint(0, line.paths[0].length - 1);
  const existingLineFinalPoint = line.getPoint(
    0,
    line.paths[0].length - 1
  );

  return {
    type: "polyline",
    spatialReference: view.spatialReference,
    hasZ: false,
    paths: [
      [
        [existingLineFinalPoint.x, existingLineFinalPoint.y],
        [lastXYPoint.x, lastXYPoint.y]
      ]
    ]
  };
}

/** end of polylien draw */


      });
	  	  
  
  
  		/*for (i in incidentIconList)  {
			alert("121");
			var logi = incidentIconList[i].logi;
			var lati = incidentIconList[i].lati;
			var img = incidentIconList[i].imgfile;
			alert(logi + " " + lati + " " + img);
			var htIconpoint = {
				type: "point", // autocasts as new Point()
				longitude: logi,
				latitude: lati                      
		   };     
		   var htIconPictureSymbol = {
				type: "picture-marker",
				url: img,  
				width: "20",
				height: "15",
		  }
		  var iconPictureGraphic = new Graphic({
			geometry: htIconpoint,
			symbol: htIconPictureSymbol
		  }); 
			view.graphics.addMany([iconPictureGraphic]);	  
		}*/