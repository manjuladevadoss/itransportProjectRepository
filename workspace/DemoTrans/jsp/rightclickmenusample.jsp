<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="login.css">
 	 <script src="bootstrap.min.js"></script>
  	 <script src="jquery.js"></script> 
<style type="text/css">
<style>
div.jumbotron34 {
    background: #202B53;
  border-radius: 4px;
}

  
.dropdown {
  position: relative;
  display: inline-block;
   background-color: #202B53;
  border-radius: 4px;
}

.dropdown-menu {
  display: none;
  position: absolute;
  background-color: #202B53; 
  min-width: 160px;
  min-height: 10px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-menu a:hover {background-color: #C8CFF4;}
</style>

<script>
$('.jumbotron34').on('contextmenu', function(e) {
	 var top = e.pageY - 10;
	 var left = e.pageX - 90;
	  $("#context-menu").css({
	    display: "block",
	    top: top,
	    left: left
	  }).addClass("show");
	  return false; //blocks default Webbrowser right click menu
	}).on("click", function() {
	alert("second rihgt click");
	  $("#context-menu").removeClass("show").hide();
	});

	$("#context-menu a").on("click", function() {
	alert("second rihgt click");
	  $(this).parent().removeClass("show").hide();
	});
</script>
<body>
<div class="container">
      <div class="jumbotron34">
              <div class="dropdown-menu dropdown-menu-sm" id="context-menu">
          <a class="dropdown-item" href="#">Create New Event</a>
        </div>
        <h2>Right click menu for Bootstrap 4 - Advanced Components</h2>
        <p class="lead">by djibe.</p>
        <h2>
        Demo
        </h2>
          <p>Just right click in this Jumbotron to test.</p>

  </div>
</div>


</body>


</html>