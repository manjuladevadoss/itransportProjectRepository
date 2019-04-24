angular.module("statisticsApp", ["chart.js"]).controller("LineCtrl", function ($scope) {
 
  $scope.test = 'Overdue Alarm';
  
  $scope.labels = ["08.00", "09.00", "10.00", "11.00", "12.00", "13.00", "14.00"];
  //$scope.series = ['Series A', 'Series B'];
  $scope.data = [
    [50, 20, 70, 20, 30, 10, 40]
  ];
  
  $scope.colours = [{ // blue
      fillColor: "#C05BA8",
      strokeColor: "rgba(103,69,128,1)",
      pointColor: "rgba(103,69,128,1)",
      pointStrokeColor: "#C05BA8",
     pointHighlightFill: "#C05BA8",
      pointHighlightStroke: "rgba(103,69,128,0.8)"
  }];
  
  $scope.onClick = function (points, evt) {
    console.log(points, evt);
  };
});

103
69
120