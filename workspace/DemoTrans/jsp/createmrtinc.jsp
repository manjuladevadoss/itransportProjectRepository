<!DOCTYPE html>
<html lang="en">
<head>
<title>Create MRT Incident</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="bootstrap.min.css">
	  <link rel="stylesheet" href="checkboxstyle1.css">
	 <link rel="stylesheet" href="mrtinc.css">
	  <link rel="stylesheet" href="checkboxstyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="jquery.js"></script>
  	  <script src="angular.min.js"></script>
  	 <script src="democontroller.js"></script>  
<style type="text/css">
</style>
<script>
function myFunction() {
  location.reload();
}
</script>

</head>
<body>
<div class="container-fuide">


<div class="bs-example">
 <div ng-app="ltaApp" ng-controller="ltaController">
    <form action="createmrtincident.jsp#popupmrtinccreate" method="post" ng-submit=createmrtinc()>
    <div class="content">
	    <h4>MRT Service Disruption  </h4>
	    
	    <h5>Create a MRT Service Disruption IR. Start By defining a start point and end point.</h5>
	<br>
		<table width="100%" class="mrtinctable"> 
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
</body>
</html>                            