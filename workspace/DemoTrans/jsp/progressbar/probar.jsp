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

<style type="text/css">
.progress {
  margin: 10px;
  width: 700px;
  background-color: black;
}

 .progress-bar-striped {
  background-color: #FF9D82;
}
</style>

</head>
<script>
$(function() {
	  var current_progress = 0;
	  var interval = setInterval(function() {
	      current_progress += 10;
	      $("#dynamic")
	      .css("width", current_progress + "%")
	      .attr("aria-valuenow", current_progress)
	      .text(current_progress + "% Complete");
	      if (current_progress >= 50)
	          clearInterval(interval);
	  }, 1000);
	});
</script>

<body>

<h3>Dynamic Progress Bar</h3>
<p>Running progress bar from 0% to 100% in 10 seconds</p>
<div class="progress">
  <div id="dynamic" class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="50" style="width: 0%">
    <span id="current-progress"></span>
  </div>
</div>

</body>
</html>   







	                         