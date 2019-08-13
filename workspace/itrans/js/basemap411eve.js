
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
        // ******************************************************
		
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
		
		//Glide Site
		var glideSiteLayer = new CustomWMSLayer({
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


		var eventLayer = new CustomWMSLayer({
          mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
          mapParameters: {
            SERVICE: "WMS",
            REQUEST: "GetMap",
            FORMAT: "image/png",
            TRANSPARENT: "TRUE",
            STYLES: "gis_eventlayer_style",
            VERSION: "1.3.0",
            LAYERS: "gisdbo_gis_carriageway",
            WIDTH: "{width}",
            HEIGHT: "{height}",
            CRS: "EPSG:{wkid}",
            BBOX: "{xmin},{ymin},{xmax},{ymax}"
          },
          title: "EventLayer"
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
		
		cctvLayer.visible  = false;
		vmsLayer.visible  = false;
		carriagewayLayer.visible = false;
		glideSiteLayer.visible  = false;
		speedLinkLayer.visible = false;
		eventLayer.visible = false;
		detectCamera.visible = false;
		map = new Map({
          //center: [103.84347,1.32858],
		   basemap: {
            baseLayers: [layer,eventLayer]
          },
          layers: [cctvLayer,vmsLayer,glideSiteLayer,speedLinkLayer,detectCamera]
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

   /* Road closed display  */
    document.getElementById("rdclose").onclick = function() {
        eventLayer.visible = true;
    }
    /*end of Road closed auto line draw*/
		
		
/*** Start and end point icon */
    document.getElementById("rdclosepoint").onclick = function() {
         displaySEIcon();
    }
    
	var startEndIconPoints = [
		{"logi": "103.933185","lati": "1.308079"},  
		{"logi": "103.949396","lati": "1.310974"}];
	var iconStartEndGraphic ;
	function displaySEIcon(){
		for (i in startEndIconPoints) { 
			var logi = startEndIconPoints [i].logi ;
			var lati = startEndIconPoints [i].lati ;
			
			//if(i==id) {
			var iconPoint = {
					type: "point", // autocasts as new Point()                   			 
					longitude: logi,
					latitude: lati
				}; 
			var iconStartEndPictureSymbol = {
				  type: "picture-marker",
				  url: "rdclose.png",
				  width: "15",
				  height: "15"
			}		
			iconStartEndGraphic = new Graphic({
				geometry: iconPoint,
				symbol: iconStartEndPictureSymbol 
			});	
			view.graphics.addMany([iconStartEndGraphic]); 
			//}		
		}
	}
/***End of Start and end point icon */

/*** Vms message on map **/

	var vmseqipPoints = [
		{"logi": "103.968971", "lati": "1.3201737"},
		{"logi": "103.9374682", "lati": "1.3100315"},
		{"logi": "103.9152873", "lati": "1.3026633"},
		{"logi": "103.8918387", "lati": "1.2953984"}
    ];
	var tipPictureSymbol = {
		type: "picture-marker",
		url: "TIP_MSG.png",
		width: "20",
		height: "20",
	}
	document.getElementById("vmsids").onclick = function() {
		var eventadvvms = document.getElementsByName("seletedid");
		vmsMsgOnMap(eventadvvms, true);
	}
	
	document.getElementById("vmsactids").onclick = function() {
		var eventactvms = document.getElementsByName("seletedactid");
		vmsMsgOnMap(eventactvms, false);
	}
	function vmsMsgOnMap(eventvms, advmsg){
		view.graphics.removeAll();	
		 for(i=0;i<eventvms.length;i++) {			
			var  str = eventvms[i].value;	
			var word1sep = str.indexOf("$");
			var eveid = str.substring(0, word1sep);
			
			var str1 = str.substring(word1sep+1, str.length);
			var word1sep1 = str1.indexOf("$");
			var evedate = str1.substring(0, word1sep1);
			
			var str2 = str1.substring(word1sep1+1, str1.length);
			var word1sep2 = str2.indexOf("$");
			var evetime = str2.substring(0, word1sep2);
			
			var evemsg = str2.substring(word1sep2+1, str2.length);
			//alert("eveid : " +  eveid + " \evedate : " +  evedate + " \evetime : " +  evetime + " \evemsg : " +  evemsg);
			
			var logi = vmseqipPoints[i].logi;
			var lati = vmseqipPoints[i].lati;
			var textmsg, xoffsetValue, yoffsetValue ;
			if(advmsg) {
				textmsg =  evedate + ' ' + evetime +  '\n' + evemsg;
				xoffsetValue = 0;
				yoffsetValue = 30;
			} else {
				textmsg =   evemsg;
				xoffsetValue = 0;
				yoffsetValue = 20;
			}
			
		var vmspoint = {
				type: "point", // autocasts as new Point()                   			 
				longitude: logi,
				latitude: lati
		}; 
		var vmsTextSymbol = {
		   type: "text",  // autocasts as new TextSymbol()
		   color: "#0018F9",
		   haloColor: "#95C8D8",
		   haloSize: "1px",
		   text: textmsg,
		   xoffset: xoffsetValue,
		   yoffset: yoffsetValue,
		   font: {  // autocast as new Font()
				  size: 8,
				  weight: "bold"
				}
		 };	

		var vmsImagePictureGraphic = new Graphic({
			geometry: vmspoint,
			symbol: tipPictureSymbol,
			popupTemplate: {
				// autocasts as new PopupTemplate()
				title: eveid,
				content: evedate + ' ' +  evetime + '<br><center>' + evemsg
			}
		});

		 
		var eventpictureGraphic = new Graphic({
			geometry: vmspoint,
			symbol: vmsTextSymbol
		});	
			view.graphics.addMany([eventpictureGraphic,vmsImagePictureGraphic]); 				
	}		
}
		

        function vmsMsgDisplayOnMap(vmsEqipId, vmsMessage) {
        	if(vmsEqipId == "TIP 545862") {
        		//alert("1st vmsEqipId : " + vmsEqipId );
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
        		//alert("1st vmsEqipId : " + vmsEqipId );
        	}
        	
        	if(vmsEqipId == "TIP 231482") {
        		//alert("2nd vmsEqipId : " + vmsEqipId );
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
        		//alert("1st vmsEqipId : " + vmsEqipId );
        	}
        	
      }
        /*       
          //VMS Test Message display on the map
         */
        
/*end of VMS Mesage display on map*/        
        
        
/*** Load Cirlce symbol on load ***/
   /*     var circlePoint = {
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
        view.graphics.addMany([circlePointGraphic]);*/
/*** End Load Cirlce symbol on load  ***/

/*** video display ***/

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
	  	  
  