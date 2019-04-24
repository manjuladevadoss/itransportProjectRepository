<!DOCTYPE html>
<html lang="en">
<head>
<title>Date and Time</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="login.css">
	 
	 <!-- Date and Time Picker -->
	    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	    <link href="datetimepicker.css" rel="stylesheet" type="text/css"/> 
	     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  	 
 	 <!-- End Date and Time Picker -->
 	 
 	 <script src="bootstrap.min.js"></script>
  	 <script src="jquery.js"></script>
  	 
  	 <!-- Date and Time Picker -->
  	 <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
   	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment-with-locales.min.js"></script> 
   	<script type="text/javascript" src="datetimejquery.js"></script>
   	<script type="text/javascript" src="datetimepicker.js"></script>
	 <!-- End Date and Time Picker --> 
<style type="text/css">
</style>

</head>
<body>
<div class="container-fuide">
	<table>
		<tr> 
			<td><img src="itranslogo.JPG"></td>
	 		<td><h7>i-Transport 2.0</h7> </td>
	 </tr>
	</table>
	 
	<div ng-app="ltaApp" ng-controller="ltaController">  
date and time check
    <div class="row">
        <div class='col-sm-6'>
            <input type='text' class="form-control" id='datetimepicker4' />
        </div>

    </div>


	</div>
</div>


</body>
        <script type="text/javascript">
            $(function () {
                $('#datetimepicker4').datetimepicker();
            });
        </script>

</html>                            