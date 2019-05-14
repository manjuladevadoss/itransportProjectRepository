 var map,tb;

      require(["esri/map", "esri/layers/ArcGISDynamicMapServiceLayer", 
          "esri/TimeExtent", "esri/dijit/TimeSlider","esri/geometry/Point","esri/SpatialReference",
          "dojo/_base/array", "esri/toolbars/draw",
               "esri/symbols/SimpleLineSymbol",
               "esri/symbols/SimpleFillSymbol", "esri/symbols/CartographicLineSymbol", 
               "esri/graphic", 
               "esri/Color", "dojo/dom", "dojo/on", "dojo/domReady!"
            ],  function(Map, ArcGISDynamicMapServiceLayer, 
                    TimeExtent, TimeSlider,Point,SpatialReference,
                    arrayUtils, Draw,
                          SimpleLineSymbol,
                         SimpleFillSymbol, CartographicLineSymbol, 
                        Graphic, Color, dom, on) {
        map = new Map("mapDiv", {
          basemap: "streets",  //For full list of pre-defined basemaps, navigate to http://arcg.is/1JVo6Wd
          center: [103.856, 1.334], // longitude, latitude
          zoom: 14
        });

        map.on("load", initToolbar);
     
/* Start to draw circle and line */
        // lineSymbol used for freehand polyline, polyline and line. 
        var lineSymbol = new CartographicLineSymbol(
          CartographicLineSymbol.STYLE_SOLID,
          new Color([237,28,36]), 3, 
          CartographicLineSymbol.CAP_ROUND,
          CartographicLineSymbol.JOIN_ROUND, 5
        );

    var fillSymbol = new SimpleFillSymbol(SimpleFillSymbol.STYLE_SOLID,
    new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,
    new Color([237,28,36]), 3),new Color([81,91,117,0.25])
  );


        function initToolbar() {
          tb = new Draw(map);
          tb.on("draw-end", addGraphic);

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
/* end of draw circle and line */        

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
     //map.on("load", initToolbar);

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
       timeExtent.endTime = new Date("05/09/2019 20:00:00 UTC"); 
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
                 "Road Closed at Marina Ctr To Shenton Way - Use Nth Bridge Rd or Victoria St"
             );
             var pt = new Point(latitude, longitude);
             map.infoWindow.show(pt, map.getInfoWindowAnchor(evt.screenPoint));
         } else if(endValString==(startValString+1)) {
             var latitude =  103.824;
             var longitude = 1.309;
             //map.infoWindow.setTitle("Coordinates");
             map.infoWindow.setContent(
             "Massive Jam Around Marian Center"
             );
             var pt = new Point(latitude, longitude);
             map.infoWindow.show(pt, map.getInfoWindowAnchor(evt.screenPoint));
         } else if(endValString==(startValString+2)) {
             var latitude =  103.853;
             var longitude = 1.32;
             //map.infoWindow.setTitle("Coordinates");
             map.infoWindow.setContent(
             "Expect Delays near Marina Ctr To Shenton Way" 
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
        
        
//Div message display on the map 
//Make the DIV element draggagle:
        
window.onload = hideVmsMsgDiv;
    var pause = 0;    
function hideVmsMsgDiv() {
	var x = document.getElementById("vmsmsgdiv");
	var x1 = document.getElementById("vmsmsgdiv1");
	var x2 = document.getElementById("vmsmsgdiv2");
	var x3 = document.getElementById("vmsmsgdiv3");
	x.style.display = "none";  
	x1.style.display = "none";
	x2.style.display = "none";
	x3.style.display = "none";
	
	//Traffic Video
	var x = document.getElementById("videodiv");
	var vid = document.getElementById("myVideo"); 
	x.style.display = "none";
	pause = 0;
}

function showmsg(x) {
	// First vms message
	if(x==1) {
		  var x = document.getElementById("vmsmsgdiv");
		  // To make visible the div
		  if (x.style.display === "none") {
			 dragElement(document.getElementById("vmsmsgdiv"));  
			 x.style.display = "block";
		  } else {
		     x.style.display = "none";    
		  } 
	}
	// Second vms message
	if(x==2) {
		  var x = document.getElementById("vmsmsgdiv1");
		  // To make visible the div
		  if (x.style.display === "none") {
			 dragElement(document.getElementById("vmsmsgdiv1"));  
			 x.style.display = "block";
		  } else {
		     x.style.display = "none";    
		  } 		
	}
	// Third vms message
	if(x==3) {
		  var x = document.getElementById("vmsmsgdiv2");
		  // To make visible the div
		  if (x.style.display === "none") {
			 dragElement(document.getElementById("vmsmsgdiv2"));  
			 x.style.display = "block";
		  } else {
		     x.style.display = "none";    
		  } 		
	}
	// four vms message
	if(x==4) {
		  var x = document.getElementById("vmsmsgdiv3");
		  // To make visible the div
		  if (x.style.display === "none") {
			 dragElement(document.getElementById("vmsmsgdiv3"));  
			 x.style.display = "block";
		  } else {
		     x.style.display = "none";    
		  } 		
	}
}
   
function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  if (document.getElementById(elmnt.id + "header")) {
    /* if present, the header is where you move the DIV from:*/
    document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
  } else {
    /* otherwise, move the DIV from anywhere inside the DIV:*/
    elmnt.onmousedown = dragMouseDown;
  }

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    // call a function whenever the cursor moves:
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    /* stop moving when mouse button is released:*/
    document.onmouseup = null;
    document.onmousemove = null;
  }
}     
//end of div message display on the map     


//Start Traffic Video

	function playVid() {
	  var vid = document.getElementById("myVideo"); 
	  var x = document.getElementById("videodiv");
	  if (x.style.display === "none") {
		  vid.play(); 
		 if(pause==1) 
			 x.style.display = "none";
		else 
			x.style.display = "block";
	} 
	else {
		  if(pause==1) { 
			x.style.display = "block";
			vid.play(); 
		  }
		  else {
			x.style.display = "none";
		  }
	   }
	}
	  
	function pauseVid() { 
		var vid = document.getElementById("myVideo"); 
		pause = 1; 
		vid.pause();
	} 

	function closeVid() { 
	  var vid = document.getElementById("myVideo"); 
	  pause = 0;
	  var x = document.getElementById("videodiv");
	  if (x.style.display === "none") {
		x.style.display = "block";
	  } 
	  else {
		x.style.display = "none";
	  }
	}