<!DOCTYPE html>
<html>
	<head>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/ScriptGlobals.php";?>
		<script type="text/javascript">
		function RCCSOAPPost(ip, script) {
var RCCPost = '<?xml version="1.0" encoding="UTF-8"?>' +
'<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns2="http://roblox.com/RCCServiceSoap" xmlns:ns1="http://roblox.com/" xmlns:ns3="http://roblox.com/RCCServiceSoap12">' +
'	<SOAP-ENV:Body>' +
'		<ns1:OpenJob>' +
'			<ns1:job>' +
'				<ns1:id>1</ns1:id>' +
'				<ns1:expirationInSeconds>60</ns1:expirationInSeconds>' +
'				<ns1:category>1</ns1:category>' +
'				<ns1:cores>1</ns1:cores>' +
'			</ns1:job>' +
'			<ns1:script>' +
'				<ns1:name>Script</ns1:name>' +
'				<ns1:script>' + script + 
'--loadstring(game:HttpGetAsync("http://hexine.ga/game/gameserver.php"))()' +
'--start(placeId, port, "http://hexine.ga")</ns1:script>' +
'			</ns1:script>' +
'		</ns1:OpenJob>' +
'	</SOAP-ENV:Body>' +
'</SOAP-ENV:Envelope>';
			
			/*fetch("http://"+ip+":64989", {
				method: "POST", 
				body: RCCPost
			})*/
			
			/*var xhr = new XMLHttpRequest();
			xhr.open("PUT", ("http://"+ip+":64989"), true);
			xhr.setRequestHeader('Content-Type', 'text/xml; charset=utf-8', 'Accept', 'text/xml', 'Cache-Control', 'no-cache', 'Pragma', 'no-cache', 'SOAPAction', 'HelloWorld');
			xhr.send(RCCPost);*/
			
			var xhr = new XMLHttpRequest();
			xhr.open("POST", ("http://"+ip+":64989"));
			xhr.setRequestHeader('Content-Type', 'text/plain; charset=utf-8', 'Accept', 'text/xml');
			xhr.send(RCCPost);
			
			/*$.ajax({
				url:"http://"+ip+":64989",
				type:"POST",
				data:RCCPost,
				contentType:"text/xml; charset=utf-8",
				Accept:"text/xml",
				Cache-Control:"no-cache",
				Pragma:"no-cache",
				SOAPAction:"HelloWorld",
				dataType:"text"
			});*/
		};
		</script>
		
<!--script type="text/javascript">	
var RCCPost = '<?xml version="1.0" encoding="UTF-8"?>' +
'<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns2="http://roblox.com/RCCServiceSoap" xmlns:ns1="http://roblox.com/" xmlns:ns3="http://roblox.com/RCCServiceSoap12">' +
'	<SOAP-ENV:Body>' +
'		<ns1:BatchJob>' +
'			<ns1:job>' +
'				<ns1:id>1</ns1:id>' +
'				<ns1:expirationInSeconds>60</ns1:expirationInSeconds>' +
'				<ns1:category>1</ns1:category>' +
'				<ns1:cores>1</ns1:cores>' +
'			</ns1:job>' +
'			<ns1:script>' +
'				<ns1:name>Script</ns1:name>' +
'				<ns1:script>loadstring(game:HttpGetAsync("http://hexine.ga/game/gameserver.php"))()' +
'start(placeId, port, "http://hexine.ga")</ns1:script>' +
'			</ns1:script>' +
'		</ns1:BatchJob>' +
'	</SOAP-ENV:Body>' +
'</SOAP-ENV:Envelope>';
$.ajax({
	url:"http://localhost:64989/",
	type:"POST",
	data:RCCPost,
	contentType:"text/xml; charset=utf-8",
	accept:"text/xml",
	cacheControl:"no-cache",
	pragma:"no-cache",
	SOAPAction:"HelloWorld",
	dataType:"xml"
	});
</script-->
<style>
input[type=text], select, input[type=password],input[type=email],input[type=number],textarea {
  width: 100%;
  padding: 5px 15px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 15px 25px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}
</style>
<title>RCCService Script Execution Panel</title>
</head>
	<body>
		<div id="MasterContainer">
                   


<script type="text/javascript">
$(function(){
    function trackReturns() {
	    function dayDiff(d1, d2) {
		    return Math.floor((d1-d2)/86400000);
	    }

	    var cookieName = 'RBXReturn';
	    var cookieOptions = {expires:9001};
        var cookie = $.getJSONCookie(cookieName);

	    if (typeof cookie.ts === "undefined" || isNaN(new Date(cookie.ts))) {
	        $.setJSONCookie(cookieName, { ts: new Date().toDateString() }, cookieOptions);
		    return;
	    }

	    var daysSinceFirstVisit = dayDiff(new Date(), new Date(cookie.ts));
	    if (daysSinceFirstVisit == 1 && typeof cookie.odr === "undefined") {
		    RobloxEventManager.triggerEvent('rbx_evt_odr', {});
		    cookie.odr = 1;
	    }
	    if (daysSinceFirstVisit >= 1 && daysSinceFirstVisit <= 7 && typeof cookie.sdr === "undefined") {
		    RobloxEventManager.triggerEvent('rbx_evt_sdr', {});
		    cookie.sdr = 1;
	    }
	
	    $.setJSONCookie(cookieName, cookie, cookieOptions);
    }

    
        RobloxListener.restUrl = window.location.protocol + "//" + "<?=$_SERVER['SERVER_NAME']?>/Game/EventTracker.ashx";
        RobloxListener.init();
    
    
        GoogleListener.init();
    
    
    
    
        RobloxEventManager.initialize(true);
        RobloxEventManager.triggerEvent('rbx_evt_pageview');
        trackReturns();
    
    
    
        RobloxEventManager._idleInterval = 450000;
        RobloxEventManager.registerCookieStoreEvent('rbx_evt_initial_install_start');
        RobloxEventManager.registerCookieStoreEvent('rbx_evt_ftp');
        RobloxEventManager.registerCookieStoreEvent('rbx_evt_initial_install_success');
        RobloxEventManager.registerCookieStoreEvent('rbx_evt_fmp');
        RobloxEventManager.startMonitor();
    

});

</script>


        

        <script type="text/javascript">Roblox.FixedUI.gutterAdsEnabled=false;</script>
        

<?php include $_SERVER["DOCUMENT_ROOT"] . '/Banner' ;?>
        




    <noscript><div class="SystemAlert"><div class="SystemAlertText">Please enable Javascript to use all the features on this site.</div></div></noscript>
    <style type="text/css">
        .SmallHeaderContainer 
        {
            top:0px;
        }
    </style>
	<div id="BodyWrapper">
        <div id="RepositionBody">
			<div id="Body" style="width:970px; padding: 5px 0 80px 0;">
			<div class="row">
				<div class="col-xs-8">
					<div class="divider-right" style="width: 484px; float: left; padding-left: 0.2in;">
						<h2 class="title">
							<span>ROBLOX Compute Cloud Service Data POST Interface</span>
						</h2>
						<div class="panel-body">
								IP:<br>
								<input type="text" id="urlEntry" style="width:3in;">
								<br>
								Script:<br>
								<textarea rows="4" cols="40" id="scriptEntry" style="width: 3in; height: 2in; resize: both; overflow: auto;"></textarea>
								<br>
								<button onclick="RCCSOAPPost(document.getElementById('urlEntry').value, document.getElementById('scriptEntry').value)" class="btn-medium btn-neutral btn-level-element " style="padding: 4px 13px 1px 13px; height: 33px;">POST Data<span class="btn-text">POST Data</span></button>
						</div>
					</div>
					<div class="divider-left" style="width: 420px; float: right; align-self: center; border-left: 0px; padding-right: 0.2in;">
					<h2 class="title" style="margin-bottom: 0px;">
						<span>RCCService SOAP Info</span>
					</h2>
					<pre class="Description body text">This is where you can test your copy of ROBLOX Compute Cloud Service. ROBLOX Compute Cloud Service (or RCCService for short) when run can serve as a remote sandboxed LUA environment. Enter a script to execute and press 'POST Data' to remotely execute your code. You could effectively run a ROBLOX instance via the loadstring command, as the current script interface is fairly limited.</pre>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
	<?php include $_SERVER["DOCUMENT_ROOT"] . "/Footer";?>
	</div>
	<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Post-Footer.php";?>
	</body>
</html>