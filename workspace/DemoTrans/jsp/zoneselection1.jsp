 <!doctype html>
<html >
<title>zone</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="login.css">
	  <link rel="stylesheet" href="checkboxstyle.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
<style>
.content {
  max-width: 550px;
  margin: auto;
  background: #283D76;
  padding: 10px;
  border-radius: 10px/20px;
}

.fontcolor{ 
color: #C8CFF4;
}



</style>
  </head>
  <body>
<div class="container-fuide">
<img src="itransimg.JPG" width="20%" height="10%"> 
  
     <div ng-app="ltaApp" ng-controller="ltaController">  
    <div class="bs-example">
	    <form action="ccgrid.jsp" method="post">
	    <div class="content">
      <table  width="100%" class="logintable"> 
	<tr> 
         <td colspan="4">  <h3>Zone Selection </h3> </td>
	  </tr>
	   <tr> 
         <td colspan="4">  Select your Zone </td>
	  </tr>
	  
	     <tr> 
         <td colspan="4">   EWAY Zone: </td>
	  </tr>
	    <tr> 
         <td colspan="4">   <div align="center">
<img src="zonemap.JPG" width="90%" height="60%">
</div> </td>
	  </tr>
	   <tr> 
         <td colspan="4">   Tunnel Zone: </td>
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
         <td colspan="4">  EAC Corridor </td>
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
</div>
  </body>
</html>