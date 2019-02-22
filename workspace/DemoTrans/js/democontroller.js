var app = angular.module('ltaApp', []);
	  app.controller('ltaController', function($scope, $http) {
    
	//get the json fle using $http get method() incident record	  
    $http.get("incidentRecord.json").then(function(response) {
        $scope.incidentRec = response.data.incidentRec;
      });
    
    // order the record a-z or z-a
    $scope.orderByMe = function(incident) {
        $scope.myOrderBy = incident;
        $scope.searchIncident = "";
    }
    $scope.sortReverse  = false;
    
	//get the json file using $http get method() work order	  
    $http.get("workorderRecord.json").then(function(response) {
        $scope.workorderRec = response.data.workorderRec;
      });
    $scope.searchWorkOrder ="";
    
   //create New IR 
    $scope.addincident = function(){
        var s = $scope.incistatus;
        $scope.incistatus = s +"abc";
      }
       

      
	 });


/* To declare angular js
	   * angular.module('ltaApp', [])
	  .controller('ltaController', function($scope) { */ 
  
	  //Display Incident record using JSON Data
	    /*$scope.incidentRec = [
	    	{irid: "236344", type: "Accident", state: "confirmed", zone: "zone1", roadname: "TPE", lanes:"1 2 3"},
	    	{irid: "345344", type: "Road Works", state: "In Progress", zone: "zone2", roadname: "PIE", lanes:"3 2"},
	    	{irid: "782344", type: "Obstacle", state: "Notified", zone: "Zone3", roadname: "tun", lanes:"1 4 2"},
	    	{irid: "172344", type: "Accident", state: "over", zone: "Zone1", roadname: "kpe", lanes:"4 2"},
	    	{irid: "236344", type: "Break Down", state: "confirmed", zone: "zone1", roadname: "TPE", lanes:"1 2 3"},
	    	{irid: "345344", type: "Road Works", state: "In Progress", zone: "zone2", roadname: "PIE", lanes:"3 2"},
	    	{irid: "782344", type: "Obstacle", state: "Notified", zone: "Zone3", roadname: "tun", lanes:"1 4 2"},
	    	{irid: "172344", type: "Accident", state: "over", zone: "Zone1", roadname: "kpe", lanes:"4 2"}
	    ];
	    */
