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
          basemap: "streets-night-vector",  //For full list of pre-defined basemaps, navigate to http://arcg.is/1JVo6Wd
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