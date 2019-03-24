<!doctype html>
<html >
<title>incident Record</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="popupincresponse.css">
	 <link rel="stylesheet" href="dropdownstyle.css">
	  <link rel="stylesheet" href="selectimagestyle.css">
	  <link rel="stylesheet" href="checkboxstyle.css">
	  <link rel="stylesheet" href="dropdownlistStylePopup.css">
	  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
	 
	 
	   <!-- Date and time picker css and js --> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
   <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment-with-locales.min.js"></script> 
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	    <link href="datetimepicker.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="datetimejquery.js"></script>
   <script type="text/javascript" src="datetimepicker.js"></script>
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	 <!-- end Date and time picker css and js --> 
	 
	 
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>

</style>
	
</head>
     <script>
$(document).ready(function(){
	$('.collapse').on('shown.bs.collapse', function(){
		$(this).parent().find(".glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus");
	}).on('hidden.bs.collapse', function(){
		$(this).parent().find(".glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus");
	});       
});
</script>
<body>
<div ng-app="ltaApp" ng-controller="ltaController">
   <form>

 <div class="container-fluid">

<!--  Response popup 2nd Screen -->

<div id="popupresponseinc" class="overlay">
  <div class="popup">
    <div class="content">
	<table width="100%"><tr>
		<td><h7><a href="createinc.jsp#popupcreateinc" style="text-decoration: none"> <font color="#C8CFF4">Create </font></a>  > Response</h7></td>
		<td>   <div align='right'> <!--  <div ng-show="createbuttonshow"> 
     	<a href="#popup" class="button1a" id="button1a" ng-click="addincident()"> Create </a>  </div>-->
		<a href="createinc.jsp" class="closebtn" ng-click="showincidentlist()"><i class="fa fa-close"></i></a> 
     	</div> </td>
	</tr>
	</table> 

	<div class='scrollResponse'>
      <table width="100%">
        <tr>
          <td>
		  
		  <div class="panel-group" id="accordion2">
       <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">               	
                    VMS Messages <span data-target="#Collapseiconone" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
            </h4>
        </div>
        <div class="panel-collapse collapse" id="Collapseiconone">
        	<div class="panel-body">
            	<p>Recommended VMS Messages </p>
			<table width="100%" class="tablevms">  
			<tr>
				<th align="left"><h6> Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </h6></th>
				<th align="left"><h6>EQT ID <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></h6></th>
				<th align="left"><h6>Recommended Display <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </h6></th>
				<th align="left"><h6></h6></th>		
			</tr>
			<tr>
				<td> 
				<div ng-if="vmsMsgStatus==='Failed'"><h6> <span class="dotfail"></span> {{vmsMsgStatus}} </h6></div>
				<div ng-if="vmsMsgStatus==='Implemented'"><h6> <span class="dotimp"></span> {{vmsMsgStatus}} </h6></div>
				<div ng-if="vmsMsgStatus==='Not Active'"><h6>  <span class="dotnotact"></span> {{vmsMsgStatus}} </h6></div>
				
				
				</td>
				<td><h6> TIP_758092 </h6></td>
				<td><h6> <textarea class = "textareaVmsMsg" rows="3" cols="55"  placeholder="Heavy Traffic at Dunearn Road" ng-model="recommMsg" ng-click="enableText()" > </textarea></h6></td>
				<td> <i class="material-icons" style="font-size:8px;color:#C8CFF4;">border_color</i> </td>
				
			</tr>	
			</table>
			<table width="100%"> 
				<tr>
					<td align="right">
						<a href="createincresponse.jsp#popupresponseinc" class="buttonRem" id="buttonRem" ng-click="vmsMsgRemoved()"> Remove </a> 
						<a href="createincresponse.jsp#popupresponseinc" class="buttonImp" id="buttonImp" ng-click="vmsMsgImpl()"> Implement </a>	
					</td>
				</tr>
	 	 </table>
            </div>
        </div>
     </div>
     
     <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">           	             	
                    Canning Message <span data-target="#Collapseicontwo" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus" style="float:right;"></span></span>
					<hr color = "#C8CFF4" style="padding:0px; margin:0px;">
            </h4>
			
        </div>
        <div class="panel-collapse collapse" id="Collapseicontwo">
        	<div class="panel-body">
			   <table width="100%"> 
					<tr>
						<td>
						<p>Enter a Canning Message</p>
						
							<textarea class = "textareaVmsMsg" rows="3" cols="55" placeholder="This road has heavy traffic, please Note." ng-model="canningMsg"> </textarea>
							<a href="createincresponse.jsp#popupresponseinc" class="buttonImp" id="buttonImp" ng-click="canMsgSend()"> Send </a>	
						</td>
					</tr>
			 </table>
            </div>
        </div>
     </div>
     <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">
                   OBU Messages<span data-target="#Collapseiconthree" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
        </div>
        <div class="panel-collapse collapse" id="Collapseiconthree">
        	<div class="panel-body">
            	<p>OBU Messages</p>
				<table width="100%" class="tableOBU">  
					<tr>
						<th colspan="3" bgcolor="Red"> Alert </th>
					</tr>
					<tr>					
						<td> 
							<div ng-if="obuMsgStatus==='Failed'"><h6> <span class="dotfail"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Implemented'"><h6> <span class="dotimp"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Not Active'"><h6>  <span class="dotnotact"></span> {{obuMsgStatus}} </h6></div>					
						</td>
						<td><h6> <textarea class = "textareaVmsMsg" rows="3" cols="55" ng-model="recommMsg" ng-click="enableText()"  placeholder="Message to be displayed on OBU"> {{obuMsg}} </textarea></h6></td>						
						<td><h6>KM Marking<input type="text" ng-click="" ng-model="kmmarking" placeholder="1.2" style="width: 32px; height: 24px; padding: 1px;background-color: #202B53;color: #C8CFF4;"> </h6></td>	
					</tr>
					<tr>
						<th colspan="3" bgcolor="yellow"> Jam</th>
					</tr>
					<tr>
						<td> 
							<div ng-if="obuMsgStatus==='Failed'"><h6> <span class="dotfail"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Implemented'"><h6> <span class="dotimp"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Not Active'"><h6>  <span class="dotnotact"></span> {{obuMsgStatus}} </h6></div>						
						</td>
						<td><h6> <textarea class = "textareaVmsMsg" rows="3" cols="55" ng-model="recommMsg" ng-click="enableText()" placeholder="Message to be displayed on OBU" > {{obuMsg}}</textarea></h6></td>						
						<td><h6>KM Marking<input type="text" ng-click="" ng-model="kmmarking" placeholder="1.2" style="width: 32px; height: 24px; padding: 1px;background-color: #202B53;color: #C8CFF4;"> </h6></td>	
					</tr>
					<tr>
						<th colspan="3" bgcolor="Green"> Guide</th>
					</tr>	
					<tr>
						<td> 
							<div ng-if="obuMsgStatus==='Failed'"><h6> <span class="dotfail"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Implemented'"><h6> <span class="dotimp"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Not Active'"><h6>  <span class="dotnotact"></span> {{obuMsgStatus}} </h6></div>						
						</td>
						<td><h6> <textarea class = "textareaVmsMsg" rows="3" cols="55" ng-model="recommMsg" ng-click="enableText()"  placeholder="Message to be displayed on OBU" > {{obuMsg}}</textarea></h6></td>						
						<td><h6>KM Marking<input type="text" ng-click="" ng-model="kmmarking" placeholder="1.2" style="width: 32px; height: 24px; background-color: #202B53;color: #C8CFF4;"> </h6></td>	
					</tr>					
				</table>
				<table width="100%"> 
				<tr>
					<td align="right">
						<a href="createincresponse.jsp#popupresponseinc" class="buttonRem" id="buttonRem" ng-click="obuMsgdeact()"> Deactivate All </a> 
						<a href="createincresponse.jsp#popupresponseinc" class="buttonImp" id="buttonImp" ng-click="obuMsgImpl()"> Implement All </a>	
					</td>
				</tr>
				</table>
            </div>
        </div>
     </div>
       <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">
                   Conjestion Routes Monitoring <span data-target="#Collapseiconfour" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
        </div>
        <div class="panel-collapse collapse" id="Collapseiconfour">
        	<div class="panel-body">
            	<p>Conjestion Routes Monitoring</p>
            </div>
        </div>
     </div>
            <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">              	
                   Partners & Vehicle Response<span data-target="#Collapseiconfive" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
        </div>
        <div class="panel-collapse collapse" id="Collapseiconfive">
        	<div class="panel-body">
            	<p>Partners Intervention</p>
					<table width="100%" class="tablevms">  
						<tr>
							<th align="left"><h6> Type <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </h6></th>
							<th align="left"><h6> Vehicle No. </h6></th>
							<th align="left"><h6> Notify Time </h6></th>
							<th align="left"><h6> Arrival Time </h6></th>	
							<th align="left"><h6> Depature Time </h6></th>								
						</tr>					
						<tr>
							<td>
							<select name="item2" ng-model="partnerType" >
								<option value="Ambulance" >Ambulance</option>
								<option value="Ambulance">Ambulance2</option>
								<option value="Ambulance">Ambulance3</option>
							</select>
							
							</td>
							<td><input type="text" ng-click="" ng-model="partnerVehNo" placeholder="RX23293"></td>
							<td><input type="text" ng-click="" ng-model="partnerNotiTime" placeholder="1/24/2018 12:00"></td>
							<td><input type="text" ng-click="" ng-model="partnerArrTime" placeholder="1/24/2018 12:00"></td>
							<td><input type="text" ng-click="" ng-model="partnerDepatTime" placeholder="1/24/2018 16:00"></td>
						</tr>
						<tr>
							<td>
							<select name="item2" ng-model="partnerType" >
								<option value="Ambulance" >Ambulance</option>
								<option value="Ambulance">Ambulance2</option>
								<option value="Ambulance">Ambulance3</option>
							</select>
							</td>
							<td><input type="text" ng-click="" ng-model="partnerVehNo" placeholder="RX23293"></td>
							<td><input type="text" ng-click="" ng-model="partnerNotiTime" placeholder="1/24/2018 12:00"></td>
							<td><input type="text" ng-click="" ng-model="partnerArrTime" placeholder="1/24/2018 12:00"></td>
							<td><input type="text" ng-click="" ng-model="partnerDepatTime" placeholder="1/24/2018 16:00"></td>
						</tr>							
					</table>
					<table width="100%"> 
						<tr>
							<td align="right">
								<a href="createincresponse.jsp#popupresponseinc" class="buttonRem" id="buttonRem" ng-click="parterMsgRemove()"> Remove </a> 
								<a href="createincresponse.jsp#popupresponseinc" class="buttonImp" id="buttonImp" ng-click="parterMsgAdd()"> Add </a>	
							</td>
						</tr>
				 </table>			
				<p>LTA Vechicles</p>
				<table width="100%" class="tablevms">  
						<tr>
							<th align="left"><h6> Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </h6></th>
							<th align="left"><h6> Vehicle No. </h6></th>
							<th align="left"><h6> Parking Address</h6></th>
							<th align="left"><h6> Parking Lot No.</h6></th>	
							<th align="left"><h6> Notify Time </h6></th>								
						</tr>	
				
						<tr>
							<td>
							<select name="item2" ng-model="partnerType" >
								<option value="Tower1" >Tower1</option>
								<option value="Tower1">Tower2</option>
								<option value="Tower3">Tower3</option>
							</select>
							
							</td>
							<td><input type="text" ng-click="" ng-model="partnerVehNo" placeholder="RX23293"></td>
							<td><input type="text" ng-click="" ng-model="partnerNotiTime" placeholder="Bedok AVe 3"></td>
							<td><input type="text" ng-click="" ng-model="partnerArrTime" placeholder="46"></td>
							<td><input type="text" ng-click="" ng-model="partnerDepatTime" placeholder="1/24/2018 16:00"></td>
						</tr>
						<tr>
							<td>
							<select name="item2" ng-model="partnerType" >
								<option value="Tower1" >Tower1</option>
								<option value="Tower1">Tower2</option>
								<option value="Tower3">Tower3</option>
							</select>
							</td>
							<td><input type="text" ng-click="" ng-model="partnerVehNo" placeholder="RX23293"></td>
							<td><input type="text" ng-click="" ng-model="partnerNotiTime" placeholder="Ang mo kio Street 3"></td>
							<td><input type="text" ng-click="" ng-model="partnerArrTime" placeholder="45"></td>
							<td><input type="text" ng-click="" ng-model="partnerDepatTime" placeholder="1/24/2018 16:00"></td>
						</tr>							
					</table>
					<table width="100%"> 
						<tr>
							<td align="right">
								<a href="createincresponse.jsp#popupresponseinc" class="buttonRem" id="buttonRem" ng-click="parterMsgRemove()"> Remove </a> 
								<a href="createincresponse.jsp#popupresponseinc" class="buttonImp" id="buttonImp" ng-click="parterMsgAdd()"> Add </a>	
							</td>
						</tr>
				 </table>
				
            </div>
        </div>
     </div>
</div>
		  
		  
		  </td>
        </tr>
      </table>
	 </div>
	<div align="right"><a href="createinc.jsp" class="buttonCreateMrtInc"  ng-click="addincident()"> Save </a></div>
    </div>
  </div>
  
</div>



  </div>
</div>
 
<!-- end of Create Incident -->
</form>
  </body>
</html>