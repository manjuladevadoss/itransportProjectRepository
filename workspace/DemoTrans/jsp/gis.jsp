<!DOCTYPE html>
<html lang="en">
<head>
<title>GIS</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="bootstrap.min.css">
	  <link rel="stylesheet" href="dropdownstyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="jquery.js"></script> 
  	 
<style>
#map{
	height:700px;
	width:100%;
	}
  
</style>

</head>
<body>
<div class="container-fluid">
   	<div ng-app="ltaApp" ng-controller="ltaController">
  <div id="map"></div>

	</div>
</div>	

</body>

 <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBftNjhUBktbiYrfJMLYRHUCi4BKPGO6eI&callback=initMap">
 </script>
 
 <script>
    	function initMap(){
			//Main Map Option which place you want to show 
    		var options = {
    			zoom:13,
				center: {lat:1.3329, lng:103.7436}
    		}
			
			// Map id show in html and style
    		var map = new google.maps.Map(document.getElementById('map'), options);
			
			//listen for click on map
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
					content:contentMsg
				},
				{
					coords:{lat:1.3485, lng:103.7642},
					content:'<h2>Nature park</h2>'
				},
				{	
					coords:{lat:1.3483, lng:103.6831}
				}
			
			];
			
			// loop  for continues marker 
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
			
			var contentMsg = '<div class="dropdown">
				<a class="button2" href="">&nbsp;Create Incident&nbsp; </a>
	 			<div class="dropdown-content" ng-model="irtypeselected">			 
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Accident')" style="text-decoration:none;"><img src="accident.jpg"> Accident</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Obstacle')" style="text-decoration:none;"><img src="obstacle.jpg"> Obstacle</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Heavy Traffic')" style="text-decoration:none;"><img src="heavytraffic.jpg"> Heavy Traffic</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Road Works')" style="text-decoration:none;"><img src="roadwork.jpg"> Road Works</a>
                <a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Mobile Road Works')" style="text-decoration:none;"><img src="mobileroadwork.jpg"> Mobile Road Works</a>
                <a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Break Down')" style="text-decoration:none;"><img src="breakdown.jpg"> Break Down</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Unattended Vehicle')" style="text-decoration:none;"><img src="unattvehicle.jpg"> Unattended Vehicle</a>
				<a href="createinc.jsp#popupcreateinc" ng-click="visiblecreatebutton('Miscellaneous')" style="text-decoration:none;"><img src="misce.jpg"> Miscellaneous</a>  
	  			</div>
			</div>';
    	}
    </script>   
    
    
</html>   







	                         