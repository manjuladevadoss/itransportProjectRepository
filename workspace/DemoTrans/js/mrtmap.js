 var map = null;  
        require([  
                "esri/map", "esri/Color", 
                "esri/symbols/PictureMarkerSymbol",  
                "esri/graphic","esri/symbols/TextSymbol","esri/symbols/CartographicLineSymbol",  
                "esri/geometry/Point", "esri/SpatialReference","esri/geometry/Polyline", 
                "dojo/on",  
                "dojo/domReady!"  
        ],  
        function (  
          Map, Color,
          PictureMarkerSymbol,  
          Graphic,TextSymbol,CartographicLineSymbol, 
          Point, SpatialReference,Polyline, 
          on  
        ) {  
            map = new Map("mapDiv", {  
                basemap: "dark-gray-vector",  
                center: [103.877, 1.304],
                zoom: 12
            });  
  
            var mrtStation = [  
                { lat: 1.281, long: 103.839, icon: 'trainy.png', width: 18, height: 18, title:'MRT -  Outram Park12' },  
                { lat: 1.289, long: 103.817, icon: 'trainy.png', width: 18, height: 18, title:'MRT - Redhill' }, 
                { lat: 1.294, long: 103.806, icon: 'trainy.png', width: 18, height: 18, title:'MRT - Queenstown' },  
                { lat: 1.307, long: 103.79, icon: 'trainy.png', width: 18, height: 18, title:'MRT - North Buona Vista' }, 
                { lat: 1.312, long: 103.778, icon: 'trainy.png', width: 18, height: 18, title:'MRT-Dove' }, 
                 ];   

    //Draw Line
        var lineSymbol = new CartographicLineSymbol(
          CartographicLineSymbol.STYLE_SOLID,
          new Color([255, 215, 0]), 2,
          CartographicLineSymbol.CAP_ROUND,
          CartographicLineSymbol.JOIN_MITER, 5
            );
            
        //text font color show next to picturemarkersymbol
        var fontColor = new Color("#B0B2AF");
        
        var lineGeometry = new Polyline(new SpatialReference({wkid:4326}));
         lineGeometry.addPath([[103.817,1.289], [103.839,1.281]]);

        // var lineGraphic = new Graphic(lineGeometry, lineSymbol);
      //   gl.add(lineGraphic)

        on(map, "load", function () {    
                for (var k=0; k < mrtStation.length; k++){  
                    var point = new Point(mrtStation[k].long, mrtStation[k].lat);  
                    var pictureMarkerSymbol = new PictureMarkerSymbol(mrtStation[k].icon, mrtStation[k].width, mrtStation[k].height);
                    pictureMarkerSymbol.xoffset= 12  ;
                    pictureMarkerSymbol.yoffset= 10
                    
                    //mrt line polyline start and end
                    var startlong =  mrtStation[k].long;
                    var startlat =  mrtStation[k].lat;
                    var endlong = mrtStation[k].long;
                    var endlat = mrtStation[k].lat;
                    if(k < (mrtStation.length-1) ) {
                        var j = k+1;
                        endlong =  mrtStation[j].long;
                        endlat =  mrtStation[j].lat;
                    } else {
                        endlong =  mrtStation[k].long;
                        endlat =  mrtStation[k].lat;
                    }
                    lineGeometry.addPath([[startlong,startlat], [endlong,endlat]]);
                    
                    //Text message MRT station names on top of pciture image
                    var textSym = new TextSymbol(mrtStation[k].title).setColor(fontColor);
                    textSym.font.setSize("8pt");  
                    textSym.font. setFamily("Roboto");  
                    textSym.xoffset = 20;    // font position one the map next to the picturemarkersymbol
                    textSym.yoffset = 20; // font position one the map next to the picturemarkersymbol
                    //end of text message

                    map.graphics.add(new Graphic(lineGeometry, lineSymbol)); 
                    map.graphics.add(new Graphic(point, pictureMarkerSymbol)); 
                    map.graphics.add(new Graphic(point, textSym));  
                    
                }
            });  
        })  
  