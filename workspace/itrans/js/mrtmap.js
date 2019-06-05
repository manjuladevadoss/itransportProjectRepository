var map = null;  
        require([  
                "esri/map", "esri/Color", 
                "esri/symbols/PictureMarkerSymbol",  
                "esri/graphic","esri/symbols/TextSymbol","esri/symbols/CartographicLineSymbol",  
                "esri/geometry/Point", "esri/SpatialReference","esri/geometry/Polyline", 
                "dojo/dom","dojo/on",  
                "dojo/domReady!"  
        ],  
        function (  
          Map, Color,
          PictureMarkerSymbol,  
          Graphic,TextSymbol,CartographicLineSymbol, 
          Point, SpatialReference,Polyline, dom,
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
                { lat: 1.312, long: 103.778, icon: 'trainy.png', width: 18, height: 18, title:'MRT-Dover' }, 
                 ];  
            
            var mrtStationNS = [  
                { lat: 1.35, long: 103.755, icon: 'trainy.png', width: 18, height: 18, title:'MRT -  Bukit Batok' },  
                { lat: 1.363, long: 103.754, icon: 'trainy.png', width: 18, height: 18, title:'MRT - Bukit Gombak' }, 
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
        //lineGeometry.addPath([[103.817,1.289], [103.839,1.281]]);
        
        
        // var lineGraphic = new Graphic(lineGeometry, lineSymbol);
      //   gl.add(lineGraphic)

        
         
         on(dom.byId("createdir"), "click", function(evt) {
        	drawmrtline(evt);
        }); 
         on(dom.byId("createdir1"), "click", function(evt) {
         	drawmrtline(evt);
         });  
         
         
      // To draw MRT Service Disruption line passing mrt station lati and logi points and picture image.
         function drawmrtline(evt) {
        	 var direction = document.getElementById('directionid').value;
         	if(direction=="East West Line") {
                 //initial station
         		for(var k=0; k < mrtStation.length; k++){
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
         	 } else if (direction=="North South Line") {
         		 
                //  var lineGeometry = new Polyline(new SpatialReference({wkid:4326}));
                  //lineGeometry.addPath([[103.817,1.289], [103.839,1.281]]);
                  for (var k=0; k < mrtStationNS.length; k++){  
                   var point = new Point(mrtStationNS[k].long, mrtStationNS[k].lat);  
                   var pictureMarkerSymbol = new PictureMarkerSymbol(mrtStationNS[k].icon, mrtStationNS[k].width, mrtStationNS[k].height);
                   pictureMarkerSymbol.xoffset= 12  ;
                   pictureMarkerSymbol.yoffset= 10
                   
                   //mrt line polyline start and end
                   var startlong =  mrtStationNS[k].long;
                   var startlat =  mrtStationNS[k].lat;
                   var endlong = mrtStationNS[k].long;
                   var endlat = mrtStationNS[k].lat;
                   if(k < (mrtStationNS.length-1) ) {
                       var j = k+1;
                       endlong =  mrtStationNS[j].long;
                       endlat =  mrtStationNS[j].lat;
                   } else {
                       endlong =  mrtStationNS[k].long;
                       endlat =  mrtStationNS[k].lat;
                   }
                   lineGeometry.addPath([[startlong,startlat], [endlong,endlat]]);
                   
                   //Text message MRT station names on top of pciture image
                   var textSym = new TextSymbol(mrtStationNS[k].title).setColor(fontColor);
                   textSym.font.setSize("8pt");  
                   textSym.font. setFamily("Roboto");  
                   textSym.xoffset = 20;    // font position one the map next to the picturemarkersymbol
                   textSym.yoffset = 20; // font position one the map next to the picturemarkersymbol
                   //end of text message

                   map.graphics.add(new Graphic(lineGeometry, lineSymbol)); 
                   map.graphics.add(new Graphic(point, pictureMarkerSymbol)); 
                   map.graphics.add(new Graphic(point, textSym));  
               }
         	 } else if(direction=="North East Line") {
         	 }
        	 
         }
       
        //** cctv camera and roadword display */
        var cctvlocation = [  
          { lat: 1.309, long: 103.825, icon: 'cctv.png', width: 18, height: 18},   
          { lat: 1.321, long: 103.803, icon: 'cctv.png', width: 18, height: 18}, 
          { lat: 1.313, long: 103.81, icon: 'cctv.png', width: 18, height: 18},   
          { lat: 1.337, long: 103.79, icon: 'cctv.png', width: 18, height: 18}, 
          { lat: 1.358, long: 103.884, icon: 'cctv.png', width: 18, height: 18}, 
          { lat: 1.373, long: 103.851, icon: 'cctv.png', width: 18, height: 18}, 
          { lat: 1.372, long: 103.898, icon: 'cctv.png', width: 18, height: 18}, 
          { lat: 1.329, long: 103.84, icon: 'cctv.png', width: 18, height: 18}, 
          { lat: 1.322, long: 103.846, icon: 'cctv.png', width: 18, height: 18}, 
           ];
           
           var roadworklocation = [  
            { lat: 1.372, long: 103.898, icon: 'roadwork1.JPG', width: 18, height: 18},  
            { lat: 1.336, long: 103.925, icon: 'roadwork1.JPG', width: 18, height: 18}, 
            { lat: 1.345, long: 103.957, icon: 'roadwork1.JPG', width: 18, height: 18},
            { lat: 1.314, long: 103.806, icon: 'roadwork1.JPG', width: 18, height: 18},    
            { lat: 1.323, long: 103.902, icon: 'roadwork1.JPG', width: 18, height: 18}, 
            { lat: 1.31, long: 103.836, icon: 'roadwork1.JPG', width: 18, height: 18},  
            { lat: 1.327, long: 103.85, icon: 'roadwork1.JPG', width: 18, height: 18}, 
            { lat: 1.317, long: 103.86, icon: 'roadwork1.JPG', width: 18, height: 18},
             ];
          
           var x = document.getElementById("infocctvcamerashow");
           x.style.display = "none";
      	 
             on(dom.byId("infocctvcamera"), "click", function(evt) {
            	 var x = document.getElementById("infocctvcamerashow");
            	   // To make visible the div
            	   if (x.style.display === "none") {
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
            	     x.style.display = "block";
            	     
            	   }
            	     else {
            	         x.style.display = "none";  
            	            // Remove the cctv and road work image 
            	   } 
          });
      
        //**  end of cctv camera and roadwork display*/
        
        
        })  
  