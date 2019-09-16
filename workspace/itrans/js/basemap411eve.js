
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

/** Timer functionality */
document.getElementById("26oct").onclick = function() {
	view.graphics.removeAll(); 
	vmsTIPMsgbyTimer('26oct','adMsg','vmsId',true);
}
document.getElementById("27oct").onclick = function() {
	view.graphics.removeAll(); 
	vmsTIPMsgbyTimer('27oct','adMsg','vmsId',true);
}
document.getElementById("02nov").onclick = function() {
	view.graphics.removeAll(); 
	vmsTIPMsgbyTimer('02nov','adMsg','vmsId',true);
}
document.getElementById("03nov").onclick = function() {
	view.graphics.removeAll(); 
	vmsTIPMsgbyTimer('03nov','acMsg','vmsId',true);
}

function vmsTIPMsgbyTimer(seleteddate,selectedmsg,selectedvmsId,timerFlag) {
	var vmsEquiPointsTIP = [
		{"ddate":"26oct","vmsid":"231278","logi": "103.9757038", "lati": "1.3300795","tipimg":"event_ad_img1.JPG"},
		{"ddate":"27oct","vmsid":"635729","logi": "103.97652", "lati": "1.326665","tipimg":"event_ad_img6.JPG"},
		{"ddate":"02nov","vmsid":"324649","logi": "103.968971", "lati": "1.3201737","tipimg":"event_ad_img7.JPG"},
		{"ddate":"02nov","vmsid":"782436","logi": "103.9459272", "lati": "1.3115447","tipimg":"event_ad_img4.JPG"},
		{"ddate":"26oct","vmsid":"983561","logi": "103.9374682", "lati": "1.3100315","tipimg":"event_ad_img5.JPG"},
		{"ddate":"27oct","vmsid":"901482","logi": "103.9236992", "lati": "1.3054055","tipimg":"event_ad_img2.JPG"},
		{"ddate":"27oct","vmsid":"564372","logi": "103.9024259", "lati": "1.2991446","tipimg":"event_ad_img3.JPG"},
		{"ddate":"02nov","vmsid":"546251","logi": "103.8916975", "lati": "1.2957672","tipimg":"event_ad_img8.JPG"},		
		{"ddate":"03nov","vmsid":"231278","logi": "103.9757038", "lati": "1.3300795","tipimg":"event_ac_img1.JPG"},
		{"ddate":"03nov","vmsid":"635729","logi": "103.97652", "lati": "1.326665","tipimg":"event_ac_img6.JPG"},
		{"ddate":"03nov","vmsid":"324649","logi": "103.968971", "lati": "1.3201737","tipimg":"event_ac_img7.JPG"},
		{"ddate":"03nov","vmsid":"782436","logi": "103.9459272", "lati": "1.3115447","tipimg":"event_ac_img4.JPG"},
		{"ddate":"03nov","vmsid":"983561","logi": "103.9374682", "lati": "1.3100315","tipimg":"event_ac_img5.JPG"},
		{"ddate":"03nov","vmsid":"901482","logi": "103.9236992", "lati": "1.3054055","tipimg":"event_ac_img2.JPG"},
		{"ddate":"03nov","vmsid":"564372","logi": "103.9024259", "lati": "1.2991446","tipimg":"event_ac_img3.JPG"},
		{"ddate":"03nov","vmsid":"546251","logi": "103.8916975", "lati": "1.2957672","tipimg":"event_ac_img8.JPG"}
	];
	for(i=0;i<vmsEquiPointsTIP.length;i++) {
		var chkdate = vmsEquiPointsTIP[i].ddate;		
		var logi = vmsEquiPointsTIP[i].logi;
		var lati = vmsEquiPointsTIP[i].lati;			
		var urlTIPImg = vmsEquiPointsTIP[i].tipimg;
		var vmsId = vmsEquiPointsTIP[i].vmsid;
		var ddate = vmsEquiPointsTIP[i].ddate;
		var iconPoint, itpIconpictureSymbol, tipPictureSymbol;
		iconPoint = {
			type: "point", // autocasts as new Point()                   			 
			longitude: logi,
			latitude: lati
		};
		
		//implementation button selection
		if(!timerFlag) {
			if(selectedvmsId==vmsId) {
				if( seleteddate==ddate) {
						itpIconpictureSymbol = {
							type: "picture-marker",
							url: "TIP_MSG.png",
							width: "20",
							height: "20",
						}
						tipPictureSymbol = {
							type: "picture-marker",
							url: urlTIPImg,
							width: "90",
							height: "60",
							xoffset: 0,
							yoffset: 35
						}
						var tipIconGraphic = new Graphic({
							geometry: iconPoint,
							symbol: itpIconpictureSymbol 
						});	
						
		
						var tipGraphic = new Graphic({
							geometry: iconPoint,
							symbol: tipPictureSymbol 
						});	
						view.graphics.addMany([tipGraphic, tipIconGraphic]);
						break;
				}
			}
		}
		
		//from timer button selection
		if(timerFlag) {
			if(seleteddate==chkdate) {
				if(selectedmsg=='adMsg') {			
					itpIconpictureSymbol = {
						type: "picture-marker",
						url: "TIP_MSG.png",
						width: "20",
						height: "20",
					}
					tipPictureSymbol = {
						type: "picture-marker",
						url: urlTIPImg,
						width: "90",
						height: "60",
						xoffset: 0,
						yoffset: 35
					}
				}
				if(selectedmsg=='acMsg') {
					itpIconpictureSymbol = {
						type: "picture-marker",
						url: "TIP_MSG.png",
						width: "20",
						height: "20",
					}
					tipPictureSymbol = {
						type: "picture-marker",
						url: urlTIPImg,
						width: "90",
						height: "60",
						xoffset: 0,
						yoffset: 35
					}
				}
				var tipIconGraphic = new Graphic({
					geometry: iconPoint,
					symbol: itpIconpictureSymbol 
				});	
				var tipGraphic = new Graphic({
					geometry: iconPoint,
					symbol: tipPictureSymbol 
				});	
				view.graphics.addMany([tipGraphic, tipIconGraphic]);
			}
		}
	}
}
/** End of Timer functionality */

/** implement all vms message on display from the rightside advanced message */
document.getElementById("vmsids").onclick = function() {
	view.graphics.removeAll(); 
	var eventadvvms = document.getElementsByName("seletedadid");
	for(j=0;j<eventadvvms.length;j++){
		var  str = eventadvvms[j].value; 
		var word1sep = str.indexOf("$");
		var eveid = str.substring(0, word1sep);
		var evedate = str.substring(word1sep+1, str.length);
		var lower = evedate.toLowerCase();
		var trimDatespace = lower.replace(/\s+/g, "");
		vmsTIPMsgbyTimer(trimDatespace,'adMsg',eveid,false);
	}
}

/** implement all vms message on display from the rightside actual message */
document.getElementById("vmsactids").onclick = function() {
	view.graphics.removeAll(); 
	var eventadvvms = document.getElementsByName("seletedacid");
	for(j=0;j<eventadvvms.length;j++){
		var  str = eventadvvms[j].value; 
		var word1sep = str.indexOf("$");
		var eveid = str.substring(0, word1sep);
		var evedate = str.substring(word1sep+1, str.length);
		var lower = evedate.toLowerCase();
		var trimDatespace = lower.replace(/\s+/g, "");
		vmsTIPMsgbyTimer(trimDatespace,'adMsg',eveid,false);
	}
}


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
	  	  

/* VMS Message display on map after implementation using textsymbol */ 
/* document.getElementById("vmsids").onclick = function() {
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
}  */       
/*end of VMS Message display on map after implementation using textsymbol*/ 