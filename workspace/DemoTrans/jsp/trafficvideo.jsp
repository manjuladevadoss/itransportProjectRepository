<html> 
<title>Traffic Video </title>
<style>
#videodiv {
  position: absolute;
  z-index: 9;
  background-color: #f1f1f1;
  text-align: center;
  width:150px; 
  border: 1px solid #4be01d;
  /* opacity: 0.5; */  /* To change transparent color*/ 
}
</style>

<body> 

<button onclick="playVid()" type="button">Play Video</button>
<button onclick="pauseVid()" type="button">Pause Video</button><br> 
<button onclick="closeVid()" type="button">Close Video</button><br> 


   	<div id="videodiv">
		<video id="myVideo" width="320" height="176">
  			<source src="CTEvideo.mp4" type="video/mp4">
		</video>
	</div>
</body>
<script> 
	var vid = document.getElementById("myVideo"); 
	var x = document.getElementById("videodiv");
	x.style.display = "none";
	var pause =0;
	function playVid() { 
	   var x = document.getElementById("videodiv");
	  if (x.style.display === "none") {
		  vid.play(); 
		 if(pause==1) 
			 x.style.display = "none";
		else 
			x.style.display = "block";
	} 
	else {
		  if(pause==1) { 
			x.style.display = "block";
			vid.play(); 
		  }
		  else {
			x.style.display = "none";
		  }
	   }
	}
	  
	function pauseVid() { 
		pause = 1; 
		vid.pause();
	} 

	function closeVid() { 
	  pause = 0;
	  var x = document.getElementById("videodiv");
	  if (x.style.display === "none") {
		x.style.display = "block";
	  } 
	  else {
		x.style.display = "none";
	  }
	}
		  
</script> 
  
</html>