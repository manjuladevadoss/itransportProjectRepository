<!doctype html>
<html >
<title>Mrt incident</title>
  <head>
    <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="popupmrtinccreate.css">
	  <link rel="stylesheet" href="selectimagestyle.css">
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
p {
  margin: 1.0em 0;
  padding: 0;
}
input[type="checkbox"] {
  visibility: hidden;
}
label {
  cursor: pointer;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 16px;
  color: white;
}
input[type="checkbox"] + label:before {
  border: 2px solid #59EE05;
  content: "\00a0";
  display: inline-block;
  font: 15px/1em Roboto;
  font-weight: bold;
  height: 18px;
  margin: 0 .25em 0 0;
  padding: 0;
  vertical-align: top;
  width: 20px;
}
input[type="checkbox"]:checked + label:before {
  background: #59EE05;
  color: #333;
  content: "\2713";
  text-align: center;
}
input[type="checkbox"]:checked + label:after {
  font-weight: bold;
}

input[type="checkbox"]:focus + label::before {
    outline: rgb(59, 153, 252) auto 5px;
}
</style>
	
</head>

<body>
   <div ng-app="ltaApp" ng-controller="ltaController">
   <form>
   <table>
   		<tr>
          <td colspan="3">
            <input id="checkbox-2" class="checkbox-custom" name="checkbox-2" type="checkbox">
			<label for="checkbox-2" class="checkbox-custom-label">Simulated 34 </label> 
           </td>
          <td colspan="3"> 
			<input id="checkbox-3" class="checkbox-custom" name="checkbox-3" type="checkbox">
			<label for="checkbox-3" class="checkbox-custom-label">Important</label> 
          </td>
        </tr>
		<tr>
          <td colspan="3">
          	<input id="checkbox-4" class="checkbox-custom" name="checkbox-4" type="checkbox">
			<label for="checkbox-4" class="checkbox-custom-label">VRS</label> 
          </td>
          <td colspan="3"> 
		    <input id="checkbox-5" class="checkbox-custom" name="checkbox-5" type="checkbox">
			<label for="checkbox-5" class="checkbox-custom-label">LTM</label> 
          </td>
        </tr> 
   </table>
   </form>
   </div>
   </body>
   </html>