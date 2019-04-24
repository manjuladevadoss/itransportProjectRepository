<!DOCTYPE html>
<html lang="en">
<head>
<title>Progress Bar</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript"  src="jquery.js"></script> 
<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>

<style type="text/css">
* {
    margin: 0;
    padding: 0;
    font-family: Roboto, Helvetica, sans-serif;
	color:#C8CFF4
}

.progress {
    position: absolute;   
    height: 80px;
    width: 80px; 
    cursor: pointer;
    top: 30%;
    left: 60%;
    margin: -80px 0 0 -80px;
    background: none;
	border: 0px solid none;
}

.progress-circle {
  transform: rotate(-90deg);
	margin-top: -120px;
}

.progress-circle-back {
	fill: none; 
	stroke: #FF9D82;
	stroke-width:10px;
}

.progress-circle-prog {
	fill: none; 
	stroke: black;
	stroke-border: black;
	stroke-width: 10px;  
	stroke-dasharray: 0 999;    
	stroke-dashoffset: 0px;
    transition: stroke-dasharray 0.7s linear 0s;
}

.progress-text {
	width: 100%;
	position: absolute;
	top: 30px;
	text-align: center;
	font-size: 10;
}
</style>

</head>
<script>
window.randomize = function() {
	 // b=document.getElementById("pro1").value;
	  
	  var rand = Math.floor(Math.random() * 100);
		var x = document.querySelector('.progress-circle-prog');
	  x.style.strokeDasharray = (rand * 4.65) + ' 999';
		var el = document.querySelector('.progress-text'); 
		var from = $('.progress-text').data('progress');
		$('.progress-text').data('progress', rand);
		var start = new Date().getTime();
	  
		setTimeout(function() {
		    var now = (new Date().getTime()) - start;
		    var progress = now / 700;
			  result = rand > from ? Math.floor((rand - from) * progress + from) : Math.floor(from - (from - rand) * progress);
		    el.innerHTML = progress < 1 ? result+'%' : rand+'%';
		    if (progress < 1) setTimeout(arguments.callee, 10);
		}, 10);
	  
	  //b = b+100;
	  //document.getElementById("pro1").value = '';
	//document.getElementById("pro1").value = b;
	}

	setTimeout(window.randomize, 100);
	$('.progress').click(window.randomize);
	

</script>

<body>
<table border="2">
	<tr>
		<td>
<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
<div class="progress">
    <svg class="progress-circle" width="200px" height="200px" xmlns="http://www.w3.org/2000/svg">
	    <circle class="progress-circle-back"
		        cx="40" cy="40" r="34"></circle>
        <circle class="progress-circle-prog"
                cx="40" cy="40" r="34"></circle>
    </svg>
	  <div class="progress-text" data-progress="0">0%</div>
</div>	

		</td>
	</tr>
</table>
<!-- <input type="text" value="10" id="pro1"> -->
</body>
</html>   







	                         