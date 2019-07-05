<!DOCTYPE html>
<!-- Add a title -->

<html>
  <head>    
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
      <link rel="stylesheet" href="dc.css">
	  <link rel="stylesheet" href="bisgrid.css">
      <link rel="stylesheet" href="chartjsbar.css">
      <title>Chartjs bar chart </title>
    <head> 
<style>
 h3 {
  color: #ffffff;
  font-family: Roboto, Helvetica, sans-serif;
  font-size: 20px;
   text-align: center;
}
</style>
<table id="chartable" cellpadding="20">
        <tr>
                <td style="border:1px solid black">
				<h3 id="titleLabelRoadOp">  </h3>
                        <canvas id="myChartOpen" width="400" height="300"></canvas>
                </td>
                <td style="border:1px solid black">
				<h3 id="titleLabelRoadCl">  </h3>
                    <canvas id="myChartClose" width="400" height="300"></canvas>
                </td>
         </tr>   
        <tr>
                <td style="border:1px solid black">
                        <canvas id="myChartOpen1" width="400" height="300"></canvas>
                </td>
                <td style="border:1px solid black">
                    <canvas id="myChartClose1" width="400" height="300"></canvas>
                </td>
         </tr>  		 
         <tr>
                <td> 
                        <table id="datatable" cellpadding="2">
                                <tr>
                                    <th>ER ID</th>
                                    <th>Roads Close Early</th>
                                    <th>Roads Close On Time</th>
                                    <th>Roads Close Late</th>
                                </tr>
                                <tr>                                  
                                    <td>1</td>
                                    <td>10</td>
                                    <td>8</td>
                                    <td>15</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>9</td>
                                    <td>7</td>
                                    <td>6</td>
                                </tr>  
                            </table>
                </td>
                <td>
                    <table id="datatable" cellpadding="2">
                            <tr>
                                <th>ER ID</th>
                                <th>Roads Open Early</th>
                                <th>Roads Open on Time</th>
                                <th>Roads Open Late</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>5</td>
                                <td>7</td>
                                <td>10</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>4</td>
                                <td>9</td>
                                <td>12</td>
                            </tr>   
                        </table>
            </td>
         </tr>     

        </table>  
<body>   
<script src="Chart.min.js"></script>
<script src="chartjsbar.js"></script>
<script> 

</script>    
      
</body>
</html>