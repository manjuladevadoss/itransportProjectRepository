   var map,tb;
    require([
      "esri/map",  "esri/toolbars/draw",  "esri/symbols/PictureMarkerSymbol", 
      "esri/symbols/SimpleLineSymbol","esri/symbols/SimpleFillSymbol", "esri/geometry/Point",
      "esri/symbols/CartographicLineSymbol", "esri/Color","esri/graphic",
      "esri/layers/WMTSLayer", "esri/layers/WMTSLayerInfo",
      "esri/geometry/Extent", "esri/layers/TileInfo", "esri/SpatialReference", 
      "dojo/parser", "dojo/dom", "dojo/on", 
      "dojo/domReady!"
    ], function(
        Map, Draw, PictureMarkerSymbol,  SimpleLineSymbol, SimpleFillSymbol, Point, CartographicLineSymbol, Color, Graphic, WMTSLayer, WMTSLayerInfo,
        Extent, TileInfo, SpatialReference, 
        parser, dom, on
      ) {
      parser.parse();
   
      map = new Map("map", {
        center: [47.075,-52.93],
        zoom: 3
      });
      map.on("load", initToolbar);
     
      /* Start basemap layer */
     var tileInfo = new TileInfo({
        "dpi": 96,
        "format": "format/png",
        "compressionQuality": 0,
        "spatialReference": new SpatialReference({
          "wkid": 4326
        }),
        "rows": 512,
        "cols": 512,
        "origin": {
          "x": -180,
          "y": 90
        },"lods": [{
          "level": "11",
          "scale": 115558.3419744397,
          "resolution": 0.000274658203125
          }]
        });
     
      var tileExtent = new Extent(-180, -90, 180, 90, new SpatialReference({
        wkid: 4326
      }));
      var layerInfo = new WMTSLayerInfo({
        tileInfo: tileInfo,
        fullExtent: tileExtent,
        initialExtent: tileExtent,
        identifier: "osm-bright",
        //identifier: "klokantech-basic",
        tileMatrixSet: "1x",
        format: "png",
        style: "default"
      });

      var resourceInfo = {
        version: "1.0.0",
        layerInfos: [layerInfo],
        copyright: "earthdata"
      };

      var options = {
        serviceMode: "KVP",
        resourceInfo: resourceInfo,
        layerInfo: layerInfo
      };

      wmtsLayer = new WMTSLayer("http://192.168.99.100:32769/services/wmts/1.0.0/", options);
      map.addLayer(wmtsLayer);
/* end of basemap layer */


/* To start Drawing toolbox */
      //circle
      var circleSymbol = new SimpleFillSymbol(SimpleFillSymbol.STYLE_SOLID,
          new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,
          new Color([237,28,36]), 3),new Color([81,91,117,0.25])
      );

      //polygon line
      var lineSymbol = new CartographicLineSymbol(
          CartographicLineSymbol.STYLE_SOLID,
          new Color([255,6,4]), 2, 
          CartographicLineSymbol.CAP_ROUND,
          CartographicLineSymbol.JOIN_MITER, 5
      );
    
      //insert picture
      var pictureSymbol = new PictureMarkerSymbol({
        url: "heavytraffic.jpg",
        width: "20",
        height: "20"
      });

      /* Create a point graphic
         *************************/
        var vmsPoints = [  
                { lat: 1.304, long: 103.877, icon: 'vmsimage.JPG', width: 20, height: 20 },  
                { lat: 1.304, long: 103.879, icon: 'vmsimage.JPG', width: 18, height: 18 }, 
                { pt:1, lat: 1.306, long: 103.872, icon: 'vmsimage.JPG', width: 18, height: 18 },  
                { pt:2, lat: 1.305, long: 103.877, icon: 'vmsimage.JPG', width: 18, height: 18}, 
                { pt:3, lat: 1.300, long: 103.876, icon: 'vmsimage.JPG', width: 18, height: 18 }, 
                 ];                       
        /*End of VMS icon show */


      function initToolbar() {
          tb = new Draw(map);
          tb.on("draw-end", addGraphic);

          // event delegation so a click handler is not
          // needed for each individual button
          on(dom.byId("info"), "click", function(evt) {
            if (evt.target.id === "info") {
              return;
            }
            var tool = evt.target.id.toLowerCase();
            map.disableMapNavigation();
            tb.activate(tool);
          });

          on(dom.byId("info2"), "click", function(evt) {
                  //alert("inside vms")    
                       for (var k=0; k < vmsPoints.length; k++){
                           var point = new Point(vmsPoints[k].long, vmsPoints[k].lat);  
                           var pictureMarkerSymbol = new PictureMarkerSymbol(vmsPoints[k].icon, vmsPoints[k].width, vmsPoints[k].height);
                           map.graphics.add(new Graphic(point, pictureMarkerSymbol)); 
                           //alert("inside vms loop")  
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

          var symbol ;
          // figure out which symbol to use
          if (evt.geometry.type === "polyline") {
            symbol = lineSymbol;  
          } 
          else if (evt.geometry.type === "multipoint") {
            symbol = pictureSymbol;
          }
          else {
            symbol = circleSymbol;
          }
          
          map.graphics.add(new Graphic(evt.geometry, symbol));
          
        } 
  /* end of Drawing toolbox */

    });