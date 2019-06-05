 var map, view;

      require([
        "esri/Map",
        "esri/views/MapView","esri/Graphic", "esri/views/draw/Draw",
        "esri/layers/WMTSLayer","esri/geometry/Extent", 
        "esri/widgets/LayerList",
        "esri/geometry/geometryEngine"
      ], function(Map, MapView, Graphic, Draw, WMTSLayer, Extent, LayerList, geometryEngine) {
        layer = 
          new WMTSLayer({
          url: "http://192.168.99.100:32768/services/wmts?service",
          //copyright:
            //"<a target='_top' href='https://earthdata.nasa.gov'>Earthdata</a> by <a target='_top' href='https://www.nasa.gov'>NASA</a>",
          activeLayer: {
            id: "osm-bright"
          },
          version: "1.0.0",
          tileMatrixSet: "2x",
          format: "png",
          style: "default",
          serviceMode: "KVP"
        });
        
        map = new Map({
          center: [103.876601,1.306190],
          zoom: 4,
          layers: [layer]
        });
        
        view = new MapView({
          container: "viewDiv",
          map: map,          
        });

        // To draw a line
        draw = new Draw({
          view: view
        });


    // First vms message pointer   
      //insert point        
        var point = {
          type: "point", // autocasts as new Point()
          longitude: 103.877526,
          latitude: 1.304287
           
        };
        //insert picture
        var pictureSymbol = {
            type: "picture-marker",
            url: "vmsimage.JPG",
            width: "20",
            height: "20"
        }

        // Create a graphic and add the geometry and symbol to it
        var pictureGraphic = new Graphic({
          geometry: point,
          symbol: pictureSymbol
        });
  
// Second vms message pointer        
      var point1 = {
          type: "point", // autocasts as new Point()
          longitude: 103.879397,
          latitude: 1.304630                     
        };
      var pictureSymbol1 = {
            type: "picture-marker",
            url: "vmsimage.JPG",
            width: "20",
            height: "20"
        }
      var pictureGraphic1 = new Graphic({
          geometry: point1,
          symbol: pictureSymbol1
        });

// Third vms message pointer
        var point2 = {
          type: "point", // autocasts as new Point()
          longitude: 103.872,
          latitude: 1.306                     
        };
     var pictureSymbol2 = {
            type: "picture-marker",
            url: "vmsimage.JPG",
            width: "20",
            height: "20"
        }
      var pictureGraphic2 = new Graphic({
          geometry: point2,
          symbol: pictureSymbol2
        });
// Fourth vms message pointer
    var point3 = {
          type: "point", // autocasts as new Point()
          longitude: 103.877,
          latitude: 1.305                     
        };
     var pictureSymbol3 = {
            type: "picture-marker",
            url: "vmsimage.JPG",
            width: "20",
            height: "20"
        }
      var pictureGraphic3 = new Graphic({
          geometry: point3,
          symbol: pictureSymbol3
        });
// Fifth vms message pointer
var point4 = {
          type: "point", // autocasts as new Point()
          longitude: 103.876,
          latitude: 1.300                     
        };
     var pictureSymbol4 = {
            type: "picture-marker",
            url: "vmsimage.JPG",
            width: "20",
            height: "20"
        }
      var pictureGraphic4 = new Graphic({
          geometry: point4,
          symbol: pictureSymbol4
        });

      /* on load vms      */
      // view.graphics.addMany([pictureGraphic,pictureGraphic1,pictureGraphic2,pictureGraphic3,pictureGraphic4]);
      /* end of online vms */

      /* on vms button click*/
      document.getElementById("vms").onclick = function() {
            view.graphics.addMany([pictureGraphic,pictureGraphic1,pictureGraphic2,pictureGraphic3,pictureGraphic4]);
      }

      /* Start draw line function */
      document.getElementById("line").onclick = function() {
          action = draw.create("polyline");
          view.focus();
          action.on(
            [
              "vertex-add",
              "vertex-remove",
              "cursor-update",
              "redo",
              "undo",
              "draw-complete"
            ],
            createGraphic
          );
      }
      function createGraphic(event) {
           vertices = event.vertices;
           graphic = new Graphic({
            geometry: {
              type: "polyline",
              paths: vertices,
              spatialReference: view.spatialReference
            },
            symbol: {
              type: "simple-line", // autocasts as new SimpleFillSymbol
              color: [237, 28, 36],
              width: 0.5,
            }
          });
          view.graphics.add(graphic);
        }
/* end of draw line function */

/*Road closed auto line draw */
var polyline = {
          type: "polyline", // autocasts as new Polyline()
          //paths: [[103.871639, 1.305326],[103.871714, 1.305192],[103.872138, 1.304967],[103.872159, 1.304624]]
          paths: [[103.871517,1.305303],[103.871608,1.305145],[103.871691,1.304968],[103.871777,1.304778]]
        };
        // Create a symbol for drawing the line
        var lineSymbol = {
          type: "simple-line", // autocasts as SimpleLineSymbol()
          color: [226, 119, 40],
          width: 2
        };
        var polylineGraphic = new Graphic({
          geometry: polyline,
          symbol: lineSymbol,
         // attributes: lineAtt,
          popupTemplate: {
            // autocasts as new PopupTemplate()
            title: "Road closed"
          }
        });
    document.getElementById("rdclose").onclick = function() {
            view.graphics.addMany([polylineGraphic]);
      }
/*end of Road closed auto line draw*/


/*on road closed start and end points icons  */
//Start Point
var rdcloseStpoint = {
    type: "point", // autocasts as new Point()
    longitude: 103.871517,
    latitude: 1.305303                         
    }; 
var rdcloseStPictureSymbol = {
    type: "picture-marker",
    url: "nocarentry.jpg",
    width: "20",
    height: "20"
  }
var rdcloseStPictureGraphic = new Graphic({
    geometry: rdcloseStpoint,
    symbol: rdcloseStPictureSymbol
   });
//end point
var rdcloseEndpoint = {
    type: "point", // autocasts as new Point()
    longitude: 103.871777,
    latitude: 1.304778                    
    };
    
var rdcloseEndPictureSymbol = {
    type: "picture-marker",
    url: "nocarentry.jpg",
    width: "20",
    height: "20"
  }
var rdcloseEndPictureGraphic = new Graphic({
    geometry: rdcloseEndpoint,
    symbol: rdcloseEndPictureSymbol
   });

document.getElementById("rdclosepoint").onclick = function() {
  view.graphics.addMany([rdcloseStPictureGraphic,rdcloseEndPictureGraphic]);
}
/*end of on road closed start and end points icons*/

/* undo */
document.getElementById("undo").onclick = function() {
  view.graphics.removeAll();
  }
/*undo*/

/*locaion finder using google finder */
/*
https://www.google.com/maps/place/1%C2%B018'17.2%22N+103%C2%B052'18.4%22E/@1.3047793,103.8712298,19z/data=!3m1!4b1!4m9!1m2!2m1!1ssports+hub!3m5!1s0x0:0x0!7e2!8m2!3d1.3047776!4d103.8717768
*/
      });