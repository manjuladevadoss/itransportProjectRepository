
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

  		circlelineLayer.visible  = false;
  		mrtstationLayer.visible  = false;
  		mrtbreakdownLayer.visible = false;
  		mrtbreakdowntrafficLayer.visible = false;
		map = new Map({
          //center: [103.84347,1.32858],
          //layers: [layer,circlelineLayer,mrtstationLayer,mrtbreakdownLayer,mrtbreakdowntrafficLayer]
		layers: [layer,circlelineLayer,mrtstationLayer]
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
        longitude: 103.892086,
        latitude: 1.317926                         
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
      	 text: "Paya Lebar",
      	//haloColor: "black",
      	 //haloSize: "1px",
      	 xoffset: 20,
      	 yoffset: 20,
      	 font: {  // autocast as new Font()
      	    size: 8,
      		family: "Roboto, Helvetica, sans-serif",
      		weight: "bold"
      	 }
       };

      var mrtStationPictureGraphic1 = new Graphic({
      	  geometry: mrtcloseStpoint,
      	  symbol: mrtStation1
      	 });

      //end point
      var mrtcloseEndpoint = {
        type: "point", // autocasts as new Point()
        longitude: 103.890246,
        latitude: 1.326583                    
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
      		 text: "MacPherson",
      		 //haloColor: "black",
      		 //haloSize: "1px",
      		 xoffset: 20,
      		 yoffset: 20,
      		 font: {  // autocast as new Font()
      		    size: 8,
      			family: "Roboto, Helvetica, sans-serif",
      			weight: "bold"
      		 }
      	 };

      	var mrtStationPictureGraphic2 = new Graphic({
      		  geometry: mrtcloseEndpoint,
      		  symbol: mrtStation2
      		 });


      document.getElementById("mrtclosepoint").onclick = function() {
      //view.graphics.addMany([mrtcloseStPictureGraphic,mrtcloseEndPictureGraphic,mrtpolylineGraphic]);
      	view.graphics.addMany([mrtcloseStPictureGraphic,mrtStationPictureGraphic1,mrtcloseEndPictureGraphic,mrtStationPictureGraphic2]);
      	drawmrtline();
      }

      // draw mrt line
       function drawmrtline(){
      	 //Draw mrt line start and end point
      	 var mrtpolyline = {
              type: "polyline", // autocasts as new Polyline()
              //paths: [[103.871639, 1.305326],[103.871714, 1.305192],[103.872138, 1.304967],[103.872159, 1.304624]]
              paths: [[103.892086,1.317926],[103.890246,1.326583]]
            };
            // Create a symbol for drawing the line
            var mrtlineSymbol = {
              type: "simple-line", // autocasts as SimpleLineSymbol()
              color: [241, 24, 24],
              width: 2
            };
            var mrtpolylineGraphic = new Graphic({
              geometry: mrtpolyline,
              symbol: mrtlineSymbol,
             // attributes: lineAtt,
              popupTemplate: {
                // autocasts as new PopupTemplate()
                title: "MRT Road closed"
              }
            });
      	  view.graphics.addMany([mrtpolylineGraphic]);
      	drawheavyTrafficline();
      // end mrt line start and end point
       }
       
       //1.306193, 103.882292 (Mountbatten)
       //1.308424, 103.888579 (Dakota)
       
       // draw heavy traffic line because of MRT BreakDown
       function drawheavyTrafficline(){
      	 //Draw mrt line start and end point
      	 var htlpolyline = {
              type: "polyline", // autocasts as new Polyline()
              //paths: [[103.871639, 1.305326],[103.871714, 1.305192],[103.872138, 1.304967],[103.872159, 1.304624]]
              paths: [[103.890123,1.326417],[103.888655,1.325848]]
            };
            // Create a symbol for drawing the line
            var htllineSymbol = {
              type: "simple-line", // autocasts as SimpleLineSymbol()
              color: [129, 31, 30],
              width: 2
            };
            var htlpolylineGraphic = new Graphic({
              geometry: htlpolyline,
              symbol: htllineSymbol,
             // attributes: lineAtt,
              popupTemplate: {
                // autocasts as new PopupTemplate()
                title: "Heavy Traffic",
                content: "Circuit Link"
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
      	  view.graphics.addMany([htlpolylineGraphic]);
       }
       
       
       
      /*MRT closed  on road closed start and end points icons*/
       
       
        /* undo */
        document.getElementById("undo").onclick = function() {
          view.graphics.removeAll();
        }
        /*undo*/
       
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

      });
	  	  
  