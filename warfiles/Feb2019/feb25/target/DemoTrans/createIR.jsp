<!doctype html>
<html >
<title>incident Record</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
	  <link rel="stylesheet" href="dropdownstyle.css">
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
	 <script type="text/javascript" src="popper.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  background-color: #43498F;
}
p{
  color: #77ebff;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 14px;
}
h5 {
  color: #77ebff;
  font-family: Roboto, Helvetica, sans-serif;
}

</style>
 
  </head>
  <body>
  <h3>iTransport 2.0</h3>
      <h5>Incident </h5>
   <div ng-app="ltaApp" ng-controller="ltaController">
   <p>Fill in the detail of your IR. hghgh</p>
    <form>
    


    
	 <table border="1" width="100%">
			<tr>
				<td  bgcolor="#43498F"><p>Status</p></td>
				<td  bgcolor="#43498F"><p>Source</p></td>
			</tr>
			<tr>
				<td  bgcolor="#43498F">
					<div class="btn-group">
					<select>
						<option value="Confirmed">Confirmed</option>
						<option value="Over">Over</option>
						<option value="In Progress">In Progress</option>
						<option value="Notified">Notified</option>
						<option value="other">Other</option>
					</select>
				</div>
			</td>
			<td  bgcolor="#43498F">
				<div class="btn-group">
					<select>
						<option value="ERS">ERS</option>
						<option value="JEYE">JEYE</option>
						<option value="other">Other</option>
					</select>
				</div>
			</td>
				
			</tr>
	</table> 





    <input type="button" ng-click="addincident()" value="Reset" />
   </form>
       
    </div>
    
  </body>
</html>

