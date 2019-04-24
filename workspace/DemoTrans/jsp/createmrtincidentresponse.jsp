<!doctype html>
<html >
<title>Mrt response </title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="popupmrtincresponse.css">
	  <link rel="stylesheet" href="selectimagestyle.css">
	  <link rel="stylesheet" href="checkboxstyle1.css">
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
	 <!-- end Date and time picker css and js --> 
	 
	  <!-- start plus and minu menu  script -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	   <!-- end plus and minu menu  script -->
	 
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* toggle plus and Minus background color*/
.panel-heading.active {
    background-color: #202B53;
  /* color: #C8CFF4;   
    border : none;*/ 
}
.panel-title { 
 font-size: 16px;
  padding-bottom:6px;
}
.panel-body {
    background-color: #202B53;
    color: #C8CFF4; 
    font-size: 12px;
}
.panel, .panel-group .panel-heading+.panel-collapse>.panel-body{
    border: none;
}
.glyphicon {
    font-size: 10px;
}
.panel-title{
  border: solid #37478A;
  /*border-style: solid; */
    border-left-width: 0px;
    border-right-width: 0px;
    border-top-width: 0px;
    border-bottom-width: 3px;
}
/* toggle plus and Minus */
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
    <div class="container-fluid">
   <div ng-app="ltaApp" ng-controller="ltaController">
   <form>
<br>
<br>



<!-- Create Incident -->
<br>
<br>
<!--  Response popup 2nd Screen -->

<div id="popupmrtresponse" class="overlay">
  <table id="inctitletbl">
  	<tr>
		<td> <h2t>MRT IR </h2t></td>
	</tr>
	</table>
  <div class="popup">
    <div class="content">
	<table width="100%" id="incdetailtbl"><tr>

		<td><a href="createmrtincident.jsp#popupmrtinccreate" style="text-decoration: none"> <h3b>CREATE  </h3b> </a> &nbsp; <h3b> > </h3b>   &nbsp;   <h3a>RESPONSE</h3a></td>
		<td>   <div align='right'> <!--  <div ng-show="createbuttonshow"> 
     	<a href="#popup" class="button1a" id="button1a" ng-click="addincident()"> Create </a>  </div>-->
		<a href="createmrtinc.jsp" class="closebtn" ng-click="showincidentlist()" style="text-decoration:none;"><i class="fa fa-close"></i></a> 
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
                    Heavy Traffic Monitoring <span data-target="#Collapseiconone" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
            </h4>
        </div>
        <div class="panel-collapse collapse in" id="Collapseiconone">
        	<div class="panel-body">
            	<p>Click here to add / edit </p>
			<table width="100%" class="tablevms">  
			<tr>
				<th align="left" style="padding:5px;"> Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i> </th>
				<th align="left">IR ID <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></th>
				<th align="left">Road Name <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></th>
				<th align="left">Km <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></th>		
			</tr>
			<tr>
				<td> 
				<div ng-if="vmsMsgStatus==='Failed'"><h6> <span class="dotfail"></span> </h6></div>
				<div ng-if="vmsMsgStatus==='Implemented'"><h6> <span class="dotimp"></span> </h6></div>
				<div ng-if="vmsMsgStatus==='Not Active'"><h6>  <span class="dotnotact"></span> </h6></div>	
				</td>
				<td> IR 232</td>
				<td> Bedok North Road</td>
				<td> 1.2 </td>
				
			</tr>
			<tr>
				<td> 
				<div ng-if="vmsMsgStatus==='Failed'"><h6> <span class="dotfail"></span> </h6></div>
				<div ng-if="vmsMsgStatus==='Implemented'"><h6> <span class="dotimp"></span> </h6></div>
				<div ng-if="vmsMsgStatus==='Not Active'"><h6>  <span class="dotnotact"></span> </h6></div>	
				</td>
				<td> ....</td>
				<td> Bedok North Road</td>
				<td> 1.2 </td>
				
			</tr>
			<tr>
				<td> 
				<div ng-if="vmsMsgStatus==='Failed'"><h6> <span class="dotfail"></span> </h6></div>
				<div ng-if="vmsMsgStatus==='Implemented'"><h6> <span class="dotimp"></span> </h6></div>
				<div ng-if="vmsMsgStatus==='Not Active'"><h6>  <span class="dotnotact"></span> </h6></div>	
				</td>
				<td> ....</td>
				<td> Bedok North Road</td>
				<td> 1.2 </td>
				
			</tr>	
			</table>
			<table width="100%" > 
				<tr>
					<td align="right">
						<a href="createmrtincidentresponse.jsp#popupmrtresponse" class="buttonRem" id="buttonRem" ng-click="vmsMsgRemoved()" style="text-decoration:none;"> Remove </a> 
						<a href="createmrtincidentresponse.jsp#popupmrtresponse" class="buttonImp" id="buttonImp" ng-click="vmsMsgImpl()" style="text-decoration:none;"> Implement </a> 
					</td>
				</tr>
				<tr>
					<td align="right">
						<a href="createmrtincident.jsp#popupmrtinccreate" class="buttonaddhevytraffic" id="buttonaddhevytraffic" ng-click="addheavrytraffic()" style="text-decoration:none;"> Add New Heavy Traffic IR </a> 
					</td>
				</tr>				
	 	 </table>
            </div>
        </div>
     </div>
     
     <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">           	             	
                    VMS Messages <span data-target="#Collapseicontwo" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus" style="float:right;"></span></span>
            </h4>
        </div>
        <div class="panel-collapse collapse" id="Collapseicontwo">
        	<div class="panel-body">
			   <table width="100%" class="tablevms"> 
					<tr>
						<td>
						Enter a VMS Message <br>
							<textarea class = "textareaVmsMsg" rows="3" cols="55" placeholder="This road has heavy traffic, please Note." ng-model="canningMsg"> </textarea>
							<a href="createmrtincidentresponse.jsp#popupmrtresponse" class="buttonImp" id="buttonImp" ng-click="canMsgSend()" style="text-decoration:none;"> Send </a>	
						</td>
					</tr>
			 </table>
            </div>
        </div>
     </div>
     <div class="panel panel-default">
    	<div class="panel-heading active">
        	<h4 class="panel-title">
                   Canning Message<span data-target="#Collapseiconthree" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
        </div>
        <div class="panel-collapse collapse" id="Collapseiconthree">
        	<div class="panel-body">
            	<p>Canning Messages</p>
			   <table width="100%" class="tablevms"> 
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
                   OBU Messages <span data-target="#Collapseiconfour" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>
            </h4>
        </div>
        <div class="panel-collapse collapse" id="Collapseiconfour">
        	<div class="panel-body">
            	<p>OBU Message </p>
				<table width="100%" class="tablevms">  
					<tr>
						<th colspan="3" bgcolor="#EE5656" style="padding:5px;"> Alert </th>
					</tr>
					<tr>					
						<td> 
							<div ng-if="obuMsgStatus==='Failed'"> <span class="dotfail"></span> {{obuMsgStatus}} </div>
							<div ng-if="obuMsgStatus==='Implemented'"> <span class="dotimp"></span> {{obuMsgStatus}} </div>
							<div ng-if="obuMsgStatus==='Not Active'">  <span class="dotnotact"></span> {{obuMsgStatus}} </div>					
						</td>
						<td> <textarea class = "textareaVmsMsg" rows="3" cols="42" ng-model="recommMsg" ng-click="enableText()"  placeholder="Message to be displayed on OBU"> {{obuMsg}} </textarea></td>						
						<td>KM Marking 
						<textarea class = "textareaVmsMsg" rows="1" cols="3" ng-model="markalert" ng-click="enableText()" placeholder="1.2" > {{obuMsg}}</textarea></td>
						
					</tr>
					<tr>
						<th colspan="3" bgcolor="#ECD641" style="padding:5px;"> Jam</th>
					</tr>
					<tr>
						<td> 
							<div ng-if="obuMsgStatus==='Failed'"><h6> <span class="dotfail"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Implemented'"><h6> <span class="dotimp"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Not Active'"><h6>  <span class="dotnotact"></span> {{obuMsgStatus}} </h6></div>						
						</td>
						<td> <textarea class = "textareaVmsMsg" rows="3" cols="42" ng-model="jamMsg" ng-click="enableText()" placeholder="Message to be displayed on OBU" > {{obuMsg}}</textarea></td>						
						<td>KM Marking<textarea class = "textareaVmsMsg" rows="1" cols="3" ng-model="markjam" ng-click="enableText()" placeholder="1.2" > {{obuMsg}}</textarea></td>	
					</tr>
					<tr>
						<th colspan="3" bgcolor="#41EC42" style="padding:5px;"> Guide</th>
					</tr>	
					<tr>
						<td> 
							<div ng-if="obuMsgStatus==='Failed'"><h6> <span class="dotfail"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Implemented'"><h6> <span class="dotimp"></span> {{obuMsgStatus}} </h6></div>
							<div ng-if="obuMsgStatus==='Not Active'"><h6>  <span class="dotnotact"></span> {{obuMsgStatus}} </h6></div>						
						</td>
						<td> <textarea class = "textareaVmsMsg" rows="3" cols="42" ng-model="guideMsg" ng-click="enableText()"  placeholder="Message to be displayed on OBU" > {{obuMsg}}</textarea></td>						
						<td>KM Marking<textarea class = "textareaVmsMsg" rows="1" cols="3" ng-model="markguide" ng-click="enableText()" placeholder="1.2" > {{obuMsg}}</textarea></td>	
					</tr>					
				</table>
				<table width="100%"> 
				<tr>
					<td align="right">
						<a href="createmrtincidentresponse.jsp#popupmrtresponse" class="buttonRem" id="buttonRem" ng-click="obuMsgdeact()" style="text-decoration:none;"> Deactivate All </a> 
						<a href="createmrtincidentresponse.jsp#popupmrtresponse" class="buttonImp" id="buttonImp" ng-click="obuMsgImpl()" style="text-decoration:none;"> Implement All </a>	
					</td>
				</tr>
				</table>            	
          	
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
            	<p>Partners Vehicle Handling</p>
						<table width="100%" class="tablevms">  
						<tr>
							<th align="left" style="padding:5px;"> Type <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4"></i></th>
							<th align="left"> Vehicle No. </th>
							<th align="left"> Notify Time </th>
							<th align="left"> Arrival Time </th>	
							<th align="left"> Depature Time </th>								
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
							<select name="item3" ng-model="partnerType2" >
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
								<a href="createmrtincidentresponse.jsp#popupmrtresponse" class="buttonRem" id="buttonRem" ng-click="parterMsgRemove()" style="text-decoration:none;"> Remove </a> 
								<a href="createmrtincidentresponse.jsp#popupmrtresponse" class="buttonImp" id="buttonImp" ng-click="parterMsgAdd()" style="text-decoration:none;"> Add </a>	
							</td>
						</tr>
				 </table>			
				<p>LTA Vechicles</p>
				<table width="100%" class="tablevms">  
						<tr>
							<th align="left" style="padding:5px;"> Status <i class="fa fa-caret-down" style="font-size:20px;color:#C8CFF4;"></i></th>
							<th align="left"> Vehicle No. </th>
							<th align="left"> Parking Address</th>
							<th align="left"> Parking Lot No.</th>	
							<th align="left"> Notify Time </th>								
						</tr>	
				
						<tr>
							<td>
							<select name="item4" ng-model="partnerType3" >
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
							<select name="item5" ng-model="partnerType4">
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
					
					</table>
					<table width="100%"> 
						<tr>
							<td align="right">
								<a href="createmrtincidentresponse.jsp#popupmrtresponse" class="buttonRem" id="buttonRem" ng-click="parterMsgRemove()" style="text-decoration:none;"> Remove </a> 
								<a href="createmrtincidentresponse.jsp#popupmrtresponse" class="buttonImp" id="buttonImp" ng-click="parterMsgAdd()" style="text-decoration:none;"> Add </a>	
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


	
	<div align="right"><a href="createmrtinc.jsp" class="buttonCreateMrtInc" ng-click="addmrtincident()" style="text-decoration:none;"> SAVE </a></div>
    </div>
  </div>
  
</div>


  </div>
</div>
 
<!-- end of Create Incident -->
</form>
  </body>
</html>