<!DOCTYPE html>
<html>
  <head>
    <title>Map2</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    
    <style>
		#map{
		height:700px;
		width:100%;
		}
  
    </style>
  </head>
  <body>
  
  <h1>My Map</h1>
  
    <div id="map"></div>
    
    
    
    <script>
    	function initMap(){
			//Map Option which place you want to show 
    		var options = {
    			zoom:13,
				center: {lat:1.3329, lng:103.7436}
    		}
			
			// Map id show in html and style
    		var map = new google.maps.Map(document.getElementById('map'), options);
			
			//listen for click on map onclick you can create the marker
			google.maps.event.addListener(map,'click', function(event){
				//add marker
				addMarker({coords:event.latLng});
			});
			
			var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';		
			//Array of Marker
			var markers = [
				{
					coords:{lat:1.3187, lng:103.706},
					iconImage:image,
					content:'<h1>Birds park</h1>'
				},
				{
					coords:{lat:1.3485, lng:103.7642},
					content:'<h2>Nature park</h2>'
				},
				{	
					coords:{lat:1.3483, lng:103.6831}
				}
			
			];
			// loop
			for(var i=0;i<markers.length;i++){
				// add marker
				addMarker(markers[i]);
			}
		
			//Multiple marker functions
			function addMarker(props){
			// Add markers particular place
			var marker = new google.maps.Marker({				
				position:props.coords,
				map:map,
				//icon:props.iconImage
			});
			
			//Check for custom Icon
			if(props.iconImage){
				//set icon image
				marker.setIcon(props.iconImage);
			}
			
			//Check Content
			if(props.content){
				// information window and add Listener 
			var infoWindow = new google.maps.InfoWindow({
				content:props.content
			});
			
			//add Listener
			marker.addListener('click', function(){
				infoWindow.open(map,marker);
				
			});
			}
			
			}
			
			
			
			
    	}
    </script>

    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBftNjhUBktbiYrfJMLYRHUCi4BKPGO6eI&callback=initMap">
    </script>
  
  </body>
</html>
