
      var map, view;

      require([
        "esri/Map",
        "esri/views/MapView","esri/Graphic", 
        "esri/layers/WMTSLayer","esri/geometry/Extent", 
        "esri/widgets/LayerList", "esri/views/draw/Draw",
		'esri/layers/WMSLayer',
		"esri/views/MapView",
        "esri/layers/BaseDynamicLayer","esri/views/layers/support/FeatureFilter","esri/views/layers/FeatureLayerView"
      ], function(Map, MapView,Graphic, WMTSLayer,Extent, LayerList, Draw, WMSLayer, MapView, BaseDynamicLayer,FeatureFilter,FeatureLayerView) {
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
            STYLES: "",
            VERSION: "1.3.0",
            LAYERS: "gisdbo_gis_carriageway",
            WIDTH: "{width}",
            HEIGHT: "{height}",
            CRS: "EPSG:{wkid}",
            BBOX: "{xmin},{ymin},{xmax},{ymax}"
          },
          title: "Carriageway"
        });
		cctvLayer.visible = false;
		vmsLayer.visible = false;
		carriagewayLayer.visible = false;
		map = new Map({
          //center: [103.84347,1.32858],
          layers: [layer,cctvLayer,vmsLayer,carriagewayLayer]
        });
		
		carriagewayLayer.visible = false;
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
  /* end of draw line function */     
        
        /* undo */
        /* document.getElementById("undo").onclick = function() {
          view.graphics.removeAll();
          }  */
        /*undo*/
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
                width: 1,
              }
            });
            view.graphics.add(graphic);
          }
  /* end of draw line function */
        
   /* begin mobile road work points icons  */
      //add symbol and point
        
   var mrwpoint = {
       type: "point", // autocasts as new Point()
       longitude: 103.876477,
       latitude: 1.306386                         
      };
    var mrwPictureSymbol = {
       type: "picture-marker",
      url: "rdwork.png",
      width: "20",
      height: "20"
     }
    var mrwPictureGraphic = new Graphic({
      geometry: mrwpoint,
      symbol: mrwPictureSymbol
    }); 
        
      var mrwpoint1 = {
          type: "point", // autocasts as new Point()
          longitude: 103.876765,
          latitude: 1.307335                         
          };
      var mrwPictureSymbol1 = {
          type: "picture-marker",
          url: "rdwork.png",
          width: "20",
          height: "20"
        }
      var mrwPictureGraphic1 = new Graphic({
          geometry: mrwpoint1,
          symbol: mrwPictureSymbol1
         });
     
      var mrwpoint2 = {
          type: "point", // autocasts as new Point()
          longitude: 103.872972,
          latitude: 1.306702                    
          };
      var mrwPictureSymbol2 = {
          type: "picture-marker",
          url: "rdwork.png",
          width: "20",
          height: "20"
        }
      var mrwPictureGraphic2 = new Graphic({
          geometry: mrwpoint2,
          symbol: mrwPictureSymbol2
         });
      var mrwpoint3 = {
              type: "point", // autocasts as new Point()
              longitude: 103.876706,
              latitude: 1.305983                    
              };
     var mrwPictureSymbol3 = {
              type: "picture-marker",
              url: "rdwork.png",
              width: "20",
              height: "20"
            }
     var mrwPictureGraphic3 = new Graphic({
              geometry: mrwpoint3,
              symbol: mrwPictureSymbol3
             }); 
     var mrwpoint4 = {
             type: "point", // autocasts as new Point()
             longitude: 103.877232,
             latitude: 1.304567                    
                  };
     var mrwPictureSymbol4 = {
          type: "picture-marker",
          url: "rdwork.png",
          width: "20",
          height: "20"
       }
     var mrwPictureGraphic4 = new Graphic({
         geometry: mrwpoint4,
         symbol: mrwPictureSymbol4
       });

     var mrwpoint5 = {
             type: "point", // autocasts as new Point()
             longitude: 103.871750,
             latitude: 1.305833                    
                  };
     var mrwPictureSymbol5 = {
          type: "picture-marker",
          url: "rdwork.png",
          width: "20",
          height: "20"
       }
     var mrwPictureGraphic5 = new Graphic({
         geometry: mrwpoint5,
         symbol: mrwPictureSymbol5
       });

     var mrwpoint5 = {
             type: "point", // autocasts as new Point()
             longitude: 103.872136,
             latitude: 1.304696                    
         };
     var mrwPictureSymbol5 = {
          type: "picture-marker",
          url: "rdwork.png",
          width: "20",
          height: "20"
       }
     var mrwPictureGraphic5 = new Graphic({
         geometry: mrwpoint5,
         symbol: mrwPictureSymbol5
       });
     
     var mrwpoint6 = {
             type: "point", // autocasts as new Point()
             longitude: 103.878745,
             latitude: 1.304342                    
         };
     var mrwPictureSymbol6 = {
          type: "picture-marker",
          url: "rdwork.png",
          width: "20",
          height: "20"
       }
     var mrwPictureGraphic6 = new Graphic({
         geometry: mrwpoint6,
         symbol: mrwPictureSymbol6
       });
     
     var mrwpoint7 = {
             type: "point", // autocasts as new Point()
             longitude: 103.878282,
             latitude: 1.303425                    
         };
     var mrwPictureSymbol7 = {
          type: "picture-marker",
          url: "rdwork.png",
          width: "20",
          height: "20"
       }
     var mrwPictureGraphic7 = new Graphic({
         geometry: mrwpoint7,
         symbol: mrwPictureSymbol7
       });
   
     var mrwpoint8 = {
             type: "point", // autocasts as new Point()
             longitude: 103.878813,
             latitude: 1.302505                    
         };
     var mrwPictureSymbol8 = {
          type: "picture-marker",
          url: "rdwork.png",
          width: "20",
          height: "20"
       }
     var mrwPictureGraphic8 = new Graphic({
         geometry: mrwpoint8,
         symbol: mrwPictureSymbol8
       });

     /****Mobile road work moving vehicle data ***/    
     var mrwvehpoint1 = {
             type: "point", // autocasts as new Point()
             longitude: 103.879593,
             latitude:   1.304744                  
         };
     var mrwvehPictureSymbol1 = {
          type: "picture-marker",
          url: "wateringplant.png",
          width: "20",
          height: "20"
       }
     var mrwvehPictureGraphic1 = new Graphic({
         geometry: mrwvehpoint1,
         symbol: mrwvehPictureSymbol1
       });
     view.graphics.addMany([mrwvehPictureGraphic1]);
     /****end of road work moving vehicle data ***/        
     
    featureLayerView = new FeatureLayerView();
	  featureLayerView.filter = new FeatureFilter({
    	  where: "percentile >= 30",
    	  geometry: mrwvehpoint1,
    	  spatialRelationship: "contains",
    	  distance: 10,
    	  units: "miles"
    	});
     view.graphics.addMany([mrwPictureGraphic,mrwPictureGraphic1,mrwPictureGraphic2,mrwPictureGraphic3,mrwPictureGraphic4,mrwPictureGraphic5,mrwPictureGraphic6,mrwPictureGraphic7,mrwPictureGraphic8]);
  /*end of on road closed start and end points icons*/
        
     /*** VMS Message Display **************/
     var pictureGraphicText;
     var seleMsgNo ;
     document.getElementById("mrwVmsMessage").onclick = function() {
      //selected check box
      var b =  document.getElementsByName("irmrwvmssatus").length;
       
	    for(i=0;i<b;i++) {   
         if (document.getElementsByName("irmrwvmssatus")[i].checked) {
          seleMsgNo = i ;
        }
      }
      //selected vms message 
      var details = document.getElementsByName("mrwvmsmsgt");
      var selemsg = details[seleMsgNo].value;
      var sepIndex = selemsg.indexOf("$");
      var mrwvmsMsg = selemsg.substring(0, sepIndex);
      var mrwvmsEqipId = selemsg.substring(sepIndex+1, selemsg.length);
      //VMS Test Message display on the map
      	var textSymbol = {
       type: "text",  // autocasts as new TextSymbol()
       color: "white",
       //haloColor: "black",
       //haloSize: "0px",
       text: "RVM",
       font: {  // autocast as new Font()
         size: 5,
         //family: "Roboto, Helvetica, sans-serif"
         
       }
     };	
		
	if(seleMsgNo==0) {
	 	 var vmspoint1 = {
               type: "point", // autocasts as new Point()
             //  longitude: 103.879066,
             //  latitude: 1.304597                     			 
			 longitude: 103.879158,
			 latitude: 1.3046553
               }; 			     
       vmspictureGraphicText1 = new Graphic({
               geometry: vmspoint1,
               symbol: textSymbol,
               popupTemplate: {
                   // autocasts as new PopupTemplate()
                   title: mrwvmsEqipId,
                   content: mrwvmsMsg
                   	  /* content: [
                   		    {
                   		      type: "fields",
                   		      fieldInfos: [
                   		        {
                   		          fieldName: "roadname",
                   		          label: "Circuit Link "
                   		        } ]
                   		    }
                   		  ] */
                 }
             });
     		view.graphics.addMany([vmspictureGraphicText1]);							
	}
			
			if(seleMsgNo==1) {
	var vmspoint2 = {
               type: "point", // autocasts as new Point()
               longitude: 103.8815355,
                 latitude: 1.306302                     
               }; 		 			   
       vmspictureGraphicText2 = new Graphic({
               geometry: vmspoint2,
               symbol: textSymbol,
               popupTemplate: {
                   // autocasts as new PopupTemplate()
                   title: mrwvmsEqipId,
                   content: mrwvmsMsg
                   	  /* content: [
                   		    {
                   		      type: "fields",
                   		      fieldInfos: [
                   		        {
                   		          fieldName: "roadname",
                   		          label: "Circuit Link "
                   		        } ]
                   		    }
                   		  ] */
                 }
             });
     		view.graphics.addMany([vmspictureGraphicText2]);				
				
			}
     }

     /*** VMS Message Display **************/       
/*** Remove particular vms message */
     document.getElementById("mrwvmsMsgRemoved").onclick = function() { 
      if(seleMsgNo==0) {  
        view.graphics.remove([pictureGraphicText]);
      }
      
     }
/**** End of Remove particular vms message */     

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
	  	 
  