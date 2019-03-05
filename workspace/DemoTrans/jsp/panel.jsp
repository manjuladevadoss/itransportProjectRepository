<!DOCTYPE html>
<html lang="en">
<head>
<title>panel</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="bootstrap.min.css">
	  <link rel="stylesheet" href="demo.css">
 	 <script src="bootstrap.min.js"></script>
	   <link rel="stylesheet" href="dropdownstyle.css">
  	 <script src="jquery.js"></script> 
  	
<style type="text/css">
.content {
  max-width: 450px;
  margin: auto;
  background: #202B53;
  padding: 10px;
  margin-top: 10%;
}

.fontcolor{ 
color: #C8CFF4;
}

.button {
  font-size: 1em;
  padding: 7px 14px;
  color: #202B53;
  border: 2px solid #C8CFF4;
  border-radius: 20px/50px;
  background:#C8CFF4;
}
</style>

</head>
<body>
<div class="container">
<h3>iTransport 2.0</h3>
<div class="bs-example">

<div class="content">
<h3><div align="center">Panel Selection </div></h3>

<table>
	<tr>
		<td><h5> <a class="button" href="gismap.jsp">GIS</a></h5>  </td><td></td>
		<td> 
			<div class="dropdown">
				 <h5> <a class="button" href="">Common Control </a></h5>
	 			 <div class="dropdown-content">
	    			<a href="incidentTbl.jsp">Incident Record</a>
	    			<a href="workorderTbl.jsp">Work Order</a>
	    			<a href="techalarmTbl.jsp">Technical Alarms</a>
					<a href="envmonTbl.jsp">Environmental Monitoring List</a>
					<a href="ccgrid.jsp">CC in GridDisplay</a>
	  			</div>
			</div>
		</td><td></td>
		<td><h5> <a class="button" href="bis.jsp">BIS Real Time</a></h5></td>
	</tr>
</table>
</div>
</div>
</div>
</body>
</html>                            