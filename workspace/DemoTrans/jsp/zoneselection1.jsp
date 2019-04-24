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
 <script>
  	  
  </script>
  </head>
  <body>
<div class="container-fuide">
	<table  style="height: 98px; width: 444px;
  background: linear-gradient(177.75deg, rgba(0,0,0,0.2) 0%, rgba(0,0,0,0) 100%);">
		<tr> 
			<td><img src="itranslogo.png" width="88px" height="90px"></td>
	 		<td><h7>i-transport 2.0</h7> </td>
	 </tr>
	</table>
  <br>
  <br style="line-height: 150%;">
     <div ng-app="ltaApp" ng-controller="ltaController">  
	    <div class="bs-example">
	   <!-- <form action="ccgrid.jsp" method="post">   -->
	    <div class="content">
		<h3>Zone Selection</h3> 
		<h6>Select your Zone </h6> <br style="line-height: 150%;">
<table  width="100%" id="zonetable"> 
	     <tr> 
         <td colspan="3">   <h8> EWAY Zone </h8> </td>
	  </tr>
	   <tr> 
         <td> 		
			<label class="contentlabel">Zone 1
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>		
          </td> 
		<td> 
			<label class="contentlabel">Zone 2
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>	 
        </td> 
        <td>   
			<label class="contentlabel">Zone 3
				<input type="checkbox">
				<span class="checkmark"></span>
			</label>		
        </td>      
       </tr>	   	  
	   <tr> 
         <td> 
			<label class="contentlabel">Zone 4
				<input type="checkbox">
				<span class="checkmark"></span>
			</label>
          </td> 
		<td> 
			<label class="contentlabel">Zone 5
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label> 
        </td> 
        <td colspan="2"> 
			<label class="contentlabel">Zone 6
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>
        </td>    
       </tr>
	   
	   </table> <br style="line-height: 100%;">
	   <table width="100%" id="zonetable">
	   
	   <tr> 
         <td colspan="4">   <h8> Tunnel Zone: </h8> </td>
	  </tr>
	   <tr> 
         <td> 
			<label class="contentlabel">CTE
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>
          </td> 
		<td> 
			<label class="contentlabel">FCT
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label> 
        </td> 
        <td> 
		<label class="contentlabel">WVT
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>
        </td> 
        <td> 
		<label class="contentlabel">SGT
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>
          </td>      
       </tr>
	   </table>
	   <br style="line-height: 100%;">
	   <table width="100%" id="zonetable">
	  <tr> 
         <td colspan="4">  <h8> EAC Corridor  </h8> </td>
	  </tr>
        <tr> 
         <td> 
			<label class="contentlabel">EAC 50
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>
          </td> 
		<td> 
		  <label class="contentlabel">EAC 51
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>
        </td> 
        <td> 
          <label class="contentlabel">EAC 52
			  <input type="checkbox">
			  <span class="checkmark"></span>
		  </label>
        </td> 
        <td> 
           <label class="contentlabel">EAC 53
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>
          </td> 
       
       </tr>
	   <tr> 
         <td> 
		  <label class="contentlabel">EAC 54
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>
          </td> 
		<td> 
		  <label class="contentlabel">EAC 55
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>
        </td> 
        <td> 
          <label class="contentlabel">EAC 56
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>
        </td> 
        <td> 
          <label class="contentlabel">EAC 57
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>
          </td> 
       </tr>
	   
	   <tr> 
         <td> 
		  <label class="contentlabel">EAC 58
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>
          </td> 
		<td> 
		  <label class="contentlabel">EAC 59
			  <input type="checkbox">
			  <span class="checkmark"></span>
			</label>
        </td> 
        
       </tr>
	   	  <tr> 
         <td colspan="4">   
         	<div  align="right">
	        	 <button type="submit" class="button button3" ng-click="threepanel()" > START </button> 
	        </div>   
	        <!--  <button class="button button3"  onclick="threepanel()"> START </button> </div>  -->
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