<?php
session_start();
include_once $_SERVER["DOCUMENT_ROOT"] . '/global.php';
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<!-- MachineID: WEB75 -->
<head id="ctl00_Head1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,requiresActiveX=true"/><title>
	<?=$_SERVER['SERVER_NAME']?>
</title><link rel="stylesheet" href="/CSS/Themes/Holiday2013/Holiday2013.css"/>
<link rel="icon" type="image/vnd.microsoft.icon" href="http:/<?=$_SERVER['SERVER_NAME']?>/favicon.ico"/><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="Content-Language" content="en-us"/><meta name="author" content="Roblonium"/><meta id="ctl00_metadescription" name="description" content="Welcome to Roblonium!"/><meta id="ctl00_metakeywords" name="keywords" content="Roblonium, Roblox, Finobe, revival, Roblox revival, old, 2013, nostalgia"/>

<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/ScriptGlobals.php";?>

    <script type="text/javascript">Roblox.XsrfToken.setToken('');</script>

<style type="text/css">
    
</style>
<form name="aspnetForm" method="post" action="/Login/NewAge.aspx" id="aspnetForm">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTY1NjU5ODk2MA8WAh4Ic2lnbnVwSUQCwpeKFhYCZg9kFgICARAWAh4GYWN0aW9uBRIvTG9naW4vTmV3QWdlLmFzcHhkFgoCBA8PFgIeB1Zpc2libGVoZBYCZg9kFggCAQ8QZGQWAGQCAg8QZGQWAWZkAgMPEGRkFgFmZAIEDxBkZBYBZmQCBQ8PFgIfAmhkZAIGDw8WAh8CaGRkAg4PDxYCHwJoZGQCEQ9kFgYCAQ8QZA8WHwIBAgICAwIEAgUCBgIHAggCCQIKAgsCDAINAg4CDwIQAhECEgITAhQCFQIWAhcCGAIZAhoCGwIcAh0CHgIfFh8QBQExBQExZxAFATIFATJnEAUBMwUBM2cQBQE0BQE0ZxAFATUFATVnEAUBNgUBNmcQBQE3BQE3ZxAFATgFAThnEAUBOQUBOWcQBQIxMAUCMTBnEAUCMTEFAjExZxAFAjEyBQIxMmcQBQIxMwUCMTNnEAUCMTQFAjE0ZxAFAjE1BQIxNWcQBQIxNgUCMTZnEAUCMTcFAjE3ZxAFAjE4BQIxOGcQBQIxOQUCMTlnEAUCMjAFAjIwZxAFAjIxBQIyMWcQBQIyMgUCMjJnEAUCMjMFAjIzZxAFAjI0BQIyNGcQBQIyNQUCMjVnEAUCMjYFAjI2ZxAFAjI3BQIyN2cQBQIyOAUCMjhnEAUCMjkFAjI5ZxAFAjMwBQIzMGcQBQIzMQUCMzFnZGQCAg8QZA8WZAIBAgICAwIEAgUCBgIHAggCCQIKAgsCDAINAg4CDwIQAhECEgITAhQCFQIWAhcCGAIZAhoCGwIcAh0CHgIfAiACIQIiAiMCJAIlAiYCJwIoAikCKgIrAiwCLQIuAi8CMAIxAjICMwI0AjUCNgI3AjgCOQI6AjsCPAI9Aj4CPwJAAkECQgJDAkQCRQJGAkcCSAJJAkoCSwJMAk0CTgJPAlACUQJSAlMCVAJVAlYCVwJYAlkCWgJbAlwCXQJeAl8CYAJhAmICYwJkFmQQBQQyMDEyBQQyMDEyZxAFBDIwMTEFBDIwMTFnEAUEMjAxMAUEMjAxMGcQBQQyMDA5BQQyMDA5ZxAFBDIwMDgFBDIwMDhnEAUEMjAwNwUEMjAwN2cQBQQyMDA2BQQyMDA2ZxAFBDIwMDUFBDIwMDVnEAUEMjAwNAUEMjAwNGcQBQQyMDAzBQQyMDAzZxAFBDIwMDIFBDIwMDJnEAUEMjAwMQUEMjAwMWcQBQQyMDAwBQQyMDAwZxAFBDE5OTkFBDE5OTlnEAUEMTk5OAUEMTk5OGcQBQQxOTk3BQQxOTk3ZxAFBDE5OTYFBDE5OTZnEAUEMTk5NQUEMTk5NWcQBQQxOTk0BQQxOTk0ZxAFBDE5OTMFBDE5OTNnEAUEMTk5MgUEMTk5MmcQBQQxOTkxBQQxOTkxZxAFBDE5OTAFBDE5OTBnEAUEMTk4OQUEMTk4OWcQBQQxOTg4BQQxOTg4ZxAFBDE5ODcFBDE5ODdnEAUEMTk4NgUEMTk4NmcQBQQxOTg1BQQxOTg1ZxAFBDE5ODQFBDE5ODRnEAUEMTk4MwUEMTk4M2cQBQQxOTgyBQQxOTgyZxAFBDE5ODEFBDE5ODFnEAUEMTk4MAUEMTk4MGcQBQQxOTc5BQQxOTc5ZxAFBDE5NzgFBDE5NzhnEAUEMTk3NwUEMTk3N2cQBQQxOTc2BQQxOTc2ZxAFBDE5NzUFBDE5NzVnEAUEMTk3NAUEMTk3NGcQBQQxOTczBQQxOTczZxAFBDE5NzIFBDE5NzJnEAUEMTk3MQUEMTk3MWcQBQQxOTcwBQQxOTcwZxAFBDE5NjkFBDE5NjlnEAUEMTk2OAUEMTk2OGcQBQQxOTY3BQQxOTY3ZxAFBDE5NjYFBDE5NjZnEAUEMTk2NQUEMTk2NWcQBQQxOTY0BQQxOTY0ZxAFBDE5NjMFBDE5NjNnEAUEMTk2MgUEMTk2MmcQBQQxOTYxBQQxOTYxZxAFBDE5NjAFBDE5NjBnEAUEMTk1OQUEMTk1OWcQBQQxOTU4BQQxOTU4ZxAFBDE5NTcFBDE5NTdnEAUEMTk1NgUEMTk1NmcQBQQxOTU1BQQxOTU1ZxAFBDE5NTQFBDE5NTRnEAUEMTk1MwUEMTk1M2cQBQQxOTUyBQQxOTUyZxAFBDE5NTEFBDE5NTFnEAUEMTk1MAUEMTk1MGcQBQQxOTQ5BQQxOTQ5ZxAFBDE5NDgFBDE5NDhnEAUEMTk0NwUEMTk0N2cQBQQxOTQ2BQQxOTQ2ZxAFBDE5NDUFBDE5NDVnEAUEMTk0NAUEMTk0NGcQBQQxOTQzBQQxOTQzZxAFBDE5NDIFBDE5NDJnEAUEMTk0MQUEMTk0MWcQBQQxOTQwBQQxOTQwZxAFBDE5MzkFBDE5MzlnEAUEMTkzOAUEMTkzOGcQBQQxOTM3BQQxOTM3ZxAFBDE5MzYFBDE5MzZnEAUEMTkzNQUEMTkzNWcQBQQxOTM0BQQxOTM0ZxAFBDE5MzMFBDE5MzNnEAUEMTkzMgUEMTkzMmcQBQQxOTMxBQQxOTMxZxAFBDE5MzAFBDE5MzBnEAUEMTkyOQUEMTkyOWcQBQQxOTI4BQQxOTI4ZxAFBDE5MjcFBDE5MjdnEAUEMTkyNgUEMTkyNmcQBQQxOTI1BQQxOTI1ZxAFBDE5MjQFBDE5MjRnEAUEMTkyMwUEMTkyM2cQBQQxOTIyBQQxOTIyZxAFBDE5MjEFBDE5MjFnEAUEMTkyMAUEMTkyMGcQBQQxOTE5BQQxOTE5ZxAFBDE5MTgFBDE5MThnEAUEMTkxNwUEMTkxN2cQBQQxOTE2BQQxOTE2ZxAFBDE5MTUFBDE5MTVnEAUEMTkxNAUEMTkxNGcQBQQxOTEzBQQxOTEzZ2RkAgQPZBYEZg8WAh4Dc3JjBUtodHRwczovL3MzLmFtYXpvbmF3cy5jb206NDQzL3QzLnJvYmxveC5jb20vNTBmZTE5NzI4ZTcxNmY0YTliYmZmMzlkN2NhOWMyMGNkAgIPFgIfAwVLaHR0cHM6Ly9zMy5hbWF6b25hd3MuY29tOjQ0My90MC5yb2Jsb3guY29tL2ZjMzIxMDdhMDc1MzUyZDYxNGQxYWI4ODEwYWI3NzMyZBgFBSNjdGwwMCRMZWZ0R3V0dGVyQWQkQXN5bmNBZE11bHRpVmlldw8PZAICZAUjY3RsMDAkcmJ4R29vZ2xlQW5hbHl0aWNzJE11bHRpVmlldzEPD2QCAWQFLGN0bDAwJGNwaEJhbm5lckFkJEJhbm5lckFkcyRBc3luY0FkTXVsdGlWaWV3Dw9kAgJkBSRjdGwwMCRSaWdodEd1dHRlckFkJEFzeW5jQWRNdWx0aVZpZXcPD2QCAmQFHl9fQ29udHJvbHNSZXF1aXJlUG9zdEJhY2tLZXlfXxYEBShjdGwwMCRjcGhSb2Jsb3gkU2VsZWN0R2VuZGVyUGFuZSRNYWxlQnRuBShjdGwwMCRjcGhSb2Jsb3gkU2VsZWN0R2VuZGVyUGFuZSRNYWxlQnRuBSpjdGwwMCRjcGhSb2Jsb3gkU2VsZWN0R2VuZGVyUGFuZSRGZW1hbGVCdG4FKmN0bDAwJGNwaFJvYmxveCRTZWxlY3RHZW5kZXJQYW5lJEZlbWFsZUJ0bgfQKkGzA6S0z99s5va81UajmzhI"/>
</div>


<script type="text/javascript">
//<![CDATA[
function checkRobloxInstall(){window.location="/Install/Unsupported.aspx"; return false;}//]]>
</script>

<script src="/ScriptResource.axd?d=ib_pzwkcj3RPo_km2yIH8sfg6UxkMguGnvoflV5geigq8Wp2zjm57-j3fGvbU1DrkHAJl9WDbCFavmYwY9TFjLYTQoErWHCSHA4jJN-ibc_3QBaQ0uahTA3wB96yLadfVfwexPLbN00yZdE6Ce_PYhvMDTCK0Dclq7xEoYG2fw0D1ZNgyIwZhz8awFvvBDUGq9n7g_HbecRCn5THtG6ybzixa7lRUwCjlxYIMLWBbwjtmNdf8zwLhIruKIZm7pqfF2_CZIVeJOdxULUWMUr8nd-IWzOt6Lvd6kXavT3Y6GyowiyXgaPTzyma5FL4YTmoPDbF9lDqKZUYKujZGROBiwkDRN3FLZfNM_6nEQB-CPi8OX7WAFmx_TF6l8SmOy8NaX5WLiHf5UHEEz3yYvedNobicAu7XVT3BGIZwLrgmm9zOQfdYkUdkhLc3kmxzFt1N7eU_g2" type="text/javascript"></script>
<div>

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWlgEC/vbP9Q4CwdSDvwcC3tSDvwcC39SDvwcC3NSDvwcC3dSDvwcC2tSDvwcC29SDvwcC2NSDvwcCydSDvwcCxtSDvwcC3tTDvAcC3tTPvAcC3tTLvAcCuavNcQKmq81xAqerzXECpKvNcQKlq81xAqKrzXECo6vNcQKgq81xArGrzXECvqvNcQKmq41yAqargXICpquFcgKmq7lyAqarvXICpquxcgKmq7VyAqarqXICpqvtcQKmq+FxAqerjXICp6uBcgKnq4VyAqeruXICp6u9cgKnq7FyAqertXICp6upcgKnq+1xAqer4XECpKuNcgKkq4FyAoK0o4EJAtHMyokNAtHM3q4EAtHM4vMPArr10OoIArr15A8CuvXI5gYCuvXciw4CuvXg0AECuvX09QgCuvWYGQK69ay+CwK69bDDAgK69cToBQL+lq0eAv6WsaMLAv6WhZoOAv6Wqb8BAv6WvcQIAv6WwekDAv6W1Y4LAv6W+dMCAv6WjfcFAv6WkZwNAsO/j7MOAsO/k9gBAsO/57AEAsO/i9QPAsO/n/kGAsO/o54OAsO/t6MBAsO/28gIAsO/7+0DAsO/87ILAvTVz/UBAvTV05oJAvTVp/EPAvTVy5YHAvTV37sOAvTV48ABAvTV9+UIAvTVmwkC9NWvrgsC9NWz8wIC2f6h6g8C2f61jwcC2f6Z5gUC2f6tiw0C2f6x0AQC2f7F9Q8C2f7pmgcC2f79vw4C2f6BwwEC2f6V6AgCoueDnwoCoueXpA0Couf7HAKi54+gCwKi55PFAgKi56fqBQKi58uPDQKi59/UBAKi5+P5DwKi5/eeBwKHiOU1AoeIidkLAoeI3bEOAoeI4dYBAoeI9fsIAoeImR8Ch4itpAsCh4ixyQICh4jF7gUCh4jpsw0C6LLHqg4C6LLrzwEC6LK/pgQC6LLDyw8C6LLXkAcC6LL7tQ4C6LKP2QEC6LKT/ggC6LKnAwLossuoCwLN27jfBALN28zkDwLN25DbAgLN26TgBQLN28iFDQLN29yqBALN2+DPDwLN2/SUBwLN25i4DgLN26zdAQLWzJr0AgLWzK6ZCgLWzPLxCALWzIYVAtbMqroLAtbMvt8CAtbMwuQFAozJwd4CAvGMmbsHAuyFj4AOR535Pa8+9ccL//u+nTrE8Q5DKnw="/>
</div>
    <div id="fb-root">
    </div>
    
    
         
    

    
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
		    $.setJSONCookie(cookieName, {ts:new Date().toDateString()}, cookieOptions)
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

    
    RobloxListener.restUrl = window.location.protocol + "//" + "roblox.com/Game/EventTracker.ashx";
    RobloxListener.init();
    
    GoogleListener.init();
    
    RobloxEventManager.initialize(true);
    RobloxEventManager.triggerEvent('rbx_evt_pageview');
    trackReturns();
    
    RobloxEventManager._singlePluginInstance = true;
    RobloxEventManager._idleInterval = 450000;
    RobloxEventManager.registerCookieStoreEvent('rbx_evt_initial_install_start');
    RobloxEventManager.registerCookieStoreEvent('rbx_evt_ftp');
    RobloxEventManager.registerCookieStoreEvent('rbx_evt_initial_install_success');
    RobloxEventManager.registerCookieStoreEvent('rbx_evt_fmp');
        
    RobloxEventManager.startMonitor();
        

});
</script>


        
		
    	

        <script type="text/javascript">Roblox.FixedUI.gutterAdsEnabled=false;</script>
        

        
        
        <div id="Container">
            
                

<style type="text/css">
    div.mySubmenuFixed {
        top: 36px;
        background-color: #191919;
        height: 25px;
        *top: 0px;
    }
</style>
<div id="Banner" class="BannerRedesign">
    <div id="NavigationRedesignBannerContainer" class="BannerCenterContainer">
        <a href="/index.html" id="navbar-logo" class="btn-logo" data-se="nav-logo"></a>
        <div id="NavRedesign" class="NavigationRedesign">
            <ul id="ctl00_cphBanner_MenuRedesign_MenuUL">
                <li><a href="/index.html" ref="nav-myroblox" data-se="nav-myhome">Home</a></li>
                <li class="gamesLink"><a id="hlGames" data-se="nav-games" href="/games" title="Games" ref="nav-games">Games</a> </li>
                <li class="catalogLink"><a id="hlCatalog" data-se="nav-catalog" href="catalog title="Catalog" ref="nav-catalog">Catalog</a></li>
                <li><a id="BuildLink" data-se="nav-build" href="/My/Places.aspx" title="Build" ref="nav-build">Build</a></li>
                <li class="upgradeLink"><a id="hlBuildersClub" data-se="nav-upgrade" href="/Upgrades/BuildersClubMemberships.aspx" title="Upgrade" ref="nav-buildersclub">Upgrade</a></li>
                <li><a data-se="nav-forum" onclick="" href="/Forum/index.html" style="" title="Forum" ref="nav-forum">Forum</a></li>
                
                <li class="moreLink" drop-down-nav-button="moreLink">
                    <div class="LinkContainer">
                        <a id="hlMore" title="More" data-se="nav-more" ref="nav-more">More<span id="moreMenuToggle"></span></a> 
                    </div>
                    <div class="dropdownnavcontainer" style="display:none;" drop-down-nav-container="moreLink">
                        <div class="dropdownmainnav" style="z-index:1023">
                            <a class="dropdownoption" data-se="nav-more-browse" href="/Browse.aspx" title="People" ref="nav-people"><span>People</span></a>
                            <a class="dropdownoption" data-se="nav-more-blog" href="http://blog.roblox.com/" title="Blog" ref="nav-news"><span>Blog</span></a>
                            
                                   <a class="dropdownoption" data-se="nav-more-sponsoredpage" href="/SponsoredPage/Croods" title="Sponsored" ref="nav-sponsoredpage">
                                       
                                       
                                          <img src="https://s3.amazonaws.com/images.roblox.com/14ec57918425f1d0851f502178359e84"/>
                                       
                                       </span>
                                   </a>
                            
                            <a class="dropdownoption" data-se="nav-more-help" href="/Help/Builderman.aspx" title="Help" ref="nav-help"><span>Help</span></a>
                            <div style="clear:both;"></div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        
  <div id="SiteWideHeaderLogin">
    <div id="HeaderLoginButton" class="iFrameLoginSignUp">
		<a id="HeaderSignUp" href="/Login/NewAge.aspx">Sign Up</a>
		<span id="HeaderOr">or</span>
        <span id="loginSpan">
		    <a id="headerLogin" class="btn-form">Login <span class="grey-arrow">▼</span></a>
        </span>
		<div id="iFrameLogin" style="display:none">
		<iframe class="loginFrame" src="/Login/iFrameLogin.aspx?loginRedirect=False&amp;parentUrl=https%3a%2f%2fwww.roblox.com%2fLogin%2fNewAge.aspx" scrolling="no" frameborder="0"></iframe>
	</div>
	 </div>
  </div>	

    </div>
</div>
<script type="text/javascript">
    $(function () {
        $('.moreLink').bind('showDropDown', function (e) {
            var maxWidth = $('#NavRedesign .dropdownnavcontainer').width();
            $('a.dropdownoption span').each(function (index, elem) {
                elem = $(elem);
                if (elem.outerWidth() > maxWidth) {
                    maxWidth = elem.outerWidth();
                }
            });
            maxWidth = maxWidth + 5;
            $('#NavRedesign .dropdownoption').each(function (index, elem) {
                elem = $(elem);
                if (elem.width() < maxWidth) {
                    elem.width(maxWidth);
                }
            });

        });
    });
</script>

                
        </div>

        
            
        
        
        


        

        <noscript><div class="SystemAlert"><div class="SystemAlertText">Please enable Javascript to use all the features on this site.</div></div></noscript>  <?php include $_SERVER["DOCUMENT_ROOT"] . "/Announcement" ;?><div id="BodyWrapper">
            <div id="RepositionBody"><div id="Body" style="">
                
<div style="float: left; width: 620px; margin-top: 10px;">
    <div class="StandardBoxHeader" style="width: 620px;"><span>Create a Free ROBLOX Account</span></div>
    <div class="StandardBox" style="width: 620px;">
		<h3>For a personalized experience, enter your birthday:</h3><br/>
		<center>
		<select name="ctl00$cphRoblox$lstMonths" id="lstMonths" style="font-size: 18px;">
	<option value="0">Select Month</option>
	<option value="1">January</option>
	<option value="2">February</option>
	<option value="3">March</option>
	<option value="4">April</option>
	<option value="5">May</option>
	<option value="6">June</option>
	<option value="7">July</option>
	<option value="8">August</option>
	<option value="9">September</option>
	<option value="10">October</option>
	<option value="11">November</option>
	<option value="12">December</option>

</select>
        &nbsp;&nbsp;
		<select name="ctl00$cphRoblox$lstDays" id="lstDays" style="font-size: 18px;">
	<option value="0">Select Day</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
	<option value="13">13</option>
	<option value="14">14</option>
	<option value="15">15</option>
	<option value="16">16</option>
	<option value="17">17</option>
	<option value="18">18</option>
	<option value="19">19</option>
	<option value="20">20</option>
	<option value="21">21</option>
	<option value="22">22</option>
	<option value="23">23</option>
	<option value="24">24</option>
	<option value="25">25</option>
	<option value="26">26</option>
	<option value="27">27</option>
	<option value="28">28</option>
	<option value="29">29</option>
	<option value="30">30</option>
	<option value="31">31</option>

</select>
		&nbsp;&nbsp;
		<select name="ctl00$cphRoblox$lstYears" id="lstYears" style="font-size: 18px;">
	<option value="0">Select Year</option>
	<option value="2018">2018</option>
	<option value="2017">2017</option>
	<option value="2016">2016</option>
	<option value="2015">2015</option>
	<option value="2014">2014</option>
	<option value="2013">2013</option>
	<option value="2012">2012</option>
	<option value="2011">2011</option>
	<option value="2010">2010</option>
	<option value="2009">2009</option>
	<option value="2008">2008</option>
	<option value="2007">2007</option>
	<option value="2006">2006</option>
	<option value="2005">2005</option>
	<option value="2004">2004</option>
	<option value="2003">2003</option>
	<option value="2002">2002</option>
	<option value="2001">2001</option>
	<option value="2000">2000</option>
	<option value="1999">1999</option>
	<option value="1998">1998</option>
	<option value="1997">1997</option>
	<option value="1996">1996</option>
	<option value="1995">1995</option>
	<option value="1994">1994</option>
	<option value="1993">1993</option>
	<option value="1992">1992</option>
	<option value="1991">1991</option>
	<option value="1990">1990</option>
	<option value="1989">1989</option>
	<option value="1988">1988</option>
	<option value="1987">1987</option>
	<option value="1986">1986</option>
	<option value="1985">1985</option>
	<option value="1984">1984</option>
	<option value="1983">1983</option>
	<option value="1982">1982</option>
	<option value="1981">1981</option>
	<option value="1980">1980</option>
	<option value="1979">1979</option>
	<option value="1978">1978</option>
	<option value="1977">1977</option>
	<option value="1976">1976</option>
	<option value="1975">1975</option>
	<option value="1974">1974</option>
	<option value="1973">1973</option>
	<option value="1972">1972</option>
	<option value="1971">1971</option>
	<option value="1970">1970</option>
	<option value="1969">1969</option>
	<option value="1968">1968</option>
	<option value="1967">1967</option>
	<option value="1966">1966</option>
	<option value="1965">1965</option>
	<option value="1964">1964</option>
	<option value="1963">1963</option>
	<option value="1962">1962</option>
	<option value="1961">1961</option>
	<option value="1960">1960</option>
	<option value="1959">1959</option>
	<option value="1958">1958</option>
	<option value="1957">1957</option>
	<option value="1956">1956</option>
	<option value="1955">1955</option>
	<option value="1954">1954</option>
	<option value="1953">1953</option>
	<option value="1952">1952</option>
	<option value="1951">1951</option>
	<option value="1950">1950</option>
	<option value="1949">1949</option>
	<option value="1948">1948</option>
	<option value="1947">1947</option>
	<option value="1946">1946</option>
	<option value="1945">1945</option>
	<option value="1944">1944</option>
	<option value="1943">1943</option>
	<option value="1942">1942</option>
	<option value="1941">1941</option>
	<option value="1940">1940</option>
	<option value="1939">1939</option>
	<option value="1938">1938</option>
	<option value="1937">1937</option>
	<option value="1936">1936</option>
	<option value="1935">1935</option>
	<option value="1934">1934</option>
	<option value="1933">1933</option>
	<option value="1932">1932</option>
	<option value="1931">1931</option>
	<option value="1930">1930</option>
	<option value="1929">1929</option>
	<option value="1928">1928</option>
	<option value="1927">1927</option>
	<option value="1926">1926</option>
	<option value="1925">1925</option>
	<option value="1924">1924</option>
	<option value="1923">1923</option>
	<option value="1922">1922</option>
	<option value="1921">1921</option>
	<option value="1920">1920</option>
	<option value="1919">1919</option>
	<option value="1918">1918</option>
	<option value="1917">1917</option>
	<option value="1916">1916</option>
	<option value="1915">1915</option>
	<option value="1914">1914</option>
	<option value="1913">1913</option>

</select>
        <div id="lblError" style="display: none"><b>Please choose a valid date</b></div>
		<br/><br/>
		<i>Your birthday will not be given out to any third party!</i>
		</center>
            <div style="text-align:center">
                

<div style="text-align:left">Are you a boy or a girl?</div>
<div style="text-align:center;position:relative;height:250px">
    <div style="position:absolute;left:50%;margin-left:-175px">
        <label for="MaleBtn"><img src="/images/Accounts/boy.png" id="ctl00_cphRoblox_SelectGenderPane_BoyThumbnail" style="cursor:pointer"/><br/></label>
        <input id="MaleBtn" type="radio" name="ctl00$cphRoblox$SelectGenderPane$Gender" value="MaleBtn"/><label for="MaleBtn">Boy</label>
    </div>
    <div style="position:absolute;left:50%;margin-left:25px">
        <label for="FemaleBtn"><img src="/images/Accounts/girl.png" id="ctl00_cphRoblox_SelectGenderPane_GirlThumbnail" style="cursor:pointer"/><br/></label>
        <input id="FemaleBtn" type="radio" name="ctl00$cphRoblox$SelectGenderPane$Gender" value="FemaleBtn"/><label for="FemaleBtn">Girl</label>
    </div>
</div>
                <div id="genderError" style="color:Red;font-weight:bold;margin-bottom:10px;display:none">Please select a gender</div>
		        <a id="btnSignup2" class="MediumButton" onclick="CheckDateAndGender()">Continue</a>
		        <input type="submit" name="ctl00$cphRoblox$btnHidden" value="" id="ctl00_cphRoblox_btnHidden" style="display: none">
		    </div>
		<br/>
	</div>
</div>
	<div id="Sidebars" style="margin-top: 10px;">
	<div class="StandardBoxHeader" style="width: 230px;"><span>Already Registered?</span></div>
		<div class="StandardBox" style="width:230px;">
			<p>If you just need to login, go to the <a id="ctl00_cphRoblox_HyperLinkLogin" href="/Login/NewAge.aspx">Login</a> page.</p>
			<p>If you have already registered but you still need to download the game installer, go directly to <a id="ctl00_cphRoblox_HyperLinkDownload" href="/install/">download</a>.</p>
		</div>
		<div class="StandardBoxHeader" style="width: 230px;"><span>Hey Parents!</span></div>
		<div class="StandardBox" style="width:230px;">
			<p>Are you creating an account for your young child?</p>
			<p>If so, you should select "Under 13"</p>
			<p>ROBLOX has a variety of online safety features that help to prevent your child from disclosing personal information to other players. As a parent, you will have the option to override them later.</p>
			<p><a id="ctl00_cphRoblox_ParentsInfo" href="/Parents.aspx">More information for ROBLOX parents</a></p>
			<p><a id="ctl00_cphRoblox_hlTruste" href="http://www.truste.org/ivalidate.php?url=www.roblox.com&amp;sealid=105" style="display:inline-block;width:140px;"><img src="http:/<?=$_SERVER['SERVER_NAME']?>/images/truste_seal_kids.gif" alt="" style="border-width:0px;"/></a></p>
			<p><a target="_blank" href="https://www.bbb.org/online/consumer/cks.aspx?id=109111915116750"><img title="Click to verify BBB accreditation and to see a BBB report." border="0" src="/images/bbbsealh1US.gif" alt="Click to verify BBB accreditation and to see a BBB report."/></a>
                        </p>
		</div>
	</div><br clear="all"/>

    <script type="text/javascript">
        function CheckDateAndGender() {
            $('#lblError').attr('style', 'display: none');
            var year = parseInt($('#lstYears option:selected').val());
            var month = parseInt($('#lstMonths option:selected').val());
            var day = parseInt($('#lstDays option:selected').val());

            var isValid = true;
            if (year <= 0 || month <= 0 || day <= 0 || day > new Date(year, month, 0).getDate()) {
                $('#lblError').attr('style', 'color: Red;');
                isValid = false;
            }

                if ($('#MaleBtn:checked').length == 0 && $('#FemaleBtn:checked').length == 0) {
                    $('#genderError').show();
                    isValid = false;
                }
                else {
                    $('#genderError').hide();
                }

            if (isValid) {
                $('#ctl00_cphRoblox_btnHidden').click();
            }
        }
    </script>


                <div style="clear:both"></div>
            </div>
        </div></div> 
        </div>
        
               

<div id="Footer" style="display:block;">
    <div class="FooterNav">
        <a id="ctl00_cphFooter_rbxFooter_PrivacyHyperLink" ref="footer-privacy" href="/info/Privacy.aspx"><b>Privacy Policy</b></a>
        <span>&nbsp;|&nbsp;</span> 
        <a id="ctl00_cphFooter_rbxFooter_AdvertiseHyperLink" ref="footer-advertise" href="http://corp.roblox.com/advertise-on-roblox">Advertise with Us</a>
        <span>&nbsp;|&nbsp;</span> 
        <a id="ctl00_cphFooter_rbxFooter_PressHyperLink" ref="footer-press" href="http://corp.roblox.com/roblox-press">Press</a>
        <span>&nbsp;|&nbsp;</span> 
        <a id="ctl00_cphFooter_rbxFooter_ContactHyperLink" ref="footer-contact" href="http://corp.roblox.com/contact-us">Contact Us</a>
        <span>&nbsp;|&nbsp;</span> 
        <a id="ctl00_cphFooter_rbxFooter_AboutHyperLink" ref="footer-about" href="http://corp.roblox.com/">About Us</a>
        <span>&nbsp;|&nbsp;</span> 
        <a id="ctl00_cphFooter_rbxFooter_BlogHyperLink" ref="footer-blog" href="http://blog.roblox.com/">Blog</a>
        <span>&nbsp;|&nbsp;</span> 
        <a id="ctl00_cphFooter_rbxFooter_JobsHyperLink" ref="footer-jobs" href="http://corp.roblox.com/jobs">Jobs</a>
        <span>&nbsp;|&nbsp;</span> 
        <a id="ctl00_cphFooter_rbxFooter_ParentsHyperLink" ref="footer-parents" href="/Parents.aspx">Parents</a> 
        
    </div>
    <div class="FooterNav">
        <div id="ctl00_cphFooter_rbxFooter_SEOGenreLinks" class="SEOGenreLinks"><a href="/all-games" title="All Games Games" ref="footer-genres">All Games</a>&nbsp;|&nbsp;<a href="/building-games" title="Building Games" ref="footer-genres">Building</a>&nbsp;|&nbsp;<a href="/horror-games" title="Horror Games" ref="footer-genres">Horror</a>&nbsp;|&nbsp;<a href="/town-and-city-games" title="Town and City Games" ref="footer-genres">Town and City</a>&nbsp;|&nbsp;<a href="/military-games" title="Military Games" ref="footer-genres">Military</a>&nbsp;|&nbsp;<a href="/comedy-games" title="Comedy Games" ref="footer-genres">Comedy</a>&nbsp;|&nbsp;<a href="/medieval-games" title="Medieval Games" ref="footer-genres">Medieval</a>&nbsp;|&nbsp;<a href="/adventure-games" title="Adventure Games" ref="footer-genres">Adventure</a>&nbsp;|&nbsp;<a href="/sci-fi-games" title="Sci-Fi Games" ref="footer-genres">Sci-Fi</a>&nbsp;|&nbsp;<a href="/naval-games" title="Naval Games" ref="footer-genres">Naval</a>&nbsp;|&nbsp;<a href="/fps-games" title="FPS Games" ref="footer-genres">FPS</a>&nbsp;|&nbsp;<a href="/rpg-games" title="RPG Games" ref="footer-genres">RPG</a>&nbsp;|&nbsp;<a href="/sports-games" title="Sports Games" ref="footer-genres">Sports</a>&nbsp;|&nbsp;<a href="/fighting-games" title="Fighting Games" ref="footer-genres">Fighting</a>&nbsp;|&nbsp;<a href="/western-games" title="Western Games" ref="footer-genres">Western</a></div>
    </div>
    <div class="legal">
        <div class="left">
            <a href="http://www.truste.org/ivalidate.php?url=www.roblox.com&amp;sealid=105" id="ctl00_cphFooter_rbxFooter_TrusteeSeal" ref="parents-truste"><img height="60" width="44" src="https://s3.amazonaws.com/images.roblox.com/c54428d4c073c3afa9348e76007733b6.png" border="0" id="TrusteLogo" alt="Truste"/></a>
        </div>
        <div class="right">
            

<p class="Legalese">
    ROBLOX, "Online Building Toy", characters, logos, names, and all related indicia are trademarks of <a href="http://corp.roblox.com/" ref="footer-smallabout">ROBLOX Corporation</a>, ©2013. Patents pending.
    ROBLOX is not sponsored, authorized or endorsed by any producer of plastic building bricks, including The LEGO Group, MEGA Brands, and K'Nex, and no resemblance to the products of these companies is intended. Use of this site signifies your acceptance of the <a href="/info/terms-of-service" ref="footer-terms">Terms and Conditions</a>.
</p>

        </div>
        <div class="clear"></div>
    </div>
</div> 

        
        
    </div>
    <div id="ChatContainer" style="width:100%;position:fixed;bottom:0;z-index:1000">
        
    </div>

    

        
        <script src="https://ssl.google-analytics.com/urchin.js" type="text/javascript"></script>
        <script type="text/javascript">
            _uacct = "UA-486632-1";
            _udn = "roblox.com";
            _uccn = "rbx_campaign";
            _ucmd = "rbx_medium";
            _ucsr = "rbx_source";
            urchinTracker();
            __utmSetVar('Visitor/Anonymous');
            </script>
    

    

<script type="text/javascript">
//<![CDATA[
$(function() {{ }});if(typeof __utmSetVar !== 'undefined'){ __utmSetVar(''); }if(typeof __utmSetVar !== 'undefined'){ __utmSetVar('Roblox_Default_Top_728x90'); };(function() {var fn = function() {Roblox.Client._skip = "/Install/Unsupported.aspx";Sys.Application.remove_load(fn);};Sys.Application.add_load(fn);})();;(function() {var fn = function() {RobloxLaunch._LaunchGamePage = "/Install/Download.aspx";Sys.Application.remove_load(fn);};Sys.Application.add_load(fn);})();$(function() {{ }});//]]>
</script>
</form>
    
    
    
    
<div id="pluginObjDiv" style="height: 0px; width:1px;visibility:hidden;"></div>
<iframe id="downloadInstallerIFrame" style="visibility:hidden; height: 0px; width:1px;position:absolute;"></iframe>


<div id="InstallationInstructions" class="modalPopup blueAndWhite" style="display: none;overflow:hidden;">
    <a id="CancelButton2" onclick="return Roblox.Client._onCancel();" class="ImageButton closeBtnCircle_35h ABCloseCircle"></a>
    <div style="padding-bottom: 10px; text-align:center;">
        
    </div>
</div>

<div id="IEMetroInstructions" class="ConfirmationModal unifiedModal" style="padding:5px;display:none">
    <div class="Title">Switch to Desktop Mode to Play Games</div>
    <div style="background:#fff;padding:10px">
        <img src="https://s3.amazonaws.com/images.roblox.com/d54d2aaebc53f81707286632ff0dfe41.jpg" alt="Switch to Desktop Mode"/>
        <div style="margin:15px 0 5px">
            <a class="ImageButton btn-neutral btn-large roblox-ok" onclick="$.modal.close()">OK<span class="btn-text">OK</span></a> 
        </div>
    </div>
</div>

<script type="text/javascript" language="javascript">
    Roblox.Client.runInstallABTest = function () {
        /**/
    }
</script>

<div id="PlaceLauncherStatusPanel" style="display: none; width: 300px;">
    <div class="modalPopup blueAndWhite PlaceLauncherModal" style="min-height: 160px;">
        <div id="Spinner" class="Spinner" style="margin:0 1em 1em 0; padding:20px 0px;">
            <img src="https://s3.amazonaws.com/images.roblox.com/e998fb4c03e8c2e30792f2f3436e9416.gif" alt="Progress"/></div>
        <div id="status" style="min-height:40px; text-align:center; margin: 5px 20px;">
            <div id="Starting" class="PlaceLauncherStatus MadStatusStarting" style="display:block">
                Starting Roblox...
                </div>
            <div id="Waiting" class="PlaceLauncherStatus MadStatusField">Connecting to Players...</div>
            <div id="StatusBackBuffer" class="PlaceLauncherStatus PlaceLauncherStatusBackBuffer MadStatusBackBuffer"></div>
        </div>
       <div style="text-align: center; margin-top: 1em;">
            <input type="button" class="Button CancelPlaceLauncherButton translate" value="Cancel"/>
        </div>
    </div>
</div>


<div id="videoPrerollPanel" style="display:none;">
    <div id="videoPrerollTitleDiv">
        Gameplay sponsored by:
    </div>
    <div id="videoPrerollMainDiv"></div>
    <div id="videoPrerollCompanionAd"></div>
    <div id="videoPrerollLoadingDiv">
        Loading <span id="videoPrerollLoadingPercent">0%</span> - <span id="videoPrerollMadStatus" class="MadStatusField">Starting game...</span><span id="videoPrerollMadStatusBackBuffer" class="MadStatusBackBuffer"></span>
        <div id="videoPrerollLoadingBar">
            <div id="videoPrerollLoadingBarCompleted">
            </div>
        </div>
    </div>
    <div id="videoPrerollJoinBC">
        <span>Want to get rid of these ads?</span>
        <a href="/Upgrades/BuildersClubMemberships.aspx?ref=vpr" target="_blank" id="videoPrerollJoinBCButton"></a>
    </div>
</div>
<script type="text/javascript">
    Roblox.VideoPreRoll.showVideoPreRoll = false;
    Roblox.VideoPreRoll.loadingBarMaxTime = 30000;
    Roblox.VideoPreRoll.videoOptions.key = "robloxcorporation";
    Roblox.VideoPreRoll.videoOptions.categories = "NonBC,IsLoggedIn,AgeUnknown,GenderUnknown";
    
    Roblox.VideoPreRoll.videoOptions.id = "games";
    
    Roblox.VideoPreRoll.videoLoadingTimeout = 11000;
    Roblox.VideoPreRoll.videoPlayingTimeout = 23000;
    
    
    Roblox.VideoPreRoll.videoLogNote = "NotWindows";
    Roblox.VideoPreRoll.logsEnabled = true;
    Roblox.VideoPreRoll.excludedPlaceIds = "32373412,88419564";
    
    Roblox.VideoPreRoll.specificAdOnPlacePageEnabled = true;
    Roblox.VideoPreRoll.specificAdOnPlacePageId = 77436063;
    Roblox.VideoPreRoll.specificAdOnPlacePageCategory = "stooges";
    
    $(Roblox.VideoPreRoll.checkEligibility());
</script>


<div id="GuestModePrompt_BoyGirl" class="Revised GuestModePromptModal" style="display:none;">
    <div class="simplemodal-close">
        <a class="ImageButton closeBtnCircle_20h" style="cursor: pointer; margin-left:455px;top:7px; position:absolute;"></a>
    </div>
    <div class="Title">
        Choose Your Character
    </div>
    <div style="min-height: 275px; background-color: white;">
        <div style="clear:both; height:25px;"></div>

        <div style="text-align: center;">
            <div class="VisitButtonsGuestCharacter VisitButtonBoyGuest" style="float:left; margin-left:45px;"></div>
            <div class="VisitButtonsGuestCharacter VisitButtonGirlGuest" style="float:right; margin-right:45px;"></div>
        </div>
        <div style="clear:both; height:25px;"></div>
        <div class="RevisedFooter">
            <div style="width:200px;margin:10px auto 0 auto;">
                <a href="#" onclick="redirectPlaceLauncherToRegister(); return false;"><div class="RevisedCharacterSelectSignup"></div></a>
                <a class="HaveAccount" href="#" onclick="redirectPlaceLauncherToLogin();return false;">I have an account</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
	RobloxLaunch.secureAuthenticate = true;
</script>
     
        <script type="text/javascript">
        adroll_adv_id = "SUG2BASJ2ZDT3EM44FOGOG";
        adroll_pix_id = "LFNDR3AF4BCD5KDK67TTLO";
        (function() {
            var oldonload = window.onload;
            window.onload = function() {
                __adroll_loaded = true;
                var scr = document.createElement("script");
                var host = (("https:" == document.location.protocol) ? "https://s.adroll.com/" : "http://a.adroll.com/");
                scr.setAttribute('async', 'true');
                scr.type = "text/javascript";
                scr.src = host + "/j/roundtrip.js";
                ((document.getElementsByTagName('head') || [null])[0] ||
                    document.getElementsByTagName('script')[0].parentNode).appendChild(scr);
                if (oldonload) {oldonload()}};
        }());
    </script>
    <!-- Segment Pixel - Roblox RT Pixel - DO NOT MODIFY -->
    <img src="https://secure.adnxs.com/seg?add=550800&amp;t=2" width="1" height="1"/>
    <!-- End of Segment Pixel -->

</body>                
</html>
<!--
     FILE ARCHIVED ON 18:50:50 Feb 26, 2013 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 06:14:36 Dec 23, 2018.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
-->
<!--
playback timings (ms):
  LoadShardBlock: 44.865 (3)
  esindex: 0.006
  captures_list: 190.812
  CDXLines.iter: 12.461 (3)
  PetaboxLoader3.datanode: 55.444 (4)
  exclusion.robots: 0.334
  exclusion.robots.policy: 0.319
  RedisCDXSource: 126.154
  PetaboxLoader3.resolve: 25.058
  load_resource: 41.546
-->