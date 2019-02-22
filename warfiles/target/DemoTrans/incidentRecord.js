angular.module('ltaApp', [])
  .controller('ltaController', function($scope) {
    
    //Display Incident record using JSON Data
    $scope.incidentRec = [
    	{irid: "236344", type: "Accident", state: "confirmed", zone: "zone1", roadname: "TPE", lanes:"1 2 3"},
    	{irid: "345344", type: "Road Works", state: "In Progress", zone: "zone2", roadname: "PIE", lanes:"3 2"},
    	{irid: "782344", type: "Obstacle", state: "Notified", zone: "Zone3", roadname: "tun", lanes:"1 4 2"},
    	{irid: "172344", type: "Accident", state: "over", zone: "Zone1", roadname: "kpe", lanes:"4 2"},
    	{irid: "236344", type: "Accident", state: "confirmed", zone: "zone1", roadname: "TPE", lanes:"1 2 3"},
    	{irid: "345344", type: "Road Works", state: "In Progress", zone: "zone2", roadname: "PIE", lanes:"3 2"},
    	{irid: "782344", type: "Obstacle", state: "Notified", zone: "Zone3", roadname: "tun", lanes:"1 4 2"},
    	{irid: "172344", type: "Accident", state: "over", zone: "Zone1", roadname: "kpe", lanes:"4 2"}
    ];
    $scope.orderByMe = function(incident) {
        $scope.myOrderBy = incident;
        $scope.searchIncident = "";
    }
    $scope.sortReverse  = false;
    
    
    
    //Display Incident record using JSON Data
    $scope.workOrderJson = [
    	{date: "2018/10/26 04:25", wonum: "#33454",descri: "SGT_ACM_09",status: "ACTIVE", zone: "KPE"},
    	{date: "2018/02/10 14:45", wonum: "#87843",descri: "SGT_ACM_19",status: "NOT ACTIVE", zone: "TUN"},
    	{date: "2018/06/16 12:28", wonum: "#53454",descri: "SGT_ACM_12",status: "ACTIVE", zone: "TPE"},
    	{date: "2018/11/23 09:46", wonum: "#76348",descri: "SGT_ACM_23",status: "NOT ACTIVE", zone: "TUN"}
    	
    ];
    $scope.searchWorkOrder ="";
    
   
  });

/*
var app = angular.module('myApp', []);
app.controller('formCtrl', function($scope) {
    $scope.firstname = "John";
});*/   
   

