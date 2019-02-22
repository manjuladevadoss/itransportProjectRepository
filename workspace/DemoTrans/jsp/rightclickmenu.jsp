<!DOCTYPE html>
<html lang="en">
<head>
<title>menu</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="bootstrap.min.css">
	 <link rel="stylesheet" href="demo.css">
	 <script type="text/javascript"  src="democontroller.js"></script> 
 	 <script type="text/javascript" src="bootstrap.min.js"></script>
 	 <script type="text/javascript" src="angular.min.js"></script>

<style type="text/css">
 .jumbotron2 {
 padding:-2rem -1rem;margin-bottom:2rem;background-image: url("roadmap.jpg");border-radius:.3rem
 }
 @media (min-width:576px)
 {.jumbotron2{padding:4rem 2rem}}
 
 .jumbotron2-fluid{padding-right:0;padding-left:0;border-radius:0}
 .dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;display:none;float:left;
 min-width:10rem;padding:.5rem 0;margin:.125rem 0 0;
 font-size:1rem;color:#202B53;text-align:left;list-style:none;
 background-color:#fff;background-clip:padding-box;border:1px solid rgba(0,0,0,.15);border-radius:.25rem}
</style>

</head>
<body>
<h3>iTransport 2.0</h3>
  <!-- 
<div class="container">
<div class="row my-3">
    <div class="col">  -->
      <div class="jumbotron2">
        <h3>Right click menu for Bootstrap 4 - Advanced Components dfsdf </h3>
        <p class="lead"></p>
        <h2>
        Demo
        </h2>
          <p>Just right click in this Jumbotron to test.</p>
        <div class="dropdown-menu dropdown-menu-sm" id="context-menu">
          <a class="dropdown-item" href="#"><img src="accident.jpg"> Accident</option></a>
          <a class="dropdown-item" href="#"><img src="obstacle.jpg"> Obstacle</a>
          <a class="dropdown-item" href="#"><img src="heavytraffic.jpg"> Heavy Traffic</a>
		   <a class="dropdown-item" href="#"><img src="roadwork.jpg"> Road Works</a>
		   <a class="dropdown-item" href="#"><img src="mobileroadwork.jpg"> Mobile Road Works</a>
		   <a class="dropdown-item" href="#"><img src="roadblock.jpg"> Road Block</a>
		   <a class="dropdown-item" href="#"><img src="unattvehicle.jpg"> Unattended Vehicle</a>
		   <a class="dropdown-item" href="#"><img src="misce.jpg"> Miscellaneous</a>
        </div>
      </div>
	  
  <!--  </div>
  </div> 
</div> -->
</body>

<script>
$('.jumbotron2').on('contextmenu', function(e) {
  var top = e.pageY - 10;
  var left = e.pageX - 90;
  $("#context-menu").css({
    display: "block",
    top: top,
    left: left
  }).addClass("show");
  return false; //blocks default Webbrowser right click menu
}).on("click", function() {
  $("#context-menu").removeClass("show").hide();
});

$("#context-menu a").on("click", function() {
  $(this).parent().removeClass("show").hide();
});

</script>
</html>                            