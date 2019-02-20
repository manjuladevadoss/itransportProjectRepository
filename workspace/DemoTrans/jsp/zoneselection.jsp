<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <!-- 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
-->
	 <link rel="stylesheet" href="bootstrap.min.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="jquery.js"></script>   
<style type="text/css"> 

 .bs-example{
    	margin: 20px;
    }
body {
  background: #555;
}

.content {
  max-width: 500px;
  margin: auto;
  background: #202B53;
  padding: 10px;
  margin-top: 20%;
}
.btnClass{
backcolor: #283D76;
}
h3 {
  color: white;
  font-family: Roboto, Helvetica, sans-serif;
}
.chkclass {
  color: white;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 14px;
}
p{
  color: white;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 14px;
}
</style>
</head>
<body>
<div class="bs-example">
    <form action="/examples/actions/confirmation.php" method="post">
    <div class="content">
    <h3>Zone Selection </h3>
    <p>Select your Zone </p>
    <p>EWAY Zone </p>
    <p><label class="checkbox-inline">
      <input type="checkbox" value="Zone 1">Zone 1
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" value="Zone 2">Zone 2
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" value="Zone 3">Zone 3
    </label></p>
    <p><label class="checkbox-inline">
      <input type="checkbox" value="Zone 4">Zone 4
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" value="Zone 5">Zone 5
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" value="Zone 6">Zone 6
    </label></p>

        
        <p> Tunnel Zone </p>
      <p><label class="checkbox-inline">
      <input type="checkbox" value="FCT">FCT
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" value="WVT">WVT
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" value="SGT">SGT
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" value="CTE">CTE
    </label></p>     
			 
  
        <p> EAC Corridor </p>
              <p><label class="checkbox-inline">
      <input type="checkbox" value="EAC 50">EAC 50
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" value="EAC 51">EAC 51
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" value="EAC 52">EAC 52
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" value="EAC 53">EAC 53
    </label></p>

      <div class="btnClass"> <button type="submit" >START</button> </div>       
        </div>
       






    </form>
</div>
</body>
</html>                            