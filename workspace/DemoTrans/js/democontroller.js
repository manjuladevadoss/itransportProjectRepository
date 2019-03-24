var app = angular.module('ltaApp', []);
	  app.controller('ltaController', function($scope, $http, $filter) {
    
	//get the json object using $http get method() incident record	  
    $http.get("incidentRecord.json").then(function(response) {
        $scope.incidentRec = response.data.incidentRec;  
        console.log("$scope.incidentRec.length() :" + $scope.incidentRec.length);
		$scope.incidentNewList = $scope.incidentRec;
      });
	
    
	//get the json object using $http get method() Technical Alarm record	  
    $http.get("techicalAlarmRecord.json").then(function(response) {
        $scope.technicalalarmrec = response.data.technicalalarmrec;  
        console.log("$scope.technicalalarmrec.length() :" + $scope.technicalalarmrec.length);
		$scope.technicalalarmrecNewList = $scope.technicalalarmrec;
      });
    
	//get the json object using $http get method() Environment Monitor Record	  
    $http.get("environmonitorRecord.json").then(function(response) {
        $scope.environmonitorec = response.data.environmonitorec;  
        console.log("$scope.environmonitorec.length() :" + $scope.environmonitorec.length);
		$scope.environmonitorecNewList = $scope.environmonitorec;
      });
    
    
    $scope.searchIncident = "";
	$scope.showList=true;
    $scope.createbuttonshow=true;
    var irid =  90051;
	//$scope.CurrentDate = new Date();
	$scope.irstarttime = $filter('date')(new Date(), 'yyyy/MM/dd HH:mm');
	$scope.irroadname = "AYE";
	$scope.irloctype = "Main Carriageway";
	$scope.irdirection = "Towards Tuas";
	$scope.irspoint = "6.31 km";
	$scope.irepoint = "6.31 km";
	$scope.irendtime = $filter('date')(new Date(), 'yyyy/MM/dd HH:mm');
	
	
    /*// order the record a-z or z-a
    $scope.orderByMe = function(incident) {
        $scope.myOrderBy = incident;
        $scope.searchIncident = "";
    }*/
	
    $scope.sortReverse  = false;
    $scope.sortReverseta = false;
    $scope.sortReversewc = false;
	$scope.sortReversenv = false;
	$scope.sortReverseincfromgrid   = false;
    
	//get the json object using $http get method() work order	  
    $http.get("workorderRecord.json").then(function(response) {
        $scope.workorderRec = response.data.workorderRec;
      });
    $scope.searchWorkOrder ="";
    $scope.searchWorkOrderfromgrid ="";
	$scope.searchtechnicalAlarmfromgrid="";
	$scope.searchIncidentfromgrid = "";
	$scope.searchEnvifromgrid  = "";
    
	//get Zone from JSON
    $http.get("zone.json").then(function(response) {
        $scope.zone = response.data.zone;
      });
   
   //create New IR 
    $scope.addincident = function(){
      
      $scope.showList = true;
      $scope.createbuttonshow=false;
      $scope.irid =  irid + 1;
	  irid = $scope.irid
    	  
      console.log("irid : " + $scope.irid);
      console.log("irtype: " + $scope.irtype);
      console.log("irstatus: " + $scope.irstatus);
      
      $scope.addInciData = {
      		"irid": $scope.irid, 
      		"type": $scope.irtype, 
      		"state": $scope.irstatus, 
      		"zone": "zone1", 
      		"roadname": $scope.irsource, 
      		"lanes":"4 4 4"
          };
      $scope.incidentRec.push($scope.addInciData);
      $scope.incidentNewList = $scope.incidentRec;
      
      console.log("$scope.irstatus: " + $scope.irstatus);
      console.log("$scope.irsource: " + $scope.irsource);
      console.log("$scope.irstarttime: " + $scope.irstarttime);
      console.log("$scope.irendtime: " + $scope.irendtime);
      console.log("$scope.irlinked: " + $scope.irlinked );
      console.log("$scope.irimgcap: " + $scope.irimgcap );
     console.log("$scope.ircomments: " + $scope.ircomments);
	 
	 
	  $scope.irstatus = ' ';
      $scope.irsource  = ' ';
      $scope.irstarttime = ' ';
      $scope.irendtime = ' ';
      $scope.irlinked = ' ';
      $scope.irimgcap = ' ';
      $scope.ircomments = ' ';

        
    };
    
    $scope.hideincidentlist = function(){
    	 $scope.showList=true;
    };
    
    $scope.showcreatebutton = function(){
   	 $scope.createbuttonshow=true;
   };
   
   $scope.visiblecreatebutton = function(msg){
	  $scope.irtype = msg;
		console.log("$scope.irtype : " + $scope.irtype);
   	 $scope.createbuttonshow=true;
   };
   
   $scope.showincidentlist = function(){
		 console.log("when you close show the exisitng list");
    	 $scope.showList=true;
    };
    
	$scope.isexpression = true;
	$scope.enableText = function() {
		 console.log("before text" + expression);
    	 $scope.isexpression = false;
		 console.log("after text" + expression);
    };
	
	//VMS Removed Message 
	$scope.obuMsg = "Message to be displayed on OBU";
	$scope.vmsMsgStatus = "Not Active";
	$scope.vmsMsgRemoved = function(){
		 console.log("Before vmsMsgRemoved : " + $scope.vmsMsgStatus);
		$scope.vmsMsgStatus = "Failed";
		 console.log("vmsMsgRemoved : " + $scope.vmsMsgStatus);
	};
    
	//VMS Implementation Message 
	$scope.vmsMsgImpl = function(){
		console.log("Before vmsMsgStatus : " + $scope.vmsMsgStatus);
		$scope.vmsMsgStatus = "Implemented";	
		console.log("vmsMsgStatus : " + $scope.vmsMsgStatus);
	};
    
	
	//OBU Deactivate Message 
	$scope.obuMsgStatus = "Not Active";
	$scope.obuMsgdeact = function(){
		 console.log("Before obuMsgdeact : " + $scope.obuMsgStatus);
		$scope.obuMsgStatus = "Failed";
		 console.log("obuMsgdeact : " + $scope.obuMsgStatus);
	};
	//OBU Deactivate Message 
	$scope.obuMsgImpl = function(){
		 console.log("Before obuMsgImpl : " + $scope.obuMsgStatus);
		$scope.obuMsgStatus = "Implemented";
		 console.log("obuMsgdeact : " + $scope.obuMsgStatus);
	};
	
	
	//get the json object using $http get method() Event 	  
    $http.get("eventRecord.json").then(function(response) {
        $scope.eventRec = response.data.eventRec;  
        $scope.eventNewList =  $scope.eventRec;
        console.log("$scope.eventRec.length() :" + $scope.eventRec.length);
        
        var copyevent = $scope.eventRec;
		var todayDate = $filter('date')(new Date(), 'yyyy/MM/dd');
		$scope.noofeventToday = 0;
		$scope.noofeventUpcome = 0;
        for(i=0;i<copyevent.length;i++){
        	var eventStartDate = copyevent[i].start;
			var edate = eventStartDate.substring(0, 10);
			
			//Today event Check
			if(todayDate==edate){
				$scope.noofeventToday = $scope.noofeventToday + 1;
			}

			//upcoming event Check
			var edate1 = $filter('date')(new Date(edate),'yyyy/MM/dd');
			if(edate1>todayDate){
				$scope.noofeventUpcome = $scope.noofeventUpcome + 1;
			} 
		}
      }); 
      $scope.searchEvent ="";
    
      //Create New Event
      $scope.eventstarttime = $filter('date')(new Date(), 'yyyy/MM/dd HH:mm');
      $scope.eventendtime = $filter('date')(new Date(), 'yyyy/MM/dd HH:mm');
      $scope.addevent = function(){       	  
          console.log("eventype : " + $scope.eventype);
          console.log("eventname: " + $scope.eventname);
          console.log("eventstarttime: " + $scope.eventstarttime);
          console.log("eventendtime: " + $scope.eventendtime);
          console.log("eventlocation: " + $scope.eventlocation);
          console.log("eventstatus: " + $scope.eventstatus);
          $scope.eventlocation = "Expo";
          $scope.eventstatus = "PLANNING";
          
          $scope.addEventData = {
          		"type": $scope.eventype, 
          		"name": $scope.eventname, 
          		"location":$scope.eventlocation, 
          		"status": $scope.eventstatus, 
          		"start": $scope.eventstarttime, 
          		"end": $scope.eventendtime
              };
          $scope.eventRec.push($scope.addEventData);
          $scope.eventNewList = $scope.eventRec;
          
          
          var copyevent = $scope.eventRec;
          var todayDate = $filter('date')(new Date(), 'yyyy/MM/dd');
  		  $scope.noofeventToday = 0;
		  $scope.noofeventUpcome = 0;
          for(i=0;i<copyevent.length;i++){
        	var eventStartDate = copyevent[i].start;
			var edate = eventStartDate.substring(0, 10);
			
			//Today event Check
			if(todayDate==edate){
				$scope.noofeventToday = $scope.noofeventToday + 1;
			}

			//upcoming event Check
			var edate1 = $filter('date')(new Date(edate),'yyyy/MM/dd');
			if(edate1>todayDate){
				$scope.noofeventUpcome = $scope.noofeventUpcome + 1;
			} 
		}
          
      
          
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
