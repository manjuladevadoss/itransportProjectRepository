
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
        layer1 = 
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
          title: "CCTV",
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
		
		/*var othervmsLayer = new CustomWMSLayer({
	          mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
	          mapParameters: {
	            SERVICE: "WMS",
	            REQUEST: "GetMap",
	            FORMAT: "image/png",
	            TRANSPARENT: "TRUE",
	            STYLES: "",
	            VERSION: "1.3.0",
	            LAYERS: "gis_vms_attr_deploy",
	            WIDTH: "{width}",
	            HEIGHT: "{height}",
	            CRS: "EPSG:{wkid}",
	            BBOX: "{xmin},{ymin},{xmax},{ymax}"
	          },
	          title: "Other VMS"
	        })		
		*/
		
		// Carraige way layer
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
		
		/*** Onload event Accident Layer display Red and Orange*/	
		var accidentLayer1 = new CustomWMSLayer({
	          mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
	          mapParameters: {
	            SERVICE: "WMS",
	            REQUEST: "GetMap",
	            FORMAT: "image/png",
	            TRANSPARENT: "TRUE",
	            STYLES: "gis_carriageway_acc_style1",
	            VERSION: "1.3.0",
	            LAYERS: "gisdbo_gis_carriageway",
	            WIDTH: "{width}",
	            HEIGHT: "{height}",
	            CRS: "EPSG:{wkid}",
	            BBOX: "{xmin},{ymin},{xmax},{ymax}"
	          },
	          title: "AccLayer"
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
		
		
  		//Layer draw red,orange,green color lane 
		var cteheavytrafficLayer = new CustomWMSLayer({
            mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
            mapParameters: {
              SERVICE: "WMS",
              REQUEST: "GetMap",
              FORMAT: "image/png",
              TRANSPARENT: "TRUE",
              STYLES: "gis_expressway_cte_heavytraffic_style",
              VERSION: "1.3.0",
              LAYERS: "gis_expressway",
              WIDTH: "{width}",
              HEIGHT: "{height}",
              CRS: "EPSG:{wkid}",
              BBOX: "{xmin},{ymin},{xmax},{ymax}"
            },
            title: "Heavy Traffic"
          });
  		
  		
		//Accident layer lane closed in red color 
		var cteheavytrafficRedLayer = new CustomWMSLayer({
            mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
            mapParameters: {
              SERVICE: "WMS",
              REQUEST: "GetMap",
              FORMAT: "image/png",
              TRANSPARENT: "TRUE",
              STYLES: "gis_expressway_cte_heavytraffic_red_style",
              VERSION: "1.3.0",
              LAYERS: "gis_expressway",
              WIDTH: "{width}",
              HEIGHT: "{height}",
              CRS: "EPSG:{wkid}",
              BBOX: "{xmin},{ymin},{xmax},{ymax}"
            },
            title: "Heavy Traffic Red"
          });
  		
		//Accident layer lane Orange Green color 
		var ctetrafficGreenOrangeLayer = new CustomWMSLayer({
            mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
            mapParameters: {
              SERVICE: "WMS",
              REQUEST: "GetMap",
              FORMAT: "image/png",
              TRANSPARENT: "TRUE",
              STYLES: "gis_expressway_cte_traffic_greenorange_style",
              VERSION: "1.3.0",
              LAYERS: "gis_expressway",
              WIDTH: "{width}",
              HEIGHT: "{height}",
              CRS: "EPSG:{wkid}",
              BBOX: "{xmin},{ymin},{xmax},{ymax}"
            },
            title: "Traffic Flow"
          });
		  
		var cteLayer = new CustomWMSLayer({
            mapUrl: "http://localhost:8088/geoserver/singaporedb/wms",
            mapParameters: {
              SERVICE: "WMS",
              REQUEST: "GetMap",
              FORMAT: "image/png",
              TRANSPARENT: "TRUE",
              STYLES: "gis_expressway_cte_style",
              VERSION: "1.3.0",
              LAYERS: "gis_expressway",
              WIDTH: "{width}",
              HEIGHT: "{height}",
              CRS: "EPSG:{wkid}",
              BBOX: "{xmin},{ymin},{xmax},{ymax}"
            },
            title: "CTE WAY"
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
          title: "TSpeed"
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
          title: "TSpeed2"
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
          title: "TSpeed3"
        });
		
	
		cctvLayer.visible  = false;
		vmsLayer.visible  = false;
		carriagewayLayer.visible = false;
		//cteheavytrafficLayer.visible  = false;
		cteLayer.visible  = false;
		//ctetrafficGreenOrangeLayer.visible = false;
		glideSiteLayer.visible = false;
		detectCamera.visible = false;
		speedLinkLayer.visible = false;
		trafficSpeedLayer1.visible = false;
		trafficSpeedLayer2.visible = false;
		trafficSpeedLayer3.visible = false;
		//othervmsLayer.visible = false;
		map = new Map({
          //center: [103.84347,1.32858],
         // layers: [layer1,cctvLayer,vmsLayer,glideSiteLayer,carriagewayLayer,cteheavytrafficLayer,cteLayer,ctetrafficGreenOrangeLayer,speedLinkLayer]
		  basemap: {
            baseLayers: [layer1,trafficSpeedLayer2,trafficSpeedLayer3]
          },
		  layers: [cctvLayer,vmsLayer,glideSiteLayer,trafficSpeedLayer1,detectCamera]
		});
		
        view = new MapView({
          container: "viewDiv",
          map: map,
         // center: [103.836862, 1.329735],
		   center: [103.859081, 1.372473],

          zoom: 12        
        });
       
        // To draw a line
        draw = new Draw({
          view: view
        });
		view.popup.viewModel.autoOpenEnabled = true;
		view.when(function() {
			//view.extent = layer.fullExtent;
			//view.popupTemplate.visible =true;			
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

			
/*** Onload Speed Layer display */
speedLkLrInterval = setInterval(speedLkLr, 1000);	
//clrspeedLkLrInterval = setInterval(clrspeedLkLr, 2000);	
//speedLayerInterval_1 = setInterval(speedLayer1, 3000);
//clrspeedLayerInterval_1 = setInterval(clrspeedLayer1, 4000);
//speedLayerInterval_2 = setInterval(speedLayer2, 5000);
//clrspeedLayerInterval_2 = setInterval(clrspeedLayer2, 6000);	


var flagSpeed = false;
var flagSpeed1 = false;
var speedLayerInterval_1, speedLayerInterval_2,speedLayerInterval_3
	function speedLkLr(){ 
		if(trafficSpeedLayer1.visible == true){
			flagSpeed = true;	
			speedLayerInterval_1 = setInterval(speedLayer1, 5000);			
		}
	}
	
	function clrspeedLkLr(){
		clearInterval(speedLkLrInterval);
	}	
	
	function speedLayer1(){ 
		if(flagSpeed){		
			trafficSpeedLayer1.visible = false;			
			trafficSpeedLayer2.visible = true;
			flagSpeed1 = true;
			speedLayerInterval_2 = setInterval(speedLayer2, 10000);
		} 
	}
	
	function clrspeedLayer1(){
		clearInterval(speedLayerInterval_1);
	}
	
	function speedLayer2(){
		if(flagSpeed1){
		trafficSpeedLayer2.visible = false;
		trafficSpeedLayer3.visible = true;
		speedLayerInterval_3 = setInterval(clrspeedLayers, 15000);
		}
	}
	
	function clrspeedLayers(){
		clearInterval(speedLayerInterval_1);
		clearInterval(speedLayerInterval_2);
		clearInterval(speedLayerInterval_3);
		trafficSpeedLayer3.visible = false;
	}

/*** Onload Icon display first time*/		
/* Start Accident location point and icon */
accIconLocation();

// Onload CTV display 
accCCTVLocation();

//Onload Detection Camera Icon 
dtCamIconLocation();

//Onload TIP TSP  Icon 
ttpTipIconLocation();

//Onload default and system gen message 
scenarioDefaultVMSOnload()


/*end Accident location point and icon*/   
/*** Onload  VMS and Glide display scenrio1 base messages*/		
	var pictureGraphicSce1List = [];
	var pictureGraphicSce1TraList = [];
	//scenrio1VMSMsgOnMap();
/*** End of Onload event VMS and Glide display scenrio1 base messages*/

var accPictureGraphic ="";
function accIconLocation() {  // Icon display
	    var accpoint = {
                type: "point", // autocasts as new Point()
                longitude: 103.858249, //103.858056,
                latitude: 1.378062  //1.378118                        
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
      }

/*** Onload cctv icon ***/
var cctvPictureGraphic1 ="", cctvPictureGraphic2 ="", cctvPictureGraphic3 ="";
function accCCTVLocation() {  // Icon display
	    var cctvpoint1 = {
                type: "point", // autocasts as new Point()
                longitude: 103.8582773,
                latitude: 1.3770134                        
                }; 
	    var cctvpoint2 = {
                type: "point", // autocasts as new Point()
                longitude:  103.8587663,
                latitude: 1.3752537                         
                }; 
		var cctvpoint3 = {
					type: "point", // autocasts as new Point()
					longitude: 103.8610203,
					latitude: 1.3698366                        
				  }; 
				  
            var cctvPictureSymbol = {
                type: "picture-marker",
                url: "cctv.png",
                width: "25",
                height: "25",
                xoffset: 5,
                yoffset: 5
              }
			var accVideoContent ='<video width="270" height="150" controls="true" autoplay="1" frameborder="0"><source src=accvideo.mp4 type=video/mp4></video>';
			var accVideoTitle = '<font color="#24DEE8" face="Roboto" size="3"><b>Accident</b></font>';
            cctvPictureGraphic1 = new Graphic({
                geometry: cctvpoint1,
                symbol: cctvPictureSymbol,
				popupTemplate: {
						// autocasts as new PopupTemplate()
						title: accVideoTitle,
						content: accVideoContent
				}
			   }); 
			   
			var traSVideoContent ='<video width="270" height="150" controls="true" autoplay="1" frameborder="0"><source src=CTEvideo.mp4 type=video/mp4></video>';
			var traSVideoTitle = '<font color="#24DEE8" face="Roboto" size="3"><b>Traffic</b></font>';			   
            cctvPictureGraphic2 = new Graphic({
                geometry: cctvpoint2,
                symbol: cctvPictureSymbol,
				popupTemplate: {
						// autocasts as new PopupTemplate()
						title: traSVideoTitle,
						content: traSVideoContent
				}
			   }); 			   
			   cctvPictureGraphic3 = new Graphic({
                geometry: cctvpoint3,
                symbol: cctvPictureSymbol,
				popupTemplate: {
						// autocasts as new PopupTemplate()
						title: traSVideoTitle,
						content: traSVideoContent
				}
               }); 			   
            	view.graphics.addMany([cctvPictureGraphic1, cctvPictureGraphic2,cctvPictureGraphic3]);
      }
/*** end of cctv icon ***/	

/** Detection Camera Icon */
		//var dtVideoContent ='';	
	   var dtCamPictureGraphic1, dtCamPictureGraphic2;
	   function dtCamIconLocation() {  // Icon display
		   
		var dtCamPictureSymbol = {
			type: "picture-marker",
			url: "DTCam.PNG",
			width: "25",
			height: "25",
			xoffset: 5,
			yoffset: 5
		  }
		 //Cam 1
		 var dtCamPoint1 = {
                type: "point", // autocasts as new Point()
                longitude: 103.8564699,
                latitude: 1.376076                        
                }; 
	    var dtCamPoint2 = {
                type: "point", // autocasts as new Point()
                longitude:  103.8579652,
                latitude: 1.3691602                         
				}; 

			dtCamPictureGraphic1 = new Graphic({
                geometry: dtCamPoint1,
				symbol: dtCamPictureSymbol,
				popupTemplate: {
					// autocasts as new PopupTemplate()
					title: 'Traffic',
					content: '<video width="270" height="150" controls="true" autoplay="1" frameborder="0"><source src=CTEvideo.mp4 type=video/mp4></video>'
				}
			}); 			   
			
			dtCamPictureGraphic2 = new Graphic({
                geometry: dtCamPoint2,
				symbol: dtCamPictureSymbol,
				popupTemplate: {
					// autocasts as new PopupTemplate()
					title: 'Traffic',
					content: '<video width="270" height="150" controls="true" autoplay="1" frameborder="0"><source src=CTEvideo.mp4 type=video/mp4></video>'
				}
			}); 
	   
		   view.graphics.addMany([dtCamPictureGraphic1,dtCamPictureGraphic2]);               
		 }

/** TTP TSP VMS locations */
function ttpTipIconLocation() {  // Icon display
		//TTP Image 	
		var ttpPictureSymbol = {
                type: "picture-marker",
                url: "TTP_MSG.png",
                width: "20",
                height: "20"
		}
		//TTP Point
		var ttpPoint1 = {
			type: "point", 
			longitude: 103.8553513, 
			latitude: 1.3759417                        
		};     
		var ttpPoint2 = {
			type: "point", 
			longitude: 103.8632314, 
			latitude: 1.3777483                         
		};     
		var ttpPoint3 = {
			type: "point", 
			longitude: 103.8647609, 
			latitude: 1.3705165                         
		};  
		var ttpPoint4 = {
			type: "point", 
			longitude: 103.857499, 
			latitude: 1.3691533                        
		};  
        var ttpPictureGraphic1 = new Graphic({
                geometry: ttpPoint1,
                symbol: ttpPictureSymbol
		}); 	
        var ttpPictureGraphic2 = new Graphic({
			geometry: ttpPoint2,
			symbol: ttpPictureSymbol
		});	
		var ttpPictureGraphic3 = new Graphic({
			geometry: ttpPoint3,
			symbol: ttpPictureSymbol
		});
		var ttpPictureGraphic4 = new Graphic({
			geometry: ttpPoint4,
			symbol: ttpPictureSymbol
		});   
		view.graphics.addMany([ttpPictureGraphic1,ttpPictureGraphic2,ttpPictureGraphic3,ttpPictureGraphic4]);
		//TSP image
		var tipPictureSymbol = {
			type: "picture-marker",
			url: "TIP_MSG.png",
			width: "20",
			height: "20"
		}
		//TSP Point
		var tipPoint1 = {
			type: "point", 
			longitude: 103.8583969, 
			latitude: 1.3615294                         
		};  
		var tipPoint2 = {
			type: "point", 
			longitude: 103.8581904, 
			latitude: 1.383792                        
		};
	
		
		var tipPictureGraphic1 = new Graphic({
			geometry: tipPoint1,
			symbol: tipPictureSymbol
		});
		var tipPictureGraphic2 = new Graphic({
			geometry: tipPoint2,
			symbol: tipPictureSymbol
		});   
		view.graphics.addMany([tipPictureGraphic1,tipPictureGraphic2]);

      }

function endCongestion() {
	view.graphics.removeAll();
	speedLinkLayer.visible  = true;
	accidentLayer1.visible  = false;
	clearInterval(endCongestionTimer);
	//clearInterval(firstCongestionTimer);
	//clearInterval(secondCongestionTimer);
	clearInterval(thirdCongestionTimer);
}
/*** Start congestion Point Creation*/
var congpolylineGraphic1Red,congpolylineGraphic1AmberA1,congpolylineGraphic1AmberA2,congpolylineGraphic1AmberA3, congpolylineGraphic1Ambercte, congpolylineGraphic1Green ;
function firstCongestion(){
// 80% congestion  first stage
/*** Red Line Layer  */
speedLinkLayer.visible  = false;
accidentLayer1.visible = false;
	 var congpolyline1Red = {
	    	  type: "polyline", // autocasts as new Polyline()
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",  //[103.858205, 1.378473],
	    	  paths: [ [103.858056, 1.377817],[103.858577, 1.375705],
	    		       [103.859092, 1.374268],[103.859261, 1.373794],
					   [103.860294, 1.371318],[103.860666, 1.370147], 
					   [103.860859, 1.369010],[103.860766, 1.367917]					    
					   ]					   
	    	};		
   	        conglineSymbol1Red = {
   	          type: "simple-line", 
   	          color: [255,64,0],
   	          width: 2
   	        };		
 			 congpolylineGraphic1Red = new Graphic({
   	          geometry: congpolyline1Red,
   	          symbol: conglineSymbol1Red,
   	        });	
//Amber	      			
// cte to amg ave 3 	
	var congpolyline1AmberA1 = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [
				[103.859895,1.365306], //cte AMg ave to 3
				[103.859981, 1.365778], 
				[103.860110, 1.366207],
				[103.860206, 1.366667], 
				[103.860381, 1.367384], 
				[103.860370, 1.367931], 
				[103.860359, 1.368446], 
				[103.860230, 1.368725], 
				[103.860101, 1.368822],
				[103.859972, 1.368940], 
				[103.859811, 1.369026], 
				[103.859618, 1.369047], 
				[103.859618, 1.369047],
				[103.858994, 1.368985], 
				//  AMg ave 3 to cte
				[103.858216, 1.369018],
				[103.859023, 1.369098], 
				[103.859629, 1.369195], 
				[103.859854, 1.369243], 
				[103.860022, 1.369341], 
				[103.860113, 1.369448], 
				[103.860226, 1.369545], 
				[103.860317, 1.369679], 
				[103.860301, 1.369990], 
				[103.860221, 1.370462], 
				[103.860141, 1.370977], 
				[103.860039, 1.371427]
			]
	    	};		
   	        var conglineSymbol1Amber = {
   	          type: "simple-line", 
   	          color: [255,165,0],
   	          width: 2
   	        };		
 			 congpolylineGraphic1AmberA1 = new Graphic({
   	          geometry: congpolyline1AmberA1,
   	          symbol: conglineSymbol1Amber
   	        });
			
// Amber cte to amg ave 5 		
		 var congpolyline1AmberA2 = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [
					[103.858945, 1.374193], 
					[103.858398, 1.375469], 
					[103.858226, 1.375909], 
					[103.858033, 1.376081], 
					[103.857808, 1.376188], 
					[103.857551, 1.376220], 
					[103.857079, 1.376134], 
					[103.856532, 1.376037]
			]
	    	};			
			 
			 congpolylineGraphic1AmberA2 = new Graphic({
   	          geometry: congpolyline1AmberA2,
   	          symbol: conglineSymbol1Amber
   	        });

// Amber amg ave 5 to cte 		
		 var congpolyline1AmberA3 = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [
					[103.856532, 1.376037], 
					[103.857101, 1.376316], 
					[103.857455, 1.376455], 
					[103.857691, 1.376670], 
					[103.857916, 1.376820], 
					[103.858013, 1.377281] 
					// 
					//[103.858056, 1.378385] 
				]
	    	};			
			 
			 congpolylineGraphic1AmberA3 = new Graphic({
   	          geometry: congpolyline1AmberA3,
   	          symbol: conglineSymbol1Amber
   	        });
// Amber cte 	
			var congpolyline1Ambercte = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [
					[103.860766, 1.367917],[103.860455,1.366662], [103.860026, 1.365675]
				]
	    	};			
			 
			 congpolylineGraphic1Ambercte = new Graphic({
   	          geometry: congpolyline1Ambercte,
   	          symbol: conglineSymbol1Amber
   	        });			
			
			
//Green		
			 var congpolyline1Green = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [ [103.860026, 1.365675],[103.859683, 1.364742], [103.859297,1.363659]
					 ]
	    	};		
   	        var conglineSymbol1Green = {
   	          type: "simple-line", 
   	          color: [0,255,64],
   	          width: 2
   	        };		
 			congpolylineGraphic1Green = new Graphic({
   	          geometry: congpolyline1Green,
   	          symbol: conglineSymbol1Green
   	        });	
			
//Green After accident towards CTE			
			var congpolyline1Greencte2 = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [ [103.858330, 1.384170],[103.858287, 1.385779],[103.858298, 1.381221], [103.858319, 1.380009], [103.858287, 1.379784] 
					 ]
	    	};			
 			congpolylineGraphic1Greencte2 = new Graphic({
   	          geometry: congpolyline1Greencte2,
   	          symbol: conglineSymbol1Green
   	        });
			
			view.graphics.addMany([congpolylineGraphic1Red,congpolylineGraphic1AmberA1,congpolylineGraphic1AmberA2,congpolylineGraphic1AmberA3,congpolylineGraphic1Ambercte, congpolylineGraphic1Green, congpolylineGraphic1Greencte2]);
}
// End of 80% congestion  first stage

// 60% congestion  first stage
function secondCongestion(){
	clearInterval(firstCongestionTimer);

//var congpolylineGraphic1Red,congpolylineGraphic1AmberA1,congpolylineGraphic1AmberA2,congpolylineGraphic1AmberA3,congpolylineGraphic1Ambercte, congpolylineGraphic1Green
	 var congpolyline1Red = {
	    	  type: "polyline", // autocasts as new Polyline()
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel", //[103.858205, 1.378473],
	    	  paths: [ [103.858056, 1.377817],[103.858577, 1.375705],
	    		       [103.859092, 1.374268],[103.859261, 1.373794],
					   [103.860294, 1.371318]
					    ]					   
	    	};		
   	        conglineSymbol1Red = {
   	          type: "simple-line", 
   	          color: [255,64,0],
   	          width: 2
   	        };		
 			 congpolylineGraphic1Red = new Graphic({
   	          geometry: congpolyline1Red,
   	          symbol: conglineSymbol1Red,
   	        });	
//Amber	      			
// cte to amg ave 3 	
	var congpolyline1AmberA1 = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [
				//[103.859895,1.365306], //cte AMg ave to 3
				//[103.859981, 1.365778], 
				//[103.860110, 1.366207],
				[103.860206, 1.366667], 
				[103.860381, 1.367384], 
				[103.860370, 1.367931], 
				[103.860359, 1.368446], 
				[103.860230, 1.368725], 
				[103.860101, 1.368822],
				[103.859972, 1.368940], 
				[103.859811, 1.369026], 
				[103.859618, 1.369047], 
				 
				//  AMg ave 3 to cte
				[103.858216, 1.369018],
				[103.859023, 1.369098], 
				[103.859629, 1.369195], 
				[103.859854, 1.369243], 
				[103.860022, 1.369341], 
				[103.860113, 1.369448], 
				[103.860226, 1.369545], 
				[103.860317, 1.369679], 
				[103.860301, 1.369990], 
				[103.860221, 1.370462], 
				[103.860141, 1.370977], 
				[103.860039, 1.371427]
			]
	    	};		
   	        var conglineSymbol1Amber = {
   	          type: "simple-line", 
   	          color: [255,165,0],
   	          width: 2
   	        };		
 			 congpolylineGraphic1AmberA1 = new Graphic({
   	          geometry: congpolyline1AmberA1,
   	          symbol: conglineSymbol1Amber
   	        });
			
// Amber cte to amg ave 5 		
		 var congpolyline1AmberA2 = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [
					[103.858945, 1.374193], 
					[103.858398, 1.375469], 
					[103.858226, 1.375909], 
					[103.858033, 1.376081], 
					[103.857808, 1.376188], 
					[103.857551, 1.376220], 
					[103.857079, 1.376134], 
					[103.856532, 1.376037]
				]
	    	};						 
			 congpolylineGraphic1AmberA2 = new Graphic({
   	          geometry: congpolyline1AmberA2,
   	          symbol: conglineSymbol1Amber
   	        });

// Amber amg ave 5 to cte 		
		 var congpolyline1AmberA3 = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [
					[103.856532, 1.376037], 
					[103.857101, 1.376316], 
					[103.857455, 1.376455], 
					[103.857691, 1.376670], 
					[103.857916, 1.376820], 
					[103.858013, 1.377281] 
					// 
					//[103.858056, 1.378385] 
				]
	    	};			
			 
			 congpolylineGraphic1AmberA3 = new Graphic({
   	          geometry: congpolyline1AmberA3,
   	          symbol: conglineSymbol1Amber
   	        });
// Amber cte 	
			var congpolyline1Ambercte = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [
					[103.860294, 1.371318],[103.860666, 1.370147],[103.860666, 1.370147], 
					   [103.860859, 1.369010],[103.860766, 1.367917],[103.860766, 1.367917],[103.860455,1.366662] 
				]
	    	};			
			 
			 congpolylineGraphic1Ambercte = new Graphic({
   	          geometry: congpolyline1Ambercte,
   	          symbol: conglineSymbol1Amber
   	        });						
//Green		
			 var congpolyline1Green = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [ [103.860455,1.366662],[103.860026, 1.365675],[103.860026, 1.365675],[103.859683, 1.364742], [103.859297,1.363659]
					 ]
	    	};		
   	        var conglineSymbol1Green = {
   	          type: "simple-line", 
   	          color: [0,255,64],
   	          width: 2
   	        };		
 			congpolylineGraphic1Green = new Graphic({
   	          geometry: congpolyline1Green,
   	          symbol: conglineSymbol1Green
   	        });	

//Green After accident towards CTE			
			var congpolyline1Greencte2 = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [ [103.858330, 1.384170],[103.858287, 1.385779],[103.858298, 1.381221], [103.858319, 1.380009], [103.858287, 1.379784] 
					 ]
	    	};			
 			congpolylineGraphic1Greencte2 = new Graphic({
   	          geometry: congpolyline1Greencte2,
   	          symbol: conglineSymbol1Green
   	        });	
			 		
			view.graphics.addMany([congpolylineGraphic1Red,congpolylineGraphic1AmberA1,congpolylineGraphic1AmberA2,congpolylineGraphic1AmberA3,congpolylineGraphic1Ambercte, congpolylineGraphic1Green,congpolylineGraphic1Greencte2]);
	}
// End of 60% congestion  first stage

// 40% congestion  first stage
function thirdCongestion(){
	clearInterval(secondCongestionTimer);
//var congpolylineGraphic1Red,congpolylineGraphic1AmberA1,congpolylineGraphic1AmberA2,congpolylineGraphic1AmberA3,congpolylineGraphic1Ambercte, congpolylineGraphic1Green
	 var congpolyline1Red = {
	    	  type: "polyline", // autocasts as new Polyline()
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel", //[103.858205, 1.378473],
	    	  paths: [ [103.858056, 1.377817],[103.858577, 1.375705],
	    		       [103.859092, 1.374268]
					    ]					   
	    	};		
   	        conglineSymbol1Red = {
   	          type: "simple-line", 
   	          color: [255,64,0],
   	          width: 2
   	        };		
 			 congpolylineGraphic1Red = new Graphic({
   	          geometry: congpolyline1Red,
   	          symbol: conglineSymbol1Red,
   	        });	
//Amber	      			
// cte to amg ave 3 	
	var congpolyline1AmberA1 = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [
				//[103.859895,1.365306], //cte AMg ave to 3
				//[103.859981, 1.365778], 
				//[103.860110, 1.366207],
				[103.860206, 1.366667], 
				[103.860381, 1.367384], 
				[103.860370, 1.367931], 
				[103.860359, 1.368446], 
				[103.860230, 1.368725], 
				[103.860101, 1.368822],
				[103.859972, 1.368940], 
				[103.859811, 1.369026], 
				[103.859618, 1.369047], 
			]
	    	};
			var conglineSymbol1Green11 = {
   	          type: "simple-line", 
   	          color: [0,255,64], 
   	          width: 2
   	        };		
 			 congpolylineGraphic1Green11 = new Graphic({
   	          geometry: congpolyline1AmberA1,
   	          symbol: conglineSymbol1Green11
   	        });
	var congpolyline1AmberA11 = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [
				//  AMg ave 3 to cte
				[103.858216, 1.369018],
				[103.859023, 1.369098], 
				[103.859629, 1.369195], 
				[103.859854, 1.369243], 
				[103.860022, 1.369341], 
				[103.860113, 1.369448], 
				[103.860226, 1.369545], 
				[103.860317, 1.369679], 
				[103.860301, 1.369990], 
				[103.860221, 1.370462], 
				[103.860141, 1.370977], 
				[103.860039, 1.371427]
			]
	    	};			
   	        var conglineSymbol1Amber = {
   	          type: "simple-line", 
   	          color: [255,165,0],
   	          width: 2
   	        };		
 			 congpolylineGraphic1AmberA1 = new Graphic({
   	          geometry: congpolyline1AmberA11,
   	          symbol: conglineSymbol1Amber
   	        });
			
// Amber cte to amg ave 5 		
		 var congpolyline1AmberA2 = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [
				[103.858945, 1.374193], 
				[103.858398, 1.375469], 
				[103.858226, 1.375909], 
				[103.858033, 1.376081], 
				[103.857808, 1.376188], 
				[103.857551, 1.376220], 
				[103.857079, 1.376134], 
				[103.856532, 1.376037]
			]
	    };			
			 
			 congpolylineGraphic1AmberA2 = new Graphic({
   	          geometry: congpolyline1AmberA2,
   	          symbol: conglineSymbol1Amber
   	        });

// Amber amg ave 5 to cte 		
		 var congpolyline1AmberA3 = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [
					[103.856532, 1.376037], 
					[103.857101, 1.376316], 
					[103.857455, 1.376455], 
					[103.857691, 1.376670], 
					[103.857916, 1.376820], 
					[103.858013, 1.377281] 
					// 
					//[103.858056, 1.378385] 
				]
	    	};			
			 
			 congpolylineGraphic1AmberA3 = new Graphic({
   	          geometry: congpolyline1AmberA3,
   	          symbol: conglineSymbol1Amber
   	        });
// Amber cte 	
			var congpolyline1Ambercte = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [
					[103.859092, 1.374268],[103.859261, 1.373794],[103.859261, 1.373794],
					   [103.860294, 1.371318],[103.860294, 1.371318],[103.860666, 1.370147],[103.860666, 1.370147] 
				]
	    	};			
			 
			 congpolylineGraphic1Ambercte = new Graphic({
   	          geometry: congpolyline1Ambercte,
   	          symbol: conglineSymbol1Amber
   	        });			
		
//Green		
			 var congpolyline1Green = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [	[103.860666, 1.370147],[103.860859, 1.369010],
						[103.860859, 1.369010],[103.860766, 1.367917],
						[103.860766, 1.367917],[103.860455,1.366662], 
						[103.860455,1.366662],[103.860026, 1.365675],
						[103.860026, 1.365675],[103.859683, 1.364742], 
						[103.859297,1.363659]
					 ]
	    	};		
   	        var conglineSymbol1Green = {
   	          type: "simple-line", 
   	          color: [0,255,64],
   	          width: 2
   	        };		
 			congpolylineGraphic1Green = new Graphic({
   	          geometry: congpolyline1Green,
   	          symbol: conglineSymbol1Green
   	        });	

//Green After accident towards CTE			
			var congpolyline1Greencte2 = {
	    	  type: "polyline", 
	    	  style: "short-dot",
	    	  cap: "round",
	          join: "bevel",
	    	  paths: [ [103.858330, 1.384170],[103.858287, 1.385779],[103.858298, 1.381221], [103.858319, 1.380009], [103.858287, 1.379784] 
					 ]
	    	};			
 			congpolylineGraphic1Greencte2 = new Graphic({
   	          geometry: congpolyline1Greencte2,
   	          symbol: conglineSymbol1Green
   	        });	
			view.graphics.addMany([congpolylineGraphic1Red,congpolylineGraphic1AmberA1,congpolylineGraphic1AmberA2,congpolylineGraphic1AmberA3,congpolylineGraphic1Ambercte, congpolylineGraphic1Green,congpolylineGraphic1Greencte2,congpolylineGraphic1Green11]);
	}
// End of 40% congestion  first stage			

 
  
 /*** Implement one VMS Message Display **************/
  var pictureGraphicText,pictureGraphicText00,pictureGraphicText01,pictureGraphicText02;
 document.getElementById("accVmsMessage").onclick = function() {	 
	 var selectedMsgNo;
	 var b =  document.getElementsByName("accvmssatus").length;
	 for(i=0;i<b;i++) {   
		if (document.getElementsByName("accvmssatus")[i].checked) {
		  selectedMsgNo = i ;
	  }
	 }
	ttpTspMessages(selectedMsgNo);
 }

 /*** Implement all VMS Message Display **************/
 document.getElementById("accAllVmsMessage").onclick = function() { 
	var selectedMsgNo;
	var b =  document.getElementsByName("accvmssatus").length;
	for(i=0;i<b;i++) {   
		ttpTspMessages(i);	 
	}
 }


 function ttpTspMessages(selectedMsgNo){

//selected vms message 
var details = document.getElementsByName("accMessageDetail");
var selemsg = details[selectedMsgNo].value;

//selected vms id 
var id = document.getElementsByName("accvmsequipidt");
var seleid = id[selectedMsgNo].value;
var imgattach;
var imgattachSel = selemsg.indexOf('Accident');
if(imgattachSel==0) {
	imgattach =  
		'<svg width="5" height="5"><img src="accimg1.JPG"  width="30px" height="30px"/> <img src="vms5.png"  width="30px" height="30px"/></svg>';
} else {
 	imgattach =  
		'<svg width="5" height="5"><img src="vms4.png"  width="30px" height="30px"/></svg>';		
}
var vmssimpleMarkerSymbol = {
	 type: "simple-marker",
	 color: [32,43,83],  // orange
	 outline: {
	   color: [32,43,83], // white
	   width: 0.5
	 }
   };
 var PictureSymbol00 = {
	 type: "picture-marker",
	 url: "TTP_MSG.png",
	 width: "20",
	 height: "20",
 }
 
 var appendStr1 = '<font color="#24DEE8" face="Roboto" size="3"><b>' ;
 var appendStr2 ='</b></font>'	
 var appendStr3 = '<font color="black" face="Roboto" size="3"><b><center>' ;
 var appendStr4 ='</center></b></font>'
 
 var seleidFormat =  appendStr1 + seleid + appendStr2;
 var selemsgFormat = appendStr3 + selemsg + appendStr4;
var msgpoint ;
 if(selectedMsgNo==0) {
	msgpoint = getLatiLongi(selectedMsgNo);
   	pictureGraphicText00 = new Graphic({
	geometry: msgpoint,
	symbol: PictureSymbol00,
	popupTemplate: {
		 // autocasts as new PopupTemplate()
		 title: seleidFormat,
		 /*actions: [
			 {
			   image: "rvms_normal.png",
			   title: "img"
			 }
		   ], */			
		 content: selemsgFormat + '<br><center>' + imgattach + '<center>'
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
   view.graphics.addMany([pictureGraphicText00]);
 }
if(selectedMsgNo==1) {
	msgpoint = getLatiLongi(selectedMsgNo);	
	pictureGraphicText01 = new Graphic({
	geometry: msgpoint,
	symbol: PictureSymbol00,
	popupTemplate: {
		 title: seleidFormat,
		 content: selemsgFormat  + '<br><center>' + imgattach + '<center>'
	   }
   });
   view.graphics.addMany([pictureGraphicText01]);
 }
 if(selectedMsgNo==2) {
	msgpoint = getLatiLongi(selectedMsgNo);			 
	pictureGraphicText02 = new Graphic({
	geometry: msgpoint,
	symbol: PictureSymbol00,
	popupTemplate: {
		 // autocasts as new PopupTemplate()
		 title: seleidFormat,
		 content: selemsgFormat + '<br><center>' + imgattach + '<center>'
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
   view.graphics.addMany([pictureGraphicText02]);
 }
 if(selectedMsgNo==3) { 
	msgpoint = getLatiLongi(selectedMsgNo);
    pictureGraphicText03 = new Graphic({
	geometry: msgpoint,
	symbol: PictureSymbol00,
	popupTemplate: {
		// autocasts as new PopupTemplate()
		title: seleidFormat,
		content: selemsgFormat + '<br><center>' + imgattach + '<center>'
	  }
  });
 view.graphics.addMany([pictureGraphicText03]);
  }
  
  //TSP Message Start here
  var PictureSymbol01 = {
	 type: "picture-marker",
	 url: "TIP_MSG.png",
	 width: "20",
	 height: "20",
 }
 if(selectedMsgNo==4) { 
	msgpoint = getLatiLongi(selectedMsgNo);
	pictureGraphicText04 = new Graphic({
	geometry: msgpoint,
	symbol: PictureSymbol01,
	popupTemplate: {
		  // autocasts as new PopupTemplate()
		  title: seleidFormat,
		  content: selemsgFormat + '<br><center>' + imgattach + '<center>'
		}
	});
   view.graphics.addMany([pictureGraphicText04]);
 }
 if(selectedMsgNo==5) { 
	msgpoint = getLatiLongi(selectedMsgNo); 
	pictureGraphicText05 = new Graphic({
	geometry: msgpoint,
	symbol: PictureSymbol01,
	popupTemplate: {
		  // autocasts as new PopupTemplate()
		  title: seleidFormat,
		  content: selemsgFormat + '<br><center>' + imgattach + '<center>'
		}
	});
   view.graphics.addMany([pictureGraphicText05]);
 }

 }

 //Remove VMS Message
document.getElementById("remAccVmsMessage").onclick = function() {
	view.graphics.removeAll();
	accIconLocation();
	accCCTVLocation();
	dtCamIconLocation();
	ttpTipIconLocation();
}
 /*** End of VMS Message Display **************/ 

/*** scenario 1 VMS  ***/
	//VMS messages Display
	var firstCongestionTimer;;
	var secondCongestionTimer;
	var thirdCongestionTimer;
	var endCongestionTimer;
	/*var pictureGraphicSce1List = [];*/
	var pictureGraphicSce1TraList = [];
	var viewFlagS1;
	document.getElementById("sce1ImpliId").onclick = function() { 
		
		//scenrio1VMSMsgView();
		//Traffic Light
		view.graphics.removeAll();
		accidentLayer1.visible = false;
		trafficLight();
		accIconLocation();
		accCCTVLocation();
		dtCamIconLocation();
		viewFlagS1 = true;
		scenrio1VMSMsgOnMap();
		congestionAreaDisplayonMap();
	}
	
	
	document.getElementById("sce1VmsView").onclick = function() { 
		view.graphics.removeAll();
		accIconLocation();
		accCCTVLocation();
		dtCamIconLocation();
		trafficLight();
		//scenrio1VMSMsgView();
		scenrio1VMSMsgOnMap();		
	}

	function scenrio1VMSMsgView() {
		var scenario1List = document.getElementsByName("scenario1List");
		var PictureSymbolTTP = {
		type: "picture-marker",
		url: "TTP_MSG.png",
		width: "20",
		height: "20",
	}
    var PictureSymbolTIP = {
		type: "picture-marker",
		url: "TIP_MSG.png",
		width: "20",
		height: "20",
	}
	  var j =0;
		for(i=0;i<scenario1List.length;i++) {		
			var  str = scenario1List[i].value;	
			var word1sep = str.indexOf("$");
			var sce1VmsId = str.substring(0, word1sep);
			var str2 = str.substring(word1sep+1, str.length);
			
			var word2sep = str2.indexOf("$");
			var sce1Vmsmsg = str2.substring(0, word2sep);
			var str3 = str2.substring(word2sep+1, str2.length);
			
			var imgattachsce ="";
			var imgattachSel = sce1Vmsmsg.indexOf('Accident');
			if(imgattachSel==0) {
				imgattachsce =  
				'<svg width="10" height="10"><img src="accimg1.JPG"  width="30px" height="30px"/> <img src="vms5.png"  width="30px" height="30px"/></svg>';
			} else {
				imgattachsce =  
					'<svg width="10" height="10"><img src="vms4.png"  width="30px" height="30px"/></svg>';		
			}
			
			var word3sep = str3.indexOf("$");
			var longi = str3.substring(0, word3sep);
			var ladi = str3.substring(word3sep+1, str3.length);
			//alert("id: " + sce1VmsId + " / msg: " + sce1Vmsmsg + " / ladi: " + ladi + " / longi: " + longi); 
			var vmsIdMsg = {
        		type: "text",  // autocasts as new TextSymbol()
        		 color: "#202B53",
        		 text: sce1VmsId,
        		 haloColor: "black",
        		 //haloSize: "1px",
        		 xoffset: 4,
        		 yoffset: 10,
        		 font: {  // autocast as new Font()
        		    size: 8,
        			weight: "bold"
        		 }
        	 };
			
			var pointSce1 = {
				type: "point", // autocasts as new Point()
				longitude: longi,
				latitude: ladi                   
			}; 
			var PictureSymbolvms;
			if(i<4) {
				PictureSymbolvms = PictureSymbolTTP;
			}else {
				PictureSymbolvms = PictureSymbolTIP; 
			}	
//Picture graphics
			var pictureGraphicSce1 = new Graphic({
				geometry: pointSce1,
				symbol: PictureSymbolvms,
				popupTemplate: {
					// autocasts as new PopupTemplate()
					title: sce1VmsId,
					content: sce1Vmsmsg + '<br><center>' + imgattachsce + '<center>'
				  }
			  });
			  
// text vmsid
			var pictureGraphicSce1vmsid; /* = new Graphic({
				geometry: pointSce1,
				symbol: vmsIdMsg,
			  });*/
			  
			 /* pictureGraphicSce1List[j] = pictureGraphicSce1;
			  j = j+1;
			  pictureGraphicSce1List[j] = pictureGraphicSce1vmsid;
			  j = j+1;*/
			  view.graphics.addMany([pictureGraphicSce1/*, pictureGraphicSce1vmsid*/]);	
		}
		
		//Traffic Light
		trafficLight();
	}
	
	function congestionAreaDisplayonMap()  {
		firstCongestionTimer = setInterval(firstCongestion, 1000);	
		secondCongestionTimer = setInterval(secondCongestion, 8000);	
		thirdCongestionTimer = setInterval(thirdCongestion, 12000);	
		endCongestionTimer = setInterval(endCongestion, 18000);					
	}

	//VMS messages Remove
	document.getElementById("sce1ImpliIdRemove").onclick = function() {  
		view.graphics.removeAll();
		clearInterval(firstCongestionTimer);
		clearInterval(secondCongestionTimer);
		clearInterval(thirdCongestionTimer);
		clearInterval(endCongestionTimer);
		view.graphics.addMany([accPictureGraphic]);	
		accIconLocation();
		accCCTVLocation();
		dtCamIconLocation();
		ttpTipIconLocation();		
	}
/*** End of scenario 1 VMS messages  ***/

/*** scenario 2 VMS  ***/
	//VMS messages Display
	var viewFlagS2 = false;
	document.getElementById("sce2ImpliId").onclick = function() { 
		view.graphics.removeAll();
		speedLinkLayer.visible  = false;	
		accIconLocation();
		viewFlagS2 = true;
		
		accCCTVLocation();
		congestionAreaDisplayonMap();
		scenrio2VMSMsgView();
	}
	
	document.getElementById("sce2VmsView").onclick = function() {
 		view.graphics.removeAll();
		accIconLocation();
		scenrio2VMSMsgView();
		accCCTVLocation();	
	}
	
	function scenrio2VMSMsgView() {
		var vmsCurrMsg2Arr = ['Jam at Amk Ave3', 'Jam at Amk Ave5', 'Jam at Amk Ave3', 'Jam at Amk Ave5', 
							  'Jam at Amk Ave3', 'Jam at Amk Ave5', 'Jam at Amk Ave3', 'Jam at Amk Ave5',
							  'Jam at Amk Ave3', 'Jam at Amk Ave5', 'Jam at Amk Ave3', 'Jam at Amk Ave5', 
							  'Jam at Amk Ave3', 'Jam at Amk Ave5', 'Jam at Amk Ave3', 'Jam at Amk Ave5'];
		speedLinkLayer.visible  = false;	
		view.graphics.addMany(accPictureGraphic);
		var scenario2List = document.getElementsByName("scenario2List");
		var PictureSymbolSce2TTP = {
				type: "picture-marker",
				url: "TTP_MSG.png",
				width: "20",
				height: "20",
			}
		    var PictureSymbolSce2TIP = {
				type: "picture-marker",
				url: "TIP_MSG.png",
				width: "20",
				height: "20",
			}
			var j =0;
			var count=0;
		for(i=0;i<scenario2List.length;i++) {
			var  str = scenario2List[i].value;	
			var word1sep = str.indexOf("$");
			var sce1VmsId = str.substring(0, word1sep);
			var str2 = str.substring(word1sep+1, str.length);
			
			var word2sep = str2.indexOf("$");
			var sce1Vmsmsg = str2.substring(0, word2sep);
			var str3 = str2.substring(word2sep+1, str2.length);
			
			var imgattachsce ="";
			var imgattachSel = sce1Vmsmsg.indexOf('Accident');
			if(imgattachSel==0) {
				imgattachsce =  
				'<svg width="10" height="10"><img src="accimg1.JPG"  width="30px" height="30px"/> <img src="vms5.png"  width="30px" height="30px"/></svg>';
			} else {
				imgattachsce =  
					'<svg width="10" height="10"><img src="vms4.png"  width="30px" height="30px"/></svg>';		
			}

			var word3sep = str3.indexOf("$");
			var longi = str3.substring(0, word3sep);
			var ladi = str3.substring(word3sep+1, str3.length);
			//alert("id: " + sce1VmsId + " / msg: " + sce1Vmsmsg + " / ladi: " + ladi + " / longi: " + longi); 
			
			var sce2VmsImgCP = getScenario2VMSMessages(i);
			var sce2VmsImgPro = getScenario2VMSMessagesPro(i);
			var PictureSymbolSce2vms;
			if(i<4) {
				PictureSymbolSce2vms = PictureSymbolSce2TTP;
			}else {
				PictureSymbolSce2vms = PictureSymbolSce2TIP; 
			}
					
			var pointSce2 = {
				type: "point", // autocasts as new Point()
				longitude: longi,
				latitude: ladi                   
			  }; 
						
			  var pictureGraphicSce2 = new Graphic({
				geometry: pointSce2,
				symbol: PictureSymbolSce2vms,
				popupTemplate: {
					// autocasts as new PopupTemplate()
					title: sce1VmsId,
					content: sce1Vmsmsg + '<br><center>' +  imgattachsce + '<center>'
				  }
			  });
	  
			  var pictureGraphicSce2vmsCP = new Graphic({
				geometry: pointSce2,
				symbol: sce2VmsImgCP,
			  });

			  var pictureGraphicSce2vmsPro = new Graphic({
				geometry: pointSce2,
				symbol: sce2VmsImgPro,
			  });
			  
			if(viewFlagS2) {
					view.graphics.addMany([pictureGraphicSce2,pictureGraphicSce2vmsPro]);		  
			  }
			  else {
				   view.graphics.addMany([pictureGraphicSce2,pictureGraphicSce2vmsCP]);		  
			  }

			  
		}
	}

/** get vmsMessage Images for Scenario2 Current and Proposed Messaages */
function getScenario2VMSMessages(selectedMsgNo) {
	var vmsSce1MsgSymbol
	if(selectedMsgNo==0) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img101_s2cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==1){ 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img102_s2cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==2) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img103_s2cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==3) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img104_s2cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==4) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img105_s2cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==5) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img106_s2cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==6) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img107_s2cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==7) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img108_s2cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==8) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img109_s2cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	return vmsSce1MsgSymbol
}



/** get vmsMessage Images for Scenario2 Proposed Messaages */
function getScenario2VMSMessagesPro(selectedMsgNo) {
	var vmsSce1MsgSymbol
	if(selectedMsgNo==0) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img101_s2p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==1){ 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img102_s2p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==2) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img103_s2p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==3) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img104_s2p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==4) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img105_s2p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==5) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img106_s2p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==6) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img107_s2p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==7) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img108_s2p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==8) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img109_s2p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	return vmsSce1MsgSymbol
}

	//VMS messages Remove
	document.getElementById("sce2ImpliIdRemove").onclick = function() {  
		view.graphics.removeAll();
		clearInterval(firstCongestionTimer);
		clearInterval(secondCongestionTimer);
		clearInterval(thirdCongestionTimer);
		clearInterval(endCongestionTimer);
		view.graphics.addMany([accPictureGraphic]);
		accIconLocation();
		accCCTVLocation();
		dtCamIconLocation();
		ttpTipIconLocation();
	}
/*** End of scenario 2 VMS messages  ***/


view.popup.autoOpenEnabled = true;

/*view.on("click", function(event) {
  view.popup.open({
    // Set the popup
  });
});*/

/***Draw Accident layer onload event on the map**/
var pictureGraphicSce1vmsCurrMsg;
function scenrio1VMSMsgOnMap() {
	var vmsCurrMsg1Arr = ['Jam at Amk Ave3','Jam at Amk Ave5','Jam at Amk Ave3',
						  'Jam at Amk Ave5','Jam at Amk Ave3','Jam at Amk Ave5',
						  'Jam at Amk Ave3','Jam at Amk Ave5','Jam at Amk Ave3',
						  'Jam at Amk Ave5','Jam at Amk Ave3','Jam at Amk Ave5'];
		var scenario1List = document.getElementsByName("scenario1List");
		var PictureSymbolTTP = {
		type: "picture-marker",
		url: "TTP_MSG.png",
		width: "20",
		height: "20",
	}
    var PictureSymbolTIP = {
		type: "picture-marker",
		url: "TSP_MSG.png",
		width: "20",
		height: "20",
	}
	  var j=0;
	  var count=0;
		for(i=0;i<scenario1List.length;i++) {	
			var  str = scenario1List[i].value;	
			var word1sep = str.indexOf("$");
			var sce1VmsId = str.substring(0, word1sep);
			var str2 = str.substring(word1sep+1, str.length);
			
			var word2sep = str2.indexOf("$");
			var sce1Vmsmsg = str2.substring(0, word2sep);
			var str3 = str2.substring(word2sep+1, str2.length);
			
			var imgattachsce ="";
			var imgattachSel = sce1Vmsmsg.indexOf('Accident');
			if(imgattachSel==0) {
				imgattachsce =  
				'<svg width="10" height="10"><img src="accimg1.JPG"  width="30px" height="30px"/> <img src="vms5.png"  width="30px" height="30px"/></svg>';
			} else {
				imgattachsce =  
					'<svg width="10" height="10"><img src="vms4.png"  width="30px" height="30px"/></svg>';		
			}			
			var word3sep = str3.indexOf("$");
			var longi = str3.substring(0, word3sep);
			var ladi = str3.substring(word3sep+1, str3.length);
			//alert("id: " + sce1VmsId + " / msg: " + sce1Vmsmsg + " / ladi: " + ladi + " / longi: " + longi); 
			

			var sce1VMSImage = getScenario1VMSMessages(i);
			var sce1VMSImagePro = getScenario1VMSMessagesPro(i);

// Lati Longi Points			  
			var pointSce1 = {
				type: "point", // autocasts as new Point()
				longitude: longi,
				latitude: ladi                   
			  }; 
			var PictureSymbolvms;
					if(i<4) {
						PictureSymbolvms = PictureSymbolTTP;
					}else {
						PictureSymbolvms = PictureSymbolTIP; 
					}	
//Picture graphics
			var pictureGraphicSce1 = new Graphic({
				geometry: pointSce1,
				symbol: PictureSymbolvms,
				popupTemplate: {
					// autocasts as new PopupTemplate()
					title: sce1VmsId,
					content: sce1Vmsmsg + '<br><center>' + imgattachsce + '<center>'
				  }
			  });		  

//current and proposed image with id			  
  		    var pictureGraphicSce1vmsCPImg = new Graphic({
				geometry: pointSce1,
				symbol: sce1VMSImage,
			  });

//proposed image with id			  
			var pictureGraphicSce1vmsPImg = new Graphic({
				geometry: pointSce1,
				symbol: sce1VMSImagePro,
			  });


			  if(viewFlagS1) {
				view.graphics.addMany([pictureGraphicSce1,pictureGraphicSce1vmsPImg]);					
			  }
			  else {
				view.graphics.addMany([pictureGraphicSce1,pictureGraphicSce1vmsCPImg]);		
			  }
		}
		
		//Traffic Light
		//trafficLight();
	}
/*** End of Accident layer onload event on the map **/ 

/*** Traffic Light glide   **/
 function trafficLight() {
	// var color1 = [97, 255, 0];
		//var color2 = [208, 187, 0];
		//var color3 = [232, 58, 58];
		var scenario1TrafficList = document.getElementsByName("scenario1TrafficList");

		for(i=0;i<scenario1TrafficList.length;i++) {
			
			var  str = scenario1TrafficList[i].value;	
			var word1sep = str.indexOf("$");
			var longi1 = str.substring(0, word1sep);
			
			var lati1 = str.substring(word1sep+1, str.length);
			//alter("longi1 : " + longi1 + "/lati1 : " + lati1);
			
			if(i==0) {
				  var sce1TraPictureSymbol = {
							type: "picture-marker",
							url: "glide_green.png",
							width: "20",
							height: "20",
						};
			}
			if(i==1) {
				  var sce1TraPictureSymbol = {
							type: "picture-marker",
							url: "glide_green.png",
							width: "20",
							height: "20",
						};
				}
			if(i==2) {
				  var sce1TraPictureSymbol = {
							type: "picture-marker",
							url: "glide_red.png",
							width: "20",
							height: "20",
						};
				}
			
			var pointSce1Tra = {
					type: "point", // autocasts as new Point()
					longitude: longi1,
					latitude: lati1                  
				  }; 
							
			var pictureGraphicSce1Tra = new Graphic({
				geometry: pointSce1Tra,
				symbol: sce1TraPictureSymbol,
		    });	
		 pictureGraphicSce1TraList[i] = pictureGraphicSce1Tra;
		 view.graphics.addMany([pictureGraphicSce1Tra]);				  				  
		}
 }
 /*** End of Traffic Light glide   **/

 /** get vmsMessage Images for default msg*/
function getScenarioDefaultVMSMessages(selectedMsgNo) {
	var vmsDefaultMsgSymbol
	if(selectedMsgNo==0) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsDefaultMsgSymbol = {
			type: "picture-marker",
			url: "img101.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==1){ 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsDefaultMsgSymbol = {
			type: "picture-marker",
			url: "img102.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==2) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsDefaultMsgSymbol = {
			type: "picture-marker",
			url: "img103.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==3) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsDefaultMsgSymbol = {
			type: "picture-marker",
			url: "img104.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==4) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsDefaultMsgSymbol = {
			type: "picture-marker",
			url: "img105.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==5) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsDefaultMsgSymbol = {
			type: "picture-marker",
			url: "img106.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	return vmsDefaultMsgSymbol
}

/** get vmsMessage Images for Scenario1 Proposed Messaages */
function getScenario1VMSMessagesPro(selectedMsgNo) {
	var vmsSce1MsgSymbol
	if(selectedMsgNo==0) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img101_s1p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==1){ 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img102_s1p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==2) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img103_s1p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==3) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img104_s1p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==4) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img105_s1p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==5) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img106_s1p.JPG",
			width: "150",
			height: "40",
			xoffset: 0,
			yoffset: 30,
		};
	}
	return vmsSce1MsgSymbol
}

/** get vmsMessage Images for Scenario1 Current and Proposed Messaages */
function getScenario1VMSMessages(selectedMsgNo) {
	var vmsSce1MsgSymbol
	if(selectedMsgNo==0) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img101_s1cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==1){ 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img102_s1cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==2) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img103_s1cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==3) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img104_s1cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==4) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img105_s1cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	if(selectedMsgNo==5) { 
		//urlImage = "img101.JPG";
		//alert ("urlImage : " +  urlImage);
		vmsSce1MsgSymbol = {
			type: "picture-marker",
			url: "img106_s1cp.JPG",
			width: "150",
			height: "50",
			xoffset: 0,
			yoffset: 30,
		};
	}
	return vmsSce1MsgSymbol
}

 /** get Lati and Longi for vms equiments */
 function getLatiLongi(selectedMsgNo){
	 var msgpoint;
	if(selectedMsgNo==1) {
		msgpoint = {
		 type: "point", // autocasts as new Point()
		 longitude: 103.8632314,
		 latitude: 1.3777483                   
	   };
	}
	 if(selectedMsgNo==2) {
		msgpoint = {
		 type: "point", // autocasts as new Point()
		 longitude: 103.8647609,
		 latitude: 1.3705165                   
	   }; 
	}
	
	 if(selectedMsgNo==4) { 
		  msgpoint = {
		   type: "point", // autocasts as new Point()
		   longitude: 103.8583969, 
		   latitude: 1.3615294                   
		 }; 
	}	 
	 if(selectedMsgNo==5) { 
	   msgpoint = {
		   type: "point", // autocasts as new Point()
		   longitude: 103.8581904, 
		   latitude: 1.383792                  
		 }; 
	}
	
	 if(selectedMsgNo==3) { 
		msgpoint = {
		 type: "point", // autocasts as new Point()
		 longitude: 103.857499,
		 latitude: 1.3691533                   
	   }; 
	}
	 if(selectedMsgNo==0) {
		msgpoint = {
		 type: "point", // autocasts as new Point()
		 longitude: 103.8553513,
		 latitude: 1.3759417                  
	   }; 
	}
	return msgpoint;
 }

//onload to show default and current msg(system generated new message)
function scenarioDefaultVMSOnload() {
	
	var vmsdefaultMsg1Arr = [
		' Jam at Amk Ave3',' Jam at Amk Ave5',' Jam at Amk Ave3',
		' Jam at Amk Ave5',' Jam at Amk Ave3',' Jam at Amk Ave5',
	];
	
	var defaultMSgList = document.getElementsByName("defaultMSgList");
	var count = 0 ;
	for(i=0;i<defaultMSgList.length;i++) {
		var  str = defaultMSgList[i].value;	
		var word1sep = str.indexOf("$");
		var currVmsId = str.substring(0, word1sep);
		var currVmsmsg = str.substring(word1sep+1, str.length);
		
		var selectedMsgNo = i;
		var msgpoint = getLatiLongi(selectedMsgNo);
		var msgImage = getScenarioDefaultVMSMessages(selectedMsgNo);
		console.log("msgpoint" + msgpoint);

	var pictureGraphicSystemMsg = new Graphic({
		geometry: msgpoint,
		symbol: msgImage,
	}) 
		view.graphics.addMany([pictureGraphicSystemMsg]);		  	  
	}

}


 /*** Obu Message display on the Map */
var obuGuideMsgPicGraText = "";
var obuJamPicGraText = ""
var obuAlertPicGraText = "";
document.getElementById("buttonImpFail").onclick = function() { 
 /*view.graphics.remove(obuGuideMsgPicGraText);
 view.graphics.remove(obuJamPicGraText);
 view.graphics.remove(obuAlertPicGraText); */
}

document.getElementById("buttonRem").onclick = function() { 
}	 

});

//OBU Messages		
/*
	 var obuAlertMsg = document.getElementById("obuAlertTxtId").innerHTML;
	 var obuJamMsg = document.getElementById("obuJamTxtId").innerHTML;
	 var obuGuideMsg = document.getElementById("obuGuideTxtId").innerHTML;
//guide Message Location
 var obuGuideMsgpoint = {
	        type: "point", // autocasts as new Point()
	        longitude: 103.859971, //green guide Message Location
	        latitude: 1.365964                   
	      }; 
 var obuGuideMsgSymbol = {
 		type: "text",  // autocasts as new TextSymbol()
 		 color: "green",
 		 text: obuGuideMsg,
 		 haloColor: "#000000",
 		 haloSize: "1px",
 		 xoffset: 20,
 		 yoffset: 20,
 		 font: {  // autocast as new Font()
 		    size: 10,
 			weight: "bold"
 		 }
 	 };   
    obuGuideMsgPicGraText = new Graphic({
	       geometry: obuGuideMsgpoint,
	       symbol: obuGuideMsgSymbol
	     });	    
		view.graphics.addMany([obuGuideMsgPicGraText]);
	
 //Jam Message Location
 var obuJamMsgpoint = {
	        type: "point", // autocasts as new Point()
	        longitude: 103.859426, //Orange Jam Message Location
	        latitude: 1.373439                  
	      }; 
 var obuJamMsgSymbol = {
 		type: "text",  // autocasts as new TextSymbol()
 		 color: "orange",
 		 text: obuJamMsg,
 		 haloColor: "#000000",
 		 haloSize: "1px",
 		 xoffset: 20,
 		 yoffset: 20,
 		 font: {  // autocast as new Font()
 		    size: 10,
 			weight: "bold"
 		 }
 	 }; 
   obuJamPicGraText = new Graphic({
	       geometry: obuJamMsgpoint,
	       symbol: obuJamMsgSymbol
	     });
		 
		 view.graphics.addMany([obuJamPicGraText]);		
		
 //Alert Message Location
 var obuAlertMsgpoint = {
	        type: "point", // autocasts as new Point()
	        longitude: 103.858185, //Red Alert Message Location
	        latitude: 1.379613                   
	      };    
 var obuAlertMsgSymbol = {
 		type: "text",  // autocasts as new TextSymbol()
 		 color: "red",
 		 text: obuAlertMsg,
 		 haloColor: "#000000",
 		 haloSize: "1px",
 		 xoffset: 10,
 		 yoffset: 10,
 		 font: {  // autocast as new Font()
 		    size: 10,
 			weight: "bold"
 		 }
 	 };
    obuAlertPicGraText = new Graphic({
	       geometry: obuAlertMsgpoint,
	       symbol: obuAlertMsgSymbol
	     });
	 
		 view.graphics.addMany([obuAlertPicGraText]); */
//End of OBU Message		 
/*** End of Obu Message display on the Map */



/***  Accident closed Layer*/
//LHS Lane closed
/*var accredlayerflag = true;
document.getElementById("laneupimg1").onclick = function() {
	//Lane closed layer
	if(accredlayerflag) {
		map.add(cteheavytrafficRedLayer); 
		accredlayerflag = false;
		}  else {
			accredlayerflag = true;
			 cteheavytrafficRedLayer.visible = false;
		}
	var s = document.getElementById("laneupimg1ht").value;
	alert("road name : " + s);
	changeImage(s);
} */

/*** Accident Lane closed Layer */	


/*** video display  */
   /*     window.onload = hideirMsgDiv;
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
        } */
        //End of popup window with video display        
 /*** End of video display  */      
	
		//map.add(wmsLayer);  

/*** TMD Layer show message Proposed system display */
  /*          	
            		var tmdequipids = document.getElementsByName("tmdeqipid");
            		var tmdtimemsgs = document.getElementsByName("tmdtimemsg");
            		var tmdminmsgs = document.getElementsByName("tmdminmsg");
            		var tmdstrnames = document.getElementsByName("tmdstrnames"); 
            		var tmdSelEqId, tmdSelTiMsg, tmdSelMiMsg, tmdSelStrName1, tmdSelStrName2, tmdSelMiMsg;
            		for(k=0; k<tmdequipids.length;k++) {
            			tmdSelEqId = tmdequipids[k].value;
            			tmdSelTiMsg = tmdtimemsgs[k].value;
            			tmdSelMiMsg = tmdminmsgs[k].value;	
            			for(i=0;i<3;i++) {
            					tmdSelStrName1 = tmdstrnames[0].value;	
            					tmdSelStrName2 = tmdstrnames[1].value;
            					tmdSelStrName3 = tmdstrnames[2].value;			
            			}
            			break;	
            		}
            		var sepIndex = tmdSelStrName1.indexOf("$");
            		var streetName1 = tmdSelStrName1.substring(0, sepIndex);
            		var min1 = tmdSelStrName1.substring(sepIndex+1, tmdSelStrName1.length);
            		sepIndex = tmdSelStrName2.indexOf("$");
            		var streetName2 = tmdSelStrName2.substring(0, sepIndex);
            		var min2 = tmdSelStrName2.substring(sepIndex+1, tmdSelStrName2.length);
            		sepIndex = tmdSelStrName3.indexOf("$");
            		var streetName3 = tmdSelStrName3.substring(0, sepIndex);
            		var min3 = tmdSelStrName3.substring(sepIndex+1, tmdSelStrName3.length);
            var msgTitle =  "<center><font style='color:#8BD27A'><b>"+tmdSelEqId+"</b></font><center>"
            var msgContent =	"<b><center><font style='color:#8BD27A'>"+tmdSelTiMsg+" &nbsp;&nbsp;&nbsp;&nbsp;"+tmdSelMiMsg+"</font><center><b><br>" 
				+ "<center><b>"+streetName1+" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='color:#8BD27A'>"+min1+"</font><b><center>" 
				+ "<center><b>"+streetName2+" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='color:#8BD27A'>"+min2+"</font><b><center>" 
				+ "<center><b>"+streetName3+" &nbsp;&nbsp;&nbsp;&nbsp;<font style='color:#8BD27A'>"+min3+"</font></b><center>";

	/*  var tmdMsgpoint1 = {
        type: "point", // autocasts as new Point()
        longitude: 103.858397,
        latitude: 1.3615295                   
      }; 
      var tmdPictureSymbol = {
                type: "picture-marker",
                url: "TMD1WithMessage.PNG",
                width: "20",
                height: "20",
              }
      tmdMsgPicGrapText1 = new Graphic({
			geometry: tmdMsgpoint1,
			symbol: tmdPictureSymbol,
			popupTemplate: {
				// autocasts as new PopupTemplate()
				title: msgTitle,
				content: msgContent    
			}
      });
      view.graphics.addMany([tmdMsgPicGrapText1]); */
/***  End of TMD Layer show message Proposed system display */

/**
 	var appendStr1 = '<table cellpadding="5px"><tr> <td bgcolor="black"><font color="#24DEE8" face="Roboto" size="3"><b>' ;
	var appendStr2 ='</b></font><td></tr><table>'
 */

 /*
 //TSP image
		var tspPictureSymbol = {
			type: "picture-marker",
			url: "TSP_MSG.png",
			width: "20",
			height: "20"
		}
		//TSP Point
		var tspPoint1 = {
			type: "point", 
			longitude: 103.8586063, 
			latitude: 1.3760463                         
		};  
		var tspPoint2 = {
			type: "point", 
			longitude: 103.8608452, 
			latitude: 1.3699416                        
		};
 
 */

 //Default current and New messages
 /*	var vmsIdMsgSymbol = {
			type: "text",  // autocasts as new TextSymbol()
			 color: "#202B53",
			 text: currVmsId,
			 //haloColor: "black",
			 //haloSize: "1px",
			 xoffset: 0,
			 yoffset: 35,
			 font: {  // autocast as new Font()
				size: 8,
				weight: "bold"
			 }
		 };
		 
		//default VMS msg
		var vmsDefaultMsg = vmsdefaultMsg1Arr[count];
		var vmsDefaultMsgFormat = "Current: " + vmsDefaultMsg ;	
		
		count = count + 1;
		if(count>6) {
			count =0;	
		}

		var vmsDefaultMsgSymbol;
		if(currVmsId=='103698') {
			var vmsDefaultMsgSymbol = {
				type: "picture-marker",
				url: "img103.JPG",
				width: "150",
				height: "50",
				xoffset: 0,
				yoffset: 25,
			};

		} else {
		vmsDefaultMsgSymbol = {
			type: "text",  // autocasts as new TextSymbol()
			 color: "#000080",
			 text: vmsDefaultMsgFormat,
			 haloColor: "#00BFFF",
			 //haloSize: "1px",
			 xoffset: 0,
			 yoffset: 25,
			 font: {  // autocast as new Font()
				size: 8,
				weight: "bold"
			 }
		 };
	}
	//System VMS msg	
	var vmsCurrMsgFormat = "New: " + currVmsmsg  ;		
	var vmsSystemMsgSymbol = {
		type: "text",  // autocasts as new TextSymbol()
		 color: "#FF0000",
		 text: vmsCurrMsgFormat,
		 haloColor: "#FDEDEC",
		 //haloSize: "1px",
		 xoffset: 0,
		 yoffset: 15,
		 font: {  // autocast as new Font()
			size: 8,
			weight: "bold"
		 }
	 };*/
//End of Default current and New messages


//Scenario 1 current and proposed messages
/*
			var vmsIdMsg = {
        		type: "text",  // autocasts as new TextSymbol()
        		color: "#202B53",
        		text: sce1VmsId,
        		 //haloColor: "black",
        		 //haloSize: "2.5px",
        		 xoffset: 0,
        		 yoffset: 35,
        		 font: {  // autocast as new Font()
        		    size: 8,
        			weight: "bold"
        		 }
			 };
			 
			// text vmsid
			var pictureGraphicSce1vmsid = new Graphic({
				geometry: pointSce1,
				symbol: vmsIdMsg,
			  }); 
			 
			// Current Message
			var vmsCurrMsg1 = vmsCurrMsg1Arr[count];
			count = count + 1;
			if(count>6) {
				count =0;	
			}
			
			vmsCurrMsg1Format = "Current: " + vmsCurrMsg1
			var vmsCurrMsg = { 
        		type: "text",  // autocasts as new TextSymbol()
        		color: "#000080",
        		text: vmsCurrMsg1Format,
        		 haloColor: "#00BFFF",
        		// haloSize: "2.5px",
        		 xoffset: 0,
        		 yoffset: 25,
        		 font: {  // autocast as new Font()
        		    size: 8,
        			weight: "bold"
        		 }
        	 };	
			 
			 pictureGraphicSce1vmsCurrMsg = new Graphic({
				geometry: pointSce1,
				symbol: vmsCurrMsg,
			  });

			//proposed message 
			
			var vmsPropMsg,vmsPropMsgFormat ;
			 
			 if(viewFlagS1){
				vmsPropMsgFormat = "Current: " + sce1Vmsmsg
				vmsPropMsg = { 
					type: "text",  // autocasts as new TextSymbol()
					color: "#000080",
					text: vmsPropMsgFormat,
					 haloColor: "#00BFFF",
					// haloSize: "2.5px",
					 xoffset: 0,
					 yoffset: 25,
					 font: {  // autocast as new Font()
						size: 8,
						weight: "bold"
					 }
				 };
			 } else
			 {
				vmsPropMsgFormat = "Proposed: " + sce1Vmsmsg
				vmsPropMsg = { 
					type: "text",  // autocasts as new TextSymbol()
					color: "#FF0000",
					text: vmsPropMsgFormat,
					 haloColor: "#FDEDEC",
					// haloSize: "2.5px",
					 xoffset: 0,
					 yoffset: 15,
					 font: {  // autocast as new Font()
						size: 8,
						weight: "bold"
					 }
				 };	
			 }	 

			 var pictureGraphicSce1vmsPropMsg = new Graphic({
				geometry: pointSce1,
				symbol: vmsPropMsg,
			  });
*/
//end of Scenario 1 current and proposed messages

//Scenario 2 current and proposed messages
/*	var vmsIdMsg = {
        		type: "text",  // autocasts as new TextSymbol()
        		 color: "#202B53",
        		 text: sce1VmsId,
        		 //haloColor: "black",
        		 //haloSize: "1px",
        		 xoffset: 0,
        		 yoffset: 35,
        		 font: {  // autocast as new Font()
        		    size: 8,
        			weight: "bold"
        		 }
        	 };

			var pictureGraphicSce2vmsId = new Graphic({
				geometry: pointSce2,
				symbol: vmsIdMsg,
			  });
			  
			 
			//current VMS msg
			var vmsCurrMsg = vmsCurrMsg2Arr[count];
			var vmsCurrMsg2Format = "Current: " + vmsCurrMsg ;	
			count = count + 1;
			if(count>8) {
				count =0;	
			}
			var vmsCurrMsg2 = {
        		type: "text",  // autocasts as new TextSymbol()
        		 color: "#000080",
        		 text: vmsCurrMsg2Format,
        		 haloColor: "#00BFFF",
        		 //haloSize: "1px",
        		 xoffset: 0,
        		 yoffset: 25,
        		 font: {  // autocast as new Font()
        		    size: 8,
        			weight: "bold"
        		 }
        	 };
			 var pictureGraphicSce2vmsCurr = new Graphic({
				geometry: pointSce2,
				symbol: vmsCurrMsg2,
			  });

		//proposed VMS msg	
			var vmsPropoMsg2Format;		
			var vmsPropoMsg2 ;
			if(viewFlagS2){
				vmsPropoMsg2Format = "Current: " + sce1Vmsmsg ;
				vmsPropoMsg2 = {
					type: "text",  // autocasts as new TextSymbol()
					 color: "#000080",
					 text: vmsPropoMsg2Format,
					 haloColor: "#00BFFF",
					 //haloSize: "1px",
					 xoffset: 0,
					 yoffset: 25,
					 font: {  // autocast as new Font()
						size: 8,
						weight: "bold"
					 }
				 };
			} else {
				vmsPropoMsg2Format = "Proposed: " + sce1Vmsmsg ;
				vmsPropoMsg2 = {
					type: "text",  // autocasts as new TextSymbol()
					 color: "#FF0000",
					 text: vmsPropoMsg2Format,
					 haloColor: "#FDEDEC",
					 //haloSize: "1px",
					 xoffset: 0,
					 yoffset: 15,
					 font: {  // autocast as new Font()
						size: 8,
						weight: "bold"
					 }
				 };
			}
		 
			var pictureGraphicSce2vmsProp2 = new Graphic({
				geometry: pointSce2,
				symbol: vmsPropoMsg2,
			  });
*/
//end of Scenario 2 current and proposed messages