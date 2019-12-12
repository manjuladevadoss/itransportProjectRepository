
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

	        
		map = new Map({
          //center: [103.84347,1.32858],
			 basemap: {
		            baseLayers: [layer]
		          }
          //layers: [layer,cctvLayer,vmsLayer,carriagewayLayer]
        });
		
		
        view = new MapView({
          container: "viewDiv",
          map: map,
        //  center: [103.836862, 1.329735],
		center: [103.857071, 1.357511],
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
		 // xmin: 103.630760,
		  //ymin:  1.266575,
		  xmin: 103.856118,
		  ymin:  1.356026,
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
        view.graphics.addMany([dtCamPictureGraphic1, dtCamPictureGraphic2]);
        view.graphics.addMany([cctvPictureGraphic1, cctvPictureGraphic2, cctvPictureGraphic3]); 
      }
      
      /** ONload Accident Icon */
    	var accPictureGraphic ="";
    	function accIconLocation() {  // Icon display
    	    var accpoint = {
            type: "point", // autocasts as new Point()
            longitude: 103.858249,
            latitude: 1.378062                        
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
          
          //call ccTV with Image and Detection cam with Video
          accCCTVLocation();
          dtCamIconLocation();
      }

       /** Onload Detection Camera Icon */
      var contentAccImage = '<img src="accidentimage.jpg"  style="width:300px;height:100px;">';
      var dtCamPictureGraphic1, dtCamPictureGraphic2;
      function dtCamIconLocation() {  // Icon display
          var dtCamPictureSymbol = {
              type: "picture-marker",
          	url: "DTCam.png",
			width: "26",
			height: "26",
             // xoffset: 5,
              //yoffset: 5
            }
            //Cam 1 
          var dtCamPoint1 = {
              type: "point", // autocasts as new Point()
              longitude: 103.8564699,
              latitude: 1.376076                        
            };                  
          dtCamPictureGraphic1 = new Graphic({
              geometry: dtCamPoint1,
              symbol: dtCamPictureSymbol,
              popupTemplate: {
                // autocasts as new PopupTemplate()
                title: "Accident",
                content: contentAccImage
            }
          });                        
             //Cam 2
          
          var dtCamPoint2 = {
            type: "point", // autocasts as new Point()
            longitude: 103.8579652,
            latitude: 1.3691602                       
          };                    
          dtCamPictureGraphic2 = new Graphic({
            geometry: dtCamPoint2,
            symbol: dtCamPictureSymbol,
          /*  popupTemplate: {
              // autocasts as new PopupTemplate()
              title: "Accident",
              content: "",
          }*/
     
          });    
          view.graphics.addMany([dtCamPictureGraphic1,dtCamPictureGraphic2]);               
        }



      /*** Onload cctv icon ***/
      var contentAccVideo = '<video width="230" height="150"  controls="true" autoplay="1" frameborder="0"><source src=CTEAccVideo.mp4 type=video/mp4></video>';
      var contentTSVideo = '<video width="230" height="150"  controls="true" autoplay="1" frameborder="0"><source src=CTEvideo.mp4 type=video/mp4></video>';
      
    var  cctvPictureGraphic1, cctvPictureGraphic2, cctvPictureGraphic3;
    function accCCTVLocation() {  // Icon display
        var cctvPictureSymbol = {
          type: "picture-marker",
          url: "cctv.PNG",
          width: "25",
          height: "25",
         // xoffset: 5,
         // yoffset: 5
        }
        var cctvpoint1 = {
          type: "point", // autocasts as new Point()
          longitude: 103.8582773,
          latitude: 1.3770134                        
        }; 
        var cctvpoint2 = {
          type: "point", // autocasts as new Point()
          longitude: 103.8587663,
          latitude: 1.3752537                        
        }; 
        var cctvpoint3 = {
          type: "point", // autocasts as new Point()
          longitude: 103.8610203,
          latitude: 1.3698366                        
        }; 

        var contentImage = '<img src="accidentimage.jpg"  style="width:300px;height:100px;">';
        
        cctvPictureGraphic1 = new Graphic({
            geometry: cctvpoint1,
            symbol: cctvPictureSymbol,
     				popupTemplate: {
    						// autocasts as new PopupTemplate()
    						title: "Accident",
    						content: contentAccVideo
    				}
          });
          cctvPictureGraphic2 = new Graphic({
            geometry: cctvpoint2,
            symbol: cctvPictureSymbol,
     				popupTemplate: {
    						// autocasts as new PopupTemplate()
    						title: "Traffic",
    						content: contentTSVideo
    				}
          });
          cctvPictureGraphic3 = new Graphic({
            geometry: cctvpoint3,
            symbol: cctvPictureSymbol,
     				popupTemplate: {
    						// autocasts as new PopupTemplate()
    						title: "Traffic",
    						content: contentTSVideo
    				}
          });
         
          view.graphics.addMany([cctvPictureGraphic1, cctvPictureGraphic2, cctvPictureGraphic3]);
    }	

          });
        