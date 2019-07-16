var app = angular.module('ltaApp', []);
	  app.controller('ltaController', function($scope, $http, $filter, $interval, $window) {
    
	
		  
 /*** sample data display from json array */
     // iraccvms incident recorad accident vms message  
     $http.get("tmdmessages.json").then(function(response) {
	  	console.log("tmd message display");
	    $scope.tmdmessages = response.data.tmdmessages;  
	});
/*** sample data display from json array */   	  
		  
   //get the json object using $http get method() incident record	  
    $http.get("incidentRecord.json").then(function(response) {
        $scope.incidentRec = response.data.incidentRec;  
        console.log("$scope.incidentRec.length() :" + $scope.incidentRec.length);
      });
    
    $interval( function(){ $scope.callIR1($scope.incidentRec); }, 5000);
    $scope.callIR1 = function(incidentNewList){
    	 var m = incidentNewList.length, t, i;
    	    // While there remain elements to shuffle
    	    while (m) {
    	      // Pick a remaining element…
    	      i = Math.floor(Math.random() * m--);   	  
    	      // And swap it with the current element.
    	      t = incidentNewList[m];
    	      incidentNewList[m] = incidentNewList[i];
    	      incidentNewList[i] = t;
    	    }  
    	    return incidentNewList;
    };
	
	//get the json object using $http get method() work order	  
 	$http.get("workorderRecord.json").then(function(response) {
         $scope.workorderRec = response.data.workorderRec;
         console.log("$scope.workorderRec.length() :" + $scope.workorderRec.length);
       });
 	
 	$interval( function(){ $scope.callWO1($scope.workorderRec); }, 4000);
    $scope.callWO1 = function(workorderNewList){
    	var m = workorderNewList.length, t, i;
	    // While there remain elements to shuffle
	    while (m) {
	      // Pick a remaining element…
	      i = Math.floor(Math.random() * m--);   	  
	      // And swap it with the current element.
	      t = workorderNewList[m];
	      workorderNewList[m] = workorderNewList[i];
	      workorderNewList[i] = t;
	    }  
	    return workorderNewList;
    };
    
	//get the json object using $http get method() Technical Alarm record	  
    $http.get("technicalAlarmRecord.json").then(function(response) {
        $scope.technicalalarmrec = response.data.technicalalarmrec;  
        console.log("$scope.technicalalarmrec.length() :" + $scope.technicalalarmrec.length);
      });
    
    $interval( function(){ $scope.callTA1($scope.technicalalarmrec); }, 5000);
    $scope.callTA1 = function(technicalalarmNewList){
    	var m = technicalalarmNewList.length, t, i;
	    // While there remain elements to shuffle
	    while (m) {
	      // Pick a remaining element…
	      i = Math.floor(Math.random() * m--);   	  
	      // And swap it with the current element.
	      t = technicalalarmNewList[m];
	      technicalalarmNewList[m] = technicalalarmNewList[i];
	      technicalalarmNewList[i] = t;
	    }  
	    return technicalalarmNewList;
    };
    
    
	//get the json object using $http get method() Environment Monitor Record	  
    $http.get("environmonitorRecord.json").then(function(response) {
        $scope.environmonitorec = response.data.environmonitorec;  
        console.log("$scope.environmonitorec.length() :" + $scope.environmonitorec.length);
      });
    
    $interval( function(){ $scope.callER($scope.environmonitorec); }, 6000);
    $scope.callER = function(environmonitorNewList){
    	var m = environmonitorNewList.length, t, i;
	    // While there remain elements to shuffle
	    while (m) {
	      // Pick a remaining element…
	      i = Math.floor(Math.random() * m--);   	  
	      // And swap it with the current element.
	      t = environmonitorNewList[m];
	      environmonitorNewList[m] = environmonitorNewList[i];
	      environmonitorNewList[i] = t;
	    }  
	    return environmonitorNewList;
    };
    
	//get the json object using $http get method() Road Work Record	  
    $http.get("roadwork.json").then(function(response) {
        $scope.roadworkRec = response.data.roadworkRec;  
        console.log("$scope.roadworkRec.length() :" + $scope.roadworkRec.length);
		//$scope.roadworkRec1 = $scope.roadworkRec;
      });        
    
// get json Incident Record Accident scenario 1
    $http.get("iraccscenario1vms.json").then(function(response) {
        $scope.iraccscenario1vms = response.data.iraccscenario1vms;  
        console.log("Scenario 1 length :" + $scope.iraccscenario1vms.length);
      });

// get json Incident Record Accident scenario 2
    $http.get("iraccscenario2vms.json").then(function(response) {
        $scope.iraccscenario2vms = response.data.iraccscenario2vms;  
        console.log("Scenario 2 length :" + $scope.iraccscenario2vms.length);
      });    
    
 // get json Incident Record Traffic Light Msg    
    $http.get("trafficlight.json").then(function(response) {
        $scope.trafficlight = response.data.trafficlight;  
        console.log("trafficlight length :" + $scope.trafficlight.length);
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
    
    $scope.searchWorkOrder ="";
    $scope.searchEnvironment ="";
    $scope.searchTechnical ="";
    $scope.searchWorkOrderfromgrid ="";
	$scope.searchtechnicalAlarmfromgrid="";
	$scope.searchIncidentfromgrid = "";
	$scope.searchEnvifromgrid  = "";
	$scope.searchroadwkfromgrid  = "";
	$scope.irstartpoint = "7.25km";
	$scope.irendpoint = "7.27km";
	$scope.ircogendpoint = "8.01km";
	$scope.accCanningMsg = "  Accident on CTE (towards SLE) after Ang Mo Kio Rd Exit";
  	$scope.irstatusList = [{
		"irstatusid": 1,
		"irstatusname": "Confirmed"
		}, {
		"irstatusid": 2,
		"irstatusname": "Over"
		}, {
		"irstatusid": 3,
		"irstatusname": "In Progress"
		}, {
		"irstatusid": 4,
		"irstatusname": "Notified"
		}, {
		"irstatusid": 5,
		"irstatusname": "Other"
	}];
  	$scope.irstatus = "1";
  	
  	$scope.irsourceList = [{
		"irsourceid": 1,
		"irsourcename": "EMAS"
		}, {
		"irsourceid": 2,
		"irsourcename": "JEYE"
		}, {
		"irsourceid": 3,
		"irsourcename": "ST_ITPMS"
		}, {
		"irsourceid": 4,
		"irsourcename": "KPE_MCE_ITPMS"
		}, {
		"irsourceid": 5,
		"irsourcename": "Other"
		}];
  	$scope.irsource = "1";
  	$scope.irlinkedtxt = "";
  	$scope.irlinkedList = [{
		"irlinkedid": 1,
		"irlinkedname": "IR 372"
		}, {
		"irlinkedid": 2,
		"irlinkedname": "IR 542"
		}, {
		"irlinkedid": 3,
		"irlinkedname": "IR 645"
		}, {
			"irlinkedid": 3,
			"irlinkedname": "Other"
			}];
  	//$scope.irlinked = "2";
  	
  	$scope.acctypeList = [{
		"acctypeid": 1,
		"acctypename": "Collision"
		}, {
		"acctypeid": 2,
		"acctypename": "Slip Roads"
		}, {
		"acctypeid": 3,
		"acctypename": "Other"
	}];
  	$scope.acctype = "3";
  	
  	$scope.rdwayList = [{
		"rdwayid": 1,
		"rdwayname": "Damp"
		}, {
		"rdwayid": 2,
		"rdwayname": "Wet"
		}, {
		"rdwayid": 3,
		"rdwayname": "Flood"
		}, {
		"rdwayid": 4,
		"rdwayname": "Dry"
		}, {
		"rdwayid": 5,
		"rdwayname": "Other"
	}];
  	$scope.rdway = "2";
    
  	$scope.dangerList = [{
		"dangerid": 1,
		"dangername": "Veh. on fire"
		}, {
		"dangerid": 2,
		"dangername": "Other"
	}];
  	$scope.danger = "1";
  	
  	$scope.slight = "";
  	$scope.serious = "";
  	$scope.fatal = "";
  	$scope.irendtime1 = "";
  	$scope.imgcapList = [{
		"imgcapid": 1,
		"imgcapname": "#124641"
		}, {
		"imgcapid": 2,
		"imgcapname": "#854645"
		}, {
		"imgcapid": 3,
		"imgcapname": "#542645"
		}, {
		"imgcapid": 4,
		"imgcapname": "Other"
	}];
  	$scope.imgcap = 2;
  	
  	$scope.irtypelist = [{
		"irtypeselid": 1,
		"irtypeselname": "Accident"
		}, {
		"irtypeselid": 2,
		"irtypeselname": "Mobile Road Work"
		}, {
		"irtypeselid": 3,
		"irtypeselname": "Heavy Traffic"
		}, {
		"irtypeselid": 4,
		"irtypeselname": "Road Work"
		}, {
		"irtypeselid": 5,
		"irtypeselname": "Unattended Vehicle"
		}, {
			"irtypeselid": 6,
			"irtypeselname": "Miscellaneous"
		},{
			"irtypeselid": 7,
			"irtypeselname": "Obstacle"
		}
	];
  	$scope.irtypesel = "1";	
  	
  	
  	$scope.irdirlist = [{
		"irdirid": 1,
		"irdirname": "Towards CTE"
		}, {
		"irdirid": 2,
		"irdirname": "Towards City"
		}	
	];
  	$scope.irdirsel = "1";	
  	
  	$scope.accAlertMsg = "CTE (SLE) Accident after Exit B";
  	$scope.accJamMsg = "CTE (SLE) Accident after Exit B";
  	$scope.accGuideMsg = "CTE(SLE) Massive Jam after Exit D";
  	$scope.accAlertMsgKM = " 4.0";
  	$scope.accJamMsgKM = " 4.0";
  	$scope.accGuideMsgKM = " 4.0";
  	
  	
  	$scope.irperincharge = "";
  	$scope.irconendpoint = "";
  	$scope.damagedetail = "";
  	$scope.showircreate = true;
    $scope.showirresponse = false;
    // seperate window for IR Creation
    $scope.callirresponse = function(){
	    $scope.showircreate = false;
	    $scope.showirresponse = true;
	    //alert("simulation : " + $scope.irsimul + "\ "  + "irimpor : " + $scope.irimpor  + "\ "  + "irvrs : " + $scope.irvrs  + "\ "  + "irltm : " + $scope.irltm);
    }
    $scope.callircreate= function(){
	    $scope.showircreate = true;
	    $scope.showirresponse = false;
    }
    
    // iraccvms incident recorad accident vms message  
    $http.get("iraccvms.json").then(function(response) {
        $scope.iraccvmsList = response.data.iraccvms;  
    });
 
   // $scope.irrecommMsg = "Massive Jam to Mandai";
   // $scope.irequipid = "15425";
	// $scope.irvmsMsgStatus = "Not Active";
	$scope.irvmsMsgRemoved = function(){
		 console.log("Before irvmsMsgStatus : " + $scope.irvmsMsgStatus);
		$scope.irvmsMsgStatus = "Failed";
		 console.log("irvmsMsgStatus : " + $scope.irvmsMsgStatus);
	};
    
	//VMS Implementation Message 
	$scope.irvmsMsgImpl = function() {
		console.log("Before irvmsMsgStatus : " + $scope.irvmsMsgStatus);
		$scope.irvmsMsgStatus = "Implemented";
		console.log("irvmsMsgStatus : " + $scope.irvmsMsgStatus);
	};
    
    
  	$scope.addincident = function(){
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
		 console.log("before text" + $scope.isexpression);
		 console.log("Accident Alert Zone Msg : " + $scope.accAlertMsg);
		 console.log("Accident Jam Zone Msg : " + $scope.accJamMsg);
		 console.log("Accident Guide Zone Msg : " + $scope.accGuideMsg);
    	 $scope.isexpression = false;
		 console.log("after text" + $scope.isexpression);
    };

 // ******** End To Create New IR     
 
 // ******* Begin Mobile Road Work ******* //
    //mobile road work vms messages
    
    $scope.sep ="$";
    
    $http.get("irmrwvms.json").then(function(response) {
        $scope.irmrwvmsList = response.data.irmrwvms;  
    });
    
    $scope.mrwincident= 'Mobile Road Work';
    $scope.mrwstate = '';
    $scope.mrwsource= '';
    $scope.mrwstarttime = $filter('date')(new Date(), 'yyyy/MM/dd HH:mm');
    $scope.mrwendtime= '';
    $scope.mrwcontname= '';
    $scope.mrwperno= '';
    $scope.mrwsupvisorname= '';
    $scope.mrwsupvisorhp= '';
    $scope.mrwcomment= '';
    $scope.mrwvehicleno= '';
    $scope.mrwsimul = false;
    $scope.mrwimpor = false;
    $scope.mrwvrs = false;
    $scope.mrwltm = false;
 
    $scope.showmrwcreate = true;
    $scope.showmrwresponse = false;
    $scope.callmrwresponse = function(){
	    $scope.showmrwcreate = false;
	    $scope.showmrwresponse = true;
	    //alert("simulation : " + $scope.irsimul + "\ "  + "irimpor : " + $scope.irimpor  + "\ "  + "irvrs : " + $scope.irvrs  + "\ "  + "irltm : " + $scope.irltm);
    }
    $scope.callmrwcreate= function(){
	    $scope.showmrwcreate = true;
	    $scope.showmrwresponse = false;
    }
    
    $scope.addmrwincident = function() {
    	alert("mobile road work incident created");
    	
    }
    
// *********** End of Mobile Road Work  ****** //
        
 // ******** New Event Creation and response part
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

  	$scope.eventypeList = [{
		"eventypeid": 1,
		"name": "F1"
		}, {
		"eventypeid": 2,
		"name": "Concert"
		}, {
		"mrtstaid": 3,
		"name": "In Summit"
		}, {
		"eventypeid": 4,
		"name": "Other"
		}];
  		$scope.eventype = "4";
     
      $scope.eventname = "Sports Event"
      $scope.eventorganizer = "Singapore Sport Club"
      $scope.eventsupp =  "CC"
      $scope.eventowner = "Singapore Athletics Association"
      $scope.eventstarttime = $filter('date')(new Date(), 'yyyy/MM/dd HH:mm');
      $scope.eventendtime = $filter('date')(new Date(), 'yyyy/MM/dd HH:mm');
      $scope.eventendtime1 = "";
      $scope.eventspec = "Badminton, Bowling, Football, Netball, Shooting";
      $scope.eventhotlineope= "0264653";
      $scope.eventhotlineclo= "2646512";
      $scope.eventincharge= "Hein ";
      $scope.eventpostno= "604521";
      $scope.eventbubbleposi= "12,10";
      $scope.eventbubblesize= "500";
      $scope.eventroadname= "Stadium Place";
      $scope.eventstarttimecl= $scope.eventstarttime;
      $scope.eventendtimecl= $scope.eventendtime;
      
     
      var currdate2 = new Date();
      //div message display on the map
      $scope.eventVmsMsg = "Expect Delays Near sports Hub";
      $scope.eventVmsdisplaytime = $scope.eventstarttime;
      $scope.eventvmseqipid = "TIP 545862";
      
      currdate2.setHours(currdate2.getHours() + 3);
	  $scope.dtdisplay1 = $filter('date')(currdate2, 'yyyy/MM/dd HH:mm');
      $scope.eventVmsMsg1 = "Heavy Traffic on Stadium Boulevard";
      $scope.eventVmsdisplaytime1 =  $scope.dtdisplay1;
      $scope.eventvmseqipid1 = "TIP 545862";
      
      currdate2.setHours(currdate2.getHours() + 3);
	  $scope.dtdisplay2 = $filter('date')(currdate2, 'yyyy/MM/dd HH:mm');
      $scope.eventVmsMsg2 = "Heavy Traffic on MountBatten Road";
      $scope.eventVmsdisplaytime2 =  $scope.dtdisplay2;
      $scope.eventvmseqipid2 = "TIP 545862";
      
      currdate2.setHours(currdate2.getHours() + 3);
	  $scope.dtdisplay3 = $filter('date')(currdate2, 'yyyy/MM/dd HH:mm');
      $scope.eventVmsMsg3 = "Heavy Traffic before Sim Way / KPE";
      $scope.eventVmsdisplaytime3 =  $scope.dtdisplay3;
      $scope.eventvmseqipid3 = "TIP 545862";
      
	/*var yday = new Date(new Date().setDate(new Date().getDate()-1));
	  $scope.eventbeforedate = $filter('date')(yday, 'yyyy/MM/dd HH:mm'); */
  
      $scope.showvmsequipmsg= function(vmseqipid) {
    	  if(vmseqipid=='1') {
    	      $scope.eventVmsMsg = "Expect Delays Near sports Hub";
              $scope.eventVmsdisplaytime = $scope.eventstarttime;
              $scope.eventvmseqipid = "TIP 231482";
              
              $scope.eventVmsMsg1 = "Heavy Traffic on Nicoll Highway/Raffles Blvd";
              $scope.eventVmsdisplaytime1 =  $scope.dtdisplay1;
              $scope.eventvmseqipid1 = "TIP 231482";
                            
              $scope.eventVmsMsg2 = "Heavy Traffic on Guillemard Road";
              $scope.eventVmsdisplaytime2 =  $scope.dtdisplay2;
              $scope.eventvmseqipid2 = "TIP 231482";
              
              $scope.eventVmsMsg3 = "Heavy Traffic on Bras Basah Rd";
              $scope.eventVmsdisplaytime3 =  $scope.dtdisplay3;
              $scope.eventvmseqipid3 = "TIP 231482";
    	  }
       	  if(vmseqipid=='2') {
       	      $scope.eventVmsMsg = "Expect Delays Near sports Hub";
       	      $scope.eventVmsdisplaytime = $scope.eventstarttime;
       	      $scope.eventvmseqipid = "TIP 545862";
       	      
       	      $scope.eventVmsMsg1 = "Heavy Traffic on Stadium Boulevard";
       	      $scope.eventVmsdisplaytime1 =  $scope.dtdisplay1;
       	      $scope.eventvmseqipid1 = "TIP 545862";
      	   
       	      $scope.eventVmsMsg2 = "Heavy Traffic on MountBatten Road";
       	      $scope.eventVmsdisplaytime2 =  $scope.dtdisplay2;
       	      $scope.eventvmseqipid2 = "TIP 545862";
      	      
       	      $scope.eventVmsMsg3 = "Heavy Traffic before Sim Way / KPE";
       	      $scope.eventVmsdisplaytime3 =   $scope.dtdisplay3;
       	      $scope.eventvmseqipid3 = "TIP 545862";
    	  } 
		/*if(vmseqipid=='545862') {
       	      $scope.eventVmsMsg = "Expect Delays Near sports Hub";
       	      $scope.eventVmsdisplaytime = $scope.eventstarttime;
       	      $scope.eventvmseqipid = "TIP 545862";
       	      
       	      $scope.eventVmsMsg1 = "Heavy Traffic on Stadium Boulevard";
       	      $scope.eventVmsdisplaytime1 =  $scope.dtdisplay1;
       	      $scope.eventvmseqipid1 = "TIP 545862";
      	   
       	      $scope.eventVmsMsg2 = "Heavy Traffic on MountBatten Road";
       	      $scope.eventVmsdisplaytime2 =  $scope.dtdisplay2;
       	      $scope.eventvmseqipid2 = "TIP 545862";
      	      
       	      $scope.eventVmsMsg3 = "Heavy Traffic before Sim Way / KPE";
       	      $scope.eventVmsdisplaytime3 =   $scope.dtdisplay3;
       	      $scope.eventvmseqipid3 = "TIP 545862";
    	  }   */		  
	}
      
      $scope.eventcanningMsg = "This road has heavy traffic, please Note."
      
    	//VMS Removed Message 
    		$scope.eventObuMsgAlert = "Road closure at Marina Centre";
    		$scope.eventObuMsgAlertkm = "1.2"
    			
    		$scope.eventObuMsgJam = "Heavy Traffic Jam in Marina Centre";
    		$scope.eventObuMsgJamkm = "1.2"
    		
    		$scope.eventObuMsgGuide = "Pls use Public tpt";
    		$scope.eventObuMsgGuidekm = "1.2"
    				
    		
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
    		$scope.guideMsg = "Guide Zone";
    		$scope.jamMsg = "Jam Zone";
    		$scope.alertMsg = "Alert Zone";
    		
    		$scope.obuMsgStatus = "Not Active";
    		$scope.obuMsgdeact = function(){
    		
       			$scope.obuMsgStatus = "Implemented";
    			console.log("OBU Message : " + $scope.obuMsgStatus);
    		};
    		//OBU Implement Message 
    		$scope.obuMsgImpl = function(){
    			$scope.obuMsgStatus = "Failed";
    			console.log("OBU Message : " + $scope.obuMsgStatus);
    		};    	  
	
    		$scope.eventNotes = "Awards Function";
    		$scope.eventNotesAuthor = "Aathor"; 
    		
    		$scope.eventDeleteNotes = function(){
    			$scope.eventNotes = "";
    			$scope.eventNotesAuthor = "";
    		}
    		
    		$scope.eventAddNewNotes = function() {
    			
    		}
    		
    		//road closure from create event panel 
    		$scope.roadcloseflag=false; 
    		$scope.showroadclosedata = function() {
    			$scope.roadcloseflag = true;
    		}	
    		
    		$scope.removeroadclosedata = function() {
    			$scope.roadcloseflag = false;
    		}
    		
    
    	  // Adding new event    	    
          $scope.addevent = function() {      
        	  alert("Event Created");
          /*$scope.eventlocation = "Expo";
          $scope.eventstatus = "PLANNING";
          
          $scope.eventypeselected = $scope.eventype ;
          $scope.eventname1 = $scope.eventname ;
          
          console.log("eventypeselected: " + $scope.eventypeselected);
          console.log("eventname1: " + $scope.eventname1);
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
		}  */
     }
     
      //Event name ngchange on text box
      $scope.changeventname = function() {
    	  $scope.eventname1 = $scope.eventname ; 
    	  console.log("event name change " + $scope.eventname1);
      }
      // Event type change 
      $scope.changeoptions = function(){
   	   $scope.eventypeselected = $scope.eventype ;
   	   console.log("event type selected : " + $scope.eventypeselected);
     }
      
      $scope.showeventcreateFlag = true;
      $scope.showeventresFlag = false;
      $scope.calleventresponse = function() {
    	$scope.showeventcreateFlag = false;
    	$scope.showeventresFlag = true ;
      }

      $scope.calleventcreate = function() {
    	$scope.showeventcreateFlag = true;
    	$scope.showeventresFlag = false ;
      } 
      
   // ********End of New Event Creation and response part  
      
      
      
      
  /* windows display */ 
     
  // ******** Start 3 different windows display - in 3 panels - CC2 - GIS - BIS
	
      $scope.threepanel = function(){
    	  var windowObjectReference;
    	  var windowObjectReference2;
    	  var windowObjectReference3;
    	  var windowObjectReference4;
    	  var protocol = window.location.protocol;
          var domain = window.location.hostname;
          var port = window.location.port
          var c =":";
          var s = "//"
		//open gis 
		  if(windowObjectReference3 == null || windowObjectReference3.closed) {
			  //  var strpage2 = "/itrans/gis.jsp";
			  var strpage2 = "/itrans/createincidentbase.jsp";
			  var value2 = protocol.concat(s,domain,c,port,strpage2);
				//alert("gis url " + value2);
				windowObjectReference3 = window.open(
						value2,
					  	"gis",
					  	"top=200,left=200,width=520,height=430,resizable,scrollbars,status,toolbar=true,menubar=true");
				} else {
					  windowObjectReference3.focus();
		  };
		//open ccgrid 
		// var ccdomain = domain;
		 var strpage1 = "/itrans/ccgridview.jsp";
		 var value1 = protocol.concat(s,domain,c,port,strpage1);
		// alert("ccgrid url " + value1);
		 window.location.assign(value1);
		 window.location.href = value1;
		 //bis window open
		 //open bis 
		/*  if(windowObjectReference2 == null || windowObjectReference2.closed) {
		    	var strpage3 = "/itrans/bis.jsp";
			    var value3 = protocol.concat(s,domain,c,port,strpage3);
			    //alert("bis url " + value3);
			    windowObjectReference2 = window.open(
			    	  value3,			
			  	      "bis",
			  	      "top=100,left=100,width=520,height=430,resizable,scrollbars,status,toolbar=true,menubar=true");
			  }else {
					windowObjectReference2.focus();
			};*/
		 
      }
      
      
      // End of 3 different windows display - in 3 panels - CC2 - GIS - BIS      
 /* windows display */
      
   // ******** MRT Incident Creation form Detail
  	$scope.mrtincflag = true;
  	$scope.mrtinccreateflag = false;	
  	$scope.mrtincalrmalert = "Complete Control Command 2564";
  	$scope.mrtStatusList = [{
  		"mrtstaid": 1,
  		"name": "Confirmed"
  		}, {
  		"mrtstaid": 2,
  		"name": "Over"
  		}, {
  		"mrtstaid": 3,
  		"name": "In Progress"
  		}, {
  		"mrtstaid": 4,
  		"name": "Notified"
  		}, {
  		"mrtstaid": 5,
  		"name": "Other"
  		}];
  	$scope.mrtStatus = "4";
  	
  		$scope.mrtSourceList = [{
  		"mrtsouid": 1,
  		"name": "ERS"
  		}, {
  		"mrtsouid": 2,
  		"name": "JEYE"
  		}, {
  		"mrtsouid": 3,
  		"name": "Other"
  		}, {
  		"mrtsouid": 4,
  		"name": "Source 1"
  		}, {
  		"mrtsouid": 5,
  		"name": "Source 2"
  		}];
  	$scope.mrtSource = "3";

      //mrt station selection based on the MRT Line
      //passing mrt station value to mrtmap.js file
      $scope.hidetextbox = false;
      
      $scope.stations = ['East West Line', 
                         'North South Line', 
                         'North East Line',
                         'Circle Line',
                         'Downtown Line'                  
                      ];

      $scope.ewstations = ['EW1-Pasir Ris',
				    	  'EW2-Tampines',
				    	  'EW3-Simei',
				    	  'EW4-Tanah Merah',
				    	  'EW5-Bedok',
				    	  'EW6-Kembangan',
				    	  'EW7-Eunos',
				    	  'EW8-Paya Lebar',
				    	  'EW9-Aljunied',
				    	  'EW10-Kallang',
				    	  'EW11-Lavender',
				    	  'EW12-Bugis',
				    	  'EW13-City Hall',
				    	  'EW14-Raffles Place',
				    	  'EW15-Tanjong Pagar',
				    	  'EW16-Outram Park',
				    	  'EW17-Tiong Bahru',
				    	  'EW18-Redhill',
				    	  'EW19-Queenstown',
				    	  'EW20-Commonwealth',
				    	  'EW21-Buona Vista',
				    	  'EW22-Dover',
				    	  'EW23-Clementi',
				    	  'EW24-Jurong East',
				    	  'EW25-Chinese Garden',
				    	  'EW26-Lakeside',
				    	  'EW27-Boon Lay',
				    	  'EW28-Pioneer',
				    	  'EW29-Joo Koon',
				    	  'EW30-Gul Circle',
				    	  'EW31-Tuas Crescent',
				    	  'EW32-Tuas West Road',
				    	  'EW33-Tuas Link',
				    	  'EW4-Tanah Merah',
				    	  'CG1-Expo',
				    	  'CG2-Changi Airport'
                      ];
     
      $scope.nsstations = [   'NS1-Jurong East',
					    	  'NS2-Bukit Batok',
					    	  'NS3-Bukit Gombak',
					    	  'NS4-Choa Chu Kang',
					    	  'NS5-Yew Tee',
					    	  'NS7-Kranji',
					    	  'NS8-Marsiling',
					    	  'NS9-Woodlands',
					    	  'NS10-Admiralty',
					    	  'NS11-Sembawang',
					    	  'NS13-Yishun',
					    	  'NS14-Khatib',
					    	  'NS15-Yio Chu Kang',
					    	  'NS16-Ang Mo Kio',
					    	  'NS17-Bishan',
					    	  'NS18-Braddell',
					    	  'NS19-Toa Payoh',
					    	  'NS20-Novena',
					    	  'NS21-Newton',
					    	  'NS22-Orchard',
					    	  'NS23-Somerset',
					    	  'NS24-Dhoby Ghaut',
					    	  'NS25-City Hall',
					    	  'NS26-Raffles Place',
					    	  'NS27-Marina Bay',
					    	  'NS28-Marina South Pier'
					    ];
      
      $scope.nestations = [	  'NE1-HarbourFront',
					    	  'NE3-Outram Park',
					    	  'NE4-Chinatown',
					    	  'NE5-Clarke Quay',
					    	  'NE6-Dhoby Ghaut',
					    	  'NE7-Little India',
					    	  'NE8-Farrer Park',
					    	  'NE9-Boon Keng',
					    	  'NE10-Potong Pasir',
					    	  'NE11-Woodleigh',
					    	  'NE12-Serangoon',
					    	  'NE13-Kovan',
					    	  'NE14-Hougang',
					    	  'NE15-Buangkok',
					    	  'NE16-Sengkang',
					    	  'NE17-Punggol'
				    	   ];
      
      $scope.ccstations = [   'CC1-Dhoby Ghaut',
					    	  'CC2-Bras Basah',
					    	  'CC3-Esplanade',
					    	  'CC4-Promenade',
					    	  'CC5-Nicoll Highway',
					    	  'CC6-Stadium',
					    	  'CC7-Mountbatten',
					    	  'CC8-Dakota',
					    	  'CC9-Paya Lebar',
					    	  'CC10-MacPherson',
					    	  'CC11-Tai Seng',
					    	  'CC12-Bartley',
					    	  'CC13-Serangoon',
					    	  'CC14-Lorong Chuan',
					    	  'CC15-Bishan',
					    	  'CC16-Marymount',
					    	  'CC17-Caldecott',
					    	  'CC18-Bukit Brown',
					    	  'CC19-Botanic Gardens',
					    	  'CC20-Farrer Road',
					    	  'CC21-Holland Village',
					    	  'CC22-Buona Vista',
					    	  'CC23-one-north',
					    	  'CC24-Kent Ridge',
					    	  'CC25-Haw Par Villa',
					    	  'CC26-Pasir Panjang',
					    	  'CC27-Labrador Park',
					    	  'CC28-Telok Blangah',
					    	  'CC29-Harbourfront',
					    	  'CE1-Bayfront',
					    	  'CE2-Marina Bay'
					    	  ];

      $scope.dtstations = [	  'DT1-Bukit Panjang',
					    	  'DT2-Cashew',
					    	  'DT3-Hillview',
					    	  'DT5-Beauty World',
					    	  'DT6-King Albert Park',
					    	  'DT7-Sixth Avenue',
					    	  'DT8-Tan Kah Kee',
					    	  'DT9-Botanic Gardens',
					    	  'DT10-Stevens',
					    	  'DT11-Newton',
					    	  'DT12-Little India',
					    	  'DT13-Rochor',
					    	  'DT14-Bugis',
					    	  'DT15-Promenade',
					    	  'DT16-Bayfront',
					    	  'DT17-Downtown',
					    	  'DT18-Telok Ayer',
					    	  'DT19-Chinatown',
					    	  'DT20-Fort Canning',
					    	  'DT21-Bencoolen',
					    	  'DT22-Jalan Besar',
					    	  'DT23-Bendemeer',
					    	  'DT24-Geylang Bahru',
					    	  'DT25-Mattar',
					    	  'DT26-MacPherson',
					    	  'DT27-Ubi',
					    	  'DT28-Kaki Bukit',
					    	  'DT29-Bedok North',
					    	  'DT30-Bedok Reservoir',
					    	  'DT31-Tampines West',
					    	  'DT32-Tampines',
					    	  'DT33-Tampines East',
					    	  'DT34-Upper Changi',
					    	  'DT35-Expo'
					    	 ];
      $scope.mrtline = "";
      $scope.mrtlinesel = function() {
	     if($scope.direction == "East West Line"){
	        $scope.mrtline = $scope.ewstations;
	        $scope.mrtlinend = $scope.ewstations;
	        $scope.directionid = $scope.direction; 
	     }
	     if($scope.direction == "North South Line"){	    	 
		        $scope.mrtline = $scope.nsstations;
		        $scope.mrtlinend = $scope.nsstations;
		        $scope.directionid = $scope.direction;
		 }
	     if($scope.direction == "North East Line"){
		        $scope.mrtline = $scope.nestations;
		        $scope.mrtlinend = $scope.nestations;
		        $scope.directionid = $scope.direction;
		 }
	     if($scope.direction == "Circle Line"){
		        $scope.mrtline = $scope.ccstations;
		        $scope.mrtlinend = $scope.ccstations;
		        $scope.directionid = $scope.direction;
		 }
	     if($scope.direction == "Downtown Line"){
		        $scope.mrtline = $scope.dtstations;
		        $scope.mrtlinend = $scope.dtstations;
		        $scope.directionid = $scope.direction;
		 }
	     $scope.mrtlsselected = $scope.direction;
	     console.log("directiod id for map : " + $scope.directionid);
    };
    
    $scope.mrtssel = function() {
    	$scope.mrtsselected = $scope.startstation;
    };
      
    $scope.mrtesel = function() {
    	$scope.mrteselected = $scope.endstation;
    };
    
    $scope.createmrtinc = function() { 
		$scope.mrtincflag = false;
		$scope.mrtinccreateflag = true;
		$scope.mrteselected = $scope.endstation;
    	$scope.mrtsselected = $scope.startstation;
    	$scope.mrtdirselected = $scope.direction;
    	console.log(" $scope.mrteselected " + $scope.mrteselected );
    	console.log(" $scope.mrteselected " + $scope.mrtsselected );
    	console.log(" $scope.mrteselected " + $scope.mrtdirselected );
		
		//var host1 = $window.location.host;
		//alert("host : " + host);
        //var landingUrl = "createmrtincwin.jsp";
        //alert("landingUrl : " + landingUrl);
        //$window.location.href = landingUrl;
    }
    
    $scope.createmrtinc = function() { 
		$scope.mrtincflag = false;
		$scope.mrtinccreateflag = true;
		$scope.mrteselected = $scope.endstation;
    	$scope.mrtsselected = $scope.startstation;
    	$scope.mrtdirselected = $scope.direction;
    	console.log(" $scope.mrteselected " + $scope.mrteselected );
    	console.log(" $scope.mrteselected " + $scope.mrtsselected );
    	console.log(" $scope.mrteselected " + $scope.mrtdirselected );
		
		//var host1 = $window.location.host;
	//	alert("host : " + host1);
      //  var landingUrl = "createmrtbase.jsp";
      //  alert("landingUrl : " + landingUrl);
     //   $window.location.href = landingUrl;
    }
    
    
    
    $scope.cancelmrtinc = function() {
		$scope.mrtincflag = true;
		$scope.mrtinccreateflag = false;
		$scope.endstation = '';
    	$scope.startstation = '';
    	$scope.direction = '';
		$scope.bothdir = false;
    }
    
    // MRT side UI panel selection for mrt 
    $scope.setendStation = function(){
    	$scope.mrteselected = $scope.endstation;
    }

    $scope.setStartStation = function(){
    	$scope.mrtsselected =  $scope.startstation;
    }
	$scope.addmrtincident = function() { 
		alert("MRT Incident Created");
	/* alert("MrtStatus  " + $scope.mrtStatus +
			"MrtSource " + $scope.mrtSource +
		" $scope.irstarttime : " + $scope.irstarttime +
		" $scope.irendtime : "  + $scope.irendtime + 
		" $scope.direction : "  + $scope.direction  +
		" $scope.bothdir : "  + $scope.bothdir + 
		" $scope.startstation : "  + $scope.startstation +
		" $scope.endstation : "  + $scope.endstation +
		" $scope.mrtsimu : "  + $scope.mrtsimu +
		" $scope.mrtimpo : "  + $scope.mrtimpo +
		" $scope.mrtvrs : "  + $scope.mrtvrs +
		" $scope.mrtltm : "  + $scope.mrtltm +
		" $scope.mrtincalrmalert : "  + $scope.mrtincalrmalert);	*/ 
	}
// ******** END OF MRT Incident Creation form Detail	
 
 // ******** Start OF CC2 grid view display changing places in different grids  	
    $scope.showinc = true;
    $scope.viewworkorderitem2 = function(){
    	$scope.showworkorder = true;
	    $scope.showinc = false;
	    $scope.showenv  = false;
	    $scope.showtech  = false;
	    $scope.showevent  = false;
	    $scope.showrdwork = false;

    };
    $scope.viewincitem2 = function(){
    	$scope.showinc = true;
    	$scope.showworkorder = false;
	    $scope.showenv  = false;
	    $scope.showtech  = false;
	    $scope.showevent  = false;
	    $scope.showrdwork = false;

    };
    $scope.viewtecitem2 = function(){
    	$scope.showtech  = true;
    	$scope.showinc = false;
    	$scope.showworkorder = false;
	    $scope.showenv  = false;
	    $scope.showevent  = false;
	    $scope.showrdwork = false;

    };
    $scope.viewenvirontem2 = function(){
    	$scope.showenv  = true;
    	$scope.showinc = false;
    	$scope.showworkorder = false;
	    $scope.showtech  = false;
	    $scope.showevent  = false;
	    $scope.showrdwork = false;

    };   
    $scope.vieweventitem2 = function(){
    	$scope.showevent  = true;
    	$scope.showinc = false;
    	$scope.showworkorder = false;
	    $scope.showenv  = false;
	    $scope.showtech  = false;
	    $scope.showrdwork = false;
    };
    $scope.viewrdworkitem2 = function(){
    	$scope.showrdwork = true;
    	$scope.showevent  = false;
    	$scope.showinc = false;
    	$scope.showworkorder = false;
	    $scope.showenv  = false;
	    $scope.showtech  = false;
    };  
    
    //vertical merge the view
    $scope.viewmergeflag = true;
    $scope.splitflag = false;
    $scope.viewmerge = function(){
    	$scope.divItem4 = {
    		"border" : "0px solid #2D50AE"
    	}
    	$scope.divItem2 = {
    		"border" : "0px solid #2D50AE"
    	}
    	$scope.viewmergeflag = false;
    	$scope.splitflag  = true;
    } 
   
    $scope.splitmerge = function(){
    	$scope.divItem4 = {
        	"border" : "1px solid #2D50AE"
       }
       $scope.divItem2 = {
    		"border" : "1px solid #2D50AE"
        }
        $scope.viewmergeflag = true;
        $scope.splitflag  = false;
     }
    
    //horizontal merge view
    $scope.viewhrmerge = true;
    $scope.splithrview = false;
    $scope.mergeside = function(){
    	$scope.divItem3 = {
    		"border" : "0px solid #2D50AE"
        }
        $scope.divItem2 = {
        	"border" : "0px solid #2D50AE"
        }
        $scope.viewhrmerge = false;
        $scope.splithrview = true;
    }
    
    $scope.splitside = function(){   	
    	$scope.divItem3 = {
        		"border" : "1px solid #2D50AE"
            }
            $scope.divItem2 = {
            	"border" : "1px solid #2D50AE"
            }
        $scope.viewhrmerge = true;
        $scope.splithrview = false;
    }
 // ******** End OF CC2 grid view display changing places in different grids     
 

/*** BIS Part */
    
    //Get json object Congestion Reason Roadworks ask to leave 
	
    $http.get("bisroadcon.json").then(function(response) {
        $scope.bisroadcon = response.data.bisroadcon;  
        console.log("$scope.bisroadcon.length() :" + $scope.bisroadcon.length);     
      }); 

    $scope.showbisincevent = true ;
    $scope.showbisroad = false;
    $scope.showconroad = false;
    $scope.showspeed =  true;
	$scope.showzone =  true;
    $scope.bisincieventshow = function() {
    	$scope.showbisincevent = true;
    	$scope.showbisroad = false;
    	$scope.showconroad = false;
    	$scope.showspeed = false;
		$scope.showzone =  false;
    };
    
    $scope.bisroadshow = function() {
    	$scope.showbisroad = true;
    	$scope.showbisincevent = false;
    	$scope.showconroad = false;
    	$scope.showspeed = false;
		$scope.showzone =  false;
    };
    
    $scope.bisconshow = function() {
    	$scope.showconroad = true;
    	$scope.showbisincevent = false;
    	$scope.showbisroad = false;
    	$scope.showspeed = false;
		$scope.showzone =  false;
    };
    $scope.bisspeedshow = function() {
    	$scope.showspeed = true;
    	$scope.showconroad = false;
    	$scope.showbisincevent = false;
    	$scope.showbisroad = false; 
		$scope.showzone =  false;		
    };
    $scope.biszoneshow = function() {  	
		$scope.showspeed = false;
    	$scope.showconroad = false;
    	$scope.showbisincevent = false;
    	$scope.showbisroad = false;    	
		$scope.showzone =  true;
    };	
    flag = true;
    $interval( function(){ $scope.selectSpeedChart(flag); }, 15000);
    $scope.selectSpeedChart = function(flagVal) {
		///alert("Speed");
      	$scope.showspeed = flagVal;
        $scope.showconroad = false;
        $scope.showbisincevent = false;
        $scope.showbisroad = false;	
		$scope.showzone =  false;
    };
	
    $interval( function(){ $scope.selectConRoadChart(flag); }, 5000);
	$scope.selectConRoadChart = function(flagVal) {
		//alert("Road");
		$scope.showspeed = false;
		$scope.showconroad = flagVal;
    	$scope.showbisincevent = false;
    	$scope.showbisroad = false;	
		$scope.showzone =  false;
	};
	
	$interval( function(){ $scope.selectInciChart(flag); }, 15000);
	$scope.selectInciChart = function(flagVal) {
		//alert("Road");
		$scope.showspeed = false;
		$scope.showconroad = false;
    	$scope.showbisincevent = flagVal;
    	$scope.showbisroad = false;	
		$scope.showzone =  false;
	};
	
	$interval( function(){ $scope.selectRoadChart(flag); }, 3000);
	$scope.selectRoadChart = function(flagVal) {
		//alert("Road");
		$scope.showspeed = false;
		$scope.showconroad = false;
    	$scope.showbisincevent = false;
    	$scope.showbisroad = flagVal;
		$scope.showzone =  false;		
	};
	
	$interval( function(){ $scope.selectZoneChart(flag); }, 7000);
	$scope.selectZoneChart = function(flagVal) {
		//alert("Road");
		$scope.showspeed = false;
		$scope.showconroad = false;
    	$scope.showbisincevent = false;
    	$scope.showbisroad = false;
		$scope.showzone =  flagVal;		
	};
	
//BIS Speed Data Dashboard	
	$scope.eacSpeed = true;
	$scope.eacTravel = false;
	$scope.expreSpeed = false;
	$scope.expreTravel = false;
	$scope.bisspeedshowdash = function(speeddata) {
		console.log("bis module");
		if(speeddata=='espeed') {
			$scope.eacSpeed = true;
			$scope.eacTravel = false;
			$scope.expreSpeed = false;
			$scope.expreTravel = false;
		}
		if(speeddata=='etravel') {
			$scope.eacSpeed = false;
			$scope.eacTravel = true;
			$scope.expreSpeed = false;
			$scope.expreTravel = false;
		}
		if(speeddata=='exspeed') {
			$scope.eacSpeed = false;
			$scope.eacTravel = false;
			$scope.expreSpeed = true;
			$scope.expreTravel = false;
		}
		if(speeddata=='extravel') {
			$scope.eacSpeed = false;
			$scope.eacTravel = false;
			$scope.expreSpeed = false;
			$scope.expreTravel = true;
		}
	}

//BIS Road close and Open Data Dashboard	
	$scope.rdopen = true;
	$scope.rdclose = false;
	$scope.bisroadshowdash = function(roaddata) {
		console.log("bis module");
		if(roaddata=='rclose') {
			$scope.rdclose = true;
			$scope.rdopen = false;
		}
		if(roaddata=='ropen') {
			$scope.rdclose = false;
			$scope.rdopen = true;
		}
	}

//BIS Zone Data Dashboard	
	$scope.zone1to4 = true;
	$scope.zone5toB = false;
	$scope.biszoneshowdash = function(zonedata) {
		console.log("Zone module");
		if(zonedata=='zone1234') {
			$scope.zone1to4 = true;
			$scope.zone5toB = false;
		}
		if(zonedata=='zone67ab') {
			$scope.zone1to4 = false;
			$scope.zone5toB = true;
		}
	}

//BIS Incident Event Data Dashboard	
$scope.incidentocc = true;
$scope.incidentkmocc = false;
$scope.incidentltoc = false;
$scope.incidentir = false;
$scope.incidenter = false;
$scope.bisincieventdash = function(incidata) {
		console.log("bis module");
		if(incidata=='occ') {
			$scope.incidentocc = true;
			$scope.incidentkmocc = false;
			$scope.incidentltoc = false;
			$scope.incidentir = false;
			$scope.incidenter = false;
		}
		if(incidata=='kmocc') {
			$scope.incidentocc = false;
			$scope.incidentkmocc = true;
			$scope.incidentltoc = false;
			$scope.incidentir = false;
			$scope.incidenter = false;
		}
		if(incidata=='ltoc') {
			$scope.incidentocc = false;
			$scope.incidentkmocc = false;
			$scope.incidentltoc = true;
			$scope.incidentir = false;
			$scope.incidenter = false;
		}
		if(incidata=='ir') {
			$scope.incidentocc = false;
			$scope.incidentkmocc = false;
			$scope.incidentltoc = false;
			$scope.incidentir = true;
			$scope.incidenter = false;
		}
		if(incidata=='er') {
			$scope.incidentocc = false;
			$scope.incidentkmocc = false;
			$scope.incidentltoc = false;
			$scope.incidentir = false;
			$scope.incidenter = true;
		}
	}
	
//Bis Intervals Zone Data Dashboard	
	$interval( function(){ $scope.selectZoneChartDash(flag); }, 2000);
	$scope.selectZoneChartDash = function(flagVal) {
		$scope.zone1to4 = false;
		$scope.zone5toB = flagVal;
	};

	$interval( function(){ $scope.selectZoneChartDash1(flag); }, 6000);
	$scope.selectZoneChartDash1 = function(flagVal) {
		$scope.zone1to4 = flagVal;
		$scope.zone5toB = false;
	};

//Bis Road close and Open Data Dashboard	
	$interval( function(){ $scope.selectRoadChartDash(flag); }, 3000);
	$scope.selectRoadChartDash = function(flagVal) {
			$scope.rdclose = flagVal;
			$scope.rdopen = false;		
	};
	
	$interval( function(){ $scope.selectRoadChartDash1(flag); }, 6000);
	$scope.selectRoadChartDash1 = function(flagVal) {
			$scope.rdclose = false;
			$scope.rdopen = flagVal;		
	};
/*** End of BIS Part */    
   
    
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
