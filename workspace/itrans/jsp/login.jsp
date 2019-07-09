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
 <!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet"> -->
	 <link rel="stylesheet" href="login.css">
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
 width: 405px;
 height: 45px;
 font-size: 22px;
 color: #FFF;
 font-family: Roboto, Helvetica, sans-serif;
 background-color:#2C3A77;
  /* -webkit-appearance: textfield;  */
  border-radius: 8px;
 border: none;
 padding: 8px 10px;  

/*   border: 2px inset;
  -webkit-user-select: text;  
  cursor: auto;*/
}
</style>
 	 <script src="bootstrap.min.js"></script>
 	 <script src="jquery.js"></script> 
 	 <script> 
 	//you could use javascript to do nice stuff
 	var fakepassw = document.getElementById('textimagePassdiv');
 	//fakepassw.contentEditable="true"; 
 	fakepassw.addEventListener('focus', function(e) { /*yourcode*/ }, false);
 	fakepassw.addEventListener('keyup', function(e) {
 	  //console.log(e.keyCode)
 	}, false);
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
	    <form action="zoneselection.jsp" method="post">
	    <div class="content">    
	   <table class="center" id="logintable">
			<tr> 
				<td>
					<font style="font-size:30px;color:#C8CFF4;">Login </font>
				</td>
			</tr>
			<tr> 
				<td>
					<font style="font-size:15px;color:#C8CFF4;"> Welcome come to user </font>
				</td>
			</tr>
			<tr> 
				<td>
						<div class="textimageIddiv" contentEditable="true" id="inputEmail" ng-model="inputEmail" placeholder="Username" required > 
							<img src="usericon.png"  width="28px" height="28px"/>&nbsp;
						</div>
			<!--	<div class="inner-addon left-addon" style="color:#C8CFF4;">
						<i class="glyphicon glyphicon-user" ></i>			
						<input type="text" class="resizedTextbox" style="padding: 4px 50px;" id="inputEmail" required>				
					</div>  -->
				</td>
			</tr>
			<tr> 
				<td>
				<div id="textimagePassdiv" contentEditable="true"  ng-model="inputPassword" required > 
						<img src="lockicon.png"  width="28px" height="28px"/>&nbsp;
				</div>
				<!-- <div class="inner-addon left-addon" style="color:#C8CFF4;">
					<i class="glyphicon glyphicon-lock" ></i>
					<input type="password" style="padding: 4px 50px;" class="resizedTextbox" id="inputPassword" placeholder="*********" required>
				</div>  -->
				</td>
			</tr>
			<tr> 
				<td colspan="2" align="left">
					 <button type="submit" class="button">Login </button> 
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