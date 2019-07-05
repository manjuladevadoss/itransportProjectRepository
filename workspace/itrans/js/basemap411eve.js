
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
		
		cctvLayer.visible  = false;
		vmsLayer.visible  = false;
		carriagewayLayer.visible = false;
		map = new Map({
          //center: [103.84347,1.32858],
          layers: [layer,cctvLayer,vmsLayer,carriagewayLayer]
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

        /*Road closed auto line draw */
        var polyline = {
                  type: "polyline", // autocasts as new Polyline()
                  //paths: [[103.871639, 1.305326],[103.871714, 1.305192],[103.872138, 1.304967],[103.872159, 1.304624]]
                  paths: [[103.871517,1.305303],[103.871608,1.305145],[103.871691,1.304968],[103.871777,1.304778]]
                };
                // Create a symbol for drawing the line
                var lineSymbol = {
                  type: "simple-line", // autocasts as SimpleLineSymbol()
                  color: [226, 119, 40],
                  width: 2
                };
                var polylineGraphic = new Graphic({
                  geometry: polyline,
                  symbol: lineSymbol,
                 // attributes: lineAtt,
                  popupTemplate: {
                    // autocasts as new PopupTemplate()
                    title: "Road closed"
                  }
                });
            document.getElementById("rdclose").onclick = function() {
                    view.graphics.addMany([polylineGraphic]);
              }
        /*end of Road closed auto line draw*/


        /*on road closed start and end points icons  */
        //add symbol start and end point
        var rdcloseStpoint = {
            type: "point", // autocasts as new Point()
            longitude: 103.871517,
            latitude: 1.305303                         
            }; 
        var rdcloseStPictureSymbol = {
            type: "picture-marker",
            url: "nocarentry.jpg",
            width: "20",
            height: "20"
          }
        var rdcloseStPictureGraphic = new Graphic({
            geometry: rdcloseStpoint,
            symbol: rdcloseStPictureSymbol
           });
        //end point
        var rdcloseEndpoint = {
            type: "point", // autocasts as new Point()
            longitude: 103.871777,
            latitude: 1.304778                    
            };
            
        var rdcloseEndPictureSymbol = {
            type: "picture-marker",
            url: "nocarentry.jpg",
            width: "20",
            height: "20"
          }
        var rdcloseEndPictureGraphic = new Graphic({
            geometry: rdcloseEndpoint,
            symbol: rdcloseEndPictureSymbol
           });
        // end of add symbol start
        document.getElementById("rdclosepoint").onclick = function() {alert("rd closure symbol");
          view.graphics.addMany([rdcloseStPictureGraphic,rdcloseEndPictureGraphic]);
        }
        /*end of on road closed start and end points icons*/

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


/*VMS Message display on map*/  
        var  vmsEqipId = "";
        var  vmsMessage = "";
        document.getElementById("eveVmsSelect").onclick = function() {
        	var eqipId = document.getElementById("evevmsequipid").innerHTML;
         	var eqipidbefindex = eqipId.indexOf('">');
            var eqipidindex = eqipId.indexOf("</font>");
            vmsEqipId = eqipId.substring(eqipidbefindex+2, eqipidindex);
        	vmsMessage = document.getElementById("eventVmsMsg").value;
        	vmsMsgDisplayOnMap(vmsEqipId, vmsMessage);
        }
        document.getElementById("eveVmsSelect1").onclick = function() {
        	var eqipId = document.getElementById("evevmsequipid1").innerHTML;
         	var eqipidbefindex = eqipId.indexOf('">');
            var eqipidindex = eqipId.indexOf("</font>");
            vmsEqipId = eqipId.substring(eqipidbefindex+2, eqipidindex);
        	vmsMessage = document.getElementById("eventVmsMsg1").value;
        	vmsMsgDisplayOnMap(vmsEqipId, vmsMessage);
        	
        }
        document.getElementById("eveVmsSelect2").onclick = function() {
        	var eqipId = document.getElementById("evevmsequipid2").innerHTML;
         	var eqipidbefindex = eqipId.indexOf('">');
            var eqipidindex = eqipId.indexOf("</font>");
            vmsEqipId = eqipId.substring(eqipidbefindex+2, eqipidindex);
        	vmsMessage = document.getElementById("eventVmsMsg2").value;
        	vmsMsgDisplayOnMap(vmsEqipId, vmsMessage);
        }
        document.getElementById("eveVmsSelect3").onclick = function() {
        	var eqipId = document.getElementById("evevmsequipid3").innerHTML;
         	var eqipidbefindex = eqipId.indexOf('">');
            var eqipidindex = eqipId.indexOf("</font>");
            vmsEqipId = eqipId.substring(eqipidbefindex+2, eqipidindex);
        	vmsMessage = document.getElementById("eventVmsMsg3").value;
        	vmsMsgDisplayOnMap(vmsEqipId, vmsMessage);
        }
        
        /****************/
        function vmsMsgDisplayOnMap(vmsEqipId, vmsMessage) {
        	if(vmsEqipId == "TIP 545862") {
        		alert("1st vmsEqipId : " + vmsEqipId );
        		var textSymbol = {
               	       type: "text",  // autocasts as new TextSymbol()
               	       color: "#202B53",
               	       //haloColor: "black",
               	       //haloSize: "0px",
               	       text: vmsEqipId,
               	       xoffset: 20,
               	       yoffset: 10,
               	       font: {  // autocast as new Font()
               	         size: 12,
               	       //  family: "Roboto, Helvetica, sans-serif"
               	         
               	       }
               	     };	
        		var point3 = {
     	                 type: "point", // autocasts as new Point()
     	                 longitude: 103.879311,
     	                 latitude: 1.304618                     
     	               };
        		var pictureGraphicText = new Graphic({
   	               geometry: point3,
   	               symbol: textSymbol,
   	               popupTemplate: {
   	                   // autocasts as new PopupTemplate()
   	                   title: vmsEqipId,
   	                   content: vmsMessage
   	               }
   	             });
   	     		view.graphics.addMany([pictureGraphicText]);
        	} else {
        		alert("1st vmsEqipId : " + vmsEqipId );
        	}
        	
        	if(vmsEqipId == "TIP 231482") {
        		alert("2nd vmsEqipId : " + vmsEqipId );
        		var textSymbol = {
               	       type: "text",  // autocasts as new TextSymbol()
               	       color: "#202B53",
               	       //haloColor: "black",
               	       //haloSize: "0px",
               	       text: vmsEqipId,
               	       xoffset: 20,
               	       yoffset: 10,
               	       font: {  // autocast as new Font()
               	         size: 12,
               	        // family: "Roboto, Helvetica, sans-serif"
               	         
               	       }
               	     };	
        		var point3 = {
     	                 type: "point", // autocasts as new Point()
     	                 longitude: 103.881558,
     	                 latitude: 1.306139                      
     	               };
        		var pictureGraphicText = new Graphic({
   	               geometry: point3,
   	               symbol: textSymbol,
   	               popupTemplate: {
   	                   // autocasts as new PopupTemplate()
   	                   title: vmsEqipId,
   	                   content: vmsMessage
   	               }
   	             });
   	     		view.graphics.addMany([pictureGraphicText]);
        	}else {
        		alert("1st vmsEqipId : " + vmsEqipId );
        	}
        	
      }
        /*       
          //VMS Test Message display on the map
         */
        
/*end of VMS Mesage display on map*/        
        
/*** undo Reset ***/
        document.getElementById("undo").onclick = function() {
          view.graphics.removeAll();
        }
/*** end of undo Reset ***/
        
/*** Load Cirlce symbol on load ***/
        var circlePoint = {
          type: "point", // autocasts as new Point()
          longitude: 103.876759,
          latitude: 1.305444
        };
        
        var circleMarkerSymbol = {
          type: "simple-marker", // autocasts as new SimpleMarkerSymbol()
          style: "circle", //style: "square",
          size: "300px",
         // color: [226, 119, 40],  // color: "blue",
          outline: {
            color: [0, 162, 232],
            width: 2
          }
        };
        var circlePointGraphic = new Graphic({
          geometry: circlePoint,
          symbol: circleMarkerSymbol
        });
        view.graphics.addMany([circlePointGraphic]);
/*** End Load Cirlce symbol on load  ***/

/*** video display ***/
        window.onload = hideirMsgDiv;
        function hideirMsgDiv() {
        	//Traffic Video
        	var x = document.getElementById("videodiv");
        	x.style.display = "none";
        }

        document.getElementById("video").onclick = function() {
        	  var x = document.getElementById("videodiv");
        	  // To make visible the div
        	  if (x.style.display === "none") {
        		// dragElement(document.getElementById("vmsmsgdiv"));  
        		  popupvideo();
        		 x.style.display = "block";
        	  } else {
        	     x.style.display = "none";    
        	  }       	 
        }
        //Popup  window  to Start Traffic Video
        function popupvideo() {
            //popup window
            var popup = document.getElementById("myPopup");
            popup.classList.toggle("show");
            
            //video in popup window
            var lightBoxVideo = document.getElementById("VisaChipCardVideo");
            lightBoxVideo.play();
        }
        // End of Popup  window 

        //popup window with Video display
        window.document.onkeydown = function(e) {
        	if (!e) {
        		e = event;
        	}
        	if (e.keyCode == 27) {
        		lightbox_close();
        	}
        }

        function lightbox_close() {
        	var lightBoxVideo = document.getElementById("VisaChipCardVideo");
        	lightBoxVideo.pause();
        }
/*** End of popup window with video display       ***/  
        
      
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
	  	  
  