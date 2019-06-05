var app = angular.module('ltaApp', []);
	  app.controller('ltaController', function($scope, $http, $filter, $interval, $window) {
    
	//get the json object using $http get method() incident record	  
    $http.get("incidentRecord.json").then(function(response) {
        $scope.incidentRec = response.data.incidentRec;  
        console.log("$scope.incidentRec.length() :" + $scope.incidentRec.length);
		$scope.incidentNewList = $scope.incidentRec;
      });
	
	//get the json object using $http get method() work order	  
 	$http.get("workorderRecord.json").then(function(response) {
         $scope.workorderRec = response.data.workorderRec;
       });
 	
	//get the json object using $http get method() Technical Alarm record	  
    $http.get("technicalAlarmRecord.json").then(function(response) {
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
    
	//get the json object using $http get method() Road Work Record	  
    $http.get("roadwork.json").then(function(response) {
        $scope.roadworkRec = response.data.roadworkRec;  
        console.log("$scope.roadworkRec.length() :" + $scope.roadworkRec.length);
		//$scope.roadworkRec1 = $scope.roadworkRec;
      });        
    
    // call incident records in certain interval
    $interval( function(){ $scope.callIR1(); }, 5000);
    $scope.callIR1 = function(){
    	$http.get("incidentRecord21.json").then(function(response) {
            $scope.incidentRec = response.data.incidentRec;  
    		$scope.incidentNewList = $scope.incidentRec;
          });
    };
    
    $interval( function(){ $scope.callIR2(); }, 10000);
    $scope.callIR2 = function(){
    	$http.get("incidentRecord22.json").then(function(response) {
            $scope.incidentRec = response.data.incidentRec;  
    		$scope.incidentNewList = $scope.incidentRec;
          });
    };
    
    $interval( function(){ $scope.callIR(); }, 15000);
    $scope.callIR = function(){
        $http.get("incidentRecord.json").then(function(response) {
            $scope.incidentRec = response.data.incidentRec;  
    		$scope.incidentNewList = $scope.incidentRec;
          });
    };
       
    // call workorder in certain interval
   $interval( function(){ $scope.callWO1(); }, 5000);
    $scope.callWO1 = function(){
    	$http.get("workorderRecord21.json").then(function(response) {
            $scope.workorderRec = response.data.workorderRec;
          });
    };
    
   $interval( function(){ $scope.callWO2(); }, 9000);
    $scope.callWO2 = function(){
    	$http.get("workorderRecord22.json").then(function(response) {
            $scope.workorderRec = response.data.workorderRec;
          });
    };
    
   $interval( function(){ $scope.callWO(); }, 12000);
    $scope.callWO = function(){
    	$http.get("workorderRecord.json").then(function(response) {
            $scope.workorderRec = response.data.workorderRec;
          });   	
    };
    
    // call technical alarm records in certain interval
    $interval( function(){ $scope.callTA1(); }, 5000);
    $scope.callTA1 = function(){
        $http.get("technicalAlarmRecord21.json").then(function(response) {
            $scope.technicalalarmrec = response.data.technicalalarmrec;  
          }); 
    };
    
   $interval( function(){ $scope.callTA2(); }, 10000);
    $scope.callTA2 = function(){
        $http.get("technicalAlarmRecord22.json").then(function(response) {
            $scope.technicalalarmrec = response.data.technicalalarmrec;  
          }); 
    };
    
    $interval( function(){ $scope.callTA(); }, 15000);
    $scope.callTA = function(){
        $http.get("technicalAlarmRecord.json").then(function(response) {
            $scope.technicalalarmrec = response.data.technicalalarmrec;  
          });   	
    };
    
    // call environmental records in certain interval
    $interval( function(){ $scope.callER1(); }, 5000);
    $scope.callER1 = function(){
        $http.get("environmonitorRecord21.json").then(function(response) {
            $scope.environmonitorec = response.data.environmonitorec;  
          });
    };
    
    $interval( function(){ $scope.callER2(); }, 10000);
    $scope.callER2 = function(){
        $http.get("environmonitorRecord22.json").then(function(response) {
            $scope.environmonitorec = response.data.environmonitorec;  
          });
    };
    
    $interval( function(){ $scope.callER(); }, 15000);
    $scope.callER = function(){
        $http.get("environmonitorRecord.json").then(function(response) {
            $scope.environmonitorec = response.data.environmonitorec;  
          });	
    };
    
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
    
	//get Zone from JSON
    $http.get("zone.json").then(function(response) {
        $scope.zone = response.data.zone;
      });

// ******** Start To Create New IR 
    $scope.irtypeflag = true;
    $scope.irdetailflag = false;
    
    $scope.createirdetail = function(msg){
    	  $scope.irtypeflag = false;
    	  $scope.irdetailflag = true;
    	  $scope.irtypeselected = msg;
    }
    
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
  	$scope.irstatus = "3";
  	
  	$scope.irsourceList = [{
		"irsourceid": 1,
		"irsourcename": "ERS"
		}, {
		"irsourceid": 2,
		"irsourcename": "JEYE"
		}, {
		"irsourceid": 3,
		"irsourcename": "Other"
		}];
  	$scope.irsource = "2";
  	
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
  	//$scope.acctype = "2";
  	
  	$scope.rdwayList = [{
		"rdwayid": 1,
		"rdwayname": "Damp / Wet"
		}, {
		"rdwayid": 2,
		"rdwayname": "Other"
	}];
  	$scope.rdway = "1";
    
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
  	$scope.imgcap = "2";  
  	
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
	$scope.irvmsMsgImpl = function(){
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
    	 $scope.isexpression = false;
		 console.log("after text" + $scope.isexpression);
    };

 // ******** End To Create New IR     
 
    // Begin Mobile Road Work
    //ir vms messages
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
    
    //End of Mobile Road Work
        
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
     
      $scope.eventname = "Asia Communication Awards"
      $scope.eventorganizer = "Terrapinn Pte Ltd, Singapore"
      $scope.eventsupp =  "OnnoRokom Group"
      $scope.eventowner = "Global Telecommunications Industry"
      $scope.eventstarttime = $filter('date')(new Date(), 'yyyy/MM/dd HH:mm');
      $scope.eventendtime = $filter('date')(new Date(), 'yyyy/MM/dd HH:mm');
      $scope.eventendtime1 = "";
      $scope.eventspec = "Asian carriers, service providers, operators, and vendors";
      $scope.eventhotlineope= "0264653";
      $scope.eventhotlineclo= "2646512";
      $scope.eventincharge= "Hein ";
      $scope.eventpostno= "604521";
      $scope.eventbubbleposi= "12,10";
      $scope.eventbubblesize= "500";
      $scope.eventroadname= "Marina Ctr";
      $scope.eventstarttimecl= $scope.eventstarttime;
      $scope.eventendtimecl= $scope.eventendtime;
      
      var currdate2 = new Date();
      //div message display on the map
      $scope.eventVmsMsg = "Massive Jam Around Marina Center";
      $scope.eventVmsdisplaytime = $scope.eventstarttime;
      $scope.eventvmseqipid = "TIP 568231";
      
      currdate2.setHours(currdate2.getHours() + 3);
      $scope.eventVmsMsg1 = "Road Closed at Marina Ctr To Shenton Way - Use Nth Bridge Rd or Victoria St";
      $scope.eventVmsdisplaytime1 =  $filter('date')(currdate2, 'yyyy/MM/dd HH:mm');
      $scope.eventvmseqipid1 = "TIP 568231";
      
      currdate2.setHours(currdate2.getHours() + 6);
      $scope.eventVmsMsg2 = "Expect Delays near Marina Ctr To Shenton Way";
      $scope.eventVmsdisplaytime2 =  $filter('date')(currdate2, 'yyyy/MM/dd HH:mm');
      $scope.eventvmseqipid2 = "TIP 568231";
      
      currdate2.setHours(currdate2.getHours() + 9);
      $scope.eventVmsMsg3 = "Expect Delays on Shenton Way";
      $scope.eventVmsdisplaytime3 =  $filter('date')(currdate2, 'yyyy/MM/dd HH:mm');
      $scope.eventvmseqipid3 = "TIP 568231";
      
      
      var currdate = new Date();
      var currdate1 = new Date();
      
      $scope.showvmsequipmsg= function(vmseqipid) {
    	  if(vmseqipid=='825231') {
    	      $scope.eventVmsMsg = "Road Closed at Marina Ctr To Shenton Way - Use Nth Bridge Rd or Victoria St";
              $scope.eventVmsdisplaytime = $scope.eventstarttime;
              $scope.eventvmseqipid = "TIP 825231";
              
              currdate.setHours(currdate.getHours() + 3);
              $scope.eventVmsMsg1 = "Massive Jam Around Marina Center";
              $scope.eventVmsdisplaytime1 =  $filter('date')(currdate, 'yyyy/MM/dd HH:mm');
              $scope.eventvmseqipid1 = "TIP 825231";
              
              currdate.setHours(currdate.getHours() + 6);
              $scope.eventVmsMsg2 = "Expect Delays on Shenton Way";
              $scope.eventVmsdisplaytime2 =  $filter('date')(currdate, 'yyyy/MM/dd HH:mm');
              $scope.eventvmseqipid2 = "TIP 825231";
              
              currdate.setHours(currdate.getHours() + 9);
              $scope.eventVmsMsg3 = "Expect Delays near Marina Ctr To Shenton Way";
              $scope.eventVmsdisplaytime3 =  $filter('date')(currdate, 'yyyy/MM/dd HH:mm');
              $scope.eventvmseqipid3 = "TIP 825231";
    	  }
       	  if(vmseqipid=='568231') {
       	      $scope.eventVmsMsg = "Massive Jam Around Marina Center";
       	      $scope.eventVmsdisplaytime = $scope.eventstarttime;
       	      $scope.eventvmseqipid = "TIP 568231";
       	      
       	      currdate1.setHours(currdate1.getHours() + 3);
       	      $scope.eventVmsMsg1 = "Road Closed at Marina Ctr To Shenton Way - Use Nth Bridge Rd or Victoria St";
       	      $scope.eventVmsdisplaytime1 =  $filter('date')(currdate1, 'yyyy/MM/dd HH:mm');
       	      $scope.eventvmseqipid1 = "TIP 568231";
       	      
       	      currdate1.setHours(currdate1.getHours() + 6);
       	      $scope.eventVmsMsg2 = "Expect Delays near Marina Ctr To Shenton Way";
       	      $scope.eventVmsdisplaytime2 = $filter('date')(currdate1, 'yyyy/MM/dd HH:mm');
       	      $scope.eventvmseqipid2 = "TIP 568231";
       	      
       	      currdate1.setHours(currdate1.getHours() + 9);
       	      $scope.eventVmsMsg3 = "Expect Delays on Shenton Way";
       	      $scope.eventVmsdisplaytime3 = $filter('date')(currdate1, 'yyyy/MM/dd HH:mm');
       	      $scope.eventvmseqipid3 = "TIP 568231";
    	  }            
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
          $scope.eventlocation = "Expo";
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
		}  
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
      
      
  // ******** Start 3 different windows display - in 3 panels - CC2 - GIS - BIS
      $scope.threepanel = function(){
    	  var windowObjectReference;
    	  var windowObjectReference2;
    	  var windowObjectReference3;
    	  var protocol = window.location.protocol;
          var domain = window.location.hostname;
          var port = window.location.port
          var c =":";
          var s = "//"
        
			//open gis 
		  if(windowObjectReference3 == null || windowObjectReference3.closed) {
			  //  var strpage2 = "/DemoTrans/gis.jsp";
			  var strpage2 = "/DemoTrans/createirwin1.jsp";
				var value2 = protocol.concat(s,domain,c,port,strpage2);
				//alert("gis url " + value2);
				windowObjectReference3 = window.open(
						value2,
					  	"gis",
					  	"top=200,left=200,width=520,height=430,resizable,scrollbars,status");
				} else {
					  windowObjectReference3.focus();
		  };
    	  
    	  //open bis 
		  if(windowObjectReference2 == null || windowObjectReference2.closed) {
		    	var strpage3 = "/DemoTrans/bis.jsp";
			    var value3 = protocol.concat(s,domain,c,port,strpage3);
			    //alert("bis url " + value3);
			    windowObjectReference2 = window.open(
			    	  value3,
			  	      "bis",
			  	      "top=100,left=100,width=520,height=430,resizable,scrollbars,status");
			  }else {
					windowObjectReference2.focus();
			};
   
		//open ccgrid 
		// var ccdomain = domain;
		 var strpage1 = "/DemoTrans/ccgridview.jsp";
		 var value1 = protocol.concat(s,domain,c,port,strpage1);
		// alert("ccgrid url " + value1);
		 window.location.assign(value1);
		 window.location.href = value1; 
      }
// ******** End of 3 different windows display - in 3 panels - CC2 - GIS - BIS      
      
  	//get the json object using $http get method() mapdata - road names	  
      $http.get("mapdata.json").then(function(response) {
          $scope.mapdata = response.data.mapdata;  
          console.log("$scope.mapdata.length() :" + $scope.mapdata.length);
        });
      
     //get streetid form the map look for corresponding streetname, location,  from jsob object
      $scope.getstreetname = function(){
      	 console.log("selection street" + $scope.strid);
      	 var len =  $scope.mapdata.length;
      	console.log("111");
      	 for(i=0;i<len;i++){
      		console.log(" for 222");
      		var streetObj =  $scope.mapdata[i];
      		if(streetObj.strid==$scope.strid) {
      			console.log("selected id same");
      			$scope.streetLocation = streetObj.directiondesc;
      			$scope.streetName = streetObj.ewayname;
      			$scope.streetDirection = streetObj.location;
      			console.log("selected id same" + " / " + $scope.streetName + " / " + $scope.streetLocation + " / " + $scope.streetDirection);
      		}
      		console.log("streetObj.strid : " + streetObj.strid);
      		console.log("streetObj.latitute : " + streetObj.latitute);
      		console.log("streetObj.longitude : " + streetObj.longitude);
      		console.log("streetObj.ewayname : " + streetObj.ewayname);
      		console.log("streetObj.directiondesc : " +streetObj.directiondesc); 
      		console.log("streetObj.location : " + streetObj.location); 
      	 }
      	 
      };

      
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
