<html lang="en">
<head>
<title>login</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <meta http-equiv="Content-Type" content="text/html"> -->
<!-- <meta http-equiv="Content-Type" content="application/x-font-woff">
<meta http-equiv="Content-Type" content="application/x-font-ttf">  -->


	 <link rel="stylesheet" href="bootstrap.min.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
	 <link rel="stylesheet" href="login.css">
<style type="text/css">

</style>
 	 <script src="bootstrap.min.js"></script>
 	 <script src="jquery.js"></script> 
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
					<font style="font-size:32px;color:#C8CFF4;">Login </font>
				</td>
			</tr>
			<tr> 
				<td>
					<font style="font-size:15px;color:#C8CFF4;"> Welcome come to user </font>
				</td>
			</tr>
			<tr> 
				<td>
				<div class="inner-addon left-addon" style="color:#C8CFF4;">
          <i class="glyphicon glyphicon-user" ></i>
				
					<input type="text" class="resizedTextbox" style="padding: 4px 50px;" id="inputEmail" placeholder="Username" required>
					
					</div>
				</td>
			</tr>
			<tr> 
				<td>
				<div class="inner-addon left-addon" style="color:#C8CFF4;">
          <i class="glyphicon glyphicon-lock" ></i>
				 
					 <input type="password" style="padding: 4px 50px;" class="resizedTextbox" id="inputPassword" placeholder="*********" required>
					 </div>
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