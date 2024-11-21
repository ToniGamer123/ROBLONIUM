<?php 
  require_once $_SERVER['DOCUMENT_ROOT']."/Hexine/api/core_functions.php";
  requireLogin();
  
  if(isset($_GET['GameType']) && $_GET['GameType'] == 'Build') { $GameType = 'PersonalServers'; }
  else { $GameType = 'Play'; }

  ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,requiresActiveX=true"/>
  <title>
    Roblonium Games - Do stuff
  </title>
  <script type="text/javascript">
    function checkForRedirect()
    {
      // If it's a page load, and there's a hash in the URL, we've definitely loaded the wrong data
      // is because hashes dont get sent to the server in requests from the browser.
      // Thus, if we see someone trying to load a page with a hash in it on pageload (external link coming
      // to our site, or copy paste), we should immediately refresh the page with the server friendly url
      var loc = window.location.href;
      var indexOfHash = loc.indexOf('#!');
      if (indexOfHash > 0) {
        var newLoc = loc.substr(indexOfHash + 2);
        window.location.replace(newLoc);
      }
    }
    checkForRedirect();
    </script>
  <meta name="fragment" content="!">
  <!--This tag informs search engine that this is an Ajax page et that there is a dynamic content to index (see the Ajax section).-->
  <link rel="icon" type="image/vnd.microsoft.icon" href="/roblonium_c5x_icon.ico"/>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta http-equiv="Content-Language" content="en-us"/>
  <meta name="author" content="ROBLONIUM"/>
  <meta id="ctl00_metadescription" name="description" content="Welcome to the games page!"/>
  <meta id="ctl00_metakeywords" name="keywords" content="Hexine Roblonium revival"/>
  <?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/ScriptGlobals.php";?>
  <link rel="alternate" type="application/rss+xml" title="Roblonium Games - Do stuff" href="/games?feed=rss"/>
  </head>
  <body roblox-js-usercheckcontrollerenabled="True">
    <script type="text/javascript">Roblox.XsrfToken.setToken('');</script>
    <script type="text/javascript">
      if (top.location != self.location) {
          top.location = self.location.href;
      }
    </script>
    <style type="text/css">
      #LeftGutterAdContainer 
      {
      margin-left: -900px;
      width: 400px;
      }
      #RightGutterAdContainer
      {
      margin-left: 500px;
      width: 400px;
      }
      #Footer
      {
      position: relative;
      }                        
      div#Footer 
      {
      width: 970px;
      margin: 0 auto;
      }
    </style>
    <!--[if IE 7]>
    <style>
      #LeftGutterAdContainer 
      {
      margin-left: -898px;
      width: 400px;
      }
      #RightGutterAdContainer
      {
      margin-left: 498px;
      width: 400px;
      }
    </style>
    <![endif]-->
    <form name="aspnetForm" method="post" action="/games" id="aspnetForm">
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
            
            RobloxEventManager._idleInterval = 450000;
            RobloxEventManager.registerCookieStoreEvent('rbx_evt_initial_install_start');
            RobloxEventManager.registerCookieStoreEvent('rbx_evt_ftp');
            RobloxEventManager.registerCookieStoreEvent('rbx_evt_initial_install_success');
            RobloxEventManager.registerCookieStoreEvent('rbx_evt_fmp');
            RobloxEventManager.startMonitor();
            
        
        });
      </script>
      <script type="text/javascript">Roblox.FixedUI.gutterAdsEnabled=true;</script>
      <div id="LeftGutterAdContainer" class="">
        <span id="3537303437393230" class="GPTAd lgutter" data-js-adtype="gptAd">
          <script type="text/javascript">
            googletag.cmd.push(function () {
                googletag.display("3537303437393230");
            });
          </script>
        </span>
        <a class="BadAdButton" href="/Ads/ReportAd.aspx" title="click to report an offensive ad">[ report ]</a>
      </div>
      <div id="RightGutterAdContainer" class="">
        <span id="3632323139303131" class="GPTAd gutter" data-js-adtype="gptAd">
          <script type="text/javascript">
            googletag.cmd.push(function () {
                googletag.display("3632323139303131");
            });
          </script>
        </span>
      </div>
      <?php include $_SERVER["DOCUMENT_ROOT"] . '/Banner' ;?>
      <div id="BodyWrapper">
        <div id="RepositionBody">
          <div id="Body" style="width:970px;">
            <div id="PlaceTemplateWrapper" style="display: none">
              <div id="PlaceTemplate" style="float: left;">
                <div class="GameItem">
                  <div class="AlwaysShown">
                    <a class="roblox-thumbnail"></a>
                    <div class="GameName" style="font-weight: bold; font-size: 12px; overflow: hidden;
                      white-space: nowrap;">
                      <a class="GameClick roblox-game-url"></a>
                    </div>
                    <span class="roblox-player-count" style="float: left; font-size: 12px; font-weight: bold">
                    </span><span class="online-player roblox-player-text" style="float: left"></span>
                    <div class="GenreIcons" style="float: right;">
                      <img class="GenreIcon" alt="GENREICONALT">
                      <img class="GearIcon" alt="GEARICONALT">
                    </div>
                    <div class="CreatorName" style="display: none; clear: both; float: left">
                      by <a class="roblox-creator-url"></a>
                    </div>
                    <div class="Price" style="display: none; float: right">
                      <span class="robux-price"></span>
                    </div>
                  </div>
                  <div class="HoverShown">
                    <div class="StatsPlayed">
                      Played <span class="roblox-plays-count"></span>
                    </div>
                    <div class="StatsFavorited">
                      Favorited <span class="roblox-fav-count"></span>
                    </div>
                    <div class="StatsUpdated">
                      Updated <span class="roblox-last-update"></span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="GamesPageHeader" style="font-size: 40px; color: #363636; font-weight: bold; letter-spacing: -2px; margin-left: 9px;">Games</div>
            <div id="ctl00_cphRoblox_MenuColumn" class="Column1e NewMenuLook">
              <div class="StandardBox" id="GamesLeftColumn">
                <div id="Sort" class="GameFilter">
                  <div>
                    Sorted By:
                  </div>
                  <ul>
                    <?php if($GameType=='PersonalServers') $disabled = "DisabledFilter"; else $disabled = ""; ?>
                    <li><a class="GamesSort SelectedSort" sort="Relevance" href="/?m=Relevance">Relevance</a></li>
                    <li><a class="GamesSort <?php echo $disabled; ?>" sort="TopGrossing" href="/?m=TopGrossing">Top Earning</a></li>
                    <li><a class="GamesSort <?php echo $disabled; ?>" sort="MostPopular" href="/?m=MostPopular">Popular</a></li>
                    <li><a class="GamesSort <?php echo $disabled; ?>" sort="TopFavorites" href="/?m=TopFavorites">Most Favorited</a></li>
                    <li><a class="GamesSort <?php echo $disabled; ?>" sort="Featured" href="/?m=Featured">Featured</a></li>
                    <?php echo $disabled; ?>
                  </ul>
                </div>
                <div id="Timespan" class="GameFilter" style="margin-top: 20px; display: none;">
                  <div>
                    Time:
                  </div>
                  <ul>
                    <li><a class="GamesFilter SelectedFilter" filter="Now" href="/?t=Now">Now</a></li>
                    <li><a class="GamesFilter " filter="PastDay" href="/?t=PastDay">Past Day</a></li>
                    <li><a class="GamesFilter " filter="PastWeek" href="/?t=PastWeek">Past Week</a></li>
                    <li><a class="GamesFilter " filter="AllTime" href="/?t=AllTime">All Time</a></li>
                  </ul>
                </div>
                <div id="Genres" class="GameFilter" style="margin-top: 20px;">
                  <div>
                    Genres:
                  </div>
                  <ul>
                    <li><a class="GamesGenre SelectedGenre" genre="all" href="/all-games" genresinfotext="" title="All Games">All</a></li>
                    <li><a class="GamesGenre " genre="building" href="/building-games" genresinfotext="" title="Building Games">Building</a></li>
                    <li><a class="GamesGenre " genre="horror" href="/horror-games" genresinfotext="" title="Horror Games">Horror</a></li>
                    <li><a class="GamesGenre " genre="town-and-city" href="/town-and-city-games" genresinfotext="" title="Town and City Games">Town and City</a></li>
                    <li><a class="GamesGenre " genre="military" href="/military-games" genresinfotext="" title="Military Games">Military</a></li>
                    <li><a class="GamesGenre " genre="comedy" href="/comedy-games" genresinfotext="" title="Comedy Games">Comedy</a></li>
                    <li><a class="GamesGenre " genre="medieval" href="/medieval-games" genresinfotext="" title="Medieval Games">Medieval</a></li>
                    <li><a class="GamesGenre " genre="adventure" href="/adventure-games" genresinfotext="" title="Adventure Games">Adventure</a></li>
                    <li><a class="GamesGenre " genre="sci-fi" href="/sci-fi-games" genresinfotext="" title="Sci-Fi Games">Sci-Fi</a></li>
                    <li><a class="GamesGenre " genre="naval" href="/naval-games" genresinfotext="" title="Naval Games">Naval</a></li>
                    <li><a class="GamesGenre " genre="fps" href="/fps-games" genresinfotext="">FPS</a></li>
                    <li><a class="GamesGenre " genre="rpg" href="/rpg-games" genresinfotext="">RPG</a></li>
                    <li><a class="GamesGenre " genre="sports" href="/sports-games" genresinfotext="" title="Sports Games">Sports</a></li>
                    <li><a class="GamesGenre " genre="fighting" href="/fighting-games" genresinfotext="" title="Fighting Games">Fighting</a></li>
                    <li><a class="GamesGenre " genre="western" href="/western-games" genresinfotext="" title="Western Games">Western</a></li>
                  </ul>
                </div>
              </div>
              <!-- Filters / genres -->
            </div>
            <div class="Column2e">
              <div id="PlayTabs" class="tab-container" style="float: left;">
                <!-- DO NOT PUT NEW LINES IN BETWEEN TABS... This will add a 4px margin because of the display: inline-block -->
                <div id="PlayGamesTab" class="tab<?php if($GameType=='Play') echo " active"; ?> GamesType" type="Play">
                  <span>
                    <a href="?GameType=Play" onclick="setTimeout(() => { checkForRedirect(); }, 100);">
                      <div>
                        Games
                      </div>
                    </a>
                  </span>
                </div>
                <div id="ctl00_cphRoblox_PlayPersonalServersTab" class="tab<?php if($GameType=='PersonalServers') echo " active"; ?> GamesType" type="Build">
                  <span>
                    <a href="?GameType=Build">
                      <div>
                        Personal Servers
                      </div>
                    </a>
                  </span>
                </div>
              </div>
              <div style="position: relative; float: right;">
                <input id="searchbox" class="translate" type="text" name="search" value="Search" style="color: #888; height: 20px;" onkeypress="if (event.keyCode == 13) { return Roblox.GamesDisplayShared.search(); }">
                <div class="SearchIconButton" onclick="Roblox.GamesDisplayShared.search()"></div>
              </div>
              <div class="divider-top tab-content" style="float: left; width: 790px; padding: 20px 0px 5px 0px;
                margin-bottom: 10px; display: block">
                <div id="Games">
                  <!--div id="BCOnlyPlaces">
                    <span class="header">
                      <div class="BCHat" style="position: relative; vertical-align: middle">
                      </div>
                      <div id="BCOnlyPlacesTitle">
                        Builders Club Games
                      </div>
                    </span>
                    <div class="content">
                      <div id="BCOnlyGamesContentPrevNavButton" class="arrow left">
                      </div>
                      <div id="BCOnlyGamesContent">
                        <div>
                        </div>
                      </div>
                      <div id="BCOnlyGamesContentNextNavButton" class="arrow right">
                      </div>
                    </div>
                  </div-->
                  <div id="GamePageAdDiv" style="width: 300px; height: 275px; float: right; display: inline">
                    <span id="31313435393032" class="GPTAd rectangle" data-js-adtype="gptAd">
                    </span>
                    <a class="BadAdButton" href="/web/20130731152815/http://www.roblox.com/Ads/ReportAd.aspx" title="click to report an offensive ad">[ report ]</a>
                  </div>
                  <div roblox-bc-games-clear="" class="clear"></div>
                  <div id="ShowBCOnlyGamesAlignmentDiv" style="margin-top: 10px; padding-top: 35px;"> <!-- class="divider-top" -->
                    <div id="GamesContent" style="width: 680px; display: inline; left: 55px; position: relative">
                      <div>
                      </div>
                    </div>
                  </div>
                  <div id="GamesContentPager" style="text-align: center; padding-bottom: 20px; padding-top: 10px; color: rgb(136, 136, 136); font-size: 14px; clear: both; visibility: visible;">
                    <span id="GamesContentPrevNavButton" class="pager previous disabled" style="position: relative;
                      top: 9px;"></span><span style="margin: 0 5px;"><span id="GamesContentCurrPageNum">1</span>
                    of <span id="GamesContentTotalPageNums">1</span></span><span id="GamesContentNextNavButton" class="pager next" style="position: relative; top: 9px;"></span>
                  </div>
                </div>
                <div id="GenreDescriptionPanel">
                  <span id="GenreDescriptionPanelGenresInfoText">
                  </span>
                </div>
              </div>
            </div>
            <br style="clear: both">
            <div style="clear:both"></div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
      if("False" === "True") {
          Roblox.FixedUI.gutterAdsEnabled = true;
      }
      
      var defaultParamData = eval({"FilterString":"Now","GameTypeString":"Play","GenreString":"all","MinBCLevelString":"None","PageNumString":"1","PageSizeString":"1","SortString":"Relevance"});
      var defaultSeedData = eval(<?php echo file_get_contents("https://sitetest1.roblonium.com/GetGames.ashx?GameType=".$GameType); ?>);
      
      var pageSize = 12;
      
      var defaultBCOnlyParamData = eval(null);
      var defaultBCOnlySeedData = eval({"TotalPages" : "0","Count" : "0","Items" : []});
      var BCOnlyPageSize = 2;
      
      if (true){ CreateGamesDisplay.prototype._defaultSort = 'Relevance'; }
      
      var GamesDisplay = new CreateGamesDisplay();
      var BCOnlyGamesDisplay = null;
      if (false){ BCOnlyGamesDisplay = new CreateGamesDisplay(); }
      
      $(function(){ GamesPageInit(); });
    </script>
    <br style="clear: both"/>
    <div style="clear:both"></div>
    <?php include $_SERVER["DOCUMENT_ROOT"] . "/Footer";?>
    </div>
    <?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Post-Footer.php";?>
  </body>
</html>