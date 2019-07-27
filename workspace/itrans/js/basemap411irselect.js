
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
          title: "TSpeed"
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
		
		cctvLayer.visible = false;
		vmsLayer.visible = false;
		carriagewayLayer.visible = false;
		speedLinkLayer.visible = true;
		detectCamera.visible = false;
		glideLayer.visible = false;
		
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

	/* Start Accident location point and icon */
	setInterval(accIconLocation, 500);
	setInterval(clearAccIconLocation, 1000);
	function clearAccIconLocation(){
		view.graphics.removeAll();
		speedLinkLayer.visible = true;
		view.graphics.addMany([cctvPictureGraphic2, cctvPictureGraphic3 ]);
	}
	var accPictureGraphic ="";
	function accIconLocation() {  // Icon display
	    var accpoint = {
                type: "point", // autocasts as new Point()
                longitude: 103.858056,
                latitude: 1.378118                        
                };     
            var accPictureSymbol = {
                type: "picture-marker",
                url: "accident.png",
                width: "25",
                height: "25",
                xoffset: 5,
                yoffset: 5
              }
            accPictureGraphic = new Graphic({
                geometry: accpoint,
                symbol: accPictureSymbol
               });    
            	view.graphics.addMany([accPictureGraphic]);
				//call cc cam and video
				accCCTVLocation()
      }

	/*** Onload cctv icon ***/
var cctvPictureGraphic1 ="", cctvPictureGraphic2 ="", cctvPictureGraphic3 ="";
function accCCTVLocation() {  // Icon display
    var accPictureGraphic ="";
	    /*var cctvpoint1 = {
                type: "point", // autocasts as new Point()
                longitude: 103.8587667,
                latitude: 1.3752537                        
                };  */
	    var cctvpoint2 = {
                type: "point", // autocasts as new Point()
                longitude: 103.8582773,
                latitude: 1.3770134                        
                }; 
	    var cctvpoint3 = {
                type: "point", // autocasts as new Point()
                longitude: 103.8584744,
                latitude: 1.3778264                        
                }; 
				
            var cctvPictureSymbol = {
                type: "picture-marker",
                url: "cctv.png",
                width: "25",
                height: "25",
                xoffset: 5,
                yoffset: 5
              }
            /*cctvPictureGraphic1 = new Graphic({
                geometry: cctvpoint1,
                symbol: cctvPictureSymbol,
				popupTemplate: {
						// autocasts as new PopupTemplate()
						title: "Accident",
						content: '<video width="270" height="150"  controls="true" autoplay="1" frameborder="0"><source src=CTEvideo.mp4 type=video/mp4></video>'
				}
               });  */
            cctvPictureGraphic2 = new Graphic({
                geometry: cctvpoint2,
                symbol: cctvPictureSymbol,
				popupTemplate: {
						// autocasts as new PopupTemplate()
						title: "Accident",
						content: '<video width="270" height="150"  controls="true" autoplay="1" frameborder="0"><source src=CTEvideo.mp4 type=video/mp4></video>'
				}
               }); 
            cctvPictureGraphic3 = new Graphic({
                geometry: cctvpoint3,
                symbol: cctvPictureSymbol,
				popupTemplate: {
						// autocasts as new PopupTemplate()
						title: "Accident",
						content: '<video width="270" height="150"  controls="true" autoplay="1" frameborder="0"><source src=CTEvideo.mp4 type=video/mp4></video>'
				}
               }); 			   
            	view.graphics.addMany([cctvPictureGraphic2, cctvPictureGraphic3 ]);
      }	

      });
	  	  
  