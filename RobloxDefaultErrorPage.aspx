<?php
die(header("Location: /RobloniumDefaultErrorPage.aspx".explode("aspx", $_SERVER['REQUEST_URI'])[1]));
//require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/global_functions.php';
$error = [
	403 => ["Access Denied", "Sorry, you don't have permission to view this page!"],
	404 => ["Requested page not found", "You may have clicked an expired link or mistyped the address."],
	500 => ["Unexpected error with your request", "Please try again after a few moments."]
];
$code = $_GET['code'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" id="www-roblox-com" style="background:white !important;">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/><title>
	ROBLONIUM Error
</title>
  <script type="text/javascript" src="/js/JSErrorTracker.js"></script>

    <!-- this link can't data bind - cmac -->
	<link rel="icon" type="image/vnd.microsoft.icon" href="/favicon.ico"/><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta name="author" content="ROBLONIUM"/><meta name="description" content="User-generated MMO gaming site for kids, teens, and adults. Players architect their own worlds. Builders create free online games that simulate the real world. Create and play amazing 3D games. An online gaming cloud and distributed physics engine."/><meta name="keywords" content="free games, online games, building games, virtual worlds, free mmo, gaming cloud, physics engine"/><meta name="robots" content="all"/>
<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-11419793-1']);
    _gaq.push(['_setCampSourceKey', 'rbx_source']);
    _gaq.push(['_setCampMediumKey', 'rbx_medium']);
    _gaq.push(['_setCampContentKey', 'rbx_campaign']);
    
    
    
    _gaq.push(['b._setAccount', 'UA-486632-1']);
    _gaq.push(['b._setCampSourceKey', 'rbx_source']);
    _gaq.push(['b._setCampMediumKey', 'rbx_medium']);
    _gaq.push(['b._setCampContentKey', 'rbx_campaign']);

    
        _gaq.push(['c._setAccount', 'UA-26810151-2']);
    

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl/' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

</script>
<!--script type="text/javascript" src="../jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="https://s3.amazonaws.com/js.roblox.com/c89f93934e866904b7e2c6cf9653b112.js"></script-->
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/ScriptGlobals.php";?>
</head>
<body style="background:white !important;">
 
    <style type="text/css">
        .SmallHeaderContainer 
        {
            top:0px;
        }
    </style>
    <form name="aspnetForm" method="post" action="/RobloxDefaultErrorPage.aspx" id="aspnetForm">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTQ5NjkzMDU3OA9kFgJmD2QWBGYPZBYEAgQPFgIeBGhyZWYFKy9DU1MvQmFzZS9DU1MvQWxsQ1NTLmFzaHg/dj0yMDEyMDQyNiZ0PVJCWDJkAgUPFgIeB1Zpc2libGVoZAIBEBYCHgZhY3Rpb24FHS9Sb2Jsb3hEZWZhdWx0RXJyb3JQYWdlLmFzcHg/ZGQYAQUjY3RsMDAkcmJ4R29vZ2xlQW5hbHl0aWNzJE11bHRpVmlldzEPD2RmZOzNU2BFovU8nU1ev/mclUakzc3Z"/>
</div>
    
	<script type="text/javascript">
		$(function () {
			$('.tooltip').tipsy();
			$('.tooltip-top').tipsy({ gravity: 's' });
			$('.tooltip-right').tipsy({ gravity: 'w' });
			$('.tooltip-left').tipsy({ gravity: 'e' });
			$('.tooltip-bottom').tipsy({ gravity: 'n' });
		});
    </script>
<?php include $_SERVER["DOCUMENT_ROOT"] . '/Banner' ;?>    
<div id="ErrorPage"> 
	<div class="divideTitleAndBackButtons" style="margin:20px auto; height:100px; width:100%; border-top:1px solid #fff;">&nbsp;</div>   
    <img src="/images/UI/error/exclamation.png" alt="Alert" class="ErrorAlert"/>
    
    <h1><?php echo($error[$code][0]);?></h1>
    <h3><?php echo($error[$code][1]);?></h3>
    <p>If you continue to receive this page, please contact customer service at <a href="mailto:info@<?=$_SERVER['SERVER_NAME']?>">info@<?=$_SERVER['SERVER_NAME']?></a>.</p>
    <pre><span id="ctl00_cphRoblox_errorMsgLbl"></span></pre>

    <div class="divideTitleAndBackButtons">&nbsp;</div>

    <div class="CenterNavigationButtonsForFloat">
        <a class="GoToPreviousPageButton" title="Go to Previous Page Button" onclick="history.back();return false;" href="#"></a>
        <a class="ReturnHomeButton" title="Return Home" href="/"></a>
        <div style="clear:both"></div>
    </div>
	<div class="divideTitleAndBackButtons" style="margin:20px auto; height:100px; width:100%; border-top:1px solid #fff;">&nbsp;</div>
</div> 
        <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
        <script type="text/javascript">
            _uacct = "UA-486632-1";
            _udn = "roblox.com";
            _uccn = "rbx_campaign";
            _ucmd = "rbx_medium";
            _ucsr = "rbx_source";
            urchinTracker();
            __utmSetVar('Visitor/Spider');
        </script>
    

    


    <script type="text/javascript">
        // Deferred loading a la google to prevent blocking during download and execution
        (function () {
            var protocol = 'https:' == document.location.protocol ? "https://ssltracking/" : "http://akatracking/";
            var scriptFile = 'esearchvisiontracking.js';
            var s = document.createElement('script');
            s.type = 'text/javascript';
            s.async = true;
            s.src = protocol + ".esearchvision.com/esi/" + scriptFile;
            var x = document.getElementsByTagName('script')[0];
            x.parentNode.insertBefore(s, x);
        })();
    </script>


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
		    $.setJSONCookie(cookieName, {ts:new Date().toDateString()}, cookieOptions)
		    return;
	    }

	    var daysSinceFirstVisit = dayDiff(new Date(), new Date(cookie.ts));
	    if (daysSinceFirstVisit == 1 && typeof cookie.odr === "undefined") {
		    RobloxEventManager.triggerEvent('rbx_evt_generic', { type:'OneDayReturn'});
		    cookie.odr = 1;
	    }
	    if (daysSinceFirstVisit >= 1 && daysSinceFirstVisit <= 7 && typeof cookie.sdr === "undefined") {
		    RobloxEventManager.triggerEvent('rbx_evt_generic', {type: 'SevenDayReturn'});
		    cookie.sdr = 1;
	    }
	
	    $.setJSONCookie(cookieName, cookie, cookieOptions);
    }

    
    KontagentListener.restUrl = window.location.protocol + "//" + "api.geo.kontagent.net/api/v1/";
    KontagentListener.APIKey = "920472a959b042f782bd267c5567b480";
    KontagentListener.StagingAPIKey = "c3ec679ac27b4f4fb393b5ccd94e7f67";
    try { 
        KontagentListener.StagingEvents = eval("([{'rbx_evt_ftp':'Install%20Success%20Place'},{'rbx_evt_fmp':'Five%20Minute%20Play%20Place'}])");
    }
    catch(ex) {
        KontagentListener.StagingEvents = [];
    }
    KontagentListener.init();
    
    RobloxListener.restUrl = window.location.protocol + "//" + "roblox.com/Game/EventTracker.ashx";
    RobloxListener.init();
    
    GoogleListener.init();
    
    SearchVisionListener.init();
    
    RobloxEventManager.initialize(true);
    RobloxEventManager.triggerEvent('rbx_evt_pageview');
    trackReturns();
    
    RobloxEventManager.registerCookieStoreEvent('rbx_evt_initial_install_start');
    RobloxEventManager.registerCookieStoreEvent('rbx_evt_ftp');
    RobloxEventManager.registerCookieStoreEvent('rbx_evt_initial_install_success');
    RobloxEventManager.registerCookieStoreEvent('rbx_evt_fmp');
    RobloxEventManager.monitorCookieStore();
    setInterval(RobloxEventManager.monitorCookieStore, 5000);
    

});
</script>


</form>
</body>
</html>