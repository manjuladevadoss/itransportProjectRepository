<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>angular-chart.js</title>

    <link rel="stylesheet" href="https://rawgit.com/jtblin/angular-chart.js/a0b1ce650d5dce9b7ccdd86843d83f27b0d7bc03/dist/angular-chart.css"> 
  
  <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>   
       
      <script type="text/javascript" src="https://rawgit.com/nnnick/Chart.js/8b840ce56be51b61dfc2d4e40e56304c880c541b/Chart.js"></script>

<script type="text/javascript" src="https://rawgit.com/jtblin/angular-chart.js/a0b1ce650d5dce9b7ccdd86843d83f27b0d7bc03/dist/angular-chart.js"></script>
<script type="text/javascript"  src="chartcontroller.js"></script> 

  
<!--
<link rel="stylesheet" href="https://rawgit.com/jtblin/angular-chart.js/master/dist/angular-chart.css">


<script type="text/javascript" src="https://rawgit.com/nnnick/Chart.js/master/Chart.min.js"></script>

<script type="text/javascript" src="https://rawgit.com/jtblin/angular-chart.js/master/dist/angular-chart.js"></script>
-->
  
</script>
</head>

<body ng-app='statisticsApp'>
<div ng-controller='LineCtrl'>

<table  style="height: 140px; width: 45%;">
	<tr>
		<td>
		<canvas id="line" class="chart chart-line" data="data"
      labels="labels" legend="false" 
      click="onClick" chart-colours="colours"">
    </canvas>
		</td>
	</tr>
</table>
  
     
    
    

  </div>
</body>
</html>