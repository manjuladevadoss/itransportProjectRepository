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
    $interval( function(){ $scope.callIR1(); }, 3000);
    $scope.callIR1 = function(){
    	$http.get("incidentRecord21.json").then(function(response) {
            $scope.incidentRec = response.data.incidentRec;  
    		$scope.incidentNewList = $scope.incidentRec;
          });
    };
    
    $interval( function(){ $scope.callIR2(); }, 6000);
    $scope.callIR2 = function(){
    	$http.get("incidentRecord22.json").then(function(response) {
            $scope.incidentRec = response.data.incidentRec;  
    		$scope.incidentNewList = $scope.incidentRec;
          });
    };
    
    $interval( function(){ $scope.callIR(); }, 9000);
    $scope.callIR = function(){
        $http.get("incidentRecord.json").then(function(response) {
            $scope.incidentRec = response.data.incidentRec;  
    		$scope.incidentNewList = $scope.incidentRec;
          });
    };
       
    // call workorder in certain interval
    $interval( function(){ $scope.callWO1(); }, 3000);
    $scope.callWO1 = function(){
    	$http.get("workorderRecord21.json").then(function(response) {
            $scope.workorderRec = response.data.workorderRec;
          });
    };
    
    $interval( function(){ $scope.callWO2(); }, 7000);
    $scope.callWO2 = function(){
    	$http.get("workorderRecord22.json").then(function(response) {
            $scope.workorderRec = response.data.workorderRec;
          });
    };
    
    $interval( function(){ $scope.callWO(); }, 10000);
    $scope.callWO = function(){
    	$http.get("workorderRecord.json").then(function(response) {
            $scope.workorderRec = response.data.workorderRec;
          });   	
    };
    
    // call technical alarm records in certain interval
    $interval( function(){ $scope.callTA1(); }, 3000);
    $scope.callTA1 = function(){
        $http.get("technicalAlarmRecord21.json").then(function(response) {
            $scope.technicalalarmrec = response.data.technicalalarmrec;  
          }); 
    };
    
    $interval( function(){ $scope.callTA2(); }, 5500);
    $scope.callTA2 = function(){
        $http.get("technicalAlarmRecord22.json").then(function(response) {
            $scope.technicalalarmrec = response.data.technicalalarmrec;  
          }); 
    };
    
    $interval( function(){ $scope.callTA(); }, 9000);
    $scope.callTA = function(){
        $http.get("technicalAlarmRecord.json").then(function(response) {
            $scope.technicalalarmrec = response.data.technicalalarmrec;  
          });   	
    };
    
    // call environmental records in certain interval
    $interval( function(){ $scope.callER1(); }, 3000);
    $scope.callER1 = function(){
        $http.get("environmonitorRecord21.json").then(function(response) {
            $scope.environmonitorec = response.data.environmonitorec;  
          });
    };
    
    $interval( function(){ $scope.callER2(); }, 5500);
    $scope.callER2 = function(){
        $http.get("environmonitorRecord22.json").then(function(response) {
            $scope.environmonitorec = response.data.environmonitorec;  
          });
    };
    
    $interval( function(){ $scope.callER(); }, 9000);
    $scope.callER = function(){
        $http.get("environmonitorRecord.json").then(function(response) {
            $scope.environmonitorec = response.data.environmonitorec;  
          });	
    };
    
    
    
    ///MRT Incident Creation form Detail
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

	 ///eND OF MRT Incident Creation form Detail


	
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
   
   //create New IR 
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
		 console.log("before text" + expression);
    	 $scope.isexpression = false;
		 console.log("after text" + expression);
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
    
      
      // ******** New Event Creation and response part
      
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

      $scope.eventspec = "Asian carriers, service providers, operators, and vendors";
      $scope.eventhotlineope= "0264653";
      $scope.eventhotlineclo= "2646512";
      $scope.eventincharge= "Hein ";
      $scope.eventpostno= "604521";
      $scope.eventbubbleposi= "12,10";
      $scope.eventbubblesize= "500";
      $scope.eventroadname= "Serangoon Ave 2";
      $scope.eventstarttimecl= $scope.eventstarttime;
      $scope.eventendtimecl= $scope.eventendtime;
      
      $scope.eventVmsMsg = "Massive Jam Around Marian Center";
      $scope.eventVmsdisplaytime = "10.00am:1.00pm"
      $scope.eventvmseqipid = "TIP 568231";
      
      $scope.eventVmsMsg1 = "Road Closed at Marina Ctr To Shenton Way - Use Nth Bridge Rd or Victoria St";
      $scope.eventVmsdisplaytime1 = "09.00am:2.00pm"
      $scope.eventvmseqipid1 = "TIP 568231";
      $scope.eventcanningMsg = "This road has heavy traffic, please Note."
      
    	//VMS Removed Message 
    		$scope.eventObuMsgAlert = "Road closure at Marian Centre";
    		$scope.eventObuMsgAlertkm = "1.2"
    			
    		$scope.eventObuMsgJam = "Heavy Traffic Jam in Marian Centre";
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
      
      
      //different windows display - in 3 panels
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
			  var strpage2 = "/DemoTrans/createinc.jsp";
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
		  

	      
		/*   if(windowObjectReference == null || windowObjectReference.closed) {
				  windowObjectReference = window.open(
			      "http://localhost:8080/DemoTrans/ccgrid.jsp",
			      "c2panel",
			      "top=300,left=300,width=520,height=430,resizable,scrollbars,status"); 
		   } else {
					windowObjectReference.focus();
	      };  */
		  
		//open ccgrid 
		// var ccdomain = domain;
		 var strpage1 = "/DemoTrans/ccgridview.jsp";
		 var value1 = protocol.concat(s,domain,c,port,strpage1);
		// alert("ccgrid url " + value1);
		 window.location.assign(value1);
		 window.location.href = value1; 
      }
      
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
      
      //mrt station selection based on the MRT Line
      $scope.stations = ['East West Line', 
                         'North South Line', 
                         'North East Line',
                         'Circle Line',
                         'Downtown Line'                  
                      ];

      $scope.ewstations = ['EW1-Pasir Ris',
                          'EW2-Tampines',
                          'EW3-Simei',
                          'EW28-Boon Lay',
                          'EW29-Joo koon'
                      ];
      $scope.nsstations = [ 'NS1-Jurong East',
					    	'NS2-Bukit Batok',
					    	'NS3-Bukit Gombak',
					    	'NS10-Admiralty',
					    	'NS28-Marina South Pier'
					    ];
      
      $scope.nestations = ['NE1-HarbourFront',
				    	   'NE3-Outram Park',
				    	   'NE4-ChinaTown',
				    	   'NE15-Buangkok',
				    	   'NE17-Punggol'
				    	   ];
      
      $scope.ccstations = ['CC1-Dhoby Ghaut',
					    	  'CC2-Bras Basah',
					    	  'CC4-Promenade',
					    	  'CC9-Paya Lebar',
					    	  'CC27-Labrador Park'
							];

      $scope.dtstations = ['DT1-Bukit Panjang',
				    	  'DT2-Cashew',
				    	  'DT3-Hillview',
				    	  'DT11-Newton',
				    	  'DT13-Bugis',
				    	  'DT19-Bayfront'
			];
      $scope.mrtline = "";
      $scope.mrtlinesel = function() {
	     if($scope.direction == "East West Line"){
	        $scope.mrtline = $scope.ewstations;
	        $scope.mrtlinend = $scope.ewstations;
	     }
	     if($scope.direction == "North South Line"){
		        $scope.mrtline = $scope.nsstations;
		        $scope.mrtlinend = $scope.nsstations;
		 }
	     if($scope.direction == "North East Line"){
		        $scope.mrtline = $scope.nestations;
		        $scope.mrtlinend = $scope.nestations;
		 }
	     if($scope.direction == "Circle Line"){
		        $scope.mrtline = $scope.ccstations;
		        $scope.mrtlinend = $scope.ccstations;
		 }
	     if($scope.direction == "Downtown Line"){
		        $scope.mrtline = $scope.dtstations;
		        $scope.mrtlinend = $scope.dtstations;
		 }
	     $scope.mrtlsselected = $scope.direction;
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
    
	$scope.addmrtincident = function() { 
	 alert("MrtStatus  " + $scope.mrtStatus +
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
" $scope.mrtincalrmalert : "  + $scope.mrtincalrmalert);
	 
	}
    
    $scope.showircreate = true;
    $scope.showirresponse = false;
    // seperate window for IR Creation
    $scope.callirresponse = function(){
	    $scope.showircreate = false;
	    $scope.showirresponse = true;
    }
    $scope.callircreate= function(){
	    $scope.showircreate = true;
	    $scope.showirresponse = false;
    }
    
    
	
    //cc grid view display changing places
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
