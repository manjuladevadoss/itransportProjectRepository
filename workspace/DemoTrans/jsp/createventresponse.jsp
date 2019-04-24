<!doctype html>
<html >
<title>Event Response Creation</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="popupeventresponse.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="angular.min.js"></script>
  	 <script type="text/javascript"  src="democontroller.js"></script> 
  	 <script type="text/javascript"  src="jquery.js"></script> 
  	 
 <!-- Date and time picker css and js --> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
   <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment-with-locales.min.js"></script> 
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	   <!--  <link href="datetimepicker.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="datetimejquery.js"></script>
   <script type="text/javascript" src="datetimepicker.js"></script>  --> 
	 <!-- end Date and time picker css and js --> 
   
   <!-- start plus and minu menu  script -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	 
	<!-- end plus and minu menu script-->	
   
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* toggle plus and Minus background color*/
.panel-heading.active {
    background-color: #202B53;
    color: #C8CFF4;  
    border : none;
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
   <!-- Create Event -->
<br>
<br>

<div id="createventresponsepopup" class="overlay">
  <table id="inctitletbl">
  	<tr>
		<td> <h2t>Events {{eventname1}}  {{eventypeselected}}</h2t></td>
	</tr>
	</table>
  <div class="popup">
    <div class="contentEventCreate">
    
	<table width="100%" id="incdetailtbl"><tr>
		<td>  <a href="createvent.jsp#createventpopup"  style="text-decoration:none;"><h3b> Details   </h3b> </a> &nbsp; <h3b> > </h3b>   &nbsp;  <h3a> Response  </h3a> </td>
		<td> <div align='right'>  

		<a href="eventTbl.jsp" class="closebtn" ng-click="showincidentlist()" style="text-decoration: none"> <i class="fa fa-close"></i></a> </div>
     	</td>
	</tr></table>   
	<br>
	<div class='scrollcreatevent'>
		<div class="panel-group" id="accordion2">
	       <div class="panel panel-default">
	    	<div class="panel-heading active">
	        	<h4 class="panel-title">               	
	                    VMS Plans <span data-target="#Collapseiconone" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
	            </h4>
				
	        </div>
	        <div class="panel-collapse collapse" id="Collapseiconone">
	        	<div class="panel-body">
            	<p>Recommended VMS Messages </p>
				<table width="100%" class="tablevms">  
				<tr>
					<th align="left">Recommended Display <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
					<th align="left"> Time <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
					<th align="left">EQT ID <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
					<th align="left"> </th>		
				</tr>
				<tr>
					<td><textarea class = "textareaeventVmsMsg" rows="3" cols="40"  placeholder="Heavy Traffic at Dunearn Road" ng-model="recommMsg" ng-click="enableText()" > </textarea></td>
					<td>
					<input type="text" ng-click="" ng-model="partnerNotiTime" placeholder="12/5/2019 10:30:32-16:00:00" 
								style =" width: 100px; height: 35px; background-color: #2C3A77; color: #FFF; border : none; border-radius: 8px;">
					</td>
					<td> TIP 568231</td>
					<td> <img src="editicon.png" width="17px" height="17px"> </td>
					
				</tr>
				<tr>
					<td><textarea class = "textareaeventVmsMsg" rows="3" cols="40"  placeholder="Heavy Traffic at Dunearn Road" ng-model="recommMsg" ng-click="enableText()" > </textarea></td>
					<td>
					<input type="text" ng-click="" ng-model="partnerNotiTime" placeholder="12/5/2019 10:30:32-16:00:00" 
								style =" width: 100px; height: 35px; background-color: #2C3A77; color: #FFF; border : none; border-radius: 8px;">
					</td>
					<td> TIP 568231</td>
					<td> <img src="editicon.png" width="17px" height="17px"> </td>
					
				</tr>	
				</table>
				<table width="100%"> 
						<tr>
							<td align="right">
								<a href="createventresponse.jsp#createventresponsepopup" class="buttonadd" id="buttonadd" ng-click="parterMsgAdd()" style="text-decoration:none;"> New VMS Plan</a>
								<a href="createventresponse.jsp#createventresponsepopup" class="buttondelete" id="buttondelete" ng-click="parterMsgRemove()" style="text-decoration:none;"> Remove </a> 									
							</td>
						</tr>
				 </table>
				 
				VMS Set
				<table width="100%" class="tablevms">  
				<tr>
					<th align="left">Set <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
					<th align="left"> Time <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
					<th align="left">EQT ID <i class="fa fa-caret-down" style="font-size:18px;color:#C8CFF4"></i></th>
				</tr>
				<tr>
					<td> 1</td>
					<td> 12/5/2019 10:30:32-16:00:00</td>
					<td> TIP 8231</td>
				</tr>
				<tr>
					<td> 2</td>
					<td> 16/4/2019 11:00:30-17:00:00</td>
					<td> TIP 568231</td>					
				</tr>	
				</table>
				 
	            </div>
	        </div>
	     </div>
		 
		  <div class="panel panel-default">
		    	<div class="panel-heading active">
							<h4 class="panel-title">               	
								Canning Messages <span data-target="#Collapseicontwo" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
							</h4>
							
				</div>
			
			
			<div class="panel-collapse collapse" id="Collapseicontwo">
	        	<div class="panel-body">
	            	<p>Canning Messages</p>
			   <table width="100%"> 
					<tr>
						<td>
						<p>Enter a Canning Message</p>
						
							<textarea class = "textareaeventcanMsg" rows="3" cols="55" placeholder="This road has heavy traffic, please Note." ng-model="canningMsg"> </textarea>
							<a href="createventresponse.jsp#createventresponsepopup" class="buttoneveImp" id="buttoneveImp" ng-click="canMsgSend()"> Send </a>	
						</td>
					</tr>
			 </table>
	            </div>
        	</div>						
	     </div>
	     
	     <div class="panel panel-default">
		    	<div class="panel-heading active">
							<h4 class="panel-title">               	
								OBU Messages <span data-target="#Collapseiconthree" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
							</h4>
							
				</div>
			<div class="panel-collapse collapse" id="Collapseiconthree">
				<div class="panel-body">
				<p>OBU Messages</p>
					<table width="100%" class="tableventOBU">  
						<tr>
							<th colspan="3" bgcolor="Red"> Alert </th>
						</tr>
						<tr>					
							<td> 
								<div ng-if="obuMsgStatus==='Failed'"> <span class="dotfail"></span> {{obuMsgStatus}} </div>
								<div ng-if="obuMsgStatus==='Implemented'"> <span class="dotimp"></span> {{obuMsgStatus}} </div>
								<div ng-if="obuMsgStatus==='Not Active'">  <span class="dotnotact"></span> {{obuMsgStatus}} </div>					
							</td>
							<td> <textarea class = "textareaeventObuMsg" rows="3" cols="45" ng-model="recommMsg" ng-click="enableText()"  placeholder="Message to be displayed on OBU"> {{obuMsg}} </textarea></td>						
							<td>KM Marking 
							<textarea class = "textareaeventObuMsg" rows="1" cols="3" ng-model="markalert" ng-click="enableText()" placeholder="1.2" > {{obuMsg}}</textarea></td>
							
						</tr>
						<tr>
							<th colspan="3" bgcolor="yellow"> Jam</th>
						</tr>
						<tr>
							<td> 
								<div ng-if="obuMsgStatus==='Failed'"> <span class="dotfail"></span> {{obuMsgStatus}} </div>
								<div ng-if="obuMsgStatus==='Implemented'"> <span class="dotimp"></span> {{obuMsgStatus}} </div>
								<div ng-if="obuMsgStatus==='Not Active'">  <span class="dotnotact"></span> {{obuMsgStatus}} </div>						
							</td>
							<td> <textarea class ="textareaeventObuMsg" rows="3" cols="45" ng-model="jamMsg" ng-click="enableText()" placeholder="Message to be displayed on OBU" > {{obuMsg}}</textarea></td>						
							<td>KM Marking<textarea class = "textareaeventObuMsg" rows="1" cols="3" ng-model="markjam" ng-click="enableText()" placeholder="1.2" > {{obuMsg}}</textarea></td>	
						</tr>
						<tr>
							<th colspan="3" bgcolor="Green"> Guide</th>
						</tr>	
						<tr>
							<td> 
								<div ng-if="obuMsgStatus==='Failed'"> <span class="dotfail"></span> {{obuMsgStatus}} </div>
								<div ng-if="obuMsgStatus==='Implemented'"> <span class="dotimp"></span> {{obuMsgStatus}} </div>
								<div ng-if="obuMsgStatus==='Not Active'"> <span class="dotnotact"></span> {{obuMsgStatus}} </div>						
							</td>
							<td> <textarea class = "textareaeventObuMsg" rows="3" cols="45" ng-model="guideMsg" ng-click="enableText()"  placeholder="Message to be displayed on OBU" > {{obuMsg}}</textarea></td>						
							<td>KM Marking<textarea class = "textareaeventObuMsg" rows="1" cols="3" ng-model="markguide" ng-click="enableText()" placeholder="1.2" > {{obuMsg}}</textarea></td>	
						</tr>					
					</table>
					<table width="100%"> 
					<tr>
						<td align="right">
							<a href="createventresponse.jsp#createventresponsepopup" class="buttoneveRem" id="buttoneveRem" ng-click="obuMsgdeact()" style="text-decoration:none;"> Deactivate All </a> 
							<a href="createventresponse.jsp#createventresponsepopup" class="buttoneveImp" id="buttoneveImp" ng-click="obuMsgImpl()" style="text-decoration:none;"> Implement All </a>	
						</td>
					</tr>
					</table>		
				</div>
			</div>
	     </div>
	     
	     <div class="panel panel-default">
		    	<div class="panel-heading active">
							<h4 class="panel-title">               	
								Sub IR <span data-target="#Collapseiconfour" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
							</h4>
							
				</div>
			<div class="panel-collapse collapse" id="Collapseiconfour">
				<div class="panel-body">
								Sub Incident Record information
				</div>
			</div>
	     </div>
	     
	     <div class="panel panel-default">
		    	<div class="panel-heading active">
							<h4 class="panel-title">               	
								Contacts <span data-target="#Collapseiconfive" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
							</h4>
							
				</div>
			<div class="panel-collapse collapse" id="Collapseiconfive">
				<div class="panel-body">
						Contact Details		
				</div>
			</div>
	     </div>
		  <div class="panel panel-default">
		    	<div class="panel-heading active">
							<h4 class="panel-title">               	
								Road Closure Monitoring <span data-target="#Collapseiconsix" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
							</h4>
							
				</div>
			<div class="panel-collapse collapse" id="Collapseiconsix">
				<div class="panel-body">
						Road closure monitoring information		
				</div>
			</div>
	     </div>	
	     
	     <div class="panel panel-default">
		    	<div class="panel-heading active">
							<h4 class="panel-title">               	
								Notes <span data-target="#Collapseiconseven" data-toggle="collapse" data-parent="#accordion2" > <span class="glyphicon glyphicon-plus"  style="float:right;"></span></span>             
							</h4>
							
				</div>
			<div class="panel-collapse collapse" id="Collapseiconseven">
				<div class="panel-body">
						<p> Add Notes to this event </p>
						
					<table width="100%" class="tablevms">  
						<tr>
							<th align="left"> Notes </th>
							<th align="left"> Author </th>
						</tr>					
						<tr>
							<td>
								<textarea class = "textareanote" rows="2" cols="50" ng-model="guideMsg" ng-click="enableText()"  placeholder="note1" > note1
								</textarea>
							</td>
							<td>
								<input type="text" ng-click="" ng-model="partnerNotiTime" placeholder="author1" 
								style =" width: 100px; height: 35px; background-color: #2C3A77; color: #FFF; border : none; border-radius: 8px;">
							
							</td>
						</tr>
						
					</table>
					<table width="100%"> 
						<tr>
							<td align="right">
								<a href="createventresponse.jsp#createventresponsepopup" class="buttondelete" id="buttondelete" ng-click="parterMsgRemove()" style="text-decoration:none;"> Delete Note </a> 
								<a href="createventresponse.jsp#createventresponsepopup" class="buttonadd" id="buttonadd" ng-click="parterMsgAdd()" style="text-decoration:none;"> Add a New Note</a>	
							</td>
						</tr>
				 </table>
						
							
				</div>
			</div>
	     </div>	     
	     
		 </div>
						<table width="100%" class="eventclosuretable">
						<tr>
							<td colspan="3"> 
							<div align="right"><a href="eventTbl.jsp" class="buttonCreateventInc" ng-click="addmrtincident()" style="text-decoration:none;"> SAVE </a></div>
							</td>
						</tr>
						</table> 		 
		 
	 </div>

    </div>
  </div>
</div>
  </div>
</div>

</form>
 </body>

</html>