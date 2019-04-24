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