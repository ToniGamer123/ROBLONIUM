<?php 
include_once $_SERVER["DOCUMENT_ROOT"] . '/global.php'; 
requireLogin();
$page_config["CSSIncludes"] = [ ];
$page_config["ScriptIncludes"] = [ "Home/Home.js" ];
include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Top.php";
?>
<div id="HomeContainer" class="home-container" 
  data-facebook-share="/facebook/share-character" 
  data-update-status-url="/home/updatestatus">
  <h1>Hello, <span class="notranslate"><?=SESSION['username']?></span>!</h1>
  <div class="left-column">
    <div class="left-column-boxes user-avatar-container no-top-border">
      <div id="UserAvatar" class="thumbnail-holder"  data-3d-thumbs-enabled data-url="/thumbnail/user-avatar?userId=51505194&amp;thumbnailFormatId=124&amp;width=210&amp;height=210" style="width:210px; height:210px;">
        <div class="roblox-avatar-image image-medium" data-user-id="<?=SESSION['userid']?>" data-image-size="custom" data-image-size-x="210" data-image-size-y="210" data-no-click="true" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="<?=SESSION['username']?>"></div>
      </div>
      <div id="UserInfo" class="text">
        <!-- Top banner alerts moved down here -->
        <br clear="all" />
        <br class="rbx2hide" />
        <style>
          .BC_Text
          {   
          width: 180px;
          font: bold 10px Arial; 
          color:Green; 
          text-align:center; 
          }
          .BC_Text a, .BC_Text a:hover
          {   
          text-decoration: none;
          }
          .BC_Text a:hover
          {
          color:#49b745;
          }
        </style>
        <!--div class="BC_Text" color = "green">
          <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_hlStipendBonus" class="RobuxAlertCaption tooltip-right" title="Bonus for being a BC Member the last 4 months ." href="AccountBalance.aspx">R$ Bonus: 19 (79 Daily Total)</a>
        </div-->
        <div style="margin: 0px 0px 0px 0px;width: 188px; background-color: white; padding: 5px">
          <center>
            <b><a style="color: #5470bd;" href="/my/notifications.aspx">
            0 System Notification(s)</a></b>
          </center>
        </div>
      </div>
    </div>
    <!--div class="left-column-boxes">
      <h3>Roblox News</h3>
      <div class="notranslate text news-container">
        <div id="RobloxNews">
          <div class="roblox-news-feed">
            <div class="roblox-news-feed-item">
              <a href="http://blog.roblox.com/2014/11/experience-these-six-unbelievably-good-looking-games/" ref="news-article" class="roblox-interstitial">Experience These Six Unbelievably Good Looking Games</a>
            </div>
            <div class="roblox-news-feed-item">
              <a href="http://blog.roblox.com/2014/11/zeekerss-puzzles-players-in-2-5-dimensions/" ref="news-article" class="roblox-interstitial">Zeekerss Puzzles Players in 2.5 Dimensions</a>
            </div>
          </div>
          <a href="http://blog.roblox.com" class="SeeMore roblox-interstitial">See More</a>
          <img alt="See more! " 
            src="http://images.rbxcdn.com/efe86a4cae90d4c37a5d73480dea4cb1.png" 
            class="see-more-img"/>
        </div>
      </div>
    </div-->
    <div class="left-column-boxes">
      <div>
        <h3 class="best-friends-title">My Best Friends</h3>
        <div class="edit-friends-button">
          <a  href="/friends.aspx#BestFriendsTab" class="btn-small btn-neutral">Edit</a>
        </div>
        <div class="clear"></div>
      </div>
      <div class="best-friends-container"></div>
      <script type="text/javascript">
          Roblox.require('Pagelets.BestFriends', function (bestFriends) {
              bestFriends.init('#bestFriendsContainer');
          });
      </script>
      <div class="clear"></div>
    </div>
  </div>
  <div class="middle-column">
    <div id="statusUpdateBox" class="status-update">
      <div>
        <input name="txtStatusMessage" type="text" id="txtStatusMessage" maxlength="254" class="translate text-box text-box-large status-textbox" placeholder="What are you up to?" value="Playing Roblox" />
        <span  class="btn-control btn-control-large share-button" id="shareButton">Share</span>
        <img id="loadingImage" class="status-update-image" style="display: none" alt="Sharing..." src="http://images.rbxcdn.com/ec4e85b0c4396cf753a06fade0a8d8af.gif" height="17" width="48"/>
        <div class="clear"></div>
      </div>
    </div>
    <div id="FeedificationsContainer">
    </div>
    <div id="FeedContainer">
      <h2>My Feed</h2>
      <div id="FeedPanel">
        <div class="text">
          <div class="divider-top feed-container">
            <div class="feed-image-container notranslate">
              <a href="/User.aspx?ID=54" class="feed-asset" >
                <img  class='feed-asset-image' src='/Game/Tools/Avatar.ashx?userId=54&t=1596446974' width='50' height='50'/> <!-- was 64x64 but it kept pushing the report button to a new line -->
              </a>         
            </div>
            <div class="feed-text-container text">
              <span class="notranslate">
                <a href='/User.aspx?ID=54'>pizzaboxer</a><br>
                <div class='Feedtext'>"hi this is a sample feed status; feeds do not actually work rn lol"</div>
              </span>
              <span style="display: block; padding-top: 5px; color: #AAA; font-size: 11px;">11/19/2014 at 2:01 PM</span> 
            </div>
            <div class="feed-report-abuse">
              <a href="/abusereport/feed?id=90938582&amp;redirectUrl=%2Fhome">
              <img src="http://images.rbxcdn.com/1ea8de3b0f71a67b032b67ddc1770c78.png" alt="Report abuse" class="reportAbuseButton" height="13" width="14">
              </a>
            </div>
            <div class="clear"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="right-column">
    <div id="RecentlyVisitedPlacesContainer" class="right-column-box no-top-border">
      <h3 style="padding-bottom: 9px;">Recently Played Games</h3>
      <?php if(false) { ?>
      <div id="RecentlyVisitedPlaces">
        <div id="RecentlyVisitedPlaceTemplate" class="RecentlyVisitedPlace" style="margin-bottom:10px;display:none">
          <div class="PlaceThumb"  style = "float:left;margin-right:5px;"></div>
          <div class="PlaceInfo">
            <div class="PlaceName" style="font:bold 12px Arial;"></div>
            <div class="PlayersOnline" color = "#666666" style= "font: 11px Arial;"></div>
          </div>
        </div>
      </div>
      <div id="SeeMore">
        <a href="/games?sortFilter=6" class="text-link">See More  <img alt="See more! " src="http://images.rbxcdn.com/efe86a4cae90d4c37a5d73480dea4cb1.png" class="see-more-img" /></a>
      </div>
      <script type="text/javascript">
      $(function () {
          $.getJSON("/GetRecentlyVisitedPlaces.ashx",
          {
              GameType: 'All',
              m: 'RecentlyVisited',
              p: 0,
              PageSize: 5
          }, function (data) {
              $(data.Items).each(function (i, place) {
                  var newPlace = $('#RecentlyVisitedPlaceTemplate').clone().removeAttr('id').show();
                  newPlace.find('.PlaceThumb').append('<img src="' + place.ThumbnailUrl + '" alt="' + place.Name.escapeHTML() + '" width="50px" style = "padding:2px;"/>');
                  newPlace.find('.PlaceName').append('<a href="' + place.NavigateUrl + '">' + fitStringToWidth(place.Name, 200, 'PlaceName') + ' </a>');
                  if (place.PersonalPlaceOverlay.Url != null) {
                      newPlace.find('.PlaceName').append('<img border="0" alt="Personal Server" src="/images/icons/personal_server.png" style="vertical-align:bottom;padding-left:2px;" />');
                  }
                  newPlace.find('.PlayersOnline').html(place.Stats.CurrentPlayersCount + ' players online');
                  $('#RecentlyVisitedPlaces').append(newPlace);
              });
          });
      });
      </script>
      <?php } else { ?>
      <div id="RecentlyVisitedPlaces">
        You haven't played any games recently. <a href="/games" class="text-link">Play Now  <img alt="See more! " src="http://images.rbxcdn.com/efe86a4cae90d4c37a5d73480dea4cb1.png" class="see-more-img" /></a>
      </div>
      <?php } ?>
    </div>
  </div>
  <div class="clear"></div>
  <div id="UserScreenContainer">
  </div>
<div class="clear"></div>
<div id="UserScreenContainer">
</div>
<div style="clear:both"></div>
</div>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Bottom.php";?>