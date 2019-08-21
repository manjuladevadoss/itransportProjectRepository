<html lang="en">
<head>
<title>login</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <meta http-equiv="Content-Type" content="text/html"> -->
<meta http-equiv="Content-Type" content="application/x-font-woff">
<meta http-equiv="Content-Type" content="application/x-font-ttf">  
	<link rel="stylesheet" href="bootstrap.min.css">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet"> 
	<link rel="stylesheet" href="login.css">
	<script src="jquery.js"></script>
	<script src="bootstrap.min.js"></script>
	 <script src="angular.min.js"></script>
 	<script type="text/javascript"  src="democontroller.js"></script>  	 
<style type="text/css">
 .textimageIddiv {
 width: 405px;
 height: 45px;
 font-size: 22px;
 color: #FFF;
 font-family: Roboto, Helvetica, sans-serif;
 background-color:#2C3A77;
 border-radius: 8px;
 border: none;
 padding: 8px 10px;   
 }
 
 #textimagePassdiv {
 -webkit-text-security: disc; 
 -webkit-appearance: textfield; 
 -webkit-user-select: text;   
 width: 405px;
 height: 45px;
 font-size: 22px;
 color: #FFF;
 font-family: Roboto, Helvetica, sans-serif;
 background-color:#2C3A77;
  /* */
  border-radius: 8px;
 border: none;
 padding: 8px 10px;  

/*   border: 2px inset;
 
  cursor: auto;*/
}
</style>
<script>
 	//you could use javascript to do nice stuff container text box password option
 /*	var fakepassw = document.getElementById('textimagePassdiv');
	document.getElementById('textimagePassdiv').innerHTML="   *********";
 	//fakepassw.contentEditable="true"; 
 	fakepassw.addEventListener('focus', function(e) {  }, false);*/
 	/*fakepassw.addEventListener('keyup', function(e) {
 	  //console.log(e.keyCode)
 	}, false); */
</script>
</head>
<body>
<div class="container-fuide">
	<table  style="height: 98px; width: 444px;
  background: linear-gradient(177.75deg, rgba(0,0,0,0.2) 0%, rgba(0,0,0,0) 100%);">
		<tr> 
			<td><img src="itranslogo.png" width="88px" height="90px"></td>
	 		<td><h7>i-Transport 2.0</h7> </td>
	 </tr>
	</table>
	 
	<div ng-app="ltaApp" ng-controller="ltaController">  
		<div class="bs-example">  
			<div class="content">    
			   <table class="center" id="logintable">
					<tr> 
						<td>
							<font style="font-size:30px;color:#C8CFF4;">Login </font>
						</td>
					</tr>
					<tr> 
						<td>
							<font style="font-size:15px;color:#C8CFF4;"> Welcome to user </font>
						</td>
					</tr>
					<tr> 
						<td>
								<!--<div class="textimageIddiv" contentEditable="true" id="inputEmail" ng-model="inputEmail"  required > 
									<img src="usericon.png"  width="28px" height="28px"/>Username
								</div>-->
						<!-- <div class="inner-addon left-addon" style="color:#C8CFF4;">
								 <i class="glyphicon glyphicon-user" ></i>		
								<input type="text" class="resizedTextbox" style="padding: 4px 50px;"  placeholder="username"  id="inputEmail" required>	
							</div>   -->	
						<input type="text" class="resizedTextbox" style="padding: 2px 10px;"  placeholder="Username"  id="inputEmail" required>	
						</td>
					</tr>
					<tr> 
						<td>
						<!--<div id="textimagePassdiv" contentEditable="true"  ng-model="inputPassword" required > 
								<img src="lockicon.png"  width="28px" height="28px"/> 
						</div>  -->
						 <!--  <div class="inner-addon left-addon" style="color:#C8CFF4;">
							<i class="glyphicon glyphicon-lock" ></i> 
							<input type="password" style="padding: 4px 50px;" class="resizedTextbox" id="inputPassword" placeholder="*********" required>
						</div> -->
						<input type="password" style="padding: 2px 10px;" class="resizedTextbox" id="inputPassword" placeholder="*********" required>
						</td>
					</tr>
					<tr> 
						<td colspan="2" align="left">
							 <button type="submit" class="button"  ng-click="threepanel()">Login </button> 
						</td>
					</tr>		
				</table>
			</div>	   
		</div>
	</div>
</div>
</body>
</html>                            