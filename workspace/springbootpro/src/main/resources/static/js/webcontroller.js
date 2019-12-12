var app = angular.module('sbApp', []);
app.controller('sbController', function($scope, $http) {

	console.log("Welcome to Angular");
	$scope.loginUser = function() {
		
		  $http.get('http://localhost:9091/rest/angularcall').
	        then(function(response) {
	        	$scope.uname = response.data;
	        });
		  console.log("hello : " + $scope.uname);
	}
});