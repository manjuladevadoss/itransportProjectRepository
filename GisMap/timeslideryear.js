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
          basemap: "streets-night-vector",
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
           timeExtent.startTime = new Date("1/1/2015 UTC");
          timeExtent.endTime = new Date("12/31/2030 UTC");
          //var today = new Date();
         // timeExtent.startTime = new Date();
          //timeExtent.endTime = new Date("04/25/2019 16:00:00 UTC"); ;
          timeSlider.setThumbCount(1);
          timeSlider.createTimeStopsByTimeInterval(timeExtent, 1, "esriTimeUnitsYears");
         // timeSlider.createTimeStopsByTimeInterval(timeExtent, 1, "esriTimeUnitsHours");
          timeSlider.setThumbIndexes([0,1]);
          timeSlider.setThumbMovingRate(4000);
          timeSlider.startup();
          
          //add labels for every other time stop
          var labels = arrayUtils.map(timeSlider.timeStops, function(timeStop, i) { 
            if ( i % 2 === 0 ) {
              /*var hours = timeStop.getHours() > 12 ? timeStop.getHours() - 12 : timeStop.getHours();
              var am_pm = timeStop.getHours() >= 12 ? "PM" : "AM";
              hours = hours < 10 ? "0" + hours : hours;
              return hours + " " + am_pm;*/
              return timeStop.getUTCFullYear();
            } else {
              //return timeStop.getHours(); 
             /* var hours = timeStop.getHours() > 12 ? timeStop.getHours() - 12 : timeStop.getHours();
              var am_pm = timeStop.getHours() >= 12 ? "PM" : "AM";
              hours = hours < 10 ? "0" + hours : hours;
              return hours + " " + am_pm; */
              return "";
            }
          });          
          timeSlider.setLabels(labels);
          timeSlider.on("time-extent-change", function(evt) {
            var startValString = evt.startTime.getUTCFullYear();
            var endValString = evt.endTime.getUTCFullYear();

            //var startValString = evt.startTime.getHours();
            //var endValString = evt.endTime.getHours();
             dom.byId("daterange").innerHTML = "<i>" + startValString + " and " + endValString  + "<\/i>";
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
      });