
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

		
        var circlelineLayer = new CustomWMSLayer({
            mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
            mapParameters: {
              SERVICE: "WMS",
              REQUEST: "GetMap",
              FORMAT: "image/png",
              TRANSPARENT: "TRUE",
              STYLES: "mrt_line_style",
              VERSION: "1.3.0",
              LAYERS: "gisdbo_gis_rtsline",
              WIDTH: "{width}",
              HEIGHT: "{height}",
              CRS: "EPSG:{wkid}",
              BBOX: "{xmin},{ymin},{xmax},{ymax}"
            },
            title: "MRT Line"
          });	
  		
  		var mrtstationLayer = new CustomWMSLayer({
            mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
            mapParameters: {
              SERVICE: "WMS",
              REQUEST: "GetMap",
              FORMAT: "image/png",
              TRANSPARENT: "TRUE",
              STYLES: "mrt_station_style",
              VERSION: "1.3.0",
              LAYERS: "	mrtlrtstnptt",
              WIDTH: "{width}",
              HEIGHT: "{height}",
              CRS: "EPSG:{wkid}",
              BBOX: "{xmin},{ymin},{xmax},{ymax}"
            },
            title: "MRT Station"
          });
  		
  		var mrtbreakdownLayer = new CustomWMSLayer({
            mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
            mapParameters: {
              SERVICE: "WMS",
              REQUEST: "GetMap",
              FORMAT: "image/png",
              TRANSPARENT: "TRUE",
              STYLES: "mrt_breakdown_line_style",
              VERSION: "1.3.0",
              LAYERS: "gisdbo_gis_rtsline",
              WIDTH: "{width}",
              HEIGHT: "{height}",
              CRS: "EPSG:{wkid}",
              BBOX: "{xmin},{ymin},{xmax},{ymax}"
            },
            title: "MRT Line Breakdown"
          });	

  		var mrtbreakdowntrafficLayer = new CustomWMSLayer({
            mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
            mapParameters: {
              SERVICE: "WMS",
              REQUEST: "GetMap",
              FORMAT: "image/png",
              TRANSPARENT: "TRUE",
              STYLES: "mrt_breakdown_heavytraffic_line_style",
              VERSION: "1.3.0",
              LAYERS: "gisdbo_gis_carriageway",
              WIDTH: "{width}",
              HEIGHT: "{height}",
              CRS: "EPSG:{wkid}",
              BBOX: "{xmin},{ymin},{xmax},{ymax}"
            },
            title: "Heavy Traffic"
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
		
  		circlelineLayer.visible  = false;
  		mrtstationLayer.visible  = false;
  		mrtbreakdownLayer.visible = true;
  		mrtbreakdowntrafficLayer.visible = false;
  		vmsLayer.visible = false;
  		detectCamera.visible = false;
  		speedLinkLayer.visible = false;
		map = new Map({
		basemap: {
	            baseLayers: [layer]
	    },
          //layers: [layer,circlelineLayer,mrtstationLayer,mrtbreakdownLayer,mrtbreakdowntrafficLayer]
		layers: [circlelineLayer,mrtstationLayer,vmsLayer,mrtbreakdowntrafficLayer,speedLinkLayer,detectCamera]
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

        /*MRT closed start and end points icons  */
      //Start Point
      var mrtcloseStpoint = {
        type: "point", // autocasts as new Point()
        longitude: 103.882860,
        latitude: 1.306264                         
        };  
      var mrtcloseStPictureSymbol = {
        type: "picture-marker",
        url: "mrtimage1.png",
        width: "20",
        height: "20",
        xoffset: "10",
        yoffset: "10"
      }
      var mrtcloseStPictureGraphic = new Graphic({
      	  geometry: mrtcloseStpoint,
      	  symbol: mrtcloseStPictureSymbol
      	 });
      var mrtStation1 = {
      	type: "text",  // autocasts as new TextSymbol()
      	 color: "#000000",
      	 text: "Mountbatten",
      	//haloColor: "black",
      	 //haloSize: "1px",
      	 xoffset: 20,
      	 yoffset: 20,
      	 font: {  // autocast as new Font()
      	    size: 8,
      		weight: "bold"
      	 }
       };

      var mrtStationPictureGraphic1 = new Graphic({
      	  geometry: mrtcloseStpoint,
      	  symbol: mrtStation1
      	 });

      //end point 1
      var mrtcloseEndpoint = {
        type: "point", // autocasts as new Point()
        longitude: 103.875405,
        latitude: 1.302867                    
        };
      var mrtcloseEndPictureSymbol = {
        type: "picture-marker",
        url: "mrtimage1.png",
        width: "20",
        height: "20",
        xoffset: "10",
        yoffset: "10"
      }
      var mrtcloseEndPictureGraphic = new Graphic({
        geometry: mrtcloseEndpoint,
        symbol: mrtcloseEndPictureSymbol
       });

      var mrtStation2 = {
      		type: "text",  // autocasts as new TextSymbol()
      		 color: "#000000",
      		 text: "Stadium",
      		 //haloColor: "black",
      		 //haloSize: "1px",
      		 xoffset: 20,
      		 yoffset: 20,
      		 font: {  // autocast as new Font()
      		    size: 8,
      			weight: "bold"
      		 }
      	 };

      	var mrtStationPictureGraphic2 = new Graphic({
      		  geometry: mrtcloseEndpoint,
      		  symbol: mrtStation2
      		 });
      	
      //end point 2
        var mrtcloseEndpoint1 = {
          type: "point", // autocasts as new Point()
          longitude: 103.863514,
          latitude: 1.300266                    
          };
        var mrtcloseEndPictureSymbol1 = {
          type: "picture-marker",
          url: "mrtimage1.png",
          width: "20",
          height: "20",
          xoffset: "10",
          yoffset: "10"
        }
        var mrtcloseEndPictureGraphic1 = new Graphic({
          geometry: mrtcloseEndpoint1,
          symbol: mrtcloseEndPictureSymbol1
         });

        var mrtStation3 = {
        		type: "text",  // autocasts as new TextSymbol()
        		 color: "#000000",
        		 text: "Nicoll Highway",
        		 //haloColor: "black",
        		 //haloSize: "1px",
        		 xoffset: 20,
        		 yoffset: 20,
        		 font: {  // autocast as new Font()
        		    size: 8,
        			weight: "bold"
        		 }
        	 };

        	var mrtStationPictureGraphic3 = new Graphic({
        		  geometry: mrtcloseEndpoint1,
        		  symbol: mrtStation3
        		 });
        	
        	//selection station traffic jam layer shown
        document.getElementById("createmrtincid").onclick = function() {
        	// traffic jam layer
        	map.add(mrtbreakdownLayer);
        	
        	//VMS message display
        	mrtHTvmsMessage();
        	
        	//3 train icon and 3 station names displayed
        	view.graphics.addMany([mrtcloseStPictureGraphic,mrtStationPictureGraphic1,mrtcloseEndPictureGraphic,mrtcloseEndPictureGraphic1,mrtStationPictureGraphic2,mrtStationPictureGraphic3]);
      }
       
      /*** vms Message location  popup template  ***/
        function mrtHTvmsMessage(){
        	
        //VMS point 1 Mountbatten Road
        	 var vmspoint1 = {
        	          type: "point", // autocasts as new Point()
        	          longitude: 103.881536,
        	          latitude: 1.306302                    
        	          };
        	 
        	        var vmsPictureSymbol1 = {
        	          type: "picture-marker",
        	          url: "rvm_img.png",
        	          width: "20",
        	          height: "20"
        	        }
        	        var vmsPictureGraphic1 = new Graphic({
        	          geometry: vmspoint1,
        	          symbol: vmsPictureSymbol1,
        	          popupTemplate: {
                          // autocasts as new PopupTemplate()
                          title: "Jam in Mountbatten Road"
                        }
        	         });
        	    
        	  // VMS Point 2   Statidum Blvd
               	 var vmspoint2 = {
           	          type: "point", // autocasts as new Point()
           	          longitude: 103.879158,
           	          latitude: 1.304655                    
           	          };
           	 
           	        var vmsPictureSymbol2 = {
           	          type: "picture-marker",
           	          url: "rvm_img.png",
           	          width: "20",
           	          height: "20"
           	        }
           	        var vmsPictureGraphic2 = new Graphic({
           	          geometry: vmspoint2,
           	          symbol: vmsPictureSymbol2,
           	          popupTemplate: {
                             // autocasts as new PopupTemplate()
                             title: "Traffic Slow Stadium Blvd"
                           }
           	         });
           	                 	        
              	  // VMS Point 3  Dunmanroad          	     
                  	 var vmspoint3 = {
              	          type: "point", // autocasts as new Point()
              	          longitude: 103.892627,
              	          latitude: 1.309146                    
              	          };
              	 
              	        var vmsPictureSymbol3 = {
              	          type: "picture-marker",
              	          url: "rvm_img.png",
              	          width: "20",
              	          height: "20"
              	        }
              	        var vmsPictureGraphic3 = new Graphic({
              	          geometry: vmspoint3,
              	          symbol: vmsPictureSymbol3,
              	          popupTemplate: {
                                // autocasts as new PopupTemplate()
                                title: "Jam in Mountbatten Road"
                              }
              	         });

              	   // VMS Point 4 Geylang Road
                     	 var vmspoint4 = {
                 	          type: "point", // autocasts as new Point()
                 	          longitude: 103.8756162,
                 	          latitude: 1.3107072                    
                 	          };
                 	 
                 	        var vmsPictureSymbol4 = {
                 	          type: "picture-marker",
                 	          url: "rvm_img.png",
                 	          width: "20",
                 	          height: "20"
                 	        }
                 	        var vmsPictureGraphic4 = new Graphic({
                 	          geometry: vmspoint4,
                 	          symbol: vmsPictureSymbol4,
                 	          popupTemplate: {
                                   // autocasts as new PopupTemplate()
                                   title: "Jam in Mountbatten Road"
                                 }
                 	         });               	        
                       	 
                 	        // VMS Point 5  Guillemard Road
                        	 var vmspoint5 = {
                    	          type: "point", // autocasts as new Point()
                    	          longitude: 103.8803654,
                    	          latitude: 1.3099666                    
                    	          };
                    	 
                    	        var vmsPictureSymbol5 = {
                    	          type: "picture-marker",
                    	          url: "rvm_img.png",
                    	          width: "20",
                    	          height: "20"
                    	        }
                    	        var vmsPictureGraphic5 = new Graphic({
                    	          geometry: vmspoint5,
                    	          symbol: vmsPictureSymbol5,
                    	          popupTemplate: {
                                      // autocasts as new PopupTemplate()
                                      title: "Jam in Mountbatten Road"
                                    }
                    	         });            	        
        	        view.graphics.addMany([vmsPictureGraphic1,vmsPictureGraphic2,vmsPictureGraphic3,vmsPictureGraphic4,vmsPictureGraphic5]);
        	
        }
     /*** MRT closed  on road closed start and end points icons*/
       
 
        view.when(function() {
        //view.extent = layer.fullExtent;
		view.extent = new Extent({
		  xmin: 103.879526,
		  ymin:  1.302259,
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
	  	  
  