<html lang="en">
<head>
<title>Login</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <meta http-equiv="Content-Type" content="text/html"> -->
<meta http-equiv="Content-Type" content="application/x-font-woff">
<meta http-equiv="Content-Type" content="application/x-font-ttf">  
	<link rel="shortcut icon" href="/Sopra_Steria_logo.ico" type="image/x-icon">
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
#loginstruction {
	z-index: 99;
    position: absolute;
    top: 350px;
    left: 54%;
    padding: 5px;
    margin-left: -175px;
    height: 20px;
    width: 580px;
}
div.b {
  font-size: 20px;
  font-family: Roboto, Helvetica, sans-serif;
}
/******* Event Response Page  ********/
.buttonStart {
  background-image: linear-gradient( 90deg,	rgba(86,94,185,1) , rgba(143,123,242,1)); 
  border: none;
  color: white;
  padding: 8px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 18px;
  margin: 4px 1px;
  cursor: pointer;
  border-radius: 5px/5px;
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

	 
	<div ng-app="ltaApp" ng-controller="ltaController">  
   <div id="loginstruction" >    	        

			   <table  width ="100%" style="text-align: center;" >
					<tr> 
						<td style="text-align: center;">
							<img src="Sopra_Steria_logo.png" width="180px" height="30px"><br>
						</td>
					</tr>
					<tr> 
						<td style="text-align: center;">
							 
							 <a href="#"  ng_click="threepanel()" style="text-decoration:none;">
										  <div class="b"> <font color="white">Intelligent Transport Management System </font> </div> </a><br>  
						</td>
					</tr>
					<td style="text-align: center;">
					<br>	<a href="#" class="buttonStart"  ng-click="threepanel()"  style="text-decoration:none;"> Start </a> &nbsp;&nbsp;		 

				   </td>

	
				</table>

	</div> 
	</div>
</div>
</body>
</html>                            