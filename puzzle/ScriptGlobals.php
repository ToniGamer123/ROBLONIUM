<link rel="stylesheet" href="/roblonium.css"/>
<link rel="stylesheet" href="/roblonium1.css"/>
<!--link rel="stylesheet" href="/CSS/Base/CSS/Party.css"/-->
<!--link rel="stylesheet" href="/CSS/Themes/Holiday2013/Holiday2013.css"/-->

<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
<script type="text/javascript">window.jQuery || document.write("<script type='text/javascript' src='/js/jquery/jquery-1.7.2.min.js'><\/script>")</script>
<script src="https://ajax.aspnetcdn.com/ajax/4.0/1/WebForms.js" type="text/javascript"></script>
<script type="text/javascript">window.WebForm_PostBackOptions||document.write('<script type="text/javascript" src="/WebResource.axd?d=pynGkmcFUV13He1Qd6_TZH6GgOgBQtqMPCPjRUnhj_pzNesAXKuAdu2pj-Sq-3JDJIgwEw2&amp;t=635792847671809273"><\/script>');//]]></script>
<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/4.0/1/MicrosoftAjax.js"></script>
<script type="text/javascript">window.Sys || document.write("<script type='text/javascript' src='/js/Microsoft/MicrosoftAjax.js'><\/script>")</script>
<script src="https://ajax.aspnetcdn.com/ajax/4.0/1/MicrosoftAjaxWebForms.js" type="text/javascript"></script>
<script type="text/javascript">(window.Sys && Sys.WebForms)||document.write('<script type="text/javascript" src="/ScriptResource.axd?d=dwY9oWetJoJoVpgL6Zq8OC_Qyj6iPZ9-IhfgU1PKd92NqwesSi5IgR2kHUAQCLPPKv5dmGb59sQmqQu3G6_D3NKJrjUgXZeod0TXb9neDij-vtT2tW5WrVuyLXf9BqECFbVGd3-sTKQ_7e03iLz9XRbz2Yc1&t=72e85ccd"><\/script>');//]]></script>
<!--script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js"></script>
<script type="text/javascript">window.jQuery.ui || document.write("<script type='text/javascript' src='/js/jquery/jquery-ui-1.9.2.min.js'><\/script>")</script-->

<script type="text/javascript" src="/js/roblox.js"></script>
<script type="text/javascript" src="/js/widgets.js"></script>

<script type="text/javascript">
    var Roblox = Roblox || {};
    Roblox.EnvironmentUrls = Roblox.EnvironmentUrls || {};
Roblox.EnvironmentUrls = {
    "abtestingApiSite": "http://abtesting.<?=$_SERVER['SERVER_NAME']?>",
    "accountInformationApi": "http://accountinformation.<?=$_SERVER['SERVER_NAME']?>",
    "accountSettingsApi": "http://accountsettings.<?=$_SERVER['SERVER_NAME']?>",
    "apiGatewayUrl": "http://apis.<?=$_SERVER['SERVER_NAME']?>",
    "apiProxyUrl": "http://api.<?=$_SERVER['SERVER_NAME']?>",
    "assetDeliveryApi": "http://assetdelivery.<?=$_SERVER['SERVER_NAME']?>",
    "authApi": "http://auth.<?=$_SERVER['SERVER_NAME']?>",
    "authAppSite": "http://authsite.<?=$_SERVER['SERVER_NAME']?>",
    "avatarApi": "http://avatar.<?=$_SERVER['SERVER_NAME']?>",
    "badgesApi": "http://badges.<?=$_SERVER['SERVER_NAME']?>",
    "billingApi": "http://billing.<?=$_SERVER['SERVER_NAME']?>",
    "captchaApi": "http://captcha.<?=$_SERVER['SERVER_NAME']?>",
    "catalogApi": "http://catalog.<?=$_SERVER['SERVER_NAME']?>",
    "chatApi": "http://chat.<?=$_SERVER['SERVER_NAME']?>",
    "contactsApi": "http://contacts.<?=$_SERVER['SERVER_NAME']?>",
    "developApi": "http://develop.<?=$_SERVER['SERVER_NAME']?>",
    "domain": "<?=$_SERVER['SERVER_NAME']?>",
    "economyApi": "http://economy.<?=$_SERVER['SERVER_NAME']?>",
    "engagementPayoutsApi": "http://engagementpayouts.<?=$_SERVER['SERVER_NAME']?>",
    "followingsApi": "http://followings.<?=$_SERVER['SERVER_NAME']?>",
    "friendsApi": "http://friends.<?=$_SERVER['SERVER_NAME']?>",
    "friendsAppSite": "http://friendsite.<?=$_SERVER['SERVER_NAME']?>",
    "gamesApi": "http://games.<?=$_SERVER['SERVER_NAME']?>",
    "gameInternationalizationApi": "http://gameinternationalization.<?=$_SERVER['SERVER_NAME']?>",
    "groupsApi": "http://groups.<?=$_SERVER['SERVER_NAME']?>",
    "inventoryApi": "http://inventory.<?=$_SERVER['SERVER_NAME']?>",
    "itemConfigurationApi": "http://itemconfiguration.<?=$_SERVER['SERVER_NAME']?>",
    "localeApi": "http://locale.<?=$_SERVER['SERVER_NAME']?>",
    "localizationTablesApi": "http://localizationtables.<?=$_SERVER['SERVER_NAME']?>",
    "metricsApi": "http://metrics.<?=$_SERVER['SERVER_NAME']?>",
    "midasApi": "http://midas.<?=$_SERVER['SERVER_NAME']?>",
    "notificationApi": "http://notifications.<?=$_SERVER['SERVER_NAME']?>",
    "premiumFeaturesApi": "http://premiumfeatures.<?=$_SERVER['SERVER_NAME']?>",
    "presenceApi": "http://presence.<?=$_SERVER['SERVER_NAME']?>",
    "publishApi": "http://publish.<?=$_SERVER['SERVER_NAME']?>",
    "thumbnailsApi": "http://thumbnails.<?=$_SERVER['SERVER_NAME']?>",
    "translationRolesApi": "http://translationroles.<?=$_SERVER['SERVER_NAME']?>",
    "universalAppConfigurationApi": "http://apis.<?=$_SERVER['SERVER_NAME']?>/universal-app-configuration",
    "usersApi": "http://users.<?=$_SERVER['SERVER_NAME']?>",
    "voiceApi": "http://voice.<?=$_SERVER['SERVER_NAME']?>",
    //"websiteUrl": "http://www.<?=$_SERVER['SERVER_NAME']?>"
	"websiteUrl": ""
};

    // please keep the list in alphabetical order
    var additionalUrls = {
    }

    for (var urlName in additionalUrls) {
        Roblox.EnvironmentUrls[urlName] = additionalUrls[urlName];
    }
</script>

<script type="text/javascript">
Roblox.config.externalResources = ['/js/jquery/jquery-1.7.2.min.js','/js/json2.min.js'];
Roblox.config.paths['jQuery'] = 'https://js.rbxcdn.com/29cf397a226a92ca602cb139e9aae7d7.js';
Roblox.config.paths['Pagelets.BestFriends'] = 'https://js.rbxcdn.com/c8acaba4214074ed4ad6f8b4a9647038.js';
Roblox.config.paths['Pages.Catalog'] = 'https://js.rbxcdn.com/c8f61a230e6ad34193b40758f1499a3d.js';
Roblox.config.paths['Pages.Messages'] = 'https://js.rbxcdn.com/34e0d4ef92076cd06d46b61bd94bc8a2.js';
Roblox.config.paths['Resources.Messages'] = 'https://js.rbxcdn.com/fb9cb43a34372a004b06425a1c69c9c4.js';
//Roblox.config.paths['Widgets.AvatarImage'] = 'https://js.rbxcdn.com/a404577733d1b68e3056a8cd3f31614c.js';
Roblox.config.paths['Widgets.AvatarImage'] = '/js/Modules/Widgets/AvatarImage.js';
Roblox.config.paths['Widgets.DropdownMenu'] = 'http://js.rbxcdn.com/d83d02dd89808934b125fa21c362bcb9.js';
//Roblox.config.paths['Widgets.GroupImage'] = 'https://js.rbxcdn.com/3e692c7b60e1e28ce639184f793fdda9.js';
Roblox.config.paths['Widgets.GroupImage'] = '/js/Modules/Widgets/GroupImage.js';
Roblox.config.paths['Widgets.HierarchicalDropdown'] = 'https://js.rbxcdn.com/e8b579b8e31f8e7722a5d10900191fe7.js';
//Roblox.config.paths['Widgets.ItemImage'] = 'https://js.rbxcdn.com/6d374381f268432a466e8b8583414b49.js';
Roblox.config.paths['Widgets.ItemImage'] = '/js/Modules/Widgets/ItemImage.js';
Roblox.config.paths['Widgets.PlaceImage'] = 'https://js.rbxcdn.com/08e1942c5b0ef78773b03f02bffec494.js';
Roblox.config.paths['Widgets.Suggestions'] = 'https://js.rbxcdn.com/a63d457706dfbc230cf66a9674a1ca8b.js';
Roblox.config.paths['Widgets.SurveyModal'] = 'https://js.rbxcdn.com/d6e979598c460090eafb6d38231159f6.js';
</script>
<script type="text/javascript">
    $(function () {
        Roblox.JSErrorTracker.initialize({'internalEventListenerPixelEnabled': true});
    });
</script>
<script type="text/javascript" src="/js/ImageControl.js"></script>
<script type="text/javascript" src="/js/DataPager.js"></script>
<script type="text/javascript" src="/js/Page.js?update=true"></script>
<!--script type="text/javascript" src="/js/Mobile.js"></script-->
<script type="text/javascript" src="/js/Chat.js"></script>
<!--script type="text/javascript" src="/js/chat_v1.js"></script-->
<script type="text/javascript" src="/js/RobloxJsonCookie.js"></script>
<script type="text/javascript" src="/js/jquery-extensions.js"></script>
<script type="text/javascript" src="/js/GPTAdScript.js"></script>
<!--roblox.js bundle replacement-->
<script type="text/javascript" src="/js/jquery.json-2.2.js"></script>
<script type="text/javascript" src="/js/jquery.simplemodal-1.3.5.js"></script>
<script type="text/javascript" src="/js/jquery.tipsy.js"></script>
<script type="text/javascript" src="/js/AjaxAvatarThumbnail.js"></script>
<script type="text/javascript" src="/js/Extensions/string.js"></script>
<script type="text/javascript" src="/js/StringTruncator.min.js"></script>
<script type="text/javascript" src="/js/json2.min.js"></script>
<script type="text/javascript" src="/js/webkit.js"></script>
<script type="text/javascript" src="/js/GoogleAnalytics/GoogleAnalyticsEvents.js"></script>
<script type="text/javascript" src="/js/MasterPageUI.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/js/jquery.jsoncookie.js"></script>
<script type="text/javascript" src="/js/JSErrorTracker.js"></script>
<script type="text/javascript" src="/js/XsrfToken.js"></script>
<script type="text/javascript" src="/js/RobloxEventManager.js"></script>
<script type="text/javascript" src="/js/RobloxEventListener.js"></script>
<script type="text/javascript" src="/js/KontagentEventListener.js"></script>
<script type="text/javascript" src="/js/GoogleEventListener.js"></script>
<script type="text/javascript" src="/js/MongoEventListener.js"></script>
<script type="text/javascript" src="/js/SiteTouchEvent.js"></script>
<script type="text/javascript" src="/js/DropDownNav.js"></script>
<!--end roblox.js bundle replacement-->
<!--MyMoney.js bundle replacement-->
<script type="text/javascript" src="/js/jquery.filter_input.js"></script>
<script type="text/javascript" src="/js/flot/excanvas.min.js"></script>
<script type="text/javascript" src="/js/flot/jquery.flot.js"></script>
<script type="text/javascript" src="/js/flot/jquery.flot.time.js"></script>
<script type="text/javascript" src="/js/flot/jquery.flot.categories.js"></script>
<script type="text/javascript" src="/js/flot/FlotChart.js"></script>
<script type="text/javascript" src="/js/flot/FlotGraphing.js"></script>
<script type="text/javascript" src="/js/NumberFormatting.js"></script>
<script type="text/javascript" src="/js/MyMoney.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.address-1.5.min.js"></script>
<script type="text/javascript" src="/js/utilities/dialog.js"></script>
<script type="text/javascript" src="/js/utilities/popover.js"></script>
<script type="text/javascript" src="/js/Trade/InventoryItem.js"></script>
<script type="text/javascript" src="/js/Trade/TradeRequest.js"></script>
<script type="text/javascript" src="/js/common/deviceMeta.js"></script>
<!--end MyMoney.js bundle replacement-->
<!--My/MyItem.js bundle replacement-->
<script type="text/javascript" src="/js/My/MyItem.js"></script>
<script type="text/javascript" src="/js/PageStyleNotifications.js"></script>
<script type="text/javascript" src="/js/YouTube/RobloxYouTube.js"></script>
<!--end My/MyItem.js bundle replacement-->
<!--ClientInstaller.js bundle replacement-->
<script type="text/javascript" src="/js/EventTracker.js"></script>
<script type="text/javascript" src="/js/ClientInstaller.js"></script>
<script type="text/javascript" src="/js/InstallationInstructions.js"></script>
<script type="text/javascript" src="/js/IEMetroInstructions.js"></script>
<!--end ClientInstaller.js bundle replacement-->
<!--GameLauncher.js>
<script type="text/javascript" src="/js/GameLauncher.js"></script>
<script type="text/javascript" src="/js/GameLaunchLogger.js"></script>
<end GameLauncher.js-->
<script type="text/javascript" src="/js/RobloxCookies.js"></script>
<script type="text/javascript" src="/js/Sets/SetsPane.js"></script>
<script type="text/javascript" src="/js/ItemPurchase.js"></script>
<script type="text/javascript" src="/js/RobloxEventListener.js"></script>
<!--My/Character.js bundle replacement-->
<script type="text/javascript" src="/js/My/Character.js"></script>
<script type="text/javascript" src="/js/Outfits.js"></script>
<script type="text/javascript" src="/js/widgets/tabs.js"></script>
<script type="text/javascript" src="/js/GenericModal.js"></script>
<script type="text/javascript" src="/js/widgets/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="/js/GenericConfirmation.js"></script>
<!--end My/Character.js bundle replacement-->
<!--Avatar Customization Page-->
<script type="text/javascript" src="/js/extensions/Thumbnails.js"></script>
<script type="text/javascript" src="/js/extensions/ThreeDeeThumbnails.js"></script>
<script type="text/javascript" src="/js/Thumbnails/ThumbnailView.js"></script>
<!--end Avatar Customization Page-->
<!--Account Page-->
<!--script type="text/javascript" src="/js/jquery.validate.js"></script>
<script type="text/javascript" src="/js/jquery.validate.unobtrusive.js"></script>
<script type="text/javascript" src="/Services/Secure/AddParentEmail.js"></script>
<script type="text/javascript" src="/js/SignupFormValidator.js"></script>
<script type="text/javascript" src="/js/My/AccountMVC.js"></script>
<script type="text/javascript" src="/js/AddEmail.js"></script>
<script type="text/javascript" src="/js/SuperSafePrivacyIndicator.js"></script-->
<!--end Account Page-->

<!-- I really don't like this script -->
<!--script type="text/javascript" src="/js/TosModalCheck.js"></script-->


<script>

        googletag.cmd.push(function() {
            Roblox = Roblox || {};
            Roblox.AdsHelper = Roblox.AdsHelper || {};
            Roblox.AdsHelper.slots = [];
            Roblox.AdsHelper.slots = Roblox.AdsHelper.slots || []; Roblox.AdsHelper.slots.push({slot:googletag.defineSlot("/1015347/Roblox_Games_Middle_300x250", [300, 250], "3139363836383631").addService(googletag.pubads()), id: "3139363836383631", path: "/1015347/Roblox_Games_Middle_300x250"});
Roblox.AdsHelper.slots = Roblox.AdsHelper.slots || []; Roblox.AdsHelper.slots.push({slot:googletag.defineSlot("/1015347/Roblox_Games_Middle_300x250_1", [300, 250], "3232313339393637").addService(googletag.pubads()), id: "3232313339393637", path: "/1015347/Roblox_Games_Middle_300x250_1"});
 
            for (var key in Roblox.AdsHelper.slots) {
                var slot = Roblox.AdsHelper.slots[key].slot;
                var id = Roblox.AdsHelper.slots[key].id;
                var path = Roblox.AdsHelper.slots[key].path;
                
                     slot.setTargeting('pos', path);
                     slot.setTargeting('tier', rtp[path].tier);
                if (slot.renderEnded != "undefined") {
                    (function(slot, id)
                    {
                        slot.renderEndedOld = slot.renderEnded;
                        slot.renderEnded = function() {
                            slot.renderEndedOld();
                            if ($('#' + id + '.gutter').css('display') == "none") {
                                $(document).trigger("GuttersHidden");
                            }
                            if ($('#' + id + '.filmstrip').css('display') == "none") {
                                $(document).trigger("FilmStripHidden");
                            }
                        };    
                    }(slot, id));
                }
            }

            googletag.pubads().setTargeting("Age", "Unknown");	
            googletag.pubads().setTargeting("Env",  "Production");
            googletag.pubads().enableSingleRequest();
            googletag.pubads().collapseEmptyDivs();
            googletag.enableServices();
        });
    </script>  
<script type="text/javascript">
    $(function () {
        Roblox.JSErrorTracker.initialize({'internalEventListenerPixelEnabled': true});
    });
</script>
<script type="text/javascript">
    var Roblox = Roblox || {};
    Roblox.UpsellAdModal = Roblox.UpsellAdModal || {};

    Roblox.UpsellAdModal.Resources = {
        //<sl:translate>
        title: "Remove Ads Like This",
        body: "Builders Club members do not see external ads like these.",
        accept: "Upgrade Now",
        decline: "No, thanks"
        //</sl:translate>
    };
</script>        <script type="text/javascript">
            Roblox.XsrfToken.setToken('');
        </script>
    <script type="text/javascript">
        Roblox.FixedUI.gutterAdsEnabled = false;
    </script>

<!--script type="text/javascript" src="/js/Games/GamesDisplayShared.js"></script-->
<!--GamesDisplay.js bundle replacement-->
<script type="text/javascript" src="/js/jquery/jquery.address-1.4.min.js"></script>
<script type="text/javascript" src="/js/GamesDisplay.js"></script>
<!--end GamesDisplay.js bundle replacement-->

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
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

</script>