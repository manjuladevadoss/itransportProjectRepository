 var map,tb;

      require(["esri/map", "esri/toolbars/draw",
               "esri/symbols/SimpleLineSymbol",
               "esri/symbols/SimpleFillSymbol", "esri/symbols/CartographicLineSymbol", 
               "esri/graphic", 
               "esri/Color", "dojo/dom", "dojo/on", "dojo/domReady!"
            ],  function(Map, Draw,
                          SimpleLineSymbol,
                         SimpleFillSymbol, CartographicLineSymbol, 
                        Graphic, Color, dom, on) {
        map = new Map("mapDiv", {
          basemap: "dark-gray-vector",  //For full list of pre-defined basemaps, navigate to http://arcg.is/1JVo6Wd
          center: [103.856, 1.334], // longitude, latitude
          zoom: 14
        });

        map.on("load", initToolbar);
        
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
      });
        
        
//Div message display on the map
//Make the DIV element draggagle:
        
window.onload = hideVmsMsgDiv;
        
function hideVmsMsgDiv() {
	var x = document.getElementById("vmsmsgdiv");
	var x1 = document.getElementById("vmsmsgdiv1");
	x.style.display = "none";  
	x1.style.display = "none";
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
  