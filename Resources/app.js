/*
 * QR Tour
 * A basic starting point for a cross-platform QR Tour app
 *  
 */

//check dependencies
if (Ti.version < 1.8 ) {
	alert('Sorry - this application template requires Titanium Mobile SDK 1.8 or later');	  	
}

(function() {
	//QR barcode scanner module requirements and settings
	var Barcode = require('ti.barcode');
	Barcode.allowRotation = true;
	Barcode.displayedMessage = ' ';
	Barcode.allowMenu = false;
	Barcode.allowInstructions = false;
	Barcode.useLED = true;
	
	//XHR wrapper: Content loading and caching made way simpler
	XHR = require('utils/xhr/xhr');
	var xhr = new XHR();
	
	//QR data synced from the Drupal admin site
	//starts empty and syncs after the first scan based on the base URL from the code
	var qrData = [];
	
	//All views for this app will go in a single window
	var window = Ti.UI.createWindow({
	    backgroundColor: '#004990',
	    exitOnClose:true,
		navBarHidden:true,
		fullscreen:false
	});
	
	//Create a chrome for the barcode scanner.
	var overlay = Ti.UI.createView({
	    backgroundColor: 'transparent',
	    top: 0, right: 0, bottom: 0, left: 0
	});
	
	var cancelButton = Ti.UI.createButton({
	    title: 'Cancel',
	    textAlign: 'center',
	    color: '#fff',
	    backgroundColor: '#004990',
	    style: 0,
	    font: {
	    	fontWeight: 'bold', 
	    	fontSize: '16dp'
	    },
	    borderColor: '#fff',
	    borderRadius: 10,
	    borderWidth: 1,
	    opacity: 0.8,
	    width: '220dp',
	    height: '30dp',
	    top: '20dp'
	});
	cancelButton.addEventListener('click', function () {
	    Barcode.cancel();
	});
	overlay.add(cancelButton);
	
	
	
	
	
	
	//a view that scrolls if needed, holding our main content
	var scrollView = Ti.UI.createScrollView({
	    contentWidth: 'auto',
	    contentHeight: 'auto',
	    top: 0,
	    showVerticalScrollIndicator: true,
	    layout: 'vertical'
	});
	
	//create a welcome message
	scrollView.add(Ti.UI.createLabel({
	    text: 'Welcome to the QR Tour! Scan QR Tour codes nearby for extra special content.',
	    color: '#fff',
	    textAlign: 'center',
	    top: 10,
	    font: {
	    	fontSize: '18dp'
	    }
	}));
	
	//Create a button that will trigger the barcode scanner.
	var scanCode = Ti.UI.createButton({
	    title: 'Scan Nearby Code!',
	    textAlign: 'center',
	    color: '#fff',
	    backgroundColor: '#004990',
	    style: 0,
	    font: {
	    	fontWeight: 'bold', 
	    	fontSize: '32dp'
	    },
	    borderColor: '#fff',
	    borderRadius: 10,
	    borderWidth: 2,
	    opacity: 0.8,
	    width: '300dp',
	    height: '50dp',
	    top: '40dp'
	});
	scanCode.addEventListener('click', function () {
	    // Note: while the simulator will NOT show a camera stream in the simulator, you may still call "Barcode.capture"
	    // to test your barcode scanning overlay.
	    Barcode.capture({
	        animate: true,
	        overlay: overlay,
	        showCancel: false,
	        showRectangle: true,
	        keepOpen: true,
	        acceptedFormats: [
	            Barcode.FORMAT_QR_CODE
	        ]
	    });
	});
	scrollView.add(scanCode);
	
	//barcode event listeners
	Barcode.addEventListener('error', function (e) {
	    //deal with error here
	     Ti.API.info('Error! Error!');
	});
	Barcode.addEventListener('cancel', function (e) {
	    Ti.API.info('Cancel received');
	});
	Barcode.addEventListener('success', function (e) {
	    var url, nodeID, feedURL;
	    Ti.API.info('Success called with barcode: ' + e.result);
	    
	    //close scanner
	    Barcode.cancel();
	    
	    //deal with results
	    //Is the code a URL?
	    if(e.contentType == Barcode.URL) {
	    	url = e.result;
	    	
	    	//Does the URL match the QR Tour admin site format?
	    	//I'm sure there's a better way to do this:
	    	//at least it's likely to be Drupal related
	    	if(url.indexOf("node") != -1) {
	    		if(qrData.length == 0) {
	    			//attempt to sync QR tour feed data, if it exists, load related features and content after the feed loads
	    			feedURL = getBaseURL(url) + '/data/qr';
	    			//alert(feedURL);
	    			
	    			//content will be loaded, then cached locally for 60 minutes
	    			//if app is closed and loaded again within 60 minutes, content will be loaded locally!
	    			xhr.get(feedURL, onFeedSuccess, onFeedError, { ttl: 0, nodeURL:url }); //tempoarily ttl 0 for demo
	    		} else {
	    			//QR tour feed data already synced, load related features and content
	    			nodeID = getURLNodeID(url);
	    			if(nodeID != -1) {
	    				launchURLData(url);
	    			}
	    		}
	    	} else {
	    		alert('Bummer. That QR code was designed for a website that is not part of the QR Tour.');
	    		//maybe give the option to open the URL in a web view anyway?
	    	}
	    	
	    } else {
	    	alert('Oh man! That code wasn\'t a format ideal for use in this QR Tour app.');
	    }
	});
	
	var onFeedSuccess = function(e) {
		//!!!to-do: check if feed is valid first
		qrData = JSON.parse(e.data);
		launchURLData(e.extraParams.nodeURL);
	}
	
	var onFeedError = function(e) { 
		alert('Doh! That QR code was designed for a website that is not part of the QR Tour.');
		//maybe give the option to open the URL in a web view anyway?
	}
	
	var launchURLData = function(url) {
		var i, nodeID, match, activeQRData;
		nodeID = getURLNodeID(url);
		
		//find matching content
		for(i=0; i<qrData.length; i++) {
			if(qrData[i].nid == nodeID) {
				match = true;
				activeQRData = qrData[i];
				//alert('We have a winner!');
				break;
			}
		}
		
		if(match == true) {
			//!!!to-do: LOTS TO DO
			
			//create a nice audio player near the top of the screen if there is audio present
			//for the moment, just play the audio (I know, that's bad!)
			if(typeof activeQRData["MP3 Audio"] == "string" && activeQRData["MP3 Audio"].substring(0, 4) == "http") {
				var player = Ti.Media.createSound({url:activeQRData["MP3 Audio"]});
				player.play();
			}
			
			
		} else {
			alert('Sorry. There was an error trying to load content for this QR code. :(');
		}
	}
	
	var getBaseURL = function(url) {
		var baseURL, pathArray, protocol, host;
		
		pathArray = url.split( '/' );
		protocol = pathArray[0];
		host = pathArray[2];
		baseURL = protocol + '//' + host;
		
		return baseURL;
	}
	
	var getURLNodeID = function(url) {
		var nodeID, pathArray;
		
		pathArray = url.split( '/' );
		nodeID = pathArray[pathArray.length - 1];
		if(isNaN(nodeID) == true) {
			nodeID = -1; //not a number!
		}
		
		return nodeID;
	}
	
	//from ti.barcode example
	//disabled for now with assumption that people will want to scan with back camera
	/*
	var switchButton = Ti.UI.createButton({
	    title: Barcode.useFrontCamera ? 'Back Camera' : 'Front Camera',
	    textAlign: 'center',
	    color: '#000', backgroundColor: '#fff', style: 0,
	    font: { fontWeight: 'bold', fontSize: 16 },
	    borderColor: '#000', borderRadius: 10, borderWidth: 1,
	    opacity: 0.5,
	    width: 220, height: 30,
	    bottom: 10
	});
	switchButton.addEventListener('click', function () {
	    Barcode.useFrontCamera = !Barcode.useFrontCamera;
	    switchButton.title = Barcode.useFrontCamera ? 'Back Camera' : 'Front Camera';
	});
	overlay.add(switchButton);
	*/
	
	window.add(scrollView);
	window.open();
	
	//types of possible codes
	/*
	function parseContentType(contentType) {
	    switch (contentType) {
	        case Barcode.URL:
	            return 'URL';
	        case Barcode.SMS:
	            return 'SMS';
	        case Barcode.TELEPHONE:
	            return 'TELEPHONE';
	        case Barcode.TEXT:
	            return 'TEXT';
	        case Barcode.CALENDAR:
	            return 'CALENDAR';
	        case Barcode.GEOLOCATION:
	            return 'GEOLOCATION';
	        case Barcode.EMAIL:
	            return 'EMAIL';
	        case Barcode.CONTACT:
	            return 'CONTACT';
	        case Barcode.BOOKMARK:
	            return 'BOOKMARK';
	        case Barcode.WIFI:
	            return 'WIFI';
	        default:
	            return 'UNKNOWN';
	    }
	}
	*/
	
	//lots of cool options to play with sometime
	/*
	function parseResult(event) {
	    var msg = '';
	    switch (event.contentType) {
	        case Barcode.URL:
	            msg = 'URL = ' + event.result;
	            break;
	        case Barcode.SMS:
	            msg = 'SMS = ' + JSON.stringify(event.data);
	            break;
	        case Barcode.TELEPHONE:
	            msg = 'Telephone = ' + event.data.phonenumber;
	            break;
	        case Barcode.TEXT:
	            msg = 'Text = ' + event.result;
	            break;
	        case Barcode.CALENDAR:
	            msg = 'Calendar = ' + JSON.stringify(event.data);
	            break;
	        case Barcode.GEOLOCATION:
	            msg = 'Geo = ' + JSON.stringify(event.data);
	            break;
	        case Barcode.EMAIL:
	            msg = 'Email = ' + event.data.email + '\nSubject = ' + event.data.subject + '\nMessage = ' + event.data.message;
	            break;
	        case Barcode.CONTACT:
	            msg = 'Contact = ' + JSON.stringify(event.data);
	            break;
	        case Barcode.BOOKMARK:
	            msg = 'Bookmark = ' + JSON.stringify(event.data);
	            break;
	        case Barcode.WIFI:
	            return 'WIFI = ' + JSON.stringify(event.data);
	        default:
	            msg = 'unknown content type';
	            break;
	    }
	    return msg;
	}
	*/
})();

