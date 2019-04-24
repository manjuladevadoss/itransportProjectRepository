<!DOCTYPE html>  
<html>  
<head>  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
    <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no">  
    <title>MRT Stations eastwest line</title>  
    
    <!-- Map Css -->
    <link rel="stylesheet" href="https://js.arcgis.com/3.28/dijit/themes/claro/claro.css">
    <link rel="stylesheet" href="https://js.arcgis.com/3.28/esri/css/esri.css">
    <link rel="stylesheet" href="mrtmap.css">
    <!-- Map Css -->
	
	<link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="mrtinc.css">
	<link rel="stylesheet" href="checkboxstyle.css">  
	  
    <style>  
		#mrtlinediv {
		  top: 200px;
		  left: 500px;
		  position: absolute;
		  z-index: 100;
		  border: solid 0px;
		  background-color:none;
		  width: 500px;
		  height: 500px;
		  border-radius: 13px;
		}
    </style> 

	 
 	<script src="bootstrap.min.js"></script>
  	<script src="jquery.js"></script>
	<script src="angular.min.js"></script>
  	<script src="democontroller.js"></script>  

    <!-- Map JS -->
    <script src="http://js.arcgis.com/3.28/"></script>  
    <script src="mrtmap.js"></script>  
    <!-- Map JS -->
    <script>  
       
    </script>  
</head>  
<body>  
    <div id="mapDiv">
	<div class="container-fuide">
	<div class="bs-example">
	<div ng-app="ltaApp" ng-controller="ltaController">
    <form action="createmrtincwin.jsp" method="post" ng-submit=createmrtinc()>
		<div id="mrtlinediv">      
			<table width="100%" class="mrtinctable"> 
				<tr>
					<td colspan="2"> <h4>MRT Service Disruption  </h4> </td>
				</tr>
				<tr>
					<td  colspan="2">
						<h5>Create a MRT Service Disruption IR. Start By defining a start point and end point.</h5>
					</td>
				</tr>
				<tr>
					<td align="right">
						<h3>MRT / LRT Line</h3> 
					</td>
					<td align="right">
						<h3>Both Direction: </h3>
					</td>						
				</tr>
				
				<tr>
					<td>
					
						 <select ng-model="direction" class="selectcls" ng-change="mrtlinesel()" ng-options="o as o for o in stations">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
    					 </select>

					</td>
					<td>
					   <label class="contentlabel" style="font-size:17px;">
						  <input type="checkbox" ng-model="bothdir">
						  <span class="checkmark"></span>
						</label>
					</td>
				</tr>
				<tr>
					<td>
						<h3>Start Station</h3>
					</td>
					<td>
						<h3>End Station</h3>
					</td>					
				</tr>
				<tr>
					<td>
					
					 <select ng-model="startstation" class="selectcls" ng-change="mrtssel()"  ng-options="o as o for o in mrtline">
							<option value=""  selected="selected" hidden="hidden">Choose here</option>
    				 </select>
					</td>
					<td>
					 <select ng-model="endstation" class="selectcls" ng-change="mrtesel()"  ng-options="o as o for o in mrtlinend">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
    				 </select>

					</td>
					
				</tr>
				<tr>
					<td colspan="2"> <div  align="right">
					<button type="submit" class="button">CREATE</button> 
					<button type="button" class="buttonCan"  id="buttonCan" onclick="myFunction()">CANCEL</button> </div>
					</td>
				</tr>
	 	 </table>  
		</div>
</form>	
	</div>     
    
    </div>
</div>
</div>
</body>  
</html> 