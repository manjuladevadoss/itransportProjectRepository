<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no"/>
    <title>Event Map</title>
    <link rel="stylesheet" href="https://js.arcgis.com/3.28/esri/css/esri.css">
    <style>
      #info1 {
        top: 20px;
        right: 300px;
        position: absolute;
        z-index: 200;
        border: solid 0px;
        background-color:none;
        width: 160px;
        border-radius: 13px;
      }
      
      #info2 {
        top: 20px;
        right: 140px;
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

      html, body, #mapDiv {
        padding:0;
        margin:0;
        height:100%;
      }
      button {
        display: block;
      }
    </style>
    <script src="https://js.arcgis.com/3.28/"></script>
    <script>
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
          center: [103.706, 1.318], // longitude, latitude
          zoom: 8
        });

        map.on("load", initToolbar);
        
        // lineSymbol used for freehand polyline, polyline and line. 
        var lineSymbol = new CartographicLineSymbol(
          CartographicLineSymbol.STYLE_SOLID,
          new Color([169,134,81]), 3, 
          CartographicLineSymbol.CAP_ROUND,
          CartographicLineSymbol.JOIN_ROUND, 5
        );

        // fill symbol used for extent, polygon and freehand polygon, use a picture fill symbol
        // the images folder contains additional fill images, other options: sand.png, swamp.png or stiple.png
    var fillSymbol = new SimpleFillSymbol(SimpleFillSymbol.STYLE_SOLID,
    new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,
    new Color([53,109,133]), 3),new Color([81,91,117,0.25])
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
    </script>
  </head>

    
  <body>
        <div id="info1">
          <button id="Circle" class="buttoneventbub"> + Add Event Bubble</button>  
         </div>
      <div id="info2">
        <button id="Line"  class="buttoneventclo"> + Add Road Closure</button>
      </div>
        <div id="mapDiv"></div>
    
      </body>
</html>

