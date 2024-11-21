<?php
require $_SERVER["DOCUMENT_ROOT"] . '/global.php';
if(isset($_GET['code'])){ $code = $_GET['code']; } else { $code = 400; }

switch($code)
{
    case 403: $error = ["Access Denied", "Sorry, you don't have permission to view this page!"]; break;
    case 404: $error = ["Requested page not found", "You may have clicked an expired link or mistyped the address."]; break;
    default: $error = ["Unexpected error with your request", "Please try again after a few moments."]; break;
}

$script_includes = $css_includes = [ ];

$page_config["EnableSimpleContainer"] = true;

require $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Top.php";
?>
<div id="ErrorPage"> 
	<div class="divideTitleAndBackButtons" style="margin:20px auto; height:100px; width:100%; border-top:1px solid #fff;">&nbsp;</div>   
    <img src="/images/UI/error/exclamation.png" alt="Alert" class="ErrorAlert"/>
    
    <h1><?php echo($error[0]);?></h1>
    <h3><?php echo($error[1]);?></h3>
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
<?php require $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Bottom.php";?>