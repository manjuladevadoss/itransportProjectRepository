<html>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="initial-scale=1,maximum-scale=1,user-scalable=no"
    />
    <title>BaseMap 4.11 Zoom Drawline VMS </title>
	<link rel="stylesheet" href="http://localhost:8080/itrans/arcgis_4.11/esri/themes/light/main.css" />
  	<link rel="stylesheet" href="mrtinc.css"> 
  	<link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="checkboxstyle.css">
    <style>
      html,
      body,
      #viewDiv {
        padding: 0;
        margin: 0;
        height: 100%;
        width: 100%;
      }
      #instruction {
        z-index: 99;
        position: absolute;
        top: 15px;
        left: 50%;
        padding: 5px;
        margin-left: -175px;
        height: 20px;
        width: 350px;
      }
      	#mrtlinediv {
		  top: 150px;
		  left: 550px;
		  position: absolute;
		  z-index: 9;
		  border: solid 0px;
		  background-color:none;
		  width: 530px;
		  height: 550px;
		  border-radius: 13px;
		  text-align: center;
		}
      .esri-layer-list {
        width: 310px;
      }
	  h3 {
  color: #C8CFF4;
  font-size: 18px; padding: 10px 15px;
}

h4 {
height: 30px;
  width: 462px;
  color: #C8CFF4;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 100;
  line-height: 30px;
  padding: 10px 15px;
}
h5 {
  color: #C8CFF4;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 18px;
   padding: 10px 15px;
}
.checkmark {
     left: 10;
}
      
    </style>

<script src="http://localhost:8080/itrans/arcgis_4.11/init.js"></script>  
<script src="basemap411.js"></script>  
 	<script type="text/javascript" src="jquery.js"></script>
 	<script src="angular.min.js"></script>
  	<script src="democontroller.js"></script>   
    <script>
     
    </script>
  </head>
  <body>
	<div class="container-fluid">
		<div ng-app="ltaApp" ng-controller="ltaController">
     <div id="viewDiv"> </div> 
    
    
     <div id="instruction">   
      <button id="mrtclosepoint" >mrt close points  </button>
       <button id="vms" >VMS Picture Symbol</button>
         <button id="line" >Draw a Line </button> 
  
        <button id="rdclose" > Road closure Automatic Line </button>
       <button id="rdclosepoint">Road Closure Entry Exit Picture Symbol  </button>
         <button id="undo" >Reset	   </button>    
       
       
         <div id="mrtlinediv">    	 
			<table   width="100%;" border="5" class="mrtinctable"> 
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
    					 <div ng-show="hidetextbox">
    					 	<input type="text" name="directionid" id="directionid" ng-model="directionid" >
    					 </div> 
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
					<td align="left">
					 <select ng-model="endstation" class="selectcls" ng-change="mrtesel()"  ng-options="o as o for o in mrtlinend">
							<option  value="" selected="selected" hidden="hidden">Choose here</option>
    				 </select>

					</td>
					
				</tr>
				<tr>
				<td> 
					<br>
					<div id="createdir" align="right">
						 <a href="createmrtbase.jsp" class="buttonCreateMrtInc"  ng-click="butt()" style="text-decoration:none;"> CREATE </a>  
							<!-- <button  class="buttonCreateMrtInc"  ng-click="createmrtinc()" style="text-decoration:none;"> CREATE </button> -->
					</div>
				</td> 
				<td> 
					<br>
					<button type="button" class="buttonCan"  id="buttonCan" ng-click="cancelmrtinc()">CANCEL</button>	&nbsp;&nbsp;&nbsp;				 
				</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;&nbsp;</td>
				</tr>
	 	 </table>  
		</div> 
      </div>
</div> 
      </div>
  </body>
</html>



