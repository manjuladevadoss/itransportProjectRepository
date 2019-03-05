 <!doctype html>
<html >
<title>zone</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="demo.css">
	 <link rel="stylesheet" href="dropdownstyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
<style>
.content {
  max-width: 500px;
  margin: auto;
  background: #202B53;
  padding: 10px;
}

.fontcolor{ 
color: #C8CFF4;
}

.button {
  font-size: 1em;
  padding: 7px 14px;
  color: #202B53;
  border: 2px solid #C8CFF4;
  border-radius: 20px/50px;
  background:#C8CFF4;
}
</style>
  </head>
  <body>
  <div class="container">
  <h3><div> iTransport 2.0</div> </h3>
     <div ng-app="ltaApp" ng-controller="ltaController">  
    <div class="bs-example">
	    <form action="panel.jsp" method="post">
	    <div class="content">
	    <h3>Zone Selection </h3>
	    <p>Select your Zone </p>
	        	<div ng-repeat="z in zone">
	  				<p>{{z.name}}</p>
	         		<div class="fontcolor"><div ng-repeat="cat in z.category">  &nbsp;&nbsp;  &nbsp;&nbsp; <input type="checkbox" value="Zone 1">  &nbsp;&nbsp; {{cat}}</div></div> 
	         		<br>
	        	</div>
	        	<button type="submit" class="button">START</button>
	      </div>
			     
	      </div>
        </div>
</div>
  </body>
</html>