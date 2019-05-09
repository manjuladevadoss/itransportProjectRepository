 var map,tb;

      require(["esri/map", "esri/layers/ArcGISDynamicMapServiceLayer", 
      "esri/TimeExtent", "esri/dijit/TimeSlider","esri/geometry/Point","esri/SpatialReference",
      "dojo/_base/array","esri/toolbars/draw",
               "esri/symbols/SimpleLineSymbol",
               "esri/symbols/SimpleFillSymbol", "esri/symbols/CartographicLineSymbol", 
               "esri/graphic", "esri/symbols/TextSymbol", 
               "esri/symbols/PictureMarkerSymbol",
               "esri/Color", "dojo/dom", "dojo/on", "dojo/domReady!"
            ],  function(Map, ArcGISDynamicMapServiceLayer, 
              TimeExtent, TimeSlider,Point,SpatialReference,
              arrayUtils, Draw,
                          SimpleLineSymbol,
                         SimpleFillSymbol, CartographicLineSymbol, 
                        Graphic, TextSymbol, PictureMarkerSymbol, Color, dom, on) {
        map = new Map("mapDiv", {
          basemap: "streets",  //For full list of pre-defined basemaps, navigate to http://arcg.is/1JVo6Wd
          center: [103.839, 1.281], // longitude, latitude
          zoom: 11
        });

 /****** Start of Time Slider circle line */
// ********** start timeslider and infowindow ********* //
var opLayer = new ArcGISDynamicMapServiceLayer("https://sampleserver3.arcgisonline.com/ArcGIS/rest/services/Petroleum/KSWells/MapServer");
opLayer.setVisibleLayers([0]);

//apply a definition expression so only some features are shown 
var layerDefinitions = [];
layerDefinitions[0] = "FIELD_KID=1000148164";
opLayer.setLayerDefinitions(layerDefinitions);

//add the gas fields layer to the map 
map.addLayers([opLayer]);

map.on("layers-add-result", initSlider);
map.on("load", initToolbar);

function initSlider() {
  var timeSlider = new TimeSlider({
    style: "width: 100%;"
  }, dom.byId("timeSliderDiv"));
  timeSlider.playPauseBtn.destroy();
  timeSlider.previousBtn.destroy();
  timeSlider.nextBtn.destroy();

  map.setTimeSlider(timeSlider);
  
  var timeExtent = new TimeExtent();
//   timeExtent.startTime = new Date("1/1/2000 UTC");
//   timeExtent.endTime = new Date("12/31/2020 UTC");
  //var today = new Date();
  timeExtent.startTime = new Date();
  timeExtent.endTime = new Date("05/08/2019 16:00:00 UTC"); ;
  timeSlider.setThumbCount(1);
  //timeSlider.createTimeStopsByTimeInterval(timeExtent, 2, "esriTimeUnitsYears");
  timeSlider.createTimeStopsByTimeInterval(timeExtent, 1, "esriTimeUnitsHours");
  timeSlider.setThumbIndexes([0,1]);
  timeSlider.setThumbMovingRate(4000);
  timeSlider.startup();
  
  //add labels for every other time stop
  var labels = arrayUtils.map(timeSlider.timeStops, function(timeStop, i) { 
    if ( i % 2 === 0 ) {
      var hours = timeStop.getHours() > 12 ? timeStop.getHours() - 12 : timeStop.getHours();
      var am_pm = timeStop.getHours() >= 12 ? "PM" : "AM";
      hours = hours < 10 ? "0" + hours : hours;
      return hours + " " + am_pm;
	  //return timeStop.getUTCFullYear();
    } else {
      //return timeStop.getHours(); 
      var hours = timeStop.getHours() > 12 ? timeStop.getHours() - 12 : timeStop.getHours();
      var am_pm = timeStop.getHours() >= 12 ? "PM" : "AM";
      hours = hours < 10 ? "0" + hours : hours;
      return hours + " " + am_pm;
	  //return "";
    }
  });          
  timeSlider.setLabels(labels);
  timeSlider.on("time-extent-change", function(evt) {
    var startValString = evt.startTime.getHours();
    var endValString = evt.endTime.getHours();

    infowindowmsg(evt);
  });
}

//inforwindow messages
function infowindowmsg(evt) {
    var endValString = evt.endTime.getHours();
    var startValString = evt.startTime.getHours();
    if(endValString==startValString) {
        var latitude =  103.831;
        var longitude = 1.286;
        //map.infoWindow.setTitle("Coordinates");
        //map.infoWindow.destroy();
        
        map.infoWindow.setContent(
            "Hello 1 7 Tiong Bahru Road, 161007, Singapore "
        );
        var pt = new Point(latitude, longitude);
        map.infoWindow.show(pt, map.getInfoWindowAnchor(evt.screenPoint));
    } else if(endValString==(startValString+1)) {
        var latitude =  103.824;
        var longitude = 1.309;
        //map.infoWindow.setTitle("Coordinates");
        map.infoWindow.setContent(
        "14A Nassim Road, 258385, Singapore"
        );
        var pt = new Point(latitude, longitude);
        map.infoWindow.show(pt, map.getInfoWindowAnchor(evt.screenPoint));
    } else if(endValString==(startValString+2)) {
        var latitude =  103.853;
        var longitude = 1.32;
        //map.infoWindow.setTitle("Coordinates");
        map.infoWindow.setContent(
        "Hello 3 - Whampoa View, 104 Whampoa Drive, 323104, Singapore" 
        );
        var pt = new Point(latitude, longitude);
        map.infoWindow.show(pt, map.getInfoWindowAnchor(evt.screenPoint));

    }else if(endValString==(startValString+3)) { 
        var latitude =  103.863;
        var longitude = 1.294;
       // map.infoWindow.setTitle("Coordinates");
        map.infoWindow.setContent(
        "Hello 4 Ophir Road, Singapore" 
        );
        var pt = new Point(latitude, longitude);
        map.infoWindow.show(pt, map.getInfoWindowAnchor(evt.screenPoint));
    }
};
// ********** end of timeslider and infowindow ********* //


 /******End of Time Slider line */



        /****** Start draw circle line */
      //  map.on("load", initToolbar);
        
        // lineSymbol used for freehand polyline, polyline and line. 
        var lineSymbol = new CartographicLineSymbol(
          CartographicLineSymbol.STYLE_SOLID,
          new Color([237,28,36]), 3, 
          CartographicLineSymbol.CAP_ROUND,
          CartographicLineSymbol.JOIN_ROUND, 5
        );

        // fill symbol used for extent, polygon and freehand polygon, use a picture fill symbol
        // the images folder contains additional fill images, other options: sand.png, swamp.png or stiple.png
    var fillSymbol = new SimpleFillSymbol(SimpleFillSymbol.STYLE_SOLID,
          new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,
          new Color([237,28,36]), 3),new Color([81,91,117,0.25])
    );

        //circle border color RGB(53,109,133) #356D85
        //circle inside RGB(81,91,117)
        //bubble button "81,103,168"
        //Add road closure color RGB(169,134,81) #356D85
        function initToolbar() {
          tb = new Draw(map);
          tb.on("draw-end", addGraphic);

          // event delegation so a click handler is not
          // needed for each individual button

          on(dom.byId("info1"), "click", function(evt) {
            if ( evt.target.id === "info1" ) {
              return;
            }
            var tool = evt.target.id.toLowerCase();
            map.disableMapNavigation();
            tb.activate(tool);
          });
          on(dom.byId("info2"), "click", function(evt) {
            if ( evt.target.id === "info2" ) {
              return;
            }
            var tool = evt.target.id.toLowerCase();
            map.disableMapNavigation();
            tb.activate(tool);
          });
        }

        function addGraphic(evt) {
          //deactivate the toolbar and clear existing graphics 
          tb.deactivate(); 
          map.enableMapNavigation();

          // figure out which symbol to use
          var symbol;
         if ( evt.geometry.type === "line") {
            console.log("choosen is line");
            symbol = lineSymbol;
          } else {
            console.log("choosen is circle");
            symbol = fillSymbol;
          }
          map.graphics.add(new Graphic(evt.geometry, symbol));
        }
      /****** End of draw circle line */


      //** cctv camera and roadword display */
      var cctvlocation = [  
        { lat: 1.281, long: 103.839, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/cctv.PNG', width: 18, height: 18},  
        { lat: 1.289, long: 103.817, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/cctv.PNG', width: 18, height: 18}, 
        { lat: 1.294, long: 103.806, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/cctv.PNG', width: 18, height: 18},  
        { lat: 1.337, long: 103.79, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/cctv.PNG', width: 18, height: 18}, 
        { lat: 1.358, long: 103.884, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/cctv.PNG', width: 18, height: 18}, 
        { lat: 1.373, long: 103.851, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/cctv.PNG', width: 18, height: 18}, 
        { lat: 1.372, long: 103.898, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/cctv.PNG', width: 18, height: 18}, 
        { lat: 1.329, long: 103.84, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/cctv.PNG', width: 18, height: 18}, 
        { lat: 1.322, long: 103.846, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/cctv.PNG', width: 18, height: 18}, 
         ];
         
         var roadworklocation = [  
          { lat: 1.372, long: 103.898, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/roadwork1.jpg', width: 18, height: 18},  
          { lat: 1.336, long: 103.925, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/roadwork1.jpg', width: 18, height: 18}, 
          { lat: 1.345, long: 103.957, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/roadwork1.jpg', width: 18, height: 18},
          { lat: 1.307, long: 103.79, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/roadwork1.jpg', width: 18, height: 18},   
          { lat: 1.323, long: 103.902, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/roadwork1.jpg', width: 18, height: 18}, 
          { lat: 1.312, long: 103.778, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/roadwork1.jpg', width: 18, height: 18}, 
          { lat: 1.327, long: 103.85, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/roadwork1.jpg', width: 18, height: 18}, 
          { lat: 1.317, long: 103.86, icon: 'C:/Users/mdevadoss/Documents/GitHub/TT231-DemoProjectRepository/GisMap/image/roadwork1.jpg', width: 18, height: 18},
           ];

           on(dom.byId("infocctvcamera"), "click", function(evt) {

          for (var k=0; k < cctvlocation.length; k++){  
            var point = new Point(cctvlocation[k].long, cctvlocation[k].lat);  
            var pictureMarkerSymbol = new PictureMarkerSymbol(cctvlocation[k].icon, cctvlocation[k].width, cctvlocation[k].height);
            map.graphics.add(new Graphic(point, pictureMarkerSymbol)); 
          }
          for (var k=0; k < roadworklocation.length; k++){  
            var point = new Point(roadworklocation[k].long, roadworklocation[k].lat);  
            var pictureMarkerSymbol = new PictureMarkerSymbol(roadworklocation[k].icon, roadworklocation[k].width, roadworklocation[k].height);
            map.graphics.add(new Graphic(point, pictureMarkerSymbol)); 
          }
        });
    
      //**  end of cctv camera and roadwork display*/
      });
