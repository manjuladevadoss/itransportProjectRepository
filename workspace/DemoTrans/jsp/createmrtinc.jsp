<!DOCTYPE html>
<html lang="en">
<head>
<title>Create MRT Incident</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="mrtinc.css">
	  <link rel="stylesheet" href="checkboxstyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="jquery.js"></script> 
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
    <form action="createmrtincident.jsp#popupmrtinccreate" method="post">
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
						<h3>Borth Dicrection: </h3>
					</td>						
				</tr>
				
				<tr>
					<td>
						<select ng-model="direction" class="selectcls">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
							<option value="ewline">East West Line</option>
							<option value="nsline">North South Line</option>
							<option value="neline">North East LIne</option>
							<option value="cline">Circle Line</option>
							<option value="dline">Downtown Line</option>
						</select>
						

					</td>
					<td>
								  <div>
									<input id="checkbox-1" class="checkbox-custom" name="checkbox-1" type="checkbox">		<label for="checkbox-1" class="checkbox-custom-label"></label>
								</div>
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
						<select ng-model="startstation" class="selectcls">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
							<option value="ns1">NS1-Jurong East</option>
							<option value="ns28">NS28-Marina South Pier</option>
							<option value="ne1">NE1-HarbourFront</option>
							<option value="ne17">NE17-Punggol</option>
							<option value="cc1">CC1-Dhoby Ghaut</option>
							<option value="cc29">CC29-HarbourFront</option>
							<option value="dt1">DT1-Bukit Panjang</option>
							<option value="dt32">DT32-Expo</option>
						</select>
					</td>
					<td>
						<select ng-model="endstation" class="selectcls">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
							<option value="ns1">NS1-Jurong East</option>
							<option value="ns28">NS28-Marina South Pier</option>
							<option value="ne1">NE1-HarbourFront</option>
							<option value="ne17">NE17-Punggol</option>
							<option value="cc1">CC1-Dhoby Ghaut</option>
							<option value="cc29">CC29-HarbourFront</option>
							<option value="dt1">DT1-Bukit Panjang</option>
							<option value="dt32">DT32-Expo</option>
						</select>

					</td>
					
				</tr>
				<tr>
					<td colspan="2"> <div  align="right">
					<button type="submit" class="button">Create</button> <button type="button" class="button" onclick="myFunction()">Cancel</button> </div>
					</td>
				</tr>
	 	 </table>

	</div>
       
    </form>
</div>
</div>
</body>
</html>                            