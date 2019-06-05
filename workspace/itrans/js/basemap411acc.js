
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
                   //view.graphics.addMany([polylineGraphic]);
                   accLane();
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
            height: "20",
            xoffset: 10,
            yoffset: 10
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
            height: "20",
            xoffset: 10,
            yoffset: 10
          }
        var rdcloseEndPictureGraphic = new Graphic({
            geometry: rdcloseEndpoint,
            symbol: rdcloseEndPictureSymbol
           });
        // end of add symbol start
        document.getElementById("rdclosepoint").onclick = function() { 
        //	view.graphics.addMany([rdcloseStPictureGraphic,rdcloseEndPictureGraphic]);
        	accIconLocation();
        }
        /*end of on road closed start and end points icons*/

/* Start Accident location point and icon */
  

   function accIconLocation() {  // Icon display
	alert ("Accident location");
	    var accpoint = {
                type: "point", // autocasts as new Point()
                longitude: 103.864490,
                latitude: 1.299949                         
                }; 
            var accPictureSymbol = {
                type: "picture-marker",
                url: "accident.png",
                width: "20",
                height: "20",
                xoffset: 5,
                yoffset: 5
              }
            var accPictureGraphic = new Graphic({
                geometry: accpoint,
                symbol: accPictureSymbol
               });    
            	view.graphics.addMany([accPictureGraphic]);
      }
 function accLane() {  // Lane display 
	 alert ("Accident Lane");
     var accpolyline = {
             type: "polyline", 
             paths: [[103.863729,1.299575],[103.864490,1.300014],[103.866046,1.300883],[103.866765,1.301698]]
           };
           // Create a symbol for drawing the line 
           var acclineSymbol = {
             type: "simple-line", // autocasts as SimpleLineSymbol()
             color: [234,67,53],  //red color code 234,67,53
             width: 2
           };
           var accpolylineGraphic = new Graphic({
             geometry: accpolyline,
             symbol: acclineSymbol,
            // attributes: lineAtt,
             popupTemplate: {
               // autocasts as new PopupTemplate()
               title: "Accident Location"
             }
           });
         view.graphics.addMany([accpolylineGraphic]);
 } 
/*end Accident location point and icon*/        

 /*** VMS Message Display **************/
 document.getElementById("accVmsMessage").onclick = function() {
 	var details = document.getElementById("accMessageDetail").value;
 	var accvmseqipid = document.getElementById("accvmsequipid").innerHTML;
  	var eqipidbefindex = accvmseqipid.indexOf('">');
    //	alert("eqipidbefindex : " + eqipidbefindex);
    var eqipidindex = accvmseqipid.indexOf("</font>");
    var eqipid = accvmseqipid.substring(eqipidbefindex+2, eqipidindex-1);
   	//VMS Test Message display on the map
  	var textSymbol = {
   type: "text",  // autocasts as new TextSymbol()
   color: "#202B53",
   //haloColor: "black",
   //haloSize: "0px",
   text: eqipid,
   xoffset: 20,
   yoffset: 10,
   font: {  // autocast as new Font()
     size: 12,
     family: "Roboto, Helvetica, sans-serif"
     
   }
 };	
	 var point3 = {
             type: "point", // autocasts as new Point()
             longitude: 103.862712,
             latitude: 1.298153                   
           };   
   var pictureGraphicText = new Graphic({
           geometry: point3,
           symbol: textSymbol,
           popupTemplate: {
               // autocasts as new PopupTemplate()
               title: eqipid,
               content: details
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
 		view.graphics.addMany([pictureGraphicText]);
 }

 /*** VMS Message Display **************/ 
 
 
 


        /* undo */
        document.getElementById("undo").onclick = function() {
          view.graphics.removeAll();
        }
        /*undo*/

        /*video display*/

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
        //End of popup window with video display        
        
        
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
	  	  
  