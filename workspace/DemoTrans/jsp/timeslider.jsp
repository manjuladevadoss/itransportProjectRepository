<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    
    <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no">
    <title>vms draw line circle </title>
    
    <link rel="stylesheet" href="http://localhost:8080/DemoTrans/arcgis_js_v328_api/3.28/dijit/themes/claro/claro.css">
    <link rel="stylesheet" href="http://localhost:8080/DemoTrans/arcgis_js_v328_api/3.28/esri/css/esri.css">
        
    <style>
              html, body, #mapDiv {
        padding:0;
        margin:0;
        height:100%;
      }

      #mapDiv {
        position: relative;
      }

      #bottomPanel {
        left: 50%;
        margin: 0 auto;
        margin-left: -500px;
        position: absolute; 
        bottom: 2.5em;
      }

      #timeInfo{
        border-radius: 4px;
      /*  border: solid 2px #ccc;
        background-color: #fff; */
        display: block;
        padding: 5px;
        position: relative;
        text-align: center;
        width: 1000px;
        z-index: 99;
        color: #46F7FF;
      }

      .dijitRuleMark {
    position: absolute;
    border: 1px solid #46F7FF;
    line-height: 0;
    height: 100%;
}
.claro .dijitRuleLabelsContainer {
    color: #46F7FF;
}
    element.style {
        width: 100%;
        background-color:none; 
    }

      .claro .dijitSlider .dijitSliderRemainingBarH, .claro .dijitSlider .dijitSliderRightBumper {
    border-color: #46F7FF;
    background-color: #46F7FF;
}

.claro .dijitButton .dijitButtonNode, .claro .dijitDropDownButton .dijitButtonNode, .claro .dijitComboButton .dijitButtonNode, .claro .dijitToggleButton .dijitButtonNode{
    border-color: #46F7FF;
    background-color: #46F7FF;
    background-image:none;
}

.claro .dijitSliderImageHandleH {
    background: #46F7FF;
}


#info1 {
  top: 90px;
  right: 800px;
  position: absolute;
  z-index: 200;
  border: solid 0px;
  background-color:none;
  width: 160px;
  border-radius: 13px;
}

#info2 {
  top: 90px;
  right: 640px;
  position: absolute;
  z-index: 200;
  border: solid 0px;
  width: 160px;
  background-color:none;
  border-radius: 13px;
}
.buttoneventbub {
  color: #C8CFF4;
  font-family:  Roboto, Helvetica, sans-serif;
  box-shadow: 2px 2px 8px 0 rgba(0,0,0,0.5);
  border-radius: 13px;
  background-color:#356D85;
  border: solid 1px #356D85;
  width:160px;
  height:30px
}

.buttoneventclo{
  color: #C8CFF4;
  font-family:  Roboto, Helvetica, sans-serif;
  border-radius: 13px;
  background-color: #A98651;
  box-shadow: 2px 2px 8px 0 rgba(0,0,0,0.5);
  border: solid 1px #A98651;
  width:160px;
  height:30px;
}

.esriPopup .contentPane {
    background-color: black;
    color: white;
}

.esriPopup .actionsPane {
     background-color: black;
 }

.esriPopup .pointer, .esriPopup .outerPointer {
    background: black;
 }

    </style>

    <script src="https://js.arcgis.com/3.28/"></script>
<!-- <script src="http://localhost:8080/DemoTrans/arcgis_js_v328_api/3.28"></script> -->
    <script>
      var map;
      require([
        "esri/map", "esri/toolbars/draw",
               "esri/symbols/SimpleLineSymbol",
               "esri/symbols/SimpleFillSymbol", "esri/symbols/PictureMarkerSymbol", "esri/symbols/CartographicLineSymbol", 
               "esri/graphic", 
               "esri/Color","esri/layers/ArcGISDynamicMapServiceLayer", 
        "esri/TimeExtent", "esri/dijit/TimeSlider","esri/geometry/Point","esri/SpatialReference",
        "dojo/_base/array", "dojo/dom", "dojo/on", "dojo/domReady!"
      ], function(
        Map, Draw, SimpleLineSymbol,
        SimpleFillSymbol, PictureMarkerSymbol, CartographicLineSymbol, 
        Graphic, Color, ArcGISDynamicMapServiceLayer, 
        TimeExtent, TimeSlider,Point,SpatialReference,
        arrayUtils, dom,on
      ) {
        map = new Map("mapDiv", {
          //basemap: "streets-night-vector",
          basemap: "dark-gray-vector",
          center: [103.877, 1.304],
          zoom: 12
        });

        /*** Marker **/
        
  //Height and Width are specified in points
  var symbol =  new PictureMarkerSymbol({
    "url":"graphics/redArrow2.png",
    "height":20,
    "width":20,
    "type":"esriPMS",
    "angle": -30
  });


// ********** start timeslider and infowindow ********* //
       // var opLayer = new ArcGISDynamicMapServiceLayer("https://sampleserver3.arcgisonline.com/ArcGIS/rest/services/Petroleum/KSWells/MapServer");
        var opLayer = new ArcGISDynamicMapServiceLayer("https://services.arcgisonline.com/arcgis/rest/services/Canvas/World_Dark_Gray_Base/MapServer");
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
        //   timeExtent.startTime = new Date("1/1/1921 UTC");
        //   timeExtent.endTime = new Date("12/31/2009 UTC");
          var today = new Date();
          timeExtent.startTime = new Date();
          timeExtent.endTime = new Date("04/22/2019 20:00:00 UTC"); ;
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
            } else {
              //return timeStop.getHours(); 
              var hours = timeStop.getHours() > 12 ? timeStop.getHours() - 12 : timeStop.getHours();
              var am_pm = timeStop.getHours() >= 12 ? "PM" : "AM";
              hours = hours < 10 ? "0" + hours : hours;
              return hours + " " + am_pm;
            }
          });          
          timeSlider.setLabels(labels);
          timeSlider.on("time-extent-change", function(evt) {
            var startValString = evt.startTime.getHours();
            var endValString = evt.endTime.getHours();
            // dom.byId("daterange").innerHTML = "<i>" + startValString + " and " + endValString  + "<\/i>";
                // 103.706, 1.318
                infowindowmsg(evt);


          });
        }
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
// ********** draw line circle ********* //
        
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
        new Color([237,28,36]), 3),new Color([81,91,117,0.25]));

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
        // ********** end of draw line and circle ********* //

      });
    </script>
  </head>
  <body class="claro">

    <div id="mapDiv">
            <div id="info1">            
                    <button id="Circle" class="buttoneventbub"> + Add Event Bubble</button>  
                   </div>
                <div id="info2">
                  <button id="Line"  class="buttoneventclo"> + Add Road Closure</button>
                </div>


      <div id="bottomPanel">
        <div id="timeInfo">
          <!--<div>Hugoton Gas Field Wells from <span id="daterange">1921 to 2009</span> (Completion date)</div>-->
          <div id="timeSliderDiv"></div>
        </div>
      </div>
    </div>
  </body>
</html>