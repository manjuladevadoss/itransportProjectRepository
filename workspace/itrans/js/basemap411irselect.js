
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
		var carriagewayLayer = new CustomWMSLayer({
          mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
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
          title: "Link Speed"
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

	          title: "DET Cam"
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
		
		// Traffic Speed Data Layer1
		var trafficSpeedLayer1 = new CustomWMSLayer({
          mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
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
          mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
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
          mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
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
        });

/*** Onload Display **/
speedLkLrInterval = setInterval(speedLkLr, 5000);	
iconLocation()
		
/*** Onload Speed Layer display */
var speedLayerInterval_1, speedLayerInterval_2, speedLayerInterval_3
	function speedLkLr(){ 
			flagSpeed = true;
			trafficSpeedLayer1.visible = true			
			speedLayerInterval_1 = setInterval(speedLayer1, 10000);					
	}
	
	function clrspeedLkLr(){
		clearInterval(speedLkLrInterval);
	}	
	
	function speedLayer1(){ 
	clrspeedLkLr();
			trafficSpeedLayer1.visible = false;			
			trafficSpeedLayer2.visible = true;
			speedLayerInterval_2 = setInterval(speedLayer2, 15000);
	}
	
	function clrspeedLayer1(){
		clearInterval(speedLayerInterval_1);
	}
	
	function speedLayer2(){
		trafficSpeedLayer2.visible = false;
		trafficSpeedLayer3.visible = true;
		speedLayerInterval_3 = setInterval(clrspeedLayers, 20000);
	}

	function clrspeedLayers(){
		clearInterval(speedLayerInterval_1);
		clearInterval(speedLayerInterval_2);
		clearInterval(speedLayerInterval_3);
		trafficSpeedLayer3.visible = false;
		speedLayerInterval_4 = setInterval(callFirstSpeedLayer, 25000);	
	}
	function callFirstSpeedLayer(){	
		speedLkLr();
	}

/*** Onload Incident Icon Display */
	var htIconPictureGraphic, unVIconPictureGraphic;
	
	var incidentIconList = [
		{"logi": "103.822766", "lati": "1.278674", "imgfile" : "heavytraffic.jpg"},
		{"logi": "103.897955", "lati": "1.297171", "imgfile" : "unattvehicle.jpg"},
		{"logi": "103.934441", "lati": "1.330996", "imgfile" : "roadwork.jpg"},
		{"logi": "103.727822", "lati": "1.374733", "imgfile" : "accident.jpg"},
		{"logi": "103.881117", "lati": "1.401208", "imgfile" : "breakdown.jpg"}		
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
            url: "heavytraffic.jpg",  //Lower Delta Rd Exit (AYE)
            width: "15",
            height: "15"
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
            url: "unattvehicle.jpg",  //Stil Rd 5th Exit (ECP)
            width: "15",
            height: "15",
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
            url: "roadwork.jpg",  //Sungei Tengah Exit(KJE)
            width: "15",
            height: "15"
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
	
	// Breakdown Icon
		var accIconpoint = {
			type: "point", // autocasts as new Point()
            longitude: 103.727822,
            latitude: 1.374733                       
       };     
	   var accIconPictureSymbol = {
			type: "picture-marker",
            url: "accident.jpg",  //Seletar Link (TPE)
            width: "15",
            height: "15",
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
		 
	// breakdown Icon
		var bdIconpoint = {
			type: "point", // autocasts as new Point()
            longitude: 103.881117,
            latitude: 1.401208                       
       };     
	   var bdIconPictureSymbol = {
			type: "picture-marker",
            url: "breakdown.jpg",  //Bedok North Ave 3(PIE)
            width: "15",
            height: "15",
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
		view.graphics.addMany([htIconPictureGraphic, unVIconPictureGraphic,rwIconPictureGraphic,accIconPictureGraphic,bdIconPictureGraphic]);
      }

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