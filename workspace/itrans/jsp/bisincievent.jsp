<!DOCTYPE html>
<!-- Add a title -->

<html>
  <head>    
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
      <link rel="stylesheet" href="dc.css">
	  <link rel="stylesheet" href="bisgrid.css">
      <link rel="stylesheet" href="chartjsdoughnut.css">
      <title>Incident Event Chart </title>
    <head> 
<style>
 h3 {
  color: #ffffff;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 20px;
   text-align: center;
}
</style>
<table class="mainTbl" cellpadding="10">
        <tr>
            <td> 
              <table border="1" cellpadding="8"> <tr>
                          <td aligh="center">
							  <h3 id="titleLabel">  </h3>
                              <canvas id="myDoughnutChart1" width="80"  height="80" ></canvas>                      
                          </td>
                        </tr>
              </table>                    
            </td>
            <td>
                <table border="1" cellpadding="8">
                    <tr aligh="center">
                        <td>
							<h3 id="titleLabel2">  </h3>
							<canvas id="myDoughnutChart2" width="80" height="80" ></canvas>                      
                        </td>
                      </tr>
            </table>                    
            </td>
            <td>
                <table border="1" cellpadding="8">
                    <tr aligh="center">
                        <td>
                             <h3 id="titleLabel3">  </h3>
							 <canvas id="myDoughnutChart3" width="80" height="80" ></canvas>                      
                        </td>
                      </tr>
            </table>                    
            </td>
         </tr>     
         <tr>
            <td>
                <table  border="1" cellpadding="8">
                    <tr aligh="center">
                        <td>
                             <h3 id="titleLabel4">  </h3>
							<canvas id="myDoughnutChart4" width="80" height="80" ></canvas>                      
                        </td>
                      </tr>
            </table> 
            </td>
            <td>
                <table border="1" cellpadding="8">
                    <tr>
                        <td aligh="center">
						 <h3 id="titleLabel5">  </h3>
                            <canvas id="myDoughnutChart5" width="80" height="80" ></canvas>                    
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
<script src="chartjsdoughnut.js"></script> 

      
</body>
</html>