<!DOCTYPE html>
<html>
  <head>
    <title>Map1</title>
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
			
			
			
			var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
			/*
			// Add markers particular place
			var marker = new google.maps.Marker({				
				position:{lat:1.3187, lng:103.706},
				map:map,
				icon:image
			});
			
			// information window and add Listener 
			var infoWindow = new google.maps.InfoWindow({
				content: '<h1>Birds park</h1>'
			});
			
			//add Listener
			marker.addListener('click', function(){
				infoWindow.open(map,marker);
				
			});
			*/
			
			
			//call addMarker function
		addMarker({
			coords:{lat:1.3187, lng:103.706},
			iconImage:image,
			content:'<h1>Birds park</h1>'
			}); // jurong birds park with flag icon
			
		addMarker({
			coords:{lat:1.3485, lng:103.7642},
			content:'<h2>Nature park</h2>'
			}); //bukit gombak nature park 
		addMarker({coords:{lat:1.3385, lng:103.7304}}); //Chines garden	
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
