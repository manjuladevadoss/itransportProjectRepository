<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  </head>

     <script>
$(document).ready(function(){
	$('.collapse').on('shown.bs.collapse', function(){
		$(this).parent().find(".glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus");
	}).on('hidden.bs.collapse', function(){
		$(this).parent().find(".glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus");
	});       
});
</script>
  <body>


    <div class="container">


<div class="panel-group" id="accordion2">
       <div class="panel panel-default">
    	<div class="panel-heading">
        	<h4 class="panel-title">
            	<a href="#.">
                	
                     VMS Messages<div align="right"><span data-target="#Collapseiconone" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"></span></span> </div>
                </a>
            </h4>
        </div>
        <div class="panel-collapse collapse" id="Collapseiconone">
        	<div class="panel-body">
            	<p>Vms message part</p>
            </div>
        </div>
     </div>
     
     <div class="panel panel-default">
    	<div class="panel-heading">
        	<h4 class="panel-title">
            	<a href="#.">
                	
                    Canning Message <div align="right"><span data-target="#Collapseicontwo" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"></span></span></div>
                </a>
            </h4>
        </div>
        <div class="panel-collapse collapse" id="Collapseicontwo">
        	<div class="panel-body">
            	<p>CAnning message part</p>
            </div>
        </div>
     </div>
     <div class="panel panel-default">
    	<div class="panel-heading">
        	<h4 class="panel-title">
            	<a href="#.">
                	
                   OBU Messages<div align="right"> <span data-target="#Collapseiconthree" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"></span></span></div>
                </a>
            </h4>
        </div>
        <div class="panel-collapse collapse" id="Collapseiconthree">
        	<div class="panel-body">
            	<p>OBU Messages Part</p>
            </div>
        </div>
     </div>
       <div class="panel panel-default">
    	<div class="panel-heading">
        	<h4 class="panel-title">
            	<a href="#.">
                	
                   Conjestion Routes Monitoring <div align="right"><span data-target="#Collapseiconfour" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"></span></span></div>
                </a>
            </h4>
        </div>
        <div class="panel-collapse collapse" id="Collapseiconfour">
        	<div class="panel-body">
            	<p>Conjestion Routes Monitoring Part</p>
            </div>
        </div>
     </div>
            <div class="panel panel-default">
    	<div class="panel-heading">
        	<h4 class="panel-title">
            	<a href="#.">
                	
                   Partners & Vehicle Response<div align="right"><span data-target="#Collapseiconfive" data-toggle="collapse" data-parent="#accordion2"> <span class="glyphicon glyphicon-plus"></span></span></div>
                </a>
            </h4>
        </div>
        <div class="panel-collapse collapse" id="Collapseiconfive">
        	<div class="panel-body">
            	<p>Partners & Vehicle Response Part</p>
            </div>
        </div>
     </div>
</div>
    </div>
    
  </body>
</html>
