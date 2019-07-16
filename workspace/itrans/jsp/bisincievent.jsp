<!DOCTYPE html>
<!-- Add a title -->

<html>
  <head>    
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
      <link rel="stylesheet" href="dc.css">
	    <link rel="stylesheet" href="bisgrid.css">
      <title>Incident Event Chart </title>
    <head> 
<style>
</style>
<table class="mainTbl" cellpadding="15">
        <tr>
            <td> 
              <table border="1" cellpadding="10">
                      <tr>
                          <td aligh="center">
                              <canvas id="myInciChart1" style="width: 400px; height: 250px" ></canvas>                      
                          </td>
                        </tr>
              </table>                    
            </td>
            <td>
                <table border="1" cellpadding="10">
                    <tr aligh="center">
                        <td>
                            <canvas id="myInciChart2" style="width: 400px; height: 250px" ></canvas>                      
                        </td>
                      </tr>
				</table>                    
            </td>
			  <td>
			    <table  border="1" cellpadding="10">
                    <tr aligh="center">
                        <td>
                             <canvas id="myInciChart3" style="width: 400px; height: 250px" ></canvas>                      
                        </td>
                      </tr>
				</table> 
             </td>
            </tr>   
            <tr>   
            <td>
                <table  border="1" cellpadding="10">
                    <tr aligh="center">
                        <td>
                             <canvas id="myInciChart4" style="width: 400px; height: 250px" ></canvas>                      
                        </td>
                      </tr>
				</table>                    
            </td>
            <td>
                <table  border="1" cellpadding="10">
                    <tr aligh="center">
                        <td>
                             <canvas id="myEventChart1" style="width: 400px; height: 250px"></canvas>                      
                        </td>
                      </tr>
            	</table>                    
            </td>
			  <td>
             </td>
         </tr>          
        </table>  
    
<body>   

<script src="Chart.min.js"></script>
<script src="chartjs-plugin-labels.js"></script> 
<script src="chartjsincievent.js"></script> 

      
</body>
</html>