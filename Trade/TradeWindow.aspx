<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/global.php';
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<meta http-equiv="X-UA-Compatible" content="IE=edge,requiresActiveX=true"/><title>
ROBLONIUM.com
</title>
<link rel="icon" type="image/vnd.microsoft.icon" href="/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="Content-Language" content="en-us"/>
<meta name="author" content="ROBLONIUM"/>

<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-11419793-1']);
		_gaq.push(['_setCampSourceKey', 'rbx_source']);
		_gaq.push(['_setCampMediumKey', 'rbx_medium']);
		_gaq.push(['_setCampContentKey', 'rbx_campaign']);
		_gaq.push(['_setDomainName', 'roblox.com']);

		_gaq.push(['b._setAccount', 'UA-486632-1']);
		_gaq.push(['b._setCampSourceKey', 'rbx_source']);
		_gaq.push(['b._setCampMediumKey', 'rbx_medium']);
		_gaq.push(['b._setCampContentKey', 'rbx_campaign']);
		_gaq.push(['b._setDomainName', '<?=$_SERVER['SERVER_NAME']?>']);
		_gaq.push(['c._setAccount', 'UA-26810151-2']);
		_gaq.push(['c._setDomainName', '<?=$_SERVER['SERVER_NAME']?>']);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl/' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();

	</script>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/ScriptGlobals.php";?>

<!--Trade-specific scripts-->
<script src="/js/utilities/Cache.js" type="text/javascript"></script>
<script src="/js/Pagination/CursorPagination.js" type="text/javascript"></script>
<script src="/js/Trade/InventoryControl.js" type="text/javascript"></script>
<script src="/js/Trade/InventoryItem.js" type="text/javascript"></script>
<script src="/js/jquery.filter_input.js" type="text/javascript"></script>
<script src="/js/jquery.tipsy.js" type="text/javascript"></script>
<script src="/js/Trade/TradeEvents.js" type="text/javascript"></script>
<script src="/js/Trade/AsyncOfferWithRobux.js" type="text/javascript"></script>
<script src="/js/GenericModal.js" type="text/javascript"></script>
<script src="/js/GenericConfirmation.js" type="text/javascript"></script>

</head>
<body>

    <script type="text/javascript">Roblox.XsrfToken.setToken('');</script>
 
    <script type="text/javascript">
        if (top.location != self.location) {
            top.location = self.location.href;
        }
    </script>
  
<style type="text/css">
    <style type="text/css">
</style>
</style>
<form name="aspnetForm" method="post" action="/Trade/TradeWindow.aspx?TradePartnerID=261" id="aspnetForm">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="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"/>
</div>


<script src="/ScriptResource.axd?d=DzIuxY6VSKHJLxDneq4HtEgmi-otc6WDnslTUZoGuaL430XQzt4UDq6lkmqgWMotUAZu1eHAJrIziKch5OkG78z36Cjurivo9LyVghq7oT_jN0eaTTH2ZoyR4RShvcrNfTUdGjKOrcqC7rUyq-pavDKllQBBWIsCMC7ADJUHBKy-KUBFbqfxsjgHH7Y2EjReZmOavFxqNBfUpTh7Elu42zslBbXBCd0Pi11zuSSErEP7155IHefEAN7IwXPy-UfjVWqnvfrxvweCmFtH6D9XDYJsr5ZfmiNSE-VFXqP8yqmVgG0xSPyfpsJpEAP_qPOpSD9seTSKftJSNGaBZLXcDWALBOh8ZnXQN5jAmrgYsPyQ3fQ41UMyjcnp0UVOHHDjS1xJkz4bW6dxxfYqwu7UNJEFnUO3nNmdJph4AP76I8HHV9w6BcmpQuDAZtHN5wBgN9rpAw2" type="text/javascript"></script>
<div>

	<input type="hidden" name="__VIEWSTATEENCRYPTED" id="__VIEWSTATEENCRYPTED" value=""/>
	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="pLlTNuXicquzPvkVlDU/yAgINX5IvS5f62MQW9Yh+XDy1P30I7kE++wh/p9bTObP2gOvMV55gCZjreiurLLZBOJ5w7FC17fP/pfCNvt4t8Cayzr1L+Sa7DSidmeYUZzzN6ErtB89RKZ8HN6aCGsiYeJv56RmP5hEsbKY0dTcZcNP55gsm751K+DHnZIeNMZFrciM1Og2hlOOuj3DdZcVrPfaGW7I8zDCeMgZd3gFYY2xflBZ0+/mRaqp1D5BEnc2l3damk8Jn5ra2B2pZBnChYVGfg7gr2bDoTrk6rKGcbt8VgyYyLOgiOOJcV33XRHOkUOF2E/2X76vjwQG8F1/0MK+FK0="/>
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
        





    <noscript><div class="SystemAlert"><div class="SystemAlertText">Please enable Javascript to use all the features on this site.</div></div></noscript>  <?php include $_SERVER["DOCUMENT_ROOT"] . "/Announcement" ;?>
	<div id="BodyWrapper">
            <div id="RepositionBody">
			<!--Body goes here-->
			<div id="Body" style="width:970px">
       

        

        <div style="clear: both;"></div>
        <!-- needed by IE7 to prevent some pages from going blank -->

        
    <!--style type="text/css">
        body, html
        {
            background-color : white;
        }
    </style-->
    <div class="TradeWindowContainer" TradeSessionId=''>
        <div class="TradeHeader">
            <h3>TRADING</h3><span class="TradingPartner" data-se="trade-partner"> with <span class="notranslate">Shedletsky</span></span>
            <span class="ExitText">Exit Trading<a id="ctl00_cphRoblox_A2" width="19px" height="19px" class="ImageButton closeBtnCircle_20h" data-se="trade-exit" style="margin-left:4px;position:relative;"></a></span>
        </div>
        <div class="Inventories">
            <div id="ctl00_cphRoblox_InventoryControl1_InventoryContainer" class="InventoryContainer" ownedbyuser="True" data-collectibles-url="https://inventory.roblonium.com/v1/users/36078913/assets/collectibles" data-bc-label="https://images.rbxcdn.com/4fc3a98692c7ea4d17207f1630885f68.png" data-tbc-label="https://images.rbxcdn.com/c8b53df0f5950ac4c2eb1af580b3236d.png" data-obc-label="https://images.rbxcdn.com/693399abeaa6eebdc9f45aebc2b36bd8.png">
    <div style="height:22px;width:574px;">
        <span class="InventoryHeader">Your Inventory</span>
        <span class="InventoryDropDowns">
            <span class="InventoryDropDownContainer">Category:
                <select class="InventorySmall CategoryDropDown" data-se="trade-inventory-dropdown">
                    <option value="null">All</option><option value="8">Accessory | Hats</option><option value="41">Accessory | Hair</option><option value="42">Accessory | Face</option><option value="43">Accessory | Neck</option><option value="44">Accessory | Shoulders</option><option value="45">Accessory | Front</option><option value="46">Accessory | Back</option><option value="47">Accessory | Waist</option><option value="19">Gear</option><option value="18">Faces</option>
                </select>
            </span>
        </span> 
    </div>
    <div class="InventoryRowContainer">
        <div class="InventoryDropDownContainer noItems" style="display:none;">No Items To Display</div>
        <div class="InventoryHandle">
        </div>
        <div class="PagingContainerDivTop" style="display:none;clear:both;">
            <div class="paging_previous" data-se="trade-inventory-prev-page" ></div>
            <div class="paging_wrapper">Page <span class="paging_currentpage"></span></div>
            <div class="paging_next" data-se="trade-inventory-next-page"></div>
        </div>
    </div>
    <div class="InventoryItemTemplate" style="display:none;">
        

<div class="InventoryItemContainerOuter"  data-se="trade-item" >
    <div fieldname="InventoryItemSize">
		<div templateid="DefaultContent" class="InventoryItemContainerInner">
            <div class="HeaderButtonPlaceHolder"></div>
            <div class="InventoryNameWrapper">
			    <a class="InventoryItemLink" href="#" target="_blank"><div class="InventoryItemName"></div></a>
            </div>
			<div class="ItemLinkDiv">
				<img class="ItemImg" alt="Item Image" />
			</div>
			<div class="HoverContent">
				<div>
                    <span class="ItemInfoLabel">Avg. Price:</span>
                    
                        <span class="icon-robux-16x16"></span>
                    
                    <span class="ItemInfoData InventoryItemAveragePrice"></span>
                </div>
				<div>
                    <span class="ItemInfoLabel">Orig. Price:</span>
                    
                        <span class="icon-robux-16x16"></span>
                    
                    <span class="ItemInfoData InventoryItemOriginalPrice"></span>
                </div>
				<div><span class="ItemInfoLabel">Serial # :&nbsp;</span><span class="InventoryItemSerial"></span><span class="ItemInfoLabel" style="margin:0 2px 0 2px;">/</span><span class="SerialNumberTotal"></span></div>
				<div class="FooterButtonPlaceHolder"></div>
            </div>
            <img class="BuildersClubOverlay">
		</div>
	</div>	
</div>

    </div>
</div>
<script type="text/javascript">
    $(function () {
        Roblox.InventoryControl.inventoryControls = Roblox.InventoryControl.inventoryControls || [];
        Roblox.InventoryControl.inventoryControls.push(new Roblox.InventoryControl('ctl00_cphRoblox_InventoryControl1_InventoryContainer', null, 14));
    });
</script>

            <div class="TradeDivider"></div>
            <div id="ctl00_cphRoblox_InventoryControl2_InventoryContainer" class="InventoryContainer" ownedbyuser="False" data-collectibles-url="https://inventory.roblonium.com/v1/users/261/assets/collectibles" data-bc-label="https://images.rbxcdn.com/4fc3a98692c7ea4d17207f1630885f68.png" data-tbc-label="https://images.rbxcdn.com/c8b53df0f5950ac4c2eb1af580b3236d.png" data-obc-label="https://images.rbxcdn.com/693399abeaa6eebdc9f45aebc2b36bd8.png">
    <div style="height:22px;width:574px;">
        <span class="InventoryHeader">Shedletsky's Inventory</span>
        <span class="InventoryDropDowns">
            <span class="InventoryDropDownContainer">Category:
                <select class="InventorySmall CategoryDropDown" data-se="trade-inventory-dropdown">
                    <option value="null">All</option><option value="8">Accessory | Hats</option><option value="41">Accessory | Hair</option><option value="42">Accessory | Face</option><option value="43">Accessory | Neck</option><option value="44">Accessory | Shoulders</option><option value="45">Accessory | Front</option><option value="46">Accessory | Back</option><option value="47">Accessory | Waist</option><option value="19">Gear</option><option value="18">Faces</option>
                </select>
            </span>
        </span> 
    </div>
    <div class="InventoryRowContainer">
        <div class="InventoryDropDownContainer noItems" style="display:none;">No Items To Display</div>
        <div class="InventoryHandle">
        </div>
        <div class="PagingContainerDivTop" style="display:none;clear:both;">
            <div class="paging_previous" data-se="trade-inventory-prev-page" ></div>
            <div class="paging_wrapper">Page <span class="paging_currentpage"></span></div>
            <div class="paging_next" data-se="trade-inventory-next-page"></div>
        </div>
    </div>
    <div class="InventoryItemTemplate" style="display:none;">
        

<div class="InventoryItemContainerOuter"  data-se="trade-item" >
    <div fieldname="InventoryItemSize">
		<div templateid="DefaultContent" class="InventoryItemContainerInner">
            <div class="HeaderButtonPlaceHolder"></div>
            <div class="InventoryNameWrapper">
			    <a class="InventoryItemLink" href="#" target="_blank"><div class="InventoryItemName"></div></a>
            </div>
			<div class="ItemLinkDiv">
				<img class="ItemImg" alt="Item Image" />
			</div>
			<div class="HoverContent">
				<div>
                    <span class="ItemInfoLabel">Avg. Price:</span>
                    
                        <span class="icon-robux-16x16"></span>
                    
                    <span class="ItemInfoData InventoryItemAveragePrice"></span>
                </div>
				<div>
                    <span class="ItemInfoLabel">Orig. Price:</span>
                    
                        <span class="icon-robux-16x16"></span>
                    
                    <span class="ItemInfoData InventoryItemOriginalPrice"></span>
                </div>
				<div><span class="ItemInfoLabel">Serial # :&nbsp;</span><span class="InventoryItemSerial"></span><span class="ItemInfoLabel" style="margin:0 2px 0 2px;">/</span><span class="SerialNumberTotal"></span></div>
				<div class="FooterButtonPlaceHolder"></div>
            </div>
            <img class="BuildersClubOverlay">
		</div>
	</div>	
</div>

    </div>
</div>
<script type="text/javascript">
    $(function () {
        Roblox.InventoryControl.inventoryControls = Roblox.InventoryControl.inventoryControls || [];
        Roblox.InventoryControl.inventoryControls.push(new Roblox.InventoryControl('ctl00_cphRoblox_InventoryControl2_InventoryContainer', null, 14));
    });
</script>

        </div>
        

<div class="Offer TradeSystemRobux">
    <div class="OfferList" list-id="OfferList0">
        <div class="OfferHeaderWrapper">
            <h3 class="OfferHeader">Your Offer</h3><img class="TipsyImg" title="This is what you will give." height="13" width="12" src="/images/Icons/question.png" alt="This is what you will give." style="width:12px;height:13px;margin-left:4px;"/>
            <div class="OfferValueContainer">
                
                    Value: <span class="icon-robux-16x16"></span><span data-se="trade-total-value" class="OfferValue">0</span>
                
            </div>
        </div>
        <div class="OfferItems"  data-se="trade-your-offer">
        </div>
        <div class="OfferRobuxWrapper">
            <span>Plus</span> 
            
                <span class="icon-robux-16x16"></span>
            
            <input class="AddRobuxBox" type="text" data-se="trade-robux-input" maxlength="10"/> 
            <span class="Asterisk">*</span> 
            
                <div class="AfterFeeRobux" style="display:none;">(<span class="icon-robux-16x16"></span> <span class="RobuxCost" data-se="trade-robux-cost"> </span>after fee)</div>
            
        </div>
    </div>
    <img class="OfferDivider" src="/images/trade_divider.png" style="margin-left:7px;" alt="" />
    <div class="OfferList"  list-id="OfferList1">
        <div class="OfferHeaderWrapper">
            <h3 class="OfferHeader">Your Request</h3><img class="TipsyImg" title="This is what you will get." height="13" width="12" src="/images/Icons/question.png" alt="This is what you will get." style="width:12px;height:13px;margin-left:4px;"/>
            <div class="OfferValueContainer">
                
                    Value: <span class="icon-robux-16x16"></span><span data-se="trade-total-value" class="OfferValue">0</span>
                
            </div>
        </div>
        <div class="OfferItems" data-se="trade-your-request">
        </div>
         <div class="OfferRobuxWrapper">
            <span>Plus</span> 
             
                 <span class="icon-robux-16x16"></span>
             
            <input class="AddRobuxBox" type="text" data-se="trade-robux-input" maxlength="10"/> 
            <span class="Asterisk">*</span> 
             
                 <div class="AfterFeeRobux" style="display:none;">(<span class="icon-robux-16x16"></span> <span class="RobuxCost" data-se="trade-robux-cost"> </span>after fee)</div>
             
        </div>
    </div>
    <div class="SendTrade" data-se="trade-send"></div>
</div>
<div class="ErrorTextContainer">
    <span class="ErrorText"></span>
</div> 

<div class="FeeNote"><span class="Asterisk" >*</span> A  30% fee will be taken from the amount.</div> 

<div class="RemoveFromOffertemplate" style="display:none">
    <div class="TradeItemSilverButtonContainer RemoveFromOffer"><a class="TradeItemSilverButton" href="#">Remove</a></div>
</div>
<div class="AddButtonTemplate" style="display:none;">
    <div class="TradeItemSilverButtonContainer AddButton"><a class="TradeItemSilverButton" href="#">Add To Offer</a></div>
</div>
<div class="RequestButtonTemplate">
    <div class="TradeItemSilverButtonContainer RequestButton"><a class="TradeItemSilverButton" href="#">Request</a></div>
</div>
<div id="InventoryItemTemplateContainer" style="display:none;">
    

<div class="InventoryItemContainerOuter"  data-se="trade-item" >
    <div fieldname="InventoryItemSize">
		<div templateid="DefaultContent" class="InventoryItemContainerInner">
            <div class="HeaderButtonPlaceHolder"></div>
            <div class="InventoryNameWrapper">
			    <a class="InventoryItemLink" href="#" target="_blank"><div class="InventoryItemName"></div></a>
            </div>
			<div class="ItemLinkDiv">
				<img class="ItemImg" alt="Item Image" />
			</div>
			<div class="HoverContent">
				<div>
                    <span class="ItemInfoLabel">Avg. Price:</span>
                    
                        <span class="icon-robux-16x16"></span>
                    
                    <span class="ItemInfoData InventoryItemAveragePrice"></span>
                </div>
				<div>
                    <span class="ItemInfoLabel">Orig. Price:</span>
                    
                        <span class="icon-robux-16x16"></span>
                    
                    <span class="ItemInfoData InventoryItemOriginalPrice"></span>
                </div>
				<div><span class="ItemInfoLabel">Serial # :&nbsp;</span><span class="InventoryItemSerial"></span><span class="ItemInfoLabel" style="margin:0 2px 0 2px;">/</span><span class="SerialNumberTotal"></span></div>
				<div class="FooterButtonPlaceHolder"></div>
            </div>
            <img class="BuildersClubOverlay">
		</div>
	</div>	
</div>

</div>
<div id="BlankTemplate" style="display:none;">
    <div class="BlankItem" data-se="trade-blank-item">
    </div>
</div>
 

<div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
    <div class="Title"></div>
    <div class="GenericModalBody">
        <div>
            <div class="ImageContainer roblox-item-image"  data-image-size="small" data-no-overlays data-no-click>
                <img class="GenericModalImage" alt="generic image" />
            </div>
            <div class="Message"></div>  
            <div style="clear:both"></div>
        </div>
        <div class="GenericModalButtonContainer">
            <a class="ImageButton btn-neutral btn-large roblox-ok">OK</a> 
        </div>  
    </div>
</div>

<script type="text/javascript" > 
    if (typeof Roblox === "undefined") {
            Roblox = {};
        }
        if (typeof Roblox.Trade === "undefined") {
            Roblox.Trade = {};
        }
        if (typeof Roblox.Trade.Offer === "undefined") {
            Roblox.Trade.Offer = {};
        }
        Roblox.Trade.Offer.Resources = {
            //<sl:translate>
            sendRequestText: "Are you sure you want to send a trade request?",
            sendRequestTitleText: "Send Request",
            tradeSentText: "Trade Sent!",
            tradeSentBody: "Your trade request has been sent! Close this window to end session.",
            badNewsTitle: "Bad News!",
            badNewsBody: " Press \"OK\" to remove invalid items from the trade.",
            maxItemsErrorText: "Only 4 items can be in an offer or request",
            watermarkText: "Enter amount",
            acceptText: "OK",
            cancelText: "Cancel",
            //</sl:translate>
            alertUrl: "https://images.rbxcdn.com/cbb24e0c0f1fb97381a065bd1e056fcb.png",
            thumbsUpUrl: "https://images.rbxcdn.com/df52f0d2c19d67b7a710876fd17c6070.png"
        };
    $(function () {
        $('.TipsyImg').tipsy();
        Roblox.Trade.Offer.initialize(36078913, 4, 261, 0.5, 0.3);
    });
</script>

    </div>
			</div>
			</div>
			<?php include $_SERVER["DOCUMENT_ROOT"] . "/Footer";?>
	</div>
	</div>
    </form>
    <div id="TradeConfirmContainer" style="display:none;">
	
    <div id="TradeConfirmModal" class="modalPopup unifiedModal smallModal">
        <div >
            Are You Sure?
        </div>
        <div class="unifiedModalContent" style="min-height:185px;margin:0px;">
            <img src="https://images.rbxcdn.com/cbb24e0c0f1fb97381a065bd1e056fcb.png" alt="alert" style="margin:10px;margin-right:12px;float:left;"/>
            <div style="margin-bottom:43px;padding-top:26px;padding-right:5px;">
                <div style="margin-left:120px;margin-bottom:5px;">                              
                    <span>Closing this window will end the trading session<span class="TradingWith" data-se="trade-confirm-partner" ></span>. Are you sure you want to exit?</span>
                </div>
            </div> 
            <div style="clear: both;"></div>
            <div class="ModalButtonContainer" >
                <div id="ButtonYes" data-se="trade-confirm-yes" ></div>
                <div id="ButtonCancel" class="simplemodal-close" data-se="trade-confirm-cancel" ></div>
                <div style="clear:both;"></div>
            </div>  
        </div>
    </div>
    <script type="text/javascript">
        var TradeConfirmModal = {};
        TradeConfirmModal.open = function () {
            var modalProperties = { overlayClose: true, escClose: true, opacity: 80, overlayCss: { backgroundColor: "#000"} };
            $("#TradeConfirmModal").modal(modalProperties);
        }
        TradeConfirmModal.close = function () {
            $.modal.close();
        };

        $(function () {
            var tradingWith = $('.TradingPartner').text();
            //<sl:translate>
            var messaging = 'Closing this window will end the Trading Session ' + tradingWith + '.';
            //</sl:translate>
            $('.TradingWith').text(tradingWith);

            $('.ExitText').click(function () {
                TradeConfirmModal.open();
            });

            $(window).bind('beforeunload', function (e) {
                e = e || window.event;

                // For IE and Firefox prior to version 4
                if (e) {
                    e.returnValue = messaging;
                }
                return messaging;
            });

            $('#ButtonYes').click(function () {
                TradeConfirmModal.close();
                $(window).unbind('beforeunload');
                window.close();
            });
            $('#ButtonCancel').click(function () {
                TradeConfirmModal.close();
            });
        });
       
    </script>

</div>
    <!--[if IE]>
     <script type="text/javascript">
        $(function () {
            $('.InventoryItemContainerInner').live('mouseenter', function () {
                $(this).parents('[fieldname="InventoryItemSize"]').css('z-index', '6');
            });
            $('.InventoryItemContainerInner').live('mouseleave', function () {
                $(this).parents('[fieldname="InventoryItemSize"]').css('z-index', '1');
            });
        });
    </script>
    <![endif]-->

        
        
          

<!--div class="ConfirmationModal modalPopup unifiedModal smallModal" data-modal-handle="confirmation" style="display:none;">
    <a class="genericmodal-close ImageButton closeBtnCircle_20h"></a>
    <div class="Title"></div>
    <div class="GenericModalBody">
        <div class="TopBody">
            <div class="ImageContainer roblox-item-image"  data-image-size="small" data-no-overlays data-no-click>
                <img class="GenericModalImage" alt="generic image" />
            </div>
            <div class="Message"></div>
        </div>
        <div class="ConfirmationModalButtonContainer">
            <a href id="roblox-confirm-btn"><span></span></a>
            <a href id="roblox-decline-btn"><span></span></a>
        </div>
        <div class="ConfirmationModalFooter">
        
        </div>  
    </div>   
    <script type="text/javascript">
        Roblox = Roblox || {};
        Roblox.Resources = Roblox.Resources || {};

        //<sl:translate>
        Roblox.Resources.GenericConfirmation = {
            yes: "Yes",
            No: "No",
            Confirm: "Confirm",
            Cancel: "Cancel"
        };
        //</sl:translate>
    </script>
</div-->

        
        <script type="text/javascript">
            function urchinTracker() { };
            GoogleAnalyticsReplaceUrchinWithGAJS = true;
        </script>
    
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Post-Footer.php";?>
</body>                
</html>