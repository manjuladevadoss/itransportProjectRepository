 <!doctype html>
<html >
<title>zone</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="zone.css">
	  <link rel="stylesheet" href="checkboxstyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
<style>


</style>
  </head>
  <body>
<div class="container-fuide">
<img src="itranslogo.JPG" width="3%" height="3%"> <h7>i-Transport 2.0</h7>
  
     <div ng-app="ltaApp" ng-controller="ltaController">  
	    <form action="ccgrid.jsp" method="post">
	    <div class="content">
		<h3>Zone Selection</h3> <br>
		<h6>Select your Zone </h6>
      <table  width="100%" > 
  
	     <tr> 
         <td colspan="4">  <br> <h8> EWAY ZONE </h8> </td>
	  </tr>
	   <tr> 
         <td> 
		  <div>
			<input id="checkbox-15" class="checkbox-custom" name="checkbox-15" type="checkbox" >
			<label for="checkbox-15" class="checkbox-custom-label">ZONE 1</label>
		  </div>
          </td> 
		<td> 
		  <div>
			<input id="checkbox-16" class="checkbox-custom" name="checkbox-16" type="checkbox">
			<label for="checkbox-16" class="checkbox-custom-label">ZONE 2</label>
		  </div> 
        </td> 
        <td colspan="2"> 
          <div>
			<input id="checkbox-17" class="checkbox-custom" name="checkbox-17" type="checkbox">
			<label for="checkbox-17"class="checkbox-custom-label">ZONE 3</label>    
			</div>
        </td> 
     
       </tr>
	   	  </tr>
	   <tr> 
         <td> 
		  <div>
			<input id="checkbox-18" class="checkbox-custom" name="checkbox-18" type="checkbox" >
			<label for="checkbox-18" class="checkbox-custom-label">ZONE 4</label>
		  </div>
          </td> 
		<td> 
		  <div>
			<input id="checkbox-19" class="checkbox-custom" name="checkbox-19" type="checkbox">
			<label for="checkbox-19" class="checkbox-custom-label">ZONE 5</label>
		  </div> 
        </td> 
        <td colspan="2"> 
          <div>
			<input id="checkbox-20" class="checkbox-custom" name="checkbox-20" type="checkbox">
			<label for="checkbox-20"class="checkbox-custom-label">ZONE 6</label>    
			</div>
        </td> 
     
       </tr>
	   
	   
	   <tr> 
         <td colspan="4">   <br><h8> TUNNEL ZONE </h8> </td>
	  </tr>
	   <tr> 
         <td> 
		  <div>
			<input id="checkbox-1" class="checkbox-custom" name="checkbox-1" type="checkbox" >
			<label for="checkbox-1" class="checkbox-custom-label">CTE</label>
		  </div>
          </td> 
		<td> 
		  <div>
			<input id="checkbox-2" class="checkbox-custom" name="checkbox-2" type="checkbox">
			<label for="checkbox-2" class="checkbox-custom-label">FCT</label>
		  </div> 
        </td> 
        <td> 
          <div>
			<input id="checkbox-3" class="checkbox-custom" name="checkbox-3" type="checkbox">
			<label for="checkbox-3"class="checkbox-custom-label">WVT</label>    
			</div>
        </td> 
        <td> 
          <div>
			<input id="checkbox-4" class="checkbox-custom" name="checkbox-4" type="checkbox">
			<label for="checkbox-4"class="checkbox-custom-label">SGT</label>    
        </div>
          </td>      
       </tr>
	  <tr> 
         <td colspan="4">  <br><h8> EAC CORRIDOR  </h8> </td>
	  </tr>
        <tr> 
         <td> 
		  <div>
			<input id="checkbox-5" class="checkbox-custom" name="checkbox-5" type="checkbox" >
			<label for="checkbox-5" class="checkbox-custom-label">EAC 50</label>
		  </div>
          </td> 
		<td> 
		  <div>
			<input id="checkbox-6" class="checkbox-custom" name="checkbox-6" type="checkbox">
			<label for="checkbox-6" class="checkbox-custom-label">EAC 51</label>
		  </div>
        </td> 
        <td> 
          <div>
			<input id="checkbox-7" class="checkbox-custom" name="checkbox-7" type="checkbox">
			<label for="checkbox-7"class="checkbox-custom-label">EAC 52</label>    
			</div>
        </td> 
        <td> 
          <div>
			<input id="checkbox-8" class="checkbox-custom" name="checkbox-8" type="checkbox">
			<label for="checkbox-8"class="checkbox-custom-label">EAC 53</label>    
        </div>
          </td> 
       
       </tr>
	   <tr> 
         <td> 
		  <div>
			<input id="checkbox-9" class="checkbox-custom" name="checkbox-9" type="checkbox" >
			<label for="checkbox-9" class="checkbox-custom-label">EAC 54</label>
		  </div>
          </td> 
		<td> 
		  <div>
			<input id="checkbox-10" class="checkbox-custom" name="checkbox-10" type="checkbox">
			<label for="checkbox-10" class="checkbox-custom-label">EAC 55</label>
		  </div>
        </td> 
        <td> 
          <div>
			<input id="checkbox-11" class="checkbox-custom" name="checkbox-11" type="checkbox">
			<label for="checkbox-11"class="checkbox-custom-label">EAC 56</label>    
			</div>
        </td> 
        <td> 
          <div>
			<input id="checkbox-12" class="checkbox-custom" name="checkbox-12" type="checkbox">
			<label for="checkbox-12"class="checkbox-custom-label">EAC 57</label>    
        </div>
          </td> 
       </tr>
	   
	   <tr> 
         <td> 
		  <div>
			<input id="checkbox-13" class="checkbox-custom" name="checkbox-13" type="checkbox" >
			<label for="checkbox-13" class="checkbox-custom-label">EAC 58</label>
		  </div>
          </td> 
		<td> 
		  <div>
			<input id="checkbox-14" class="checkbox-custom" name="checkbox-14" type="checkbox">
			<label for="checkbox-14" class="checkbox-custom-label">EAC 59</label>
		  </div>
        </td> 
        <td> 
   
        </td> 
        <td> 
          </td> 
       
       </tr>
	   	  <tr> 
         <td colspan="4">   <div  align="right">
	        	<button type="submit" class="button button3"> START </button> </div>
		 </td>
	  </tr>
      </table>
				
		
				<br>
				
	      </div>
			     
        </div>
</div>
  </body>
</html>