<?php
require_once $_SERVER['DOCUMENT_ROOT']."/global.php";

if(isset($_GET['ID'])){ $id = $_GET['ID']; }
elseif(isset($_GET['id'])){ $id = $_GET['id']; }
else{ die(header("Location: /Games.aspx")); }

if(!filter_var($id, FILTER_VALIDATE_INT)){ die(header("Location: /RobloniumDefaultErrorPage.aspx?code=400")); }
  
$placeinfo = getMarketplaceInfo($id);

if(!$placeinfo){ die(header("Location: /RobloniumDefaultErrorPage.aspx?code=404")); }
if($placeinfo->AssetTypeId != 9){ die(header("Location: /".replaceSpecialChars($placeinfo->Name)."-item?id=".$id)); }

$ThumbnailUrl = "/Game/Tools/ThumbnailAsset.ashx?aid=".$placeinfo->AssetId."&fmt=png&wd=420&ht=420";
$CreatorInfo = getUserInfoFromUid($placeinfo->CreatorId);
$Creator = $CreatorInfo->Name;

$page_config["ScriptIncludes"] = 
[
	$page_config["DefaultScriptBundles"]["master"],
	"DataPager.js",
	"PlaceProductPromotion.js",
	"GamePass.js",
	"VotingPanel.js",
	"jquery.dotdotdot-1.5.7-packed.js",
	"PrivateGameInstances/PrivateGameInstances.js",
	"PrivateGameInstances/GetOrUseAccessCodeModal.js",
	"widgets/Favorites.js",
	"NewGamePage.js",
	"modules/Widgets/AvatarImage.js",
	"LaunchApp.js",
	"fileUploadUnsupported.js",
	"jquery.simplemodal-1.3.5.js",
	"GenericModal.js",
	"ItemPurchase.js",
	"modules/Widgets/ItemImage.js",
	"CommentsPane.js",
	"SuperSafePrivacyIndicator.js",
	"GenericConfirmation.js",
	//"EventTracker.js",
	$page_config["DefaultScriptBundles"]["clientinstaller"],
	$page_config["DefaultScriptBundles"]["videopreroll"],
	$page_config["DefaultScriptBundles"]["placelauncher"]
]
;
$page_config["CSSIncludes"] = 
[
	//$page_config["DefaultStyleBundles"]["main"],
	"roblonium.css",
	"roblonium1.css",
	"CSS/Widgets/Flyouts.css",
	"CSS/Pages/VotingPanel.css",
	"CSS/Pages/PrivateGameInstances/PrivateGameInstances.css",
	//"CSS/PartialViews/Navigation.css",
	"CSS/Pages/GamePage.css",
	"CSS/Widgets/Favorites.css",
	"CSS/Pages/Thumbnails/AssetMedia.css"
]
;
$page_config["IncludeScriptGlobals"] = true;

include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Top.php";?>
<div id="ItemContainer" class="PlaceItemContainer new-game-page">
<script type="text/javascript">
            Roblox.Resources = {};
            Roblox.Resources.PlaceProductPromotion = {
                //<sl:translate>
                anErrorOccurred: 'An error occurred, please try again.'
                , youhaveAdded: "You have added "
                , toYourGame: " to your game, "
                , youhaveRemoved: "You have removed "
                , fromYourGame: " from your game, "
                , ok: "OK"
                , success: "Success!"
                , error: "Error"
                , sorryWeCouldnt: "Sorry, we couldn't remove the item from your game. Please try again."
                , notForSale: "This item is not for sale."
                , rent: "Rent"
                //<sl:translate>
            };
        </script>
<div class="Ads_WideSkyscraper" style="float:right">
<div style="width: 160px">
<span id="3232353539363436" class="GPTAd skyscraper" data-js-adtype="gptAd">
<script type="text/javascript">
            googletag.cmd.push(function () {
                googletag.display("3232353539363436");
            });
        </script>
</span>
<div class="ad-annotations " style="width: 160px">
<span class="">
</span>
<a class="" href="" title=""></a>
</div>
</div></div>
<div id="Item" class="place-item redesign body">
<div class="item-header">
<h1 class="notranslate"><?=htmlspecialchars($placeinfo->Name)?></h1>
<span class="place-access">
<span class="PlaceAccessIndicator">
<span id="ctl00_cphRoblox_NewGamePageControl_PlaceAccessIndicator_FriendsOnlyLocked" style="display: none">
<a class="iLocked tooltip" original-title="Friends Only"></a><span class="invisible">&nbsp;Friends-only</span>
</span>
<span id="ctl00_cphRoblox_NewGamePageControl_PlaceAccessIndicator_FriendsOnlyUnlocked" style="display: none">
<a class="iUnlocked tooltip" original-title="Friends Only - You are friends"></a><span class="invisible">&nbsp;Friends-only: You are friends</span>
</span>
<span id="ctl00_cphRoblox_NewGamePageControl_PlaceAccessIndicator_ExpiredSelf" style="display: none">
<a class="iLocked tooltip" original-title="Locked"></a>
<span class="invisible">&nbsp;Your Outrageous Builders Club, Turbo Builders Club, or Builders Club membership has expired, so you can
only have one open place. Your places will not be deleted, and you can <a id="ctl00_cphRoblox_NewGamePageControl_PlaceAccessIndicator_RBXLDownloadLink">download the RBXL here.</a> To unlock all of your places,
please <a href="/upgrades/BuildersClubMemberships.aspx">re-order Outrageous Builders Club, Turbo Builders Club, or Builders
Club </a>.<br></span>
</span>
<span id="ctl00_cphRoblox_NewGamePageControl_PlaceAccessIndicator_ExpiredOther" style="display: none">
<a class="iLocked tooltip" original-title="Locked"></a>
<span class="invisible">This place is locked because the creator's <a href="/upgrades/BuildersClubMemberships.aspx">Builders
Club / Turbo Builders Club / Outrageous Builders Club </a>has expired.
</span>
</span>
</span>
<a class="CopyLockedIcon tooltip" original-title="Copylocked"></a>
<!--a class="GenreGearIcon tooltip" original-title="Same Genre Gear Only"></a-->
</span>
</div>
<div class="left-column" style="border-right:none">
<div class="item-media">
<script type="text/javascript">
    if (typeof Roblox === "undefined") {
        Roblox = {};
    }
    if (typeof Roblox.FileUploadUnsupported === "undefined") {
        Roblox.FileUploadUnsupported = {};
    }
    Roblox.FileUploadUnsupported.Resources = {
        //<sl:translate>
        notSupported: " This device does not support file upload."
        //</sl:translate>
    };
    if (typeof Roblox.CreateSetPanel === "undefined") {
        Roblox.CreateSetPanel = {};
    }
    Roblox.CreateSetPanel.Resources = {
        //<sl:translate>
        youMaySelect: "You may select a maximum of ",
        elementsInList: " elements from this list!"
        //</sl:translate>
    };
</script>
<style type="text/css">
        .youTubeVideoOverlay 
        {
            position:absolute;
            top:0px;
            left:0px;
            width: 120px;
            height: 70px;
            z-index:5;
            cursor: pointer;
            background: white;
            opacity: 0.0;
            filter: alpha(opacity=0.0);
        }
        .SelectedYouTubeGalleryIcon
        {
            top: -3px; 
            margin: 2px !important;  /** !important makes sure we override the margin in divSmallGalleryItem **/ 
            border: 3px solid black; /** If you change this border size, you need to change the margin, as well as the top value **/
        }
        .RemoveYouTubeGalleryImage
        {
            cursor: pointer; 
            position: absolute; 
            top: -10px; 
            right: -10px; 
            z-index: 6; /** Make sure this is higher than z-index of youTubeVideoOverlay **/
        }
        .divSmallGalleryItem
        {
            height: 70px; 
            width: 120px; 
            float: left;
            position:relative;
            margin: 5px;
        }
        #divSmallGalleryItemBox
        {
            width: 500px; 
            height:100px;
            position:relative;
            overflow-x: auto; 
            overflow-y: hidden;
        }
        #divSmallGalleryScrollContainer
        {
            margin: 0px auto; 
            margin-top: 5px; 
            margin-bottom: 5px; /** Allows for scroll bar **/
            display: inline-block; 
            width: 0px;
            *display:inline;
            *zoom:1;
        }
        .smallGalleryThumbItem
        {
            float: left; 
        }
        </style>
<div style="margin: 0px auto; width: 500px">
<div id="ItemThumbnail" style="height:280px; width: 500px">
<div id="bigGalleryThumbItem" style="position: absolute;">
<a id="ctl00_cphRoblox_NewGamePageControl_RichMediaThumbDisplay_rbxGalleryAssetThumbnail_rbxAssetImage" class=" notranslate" title="<?=htmlspecialchars($placeinfo->Name) ?? "Missing Title"?>" onclick="if (!window.__cfRLUnblockHandlers) return false; __doPostBack('ctl00$cphRoblox$NewGamePageControl$RichMediaThumbDisplay$rbxGalleryAssetThumbnail$rbxAssetImage','')" style="display:inline-block;height:280px;width:500px;cursor:pointer;"><img src="/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=<?=$placeinfo->AssetId?>" height="280" width="500" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="<?=htmlspecialchars($placeinfo->Name) ?? "Missing Title"?>" class=" notranslate"></a>
</div>
</div>
</div>
</div>
<div class="actions ">
<div class="favorite-button-container" title="Add to favorites">
<a>
<div class="favorite-button" data-toggle-url="/favorite/toggle" data-assetid="<?=$placeinfo->AssetId?>">
</div>
</a>
</div>
<script type="text/javascript">
    //<sl:translate>
    Roblox.Resources.FavoriteButton = {
        AddToFavorites: "Add to favorites",
        RemoveFromFavorites: "Remove from favorites"
    };
    //</sl:translate>

    Roblox.FavoriteButton = Roblox.FavoriteButton || {};
    var isCurrentlyFavorited = false;
    Roblox.FavoriteButton.initialTooltip = isCurrentlyFavorited ? Roblox.Resources.FavoriteButton.RemoveFromFavorites : Roblox.Resources.FavoriteButton.AddToFavorites;
</script>
<div class="voting"><input name="__RequestVerificationToken" type="hidden" value="mMAKnDgcDplTxLzFuy80FxJ0R-ufv59SJ1mtx-oyMgibl5KJQe8xN7K6rjbwD4BtbXXMy25ZEzQsUW1_JilRVM33Qu9Uny6j0g4mIY_D8AqSxYlTBowdxTukXvqiIbe2T6NpihHsB7I-X_rvgcNWFcpABlE1">
<div class="voting-panel body" data-asset-id="<?=$placeinfo->AssetId?>" data-total-up-votes="<?=$placeinfo->UpVotes ?? 0?>" data-total-down-votes="<?=$placeinfo->DownVotes ?? 0?>">
<div class="loading"></div>
<div class="users-vote">
<div class="upvote "></div>
<div class="downvote  divider-left"></div>
</div>
<div class="vote-summary">
<div class="voting-details">
<div class="total-upvotes divider-right">
<div class="tiny-thumbs-up"></div><span>Thumbs up: <?=$placeinfo->UpVotes ?? 0?></span>
</div>
<div class="total-downvotes">
<span>Thumbs down: <?=$placeinfo->DownVotes ?? 0?></span><span class="tiny-thumbs-down"></span>
</div>
 <div class="clear"></div>
</div>
<div class="visual-container">
<div class="background votes"></div>
<div class="percent" style="width: 0%;"></div>
<div class="clear"></div>
</div>
</div>
<div class="clear"></div>
</div>
<script type="text/javascript">
    $(function () {
        Roblox.Voting.Initialize();

        Roblox.Voting.Resources = {
            //<sl:translate>
            emailVerifiedTitle: "Verify Your Email",
            emailVerifiedMessage: "You must verify your email before you can vote. You can verify your email on the <a href='/my/account?confirmemail=1'>Account</a> page.",
            
            playGameTitle: "Play Game",
            playGameMessage: "You must play the game before you can vote on it.",
            
            useModelTitle: "Use Model",
            useModelMessage: "You must use this model before you can vote on it.",

            installPluginTitle: "Install Plugin",
            installPluginMessage: "You must install this plugin before you can vote on it.",
            
            buyGamePassTitle: "Buy Game Pass",
            buyGamePassMessage: "You must own this game pass before you can vote on it.",
            
            accept: "Verify",
            decline: "Cancel"
            //<sl:translate>
        };
    });
</script></div>
<div class="clear"></div>
<span class="ReportAbuse">
<div id="ctl00_cphRoblox_NewGamePageControl_AbuseReportButton_AbuseReportPanel" class="ReportAbuse">
<span class="AbuseIcon"><a id="ctl00_cphRoblox_NewGamePageControl_AbuseReportButton_ReportAbuseIconHyperLink" href=""><img src="/images/abuse.png" alt="Report Abuse" style="border-width:0px;"></a></span>
<span class="AbuseButton"><a id="ctl00_cphRoblox_NewGamePageControl_AbuseReportButton_ReportAbuseTextHyperLink" href="">Report Abuse</a></span>
</div>
</span>
</div>
<div class="description notranslate">
<div id="DescriptionText" class="invisible"><?=htmlspecialchars($placeinfo->Description) ?? "This item has no description."?></div>
<pre id="PlaceDescription" class="body"><?=htmlspecialchars($placeinfo->Description) ?? "This item has no description."?></pre>
</div>
<div class="facebook-like">
</div>
</div>
<div class="right-column">
<div class="builder divider-bottom">
<div class="builder-image">
<div>
<img src="/Thumbs/Avatar.ashx?x=70&y=70&userId=<?=$placeinfo->CreatorId?>" height="70" width="70" style="margin:0px -8px;"></div>
</div>
<div class="builder-name"><span>Builder: </span><span class="notranslate"><a href="/User.aspx?ID=<?=$placeinfo->CreatorId?>" class="tooltip" original-title="<?=$Creator?>"><?=$Creator?></a></span></div>
<div class="builder-joined"><span class="stat-label">Joined: </span><span class="stat"><?=formatDate($CreatorInfo->Joined)?></span></div>
<div class="clear"></div>
</div>
<div class="buttons">
<div id="VisitButtonContainer">
<div class="VisitButtonsLeft Centered">
<div id="ctl00_cphRoblox_NewGamePageControl_VisitButtons_MultiplayerVisitButton" class="VisitButton VisitButtonPlay" placeid="<?=$placeinfo->AssetId?>">
<a class="btn-medium btn-primary">Play</a>
</div>
</div>
<script type="text/javascript">
        var play_placeId = 1;
        function redirectPlaceLauncherToLogin() {
            location.href = "/login/default.aspx?ReturnUrl=" + encodeURIComponent("/PlaceItem.aspx?seoname=When-the-Ballzes-Come-V1-29-FIXED-ORIGINAL&id=<?=$placeinfo->AssetId?>");
        }
        function redirectPlaceLauncherToRegister() {
            location.href = "/login/NewAge.aspx?ReturnUrl=" + encodeURIComponent("/PlaceItem.aspx?seoname=When-the-Ballzes-Come-V1-29-FIXED-ORIGINAL&id=<?=$placeinfo->AssetId?>");
        }
        function fireEventAction(action) {
            RobloxEventManager.triggerEvent('rbx_evt_popup_action', { action: action });
        }
    </script>
<div id="BCOnlyModal" class="modalPopup unifiedModal smallModal" style="display:none;">
<div style="margin:4px 0px;">
<span>Builders Club Only</span>
</div>
<div class="simplemodal-close">
<a class="ImageButton closeBtnCircle_20h" style="margin-left:400px;"></a>
</div>
<div class="unifiedModalContent" style="padding-top:5px; margin-bottom: 3px; margin-left: 3px; margin-right: 3px">
<div class="ImageContainer">
<img class="GenericModalImage BCModalImage" alt="Builder's Club" src="https://images.rbxcdn.com/ae345c0d59b00329758518edc104d573.png">
<div id="BCMessageDiv" class="BCMessage Message">
Builders Club membership is required to play in this place.
</div>
</div>
<div style="clear:both;"></div>
<div style="clear:both;"></div>
<div class="GenericModalButtonContainer" style="padding-bottom: 13px">
<div style="text-align:center">
<a id="BClink" href="/Upgrades/BuildersClubMemberships.aspx" class="btn-primary btn-large">Upgrade Now</a>
</div>
<div style="clear:both;"></div>
</div>
<div style="clear:both;"></div>
</div>
</div>
<script type="text/javascript">
    function showBCOnlyModal(modalId) {
        var modalProperties = { overlayClose: true, escClose: true, opacity: 80, overlayCss: { backgroundColor: "#000" } };
        if (typeof modalId === "undefined")
            $("#BCOnlyModal").modal(modalProperties);
        else
            $("#" + modalId).modal(modalProperties);
    }
    $(document).ready(function () {
        $('#VOID').click(function () {
            showBCOnlyModal("BCOnlyModal");
            return false;
        });
    });
</script>
<div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
<div class="Title"></div>
<div class="GenericModalBody">
<div>
<div class="ImageContainer roblox-item-image" data-image-size="small" data-no-overlays="" data-no-click="">
<img class="GenericModalImage" alt="generic image">
</div>
<div class="Message"></div>
<div style="clear:both"></div>
</div>
<div class="GenericModalButtonContainer">
<a class="ImageButton btn-neutral btn-large roblox-ok">OK<span class="btn-text">OK</span></a>
</div>
</div>
</div>
</div>
</div>
<div class="details ">
<div class="statistics">
<div><span class="stat-label">Created:</span><span class="stat"><?=formatDate($placeinfo->Created)?></span></div>
<div><span class="stat-label">Updated:</span><span class="stat"><?=formatDate($placeinfo->Updated)?></span></div>
<div><span class="stat-label">Favorited:</span><span class="stat"><?=$placeinfo->Favorited ?? 0?></span></div>
<div><span class="stat-label">Visited:</span><span class="stat"><?=$placeinfo->Visited ?? 0?></span></div>
<div><span class="stat-label">Max Players:</span><span class="stat"><?=$placeinfo->MaxPlayers ?? 10?></span></div>
<div>
</div>
</div>
<span class="stat-label">Genres:</span><span class="stat"><a href="">Classic</a></span>
<div id="ctl00_cphRoblox_NewGamePageControl_Div1" class="allowed-gear">
<div class="stat-label">Allowed Gear Types:</div><div> <!--div class="category-icon genre-only tooltip" original-title="Town and City Gear Only"></div>
<div class="category-icon tooltip MusicalInstrument" original-title="Musical Instrument"></div>
<div class="category-icon tooltip PersonalTransport" original-title="Personal Transport"></div-->
<div class="category-icon no-gear tooltip" original-title="No Gear Allowed"></div>
<div class="clear"></div></div>
</div>
<div class="configure divider-top invisible">
<div class="form-label">Options</div>
<div><a href="/My/Item.aspx?id=<?=$placeinfo->AssetId?>">Configure this Place</a></div>
<div><a href="/My/NewUserAd.aspx?targetID=<?=$placeinfo->AssetId?>">Advertise this Place</a></div>
<div><a href="/My/NewBadge.aspx?targetID=<?=$placeinfo->AssetId?>">Create a Badge for this Place</a></div>
<div><a href="/My/ContentBuilder.aspx?ContentType=34&amp;PlaceID=<?=$placeinfo->AssetId?>">Create a Game Pass</a></div>
<div>
<a href="/universes/configure?id=66461562">Configure this Game</a>
</div>
<div><a href="/places/<?=$placeinfo->AssetId?>/stats">Developer Stats</a></div>
</div>
<div class="clear"></div>
</div>
</div>
</div>
<script type="text/javascript">
    $(function () {
        Roblox.Widgets.AvatarImage.load($('.builder-image .roblox-avatar-image'));

        var text = $("#DescriptionText").text(),
                                maxChars = 800,
                                placeDesc = $("#PlaceDescription");

        //<sl:translate>
        var SeeMoreText = "See More";
        var SeeLessText = "See Less";
        //</sl:translate>

        function descShowMore() {
            placeDesc.html(text + '<div><a class="DescriptionSeeMore">'+SeeLessText+'</a></div>');
            $(".DescriptionSeeMore").click(descShowLess);
        };
        function descShowLess() {
            placeDesc.html(text.slice(0, maxChars) + '... ' + '<a class="DescriptionSeeMore">' + SeeMoreText + '</a>');
            $(".DescriptionSeeMore").click(descShowMore);
        };
        if (text.length > maxChars) {
            descShowLess();
        }

        $('.builder-name a').text(fitStringToWidthSafeText($('.builder-name a').text(), 130));
    });
</script>
<div class="clear"></div>
<div>
<div>
<input name="__RequestVerificationToken" type="hidden" value="FkIY_e32pRFZj09vfAg23uuZ35KDjTzQv2y56h3w-e6LnXp9plU2uGUtTn-zFWG2oWYElFYvtf0vYXOP7CYFKgyrhPzG_kj2I9JDXGB7FS2pcEv_KcuYlyadAQAWhO4COHgQa2wY2JXsMxsbfR0fX1jY34Y1">
<div class="GamePassesDisplayContainer ">
<div class="divider-bottom"></div>
<h3>Passes For This Game</h3>
<div id="GamePassesItemContainer"></div>
<div id="GamePassesPagerContainer"></div>
</div>
<div class="GamePasses PlacePagePagersItem template">
<div class="roblox-item-image" data-image-size="small" data-item-id=""></div>
<div class="InfoContainer">
<div class="NameDiv"><a class="ItemURL"></a></div>
<div class="SalesDiv"><span class="label">Sales: </span><span class="TotalSales"></span></div>
<div class="prices-div">
<input type="radio" group="currency" name="currency" checked="" class="robux"><span class="Price robux"></span><br>
<input type="radio" group="currency" name="currency" class="tickets"><span class="Price tickets"></span>
<span class="Price robux-text"></span>
</div>
<div class="btn-primary btn-small PurchaseButton" data-item-id="" data-item-name="" data-product-id="" data-expected-price="" data-asset-type="Game Pass" data-expected-currency="" data-bc-requirement="" data-expected-seller-id="40265333" data-seller-name="<?=$placeinfo->Creator?>">
Buy
<span class="btn-text">Buy</span>
</div>
<div class="UserOwns">You own this item.</div>
</div>
<div style="clear:both;"></div>
</div>
<script type="text/javascript">
    $(function () {
        Roblox.GamePass.Resources = {
            noneforSale: 'None of your game passes are currently for sale.'
            , anErrorOccurred: 'An error occurred, please try again.'
        };
        
        Roblox.GamePassJSData = { };
        Roblox.GamePassJSData.PlaceID = <?=$placeinfo->AssetId?>;
        Roblox.GamePassJSData.TotalPasses = 3;
        Roblox.GamePassJSData.ResultsPerPage = 3;

        Roblox.GamePassesPager = new DataPager(
            3,
            3, 
            'GamePassesItemContainer', 
            'GamePassesPagerContainer',
            Roblox.GamePass.getGamePasses,
            Roblox.GamePass.formatGamePassHTML, 
            Roblox.GamePass.FormatGamePassCallback,
            {
                Paging_PageNumbers_AreLinks: false
            });
        
            var purchaseConfirmationCallback = function(obj) {
                var originalContainer = $('.PurchaseButton[data-item-id=' + obj.AssetID + ']').parent();
                originalContainer.find('.PurchaseButton').hide();
                originalContainer.find('.UserOwns').show();
            };
            Roblox.GamePassItemPurchase = new Roblox.ItemPurchase(purchaseConfirmationCallback);
    });
    
</script>
<div id="ctl00_cphRoblox_BadgeStatsContainer" class="BadgeStats" style="margin-top: 10px;">
<div class="divider-bottom"></div>
<h3>Badges</h3>
<div id="BadgeStats">
<span id="ctl00_cphRoblox_PlaceBadgeStats_BadgeRepeater_ctl01_lblEmpty">
</span><table class="BadgeTable">
<tbody><tr class="BadgeRow" style="height:40px">
<td class="BadgeEmptyTableColumn" style="text-align:center;">No Badges Offered</td>
</tr>

</tbody></table>
<div id="BadgesShowContainer" style="display:none"><a id="BadgesShowMore" class="btn-control btn-control-small">See More</a></div>
<script type="text/javascript">
        $(function () {
            var maxRows = 4,
                maxHeight = "400px",
                table = $("#BadgeStats .BadgeTable"),
                tableRows = $("#BadgeStats .BadgeTable tr"),
                showMoreLink = $("#BadgesShowMore"),
                collapsedHeight = 0;

            badgesShowMore = function () {
                //table.removeClass("BadgeTableCollapsed");
                //table.css('max-height', "");
                tableRows.show();
                showMoreLink.text("See Less");
                showMoreLink.unbind('click');
                showMoreLink.bind('click', badgesShowLess);
            }
            badgesShowLess = function () {
                //table.addClass("BadgeTableCollapsed");
                //table.css('max-height', collapsedHeight + "px");
                tableRows.hide();

                for (var i = 0; i < maxRows && i < tableRows.length; i++)
                    collapsedHeight += tableRows.slice(i, i + 1).show()

                showMoreLink.text("See More");
                showMoreLink.unbind('click');
                showMoreLink.bind('click', badgesShowMore);
            }
            for (var i = 0; i < maxRows && i < tableRows.length; i++)
                collapsedHeight += tableRows.slice(i, i + 1).height();

            if (tableRows.length > maxRows || table.height() > 400) {
                $("#BadgesShowContainer").show();
                badgesShowLess();
            }
        });
</script>
</div>
</div>
<div class="ItemPurchaseAjaxContainer">
<div id="ItemPurchaseAjaxData" data-authenticateduser-isnull="False" data-user-balance-robux="8" data-user-balance-tickets="10" data-user-bc="0" data-continueshopping-url="" data-imageurl="" data-alerturl="http://images.rbxcdn.com/cbb24e0c0f1fb97381a065bd1e056fcb.png" data-builderscluburl="http://images.rbxcdn.com/ae345c0d59b00329758518edc104d573.png"></div>
<div id="ProcessingView" style="display:none">
<div class="ProcessingModalBody">
<p style="margin:0px"><img src="https://images.rbxcdn.com/ec4e85b0c4396cf753a06fade0a8d8af.gif" alt="Processing..."></p>
<p style="margin:7px 0px">Processing Transaction</p>
</div>
</div>
<script type="text/javascript">
        //<sl:translate>
        Roblox.ItemPurchase.strings = {
            insufficientFundsTitle : "Insufficient Funds",
            insufficientFundsText : "You need {0} more to purchase this item.",
            cancelText : "Cancel",
            okText : "OK",
            buyText : "Buy",
            buyTextLower : "buy",
            tradeCurrencyText : "Trade Currency",
            priceChangeTitle : "Item Price Has Changed",
            priceChangeText : "While you were shopping, the price of this item changed from {0} to {1}.",
            buyNowText : "Buy Now",
            buyAccessText: "Buy Access",
            buildersClubOnlyTitle : "{0} Only",
            buildersClubOnlyText : "You need {0} to buy this item!",
            buyItemTitle : "Buy Item",
            buyItemText : "Would you like to {0} {5}the {1} {2} from {3} for {4}?",
            balanceText : "Your balance after this transaction will be {0}",
            freeText : "Free",
            purchaseCompleteTitle : "Purchase Complete!",
            purchaseCompleteText : "You have successfully {0} {5}the {1} {2} from {3} for {4}.",
            continueShoppingText : "Return to Place",
            customizeCharacterText : "Customize Character",
            orText : "or",
            rentText : "rent",
            accessText: "access to "
        }
    //</sl:translate>
    </script>
</div>
<div style="width: 720px; color: #000000; margin-bottom: 10px;" class="redesign">
<a name="tabRegion">&nbsp;</a>
<div id="ctl00_cphRoblox_TabbedInfo" class="tab_white_31h_container" style="visibility:hidden;">
<div id="ctl00_cphRoblox_TabbedInfo_header">
<span id="__tab_ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign">
<h3>Recommendations</h3>
</span><span id="__tab_ctl00_cphRoblox_TabbedInfo_GamesTab">
<h3>Games</h3>
</span><span id="__tab_ctl00_cphRoblox_TabbedInfo_CommentaryTab">
<h3>Commentary</h3>
</span>
</div><div id="ctl00_cphRoblox_TabbedInfo_body">
<div id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign" style="display:none;visibility:hidden;">
<div class="AssetRecommenderContainer">
<table id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign_AssetRecommenderRedesign_dlAssets" cellspacing="0" align="Center" border="0" style="height:175px;width:720px;border-collapse:collapse;">
<tbody><tr>
<td>
<div class="WideAspectRatio" style="width: 140px;overflow: hidden;margin:auto;" visible="False" data-se="recommended-items-0">
<div class="AssetThumbnail">
<a id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign_AssetRecommenderRedesign_dlAssets_ctl00_AssetThumbnailHyperLink" class=" notranslate" title="Angry birds tag!" href="/Angry-birds-tag-place?id=64355520" style="display:inline-block;height:100px;width:160px;cursor:pointer;"><img src="https://t1.rbxcdn.com/76effd5e1bc216b182db6c8976bc1595" height="100" width="160" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Angry birds tag!" class=" notranslate"></a>
</div>
<div class="AssetDetails">
<div class="AssetName noTranslate">
<a id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign_AssetRecommenderRedesign_dlAssets_ctl00_AssetNameHyperLinkPortrait" href="/Angry-birds-tag-place?id=64355520">Angry birds tag!</a>
</div>
<div class="AssetCreator">
<span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign_AssetRecommenderRedesign_dlAssets_ctl00_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=617197">jaredvald…</a></span>
</div>
</div>
</div>
</td><td>
<div class="WideAspectRatio" style="width: 140px;overflow: hidden;margin:auto;" visible="False" data-se="recommended-items-1">
<div class="AssetThumbnail">
<a id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign_AssetRecommenderRedesign_dlAssets_ctl01_AssetThumbnailHyperLink" class=" notranslate" title="ROBLOX Dodgeball [1 KO = 5 POINTS]" href="/ROBLOX-Dodgeball-1-KO-5-POINTS-place?id=18874219" style="display:inline-block;height:100px;width:160px;cursor:pointer;"><img src="https://t3.rbxcdn.com/ab277ba83046133bf945b7cf98c86710" height="100" width="160" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="ROBLOX Dodgeball [1 KO = 5 POINTS]" class=" notranslate"></a>
</div>
<div class="AssetDetails">
<div class="AssetName noTranslate">
<a id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign_AssetRecommenderRedesign_dlAssets_ctl01_AssetNameHyperLinkPortrait" href="/ROBLOX-Dodgeball-1-KO-5-POINTS-place?id=18874219">ROBLOX Dodgeball [1 KO = 5 P…</a>
</div>
<div class="AssetCreator">
<span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign_AssetRecommenderRedesign_dlAssets_ctl01_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=123247">alexnewt…</a></span>
</div>
</div>
</div>
</td><td>
<div class="WideAspectRatio" style="width: 140px;overflow: hidden;margin:auto;" visible="False" data-se="recommended-items-2">
<div class="AssetThumbnail">
<a id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign_AssetRecommenderRedesign_dlAssets_ctl02_AssetThumbnailHyperLink" class=" notranslate" title="✈Base wars! ▄︻̷̿┻̿═━一 [Fixes]" href="/Base-wars-一-Fixes-place?id=18164449" style="display:inline-block;height:100px;width:160px;cursor:pointer;"><img src="https://t1.rbxcdn.com/37270d72a4108c510f94472d99890a0c" height="100" width="160" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="✈Base wars! ▄︻̷̿┻̿═━一 [Fixes]" class=" notranslate"></a>
</div>
<div class="AssetDetails">
<div class="AssetName noTranslate">
<a id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign_AssetRecommenderRedesign_dlAssets_ctl02_AssetNameHyperLinkPortrait" href="/Base-wars-%e4%b8%80-Fixes-place?id=18164449">✈Base wars! ▄︻̷̿┻̿═━一 [Fixes]</a>
</div>
<div class="AssetCreator">
<span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign_AssetRecommenderRedesign_dlAssets_ctl02_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=5239900">d4rk886</a></span>
</div>
</div>
</div>
</td><td>
<div class="WideAspectRatio" style="width: 140px;overflow: hidden;margin:auto;" visible="False" data-se="recommended-items-3">
<div class="AssetThumbnail">
<a id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign_AssetRecommenderRedesign_dlAssets_ctl03_AssetThumbnailHyperLink" class=" notranslate" title="Work at a Pizza Place" href="/Work-at-a-Pizza-Place-place?id=192800" style="display:inline-block;height:100px;width:160px;cursor:pointer;"><img src="https://t3.rbxcdn.com/1d558505c488e0176a04c792f8cb3bb5" height="100" width="160" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Work at a Pizza Place" class=" notranslate"></a>
</div>
<div class="AssetDetails">
<div class="AssetName noTranslate">
<a id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign_AssetRecommenderRedesign_dlAssets_ctl03_AssetNameHyperLinkPortrait" href="/Work-at-a-Pizza-Place-place?id=192800">Work at a Pizza Place</a>
</div>
<div class="AssetCreator">
<span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_TabbedInfo_RecommendationsTabPageRedesign_AssetRecommenderRedesign_dlAssets_ctl03_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=82471">Dued1</a></span>
</div>
</div>
</div>
</td>
</tr>
</tbody></table>
</div>
<script type="text/javascript">
    $(function () {
        var itemNames = $('.WideAspectRatio .AssetDetails .AssetName a');
        $.each(itemNames, function (index) {
            var elem = $(itemNames[index]);
            elem.html(fitStringToWidthSafe(elem.html(), 200));
        });
        var userNames = $('.WideAspectRatio .AssetDetails .AssetCreator .Detail a');
        $.each(userNames, function (index) {
            var elem = $(userNames[index]);
            elem.html(fitStringToWidthSafe(elem.html(), 70));
        });
    });
</script>
</div><div id="ctl00_cphRoblox_TabbedInfo_GamesTab" style="display:none;visibility:hidden;">
<div id="ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesList_RunningGamesUpdatePanel">
<div id="ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesList_LoadGamesButtonDiv" style="padding:5px; text-align:center;"><a id="ctl00_cphRoblox_TabbedInfo_GamesTab_RunningGamesList_LoadGamesButton" class="btn-primary btn-medium roblox-running-games-btn" href="javascript:__doPostBack('ctl00$cphRoblox$TabbedInfo$GamesTab$RunningGamesList$LoadGamesButton','')"><span>Load Games</span></a></div>
</div>
<script type="text/javascript">
    if (typeof Roblox === "undefined") {
        Roblox = {};
    }
    if (typeof Roblox.RunningGamesList === "undefined") {
        Roblox.RunningGamesList = {};
    }

    Roblox.RunningGamesList.Load = function() {
        eval($('.roblox-running-games-btn').attr('href'));
    };

</script>
</div><div id="ctl00_cphRoblox_TabbedInfo_CommentaryTab" style="display:none;visibility:hidden;">
<div id="ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_CommentsUpdatePanel">
<div id="AjaxCommentsPaneData"></div>
<div class="AjaxCommentsContainer">
<div id="ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_Div1" class="PostACommentContainer divider-bottom">
<div class="Commenter">
<div class="Avatar">
<a id="ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_AvatarImage" class=" notranslate" title="<?=$placeinfo->Creator?>" href="/User.aspx?ID=59896360" style="display:inline-block;height:100px;width:100px;cursor:pointer;"><img src="https://t5.rbxcdn.com/3afad12ffc6f3c595632b2c83cfe3b73" height="100" width="100" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="<?=$placeinfo->Creator?>" class=" notranslate"></a>
</div>
</div>
<div class="centered-error-container">
<span id="commentPaneErrorMessage" class="status-error" style="display:none;"> </span>
</div>
<div id="ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_PostAComment" class="PostAComment">
<div class="CommentText">
<textarea name="ctl00$cphRoblox$TabbedInfo$CommentaryTab$CommentsPane$NewCommentTextBox" id="ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_NewCommentTextBox" class="MultilineTextBox hint-text text" rows="5" style="margin-bottom: 0px">Write a comment!</textarea>
<div class="Buttons">
<div id="ctl00_cphRoblox_TabbedInfo_CommentaryTab_CommentsPane_BlueCommentBtn" class="BlueCommentBtn btn-neutral btn-small roblox-comment-button">Comment<span class="btn-text">Comment</span></div>
<p id="CharsRemaining" class="hint-text"></p>
<div style="clear:both;"></div>
</div>
</div>
</div>
<div style="clear:both;"></div>
</div>
<div class="Comments" data-asset-id="<?=$placeinfo->AssetId?>"></div>
<div class="CommentsItemTemplate">
 <div class="Comment text">
<div class="Commenter">
<div class="Avatar" data-user-id="%CommentAuthorID" data-image-size="small">
</div>
</div>
<div class="PostContainer">
<div class="Post">
<div class="Audit">
<span class="ByLine footnote"><div class="UserOwnsAsset" title="User has this item" alt="User has this item" style="display:none;"></div>Posted %CommentCreated ago by <a href="/user.aspx?id=%CommentAuthorID">%CommentAuthor</a></span>
<div class="ReportAbuse">
<span class="AbuseButton">
<a href="">Report Abuse</a>
</span>
</div>
<div style="clear:both;"></div>
</div>
<div class="Content">
%CommentContent
</div>
<div id="Actions" class="Actions">
<a data-comment-id="%CommentID" class="DeleteCommentButton">Delete Comment</a>
</div>
</div>
<div class="PostBottom"></div>
</div>
<div style="clear:both;"></div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
    Roblox.CommentsPane.Resources = {
        //<sl:translate>
        defaultMessage:         'Write a comment!',
        noCommentsFound:		'No comments found.',
        moreComments:			'More comments',
        sorrySomethingWentWrong:'Sorry, something went wrong.',
        charactersRemaining:	' characters remaining',
        emailVerifiedABTitle:	'Verify Your Email',
        emailVerifiedABMessage: "You must verify your email before you can comment. You can verify your email on the <a href='/my/account?confirmemail=1'>Account</a> page.",
        linksNotAllowedTitle:   'Links Not Allowed',
        linksNotAllowedMessage: 'Comments should be about the item or place on which you are commenting. Links are not permitted.',
        accept:					'Verify',
        decline:				'Cancel',
        tooManyCharacters:		'Too many characters!',
        tooManyNewlines:		'Too many newlines!'
        //</sl:translate>
       };

       Roblox.CommentsPane.Limits =
       [	{ limit: '10'
            , character: "\n"
            , message: Roblox.CommentsPane.Resources.tooManyNewlines
            }
       ,	{ limit: '200'
            , character: undefined
            , message: Roblox.CommentsPane.Resources.tooManyCharacters
            }
       ];

       Roblox.CommentsPane.FilterIsEnabled = true;
       Roblox.CommentsPane.FilterRegex = "(([a-zA-Z0-9-]+\\.[a-zA-Z]{2,4}[:\\#/\?]+)|([a-zA-Z0-9]\\.[a-zA-Z0-9-]+\\.[a-zA-Z]{2,4}))";
       Roblox.CommentsPane.FilterCleanExistingComments = false;

    Roblox.CommentsPane.initialize();
</script>
</div>
</div>
</div>
<script type="text/javascript">
                        var commentsLoaded = false;
                        var gamesLoaded = false;
                        function isActivatingTab(sender, tabName) {
                            return $(sender._tabs[sender._activeTabIndex]._header).text().trim() == tabName;
                        }
                        function LoadComments(sender, eventargs) {
                            if (isActivatingTab(sender, "Commentary") && !commentsLoaded) {
                                Roblox.CommentsPane.getComments(0);
                                if (Roblox.SuperSafePrivacyMode != undefined) {
                                    Roblox.SuperSafePrivacyMode.initModals();
                                }
                                commentsLoaded = true;
                            }
                            if (isActivatingTab(sender, "Games") && !gamesLoaded) {
                                Roblox.RunningGamesList.Load();
                                gamesLoaded = true;
                            }
                        }
                    </script>
</div>
</div>
<div class="clear"></div>
</div>
</div>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Bottom.php";?>