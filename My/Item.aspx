<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/global.php';

$id = $_GET["id"];
if ($id == "" or $id == null){Redirect("http://" . $_SERVER['SERVER_NAME'] . "/RobloxDefaultErrorPage.aspx");
die();}

// JSON
$asset = $itemApi->GetAssetInfo($id);
if ($asset === FALSE) {
Redirect("http://" . $_SERVER['SERVER_NAME'] . "/RobloxDefaultErrorPage.aspx");
die();
}
if ($asset['Creator']['Id'] !== $_SESSION["player"] or verify_user() !== true) {
	//They're legit
	if ($_SESSION["player"] == 1 and verify_user() == true) {
	}else {
	Redirect("http://" . $_SERVER['SERVER_NAME'] . "/RobloxDefaultErrorPage.aspx");
	die();
	}
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<head id="ctl00_Head1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,requiresActiveX=true"/><title>
    Configure <?=$asset["ProductType"]?> - ROBLONIUM
</title>
<link rel="icon" type="image/vnd.microsoft.icon" href="/favicon.ico"/><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="Content-Language" content="en-us"/><meta name="author" content="ROBLONIUM"/><meta id="ctl00_metadescription" name="description" content="<?=$asset["Name"]?>, a <?=$asset["ProductType"]?> by <?=$asset['Creator']['Name']?> - ROBLONIUM (updated <?=$asset["Updated"]?>): ItemDescription"/><meta id="ctl00_metakeywords" name="keywords" content="<?=$asset["Name"]?>, a <?=$asset["ProductType"]?> by <?=$asset['Creator']['Name']?> - ROBLONIUM (updated <?=$asset["Updated"]?>) items, ROBLONIUM <?=$asset["Name"]?>, a <?=$asset["ProductType"]?> by <?=$asset['Creator']['Name']?> - ROBLONIUM (updated <?=$asset["Updated"]?>)"/>
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
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/ScriptGlobals.php";?>
<meta property="og:title" content="<?=$asset["Name"]?>"/><meta property="og:type" content="Game"/>
<meta property="og:url" content="/Item.aspx?id=<?=$asset["AssetId"]?>"/>
<meta property="og:site_name" content="ROBLONIUM"/>
<meta property="fb:app_id" content="190191627665278"/>
<meta property="og:description" content="<?=$asset["Description"]?>"/>
<meta property="og:image" content="<?="http://" . $_SERVER['SERVER_NAME'] . "/Game/Tools/ThumbnailAsset.ashx?aid=" . $asset["AssetId"] . "&fmt=png&wd=320&ht=320"?>"/>
</head>

    <script type="text/javascript">Roblox.XsrfToken.setToken('');</script>
 
    <script type="text/javascript">
        if (top.location != self.location) {
            top.location = self.location.href;
        }
    </script>

<form name="aspnetForm" method="post" action="/Item.aspx?id=<?=$asset["AssetId"]?>" id="aspnetForm">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJNDM3NTU5NjQ1D2QWAmYPZBYCAgEQFgIeBmFjdGlvbgUeL0dyYXZpdHktQ29pbC1pdGVtP2lkPTE2Njg4OTY4ZBYKAgMPDxYCHgdWaXNpYmxlaGQWAmYPZBYIAgEPEGRkFgBkAgIPEGRkFgFmZAIDDxBkZBYBZmQCBA8QZGQWAWZkAgQPDxYCHwFoZGQCCw8PFgIfAWhkZAIOD2QWSGYPFgIeBWNsYXNzBR1TZXRMaXN0IEl0ZW1PcHRpb25zIGludmlzaWJsZRYGZg8WAh8BaBYCAgMPDxYCHwFoZGQCAQ8PFgQeCENzc0NsYXNzBQlpbnZpc2libGUeBF8hU0ICAmRkAgIPDxYCHwFoZBYEAgEPDxYEHgtOYXZpZ2F0ZVVybAUafi9NeS9JdGVtLmFzcHg/SUQ9MTY2ODg5NjgeBFRleHQFFENvbmZpZ3VyZSB0aGVzZSBHZWFyZGQCAw8WAh8BaBYCAgEPDxYEHwUFJX4vTXkvTmV3VXNlckFkLmFzcHg/dGFyZ2V0SUQ9MTY2ODg5NjgfBgUUQWR2ZXJ0aXNlIHRoZXNlIEdlYXJkZAIBDxYCHwYFDEdyYXZpdHkgQ29pbGQCAg8WAh8GBQtST0JMT1ggR2VhcmQCAw9kFgJmD2QWAgIBDw8WCB4KSXNVcmxGaW5hbGceCEltYWdlVXJsBTdodHRwOi8vdDRhay5yb2Jsb3guY29tL2UzYjQ4ZWJiZWE4Mzg0Nzc3ZWEzYTk2NmFhMmUyNTQxHgtDb21tYW5kTmFtZWUeD0NvbW1hbmRBcmd1bWVudGRkZAIEDw8WCB8IZB8JZR8KZB8BaGRkAgUPDxYIHwdnHwgFN2h0dHA6Ly90MGFrLnJvYmxveC5jb20vMmJhODlhN2MzMTkyYzAxNzY3OTQwYjgwNWI4NDAzYzMfCWUfCmRkZAIGDw8WBB8FBRB+L1VzZXIuYXNweD9JRD0xHwYFBlJPQkxPWGRkAgcPFgIfBgUMNSBtb250aHMgYWdvZAIIDxYCHgNzcmNkZAIJD2QWAmYPFgIfBgWYAUVxdWlwcGluZyB0aGlzIGl0ZW0gY2FuY2VscyA3NSUgb2YgZ3Jhdml0eSdzIGVmZmVjdCBvbiB5b3VyIGNoYXJhY3Rlci4gVGhpcyBhbGxvd3MgeW91IHRvIGp1bXAgZXh0cmEgaGlnaCwg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AgIBDw8WBB8GBQhGYXZvcml0ZR8BaGRkAiAPDxYCHwFoZGQCIQ8PZA8QFgFmFgEWAh4OUGFyYW1ldGVyVmFsdWVkFgECA2RkAiIPFCsAAg8WBB4LXyFEYXRhQm91bmRnHwxmZGRkAiMPFCsAAmQQFgAWABYAZAIkDxYCHwFoZAInD2QWAmYPZBYCZg8WAh8BaGQCLA9kFgZmDw8WCB8HZx8IBTdodHRwOi8vdDVhay5yb2Jsb3guY29tLzFjYzRiYjA4NmZhYjkzODIxNDhmMGYxZmRlNTZhMzE3HwllHwpkZGQCAQ8WAh8BaBYEAgEPZBYCAgEPEA8WAh8XZ2RkFgBkAgYPFQECMzBkAgMPDxYCHwFoZGQCLg9kFgYCAQ8PFggfB2cfCAU3aHR0cDovL3Q1YWsucm9ibG94LmNvbS8xY2M0YmIwODZmYWI5MzgyMTQ4ZjBmMWZkZTU2YTMxNx8JZR8KZGRkAgMPFgIfAWgWAgIBDxAPFgIfF2dkZBYAZAIFDw8WAh8BaGRkAhEPDxYCHwFoZGQYCQUjY3RsMDAkTGVmdEd1dHRlckFkJEFzeW5jQWRNdWx0aVZpZXcPD2QCA2QFIGN0bDAwJGNwaFJvYmxveCRwZ0l0ZW1zRm9yUmVzYWxlDxQrAARkZAIGZmQFKmN0bDAwJGNwaFJvYmxveCRBc3NldFByZXNlbnRhdGlvbk11bHRpVmlldw8PZGZkBSRjdGwwMCRSaWdodEd1dHRlckFkJEFzeW5jQWRNdWx0aVZpZXcPD2QCA2QFHGN0bDAwJGNwaFJvYmxveCRCYWRnZUV4cGlyZWQPD2QCAWQFMmN0bDAwJGNwaFJvYmxveCRhZHNXaWRlU2t5c2NyYXBlciRBc3luY0FkTXVsdGlWaWV3Dw9kAgNkBS9jdGwwMCRjcGhCYW5uZXJBZCRJdGVtQmFubmVyQWQkQXN5bmNBZE11bHRpVmlldw8PZAIDZAUhY3RsMDAkY3BoUm9ibG94JGxzdEl0ZW1zRm9yUmVzYWxlDzwrAA4DCGYMZg0CBmQFI2N0bDAwJHJieEdvb2dsZUFuYWx5dGljcyRNdWx0aVZpZXcxDw9kZmSoRXuqkvpuSMbC7rSkG1GOMvg2iw=="/>
</div>


<script src="/ScriptResource.axd?d=hUbyVCWDcRmikM3tO-QWgiU9QRmST8S7BPxWou7Mzt-pNBVT-Is2KGk96aGOUdQpifQfj65G7McMxgPfN2eNQOTL9O3A1FKcYCCwrovdjHLwBKJijrZ8s6_Ew6ErJ72aIove8-TcrvdTzRuYfbbjB3J4lvtOApd9TFYhK0QLEbCxrFIhaA6pgaHtT_wAICinzZ_4D8U78h9Sox-26lxICd6XSpdJEv4js9MMndbPyznIxvI3OC7FcxPbCMdXZ_YmDnrKIv9d50mFceZ78kiH4MDIYed4juvSQoDN8A-_Mw5pyT8FzuUYxr3x7TccRLAU5Ma55ma_sbG6p5qJBXWEqjhBzmOSNgOPG-JvMRDoB836CDvQ1nVdrskvy-bYvZyR9vTIGZ2zPNrKXpWb2fmxEAln-op-yxqSYaoW5qSUFKoqFXXAMhXEickCS3m5SXDze-IQcg2" type="text/javascript"></script>
<div>

    <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWAgLDv6CeCQKU8uj+AeTR6tmAmXlnOv43yhNWAwUhB2iB"/>
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
			<?php
				if (isset($_GET['error'])) {
					$id = $_GET['error'];
					if ($id == 1) {
						echo alert('Your description is too long!', '#dada01');
					}elseif($id == 2) {
						echo alert('Your asset name is too long!', '#dada01');
					}elseif($id == 3) {
						echo alert('Your asset price cannot be higher than <span class="robux money">99999</span>.', '#dada01');
					}elseif($id == 4) {
						echo alert('Your asset price cannot be lower than <span class="robux money">0</span>.', '#dada01');
					}elseif($id == 5) {
						echo alert('Your asset name must be at least 1 character in length.', '#dada01');
					}elseif($id == 6) {
						echo alert('Illegal character has been detected!', 'red');
					}
				}
			?>
<div id="BodyWrapper">
                        
                        <div id="RepositionBody">
                            <div id="Body" class="body-width ">
                                
    
    
     


    <div id="EditItemContainer">
        <h1>Configure <?=$asset["ProductType"]?></h1>
        <div>
            <div id="EditItem" style="width:890px;">
                
                
                
                
                <div id="ItemName">
                    <span id="ctl00_cphRoblox_NameLabel" class="form-label">Name:</span><br>
                    <input name="title" type="text" value="<?=$asset["Name"]?>" maxlength="50" id="ctl00_cphRoblox_NameTextBox" class="TextBox">
                    <span id="ctl00_cphRoblox_NTBRFV" style="color:Red;visibility:hidden;">A Name is Required</span>
                </div>
                <div id="ItemThumbnail">
                    <a id="ctl00_cphRoblox_rbxGalleryAssetThumbnail_rbxAssetImage" class=" notranslate" title="<?=$asset["Name"]?>" onclick="__doPostBack('ctl00$cphRoblox$rbxGalleryAssetThumbnail$rbxAssetImage','')" style="display:inline-block;height:230px;width:420px;cursor:pointer;">
						<div class="roblox-item-image image-medium" data-item-id="<?=$asset['AssetId']?>" data-image-size="medium" data-no-overlays="true"></div>
					</a>




                </div>
                <div id="ItemDescription">
                    <span id="ctl00_cphRoblox_DescriptionLabel" class="form-label">Description:</span><br>
                    <textarea name="description" rows="2" cols="20" id="ctl00_cphRoblox_DescriptionTextBox" class="text" style="height:150px;width: 410px;padding: 5px;"><?=$asset["Description"]?></textarea>
                </div>
                
                <div class="Buttons">
                    <button type="submit" name="upload" class="btn-small btn-neutral" style="height:22px;">
                   <!--a id="ctl00_cphRoblox_SubmitButtonTop" tabindex="4" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$SubmitButtonTop&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">
                        Save
                    </a-->
					Save
                    <span class="btn-text">Save</span>
                    </button>&nbsp;
                    
                    <button class="btn-small btn-negative" style="height:22px;">
                    <!--a id="ctl00_cphRoblox_CancelButtonTop" tabindex="5" href="/Item.aspx?id=<?=$asset["AssetId"]?>">
                        Cancel
                    </a-->
					Cancel
                    <span class="btn-text">Cancel</span>
                    </button>
                </div>
                <div id="ctl00_cphRoblox_SellThisItemPanel">
    
                    <div id="SellThisItem">
                        <fieldset title="Sell this Item">
                            <legend id="ctl00_cphRoblox_SellLegend">Sell this Item</legend>
                            <div id="ctl00_cphRoblox_AssetSellSuggestion" class="Suggestion">
                                Check the box below and enter a price if you want to sell this item in the Roblox
                                catalog. Uncheck the box to remove the item from the catalog. (Un-checking and re-checking the following box on a <b>free item</b> will cause the item to <b>require a price</b>. Please <b>do not</b> attempt to modify the price of items sold with <b><span class="tickets " data-se="item-priceintickets">Tix</span></b>.)
                            </div>
                            <div class="SellThisItemRow">
                                <input id="ctl00_cphRoblox_SellThisItemCheckBox" type="checkbox" name="forsale" <?php if ($asset['IsForSale'] == 1) {echo('checked="checked"');} ?>><label for="ctl00_cphRoblox_SellThisItemCheckBox">Sell this Item</label>
                                    <div id="ctl00_cphRoblox_PricingPanel" class="PricingPanel" style="display: none;">
        
                                    
                                    <div id="Pricing">
                                        <div id="Currency" style="margin-left: 183px;">
                                            <div class="PricingLabel form-label">
                                            </div>
                                            <div id="ctl00_cphRoblox_SellForRobuxCheck" class="PricingField_Robux" style="/* display:none */">
                                                <input id="ctl00_cphRoblox_SellForRobux" type="checkbox"<?php if ($asset['PriceInRobux'] !== 0 and $asset['PriceInTickets'] <= 0) {echo('checked="checked"');} ?>><label for="ctl00_cphRoblox_SellForRobux">for Robux</label></div>
											<div id="ctl00_cphRoblox_SellForTicketsCheck" class="PricingField_Tickets" style="/* display:none */">
                                                <input id="ctl00_cphRoblox_SellForTickets" type="checkbox"<?php if ($asset['PriceInRobux'] <= 0 and $asset['PriceInTickets'] !== 0) {echo('checked="checked"');} ?>><label for="ctl00_cphRoblox_SellForTickets">for Tickets</label></div>
                                            <div style="clear: both;">
                                            </div>
                                        </div>
                                        <div id="Price">
                                            <div class="PricingLabel form-label" style="margin-top: 5px">
                                                Price:
                                            </div>
                                            <div class="PricingField_Robux">
                                                
                                                    <span class="robux">&nbsp;</span>
                                                    <input name="price-robux" type="text" <?php if($asset['IsForSale'] == 1) {echo('value="'.$asset['PriceInRobux'].'" ');} ?>maxlength="9" id="ctl00_cphRoblox_RobuxPrice" class="TextBox">
                                                
                                            </div>
											<div class="PricingField_Tickets">
                                                
                                                    <span class="tickets">&nbsp;</span>
                                                    <input name="price-tickets" type="text" <?php if($asset['IsForSale'] == 1) {echo('value="'.$asset['PriceInTickets'].'" ');} ?>maxlength="9" id="ctl00_cphRoblox_TicketsPrice" class="TextBox">
                                                
                                            </div>
                                            <span id="PricingError" class="status-error" style="display:none;">
                                                The minimum price for this item is <span class="robux notranslate">0</span>
                                            </span>
                                            <span id="PricingErrorMax" class="status-error" style="display:none;">
                                                The maximum price for this item is <span class="robux notranslate">999999999</span>
                                            </span>
                                            <div style="clear: both;"></div>
                                        </div>
                                        
                                        <div id="Fee" style="margin-top: 18px;">
                                            <div id="market-info" data-market-fee-rate="90" data-minimum-price="2" class="PricingLabel form-label">
                                                Marketplace Fee:<br>
                                                <span class="Suggestion footnote">(90% - minimum 1)</span></div>
                                            <div class="PricingField_Robux">
                                                <span class="robux MarketplaceFeeInRobuxLabel"></span>
                                            </div>
											<div class="PricingField_Tickets">
                                                <span class="tickets MarketplaceFeeInTicketsLabel"></span>
                                            </div>
                                            <div style="clear: both;">
                                            </div>
                                        </div>
                                        <div id="Profit" style="margin-top:10px">
                                            <div class="PricingLabel form-label">
                                                You Earn:</div>
                                            <div class="PricingField_Robux">
                                                <span class="robux UserProfitInRobuxLabel"></span></div>
											<div class="PricingField_Tickets">
                                                <span class="tickets UserProfitInTicketsLabel"></span></div>
                                            <div style="clear: both;">
                                            </div>
                                        </div>
                                    </div>
                                
    </div>
                            </div>
                            
                            
                            
                        </fieldset>
                    </div>
                
</div>
                <div id="Comments">
                    <fieldset title="Turn comments on/off">
                        <legend>Turn comments on/off</legend>
                        <div class="Suggestion">
                            Choose whether or not this item is open for comments.
                        </div>
                        <div class="EnableCommentsRow">
                            <input id="ctl00_cphRoblox_EnableCommentsCheckBox" type="checkbox" name="ctl00$cphRoblox$EnableCommentsCheckBox" checked="checked"><label for="ctl00_cphRoblox_EnableCommentsCheckBox">Allow Comments</label>
                        </div>
                    </fieldset>
                </div>
                
                <div id="ctl00_cphRoblox_GenreOptionsPanel">
    
                    <div id="SetGenres">
                        <fieldset>
                            <legend>Genre</legend>
                            <div class="Suggestion">
                                Classify your
                                <?=$asset["ProductType"]?>
                                to help people find it.
                            </div>
                            <script type="text/javascript">
                                var genreID = 'ctl00_cphRoblox_actualGenreSelection';
                                var multigenreID = 'ctl00_cphRoblox_actualGenreSelectionMulti';
                                function addGenre($this, multi) {
                                    var a = $this.val();
                                    if (!multi) {
                                        $('#' + genreID).val(a);
                                    }
                                    else {
                                        var b = parseInt($('#' + multigenreID).val(), 10);
                                        if ($this.is(":checked")) {
                                            $('#' + multigenreID).val(b + parseInt(a, 10));
                                        }
                                        else {
                                            $('#' + multigenreID).val(b - parseInt(a, 10));
                                        }
                                    }
                                }
                            </script>

                            <div id="ctl00_cphRoblox_AllowOneGenre">
        
                                <div class="GenreSettings">
                                    <ul style="list-style: none;">
                                        
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/Classic.png" alt="All">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="1" checked="checked">
                                                        All
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/Tutorial.gif" alt="Building">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="19">
                                                        Building
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/Cthulu.png" alt="Horror">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="11">
                                                        Horror
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/City.png" alt="Town and City">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="7">
                                                        Town and City
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/ModernMilitary.png" alt="Military">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="17">
                                                        Military
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/LOL.png" alt="Comedy">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="15">
                                                        Comedy
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/Castle.png" alt="Medieval">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="8">
                                                        Medieval
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/Adventure.png" alt="Adventure">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="13">
                                                        Adventure
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/SciFi.png" alt="Sci-Fi">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="9">
                                                        Sci-Fi
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/Pirate.png" alt="Naval">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="12">
                                                        Naval
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/FPS.png" alt="FPS">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="20">
                                                        FPS
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/RPG.png" alt="RPG">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="21">
                                                        RPG
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/Sports.png" alt="Sports">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="14">
                                                        Sports
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/Ninja.png" alt="Fighting">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="10">
                                                        Fighting
                                                    </label>
                                                </li>
                                            
                                                <li style="width:250px;float:left;">
                                                    <img src="/images/GenreIcons/WildWest.png" alt="Western">
                                                    <label>
                                                        <input type="radio" onclick="addGenre($(this), false);" name="GenreButtons2" value="16">
                                                        Western
                                                    </label>
                                                </li>
                                            
                                    </ul>
                                    <input type="hidden" name="ctl00$cphRoblox$actualGenreSelection" id="ctl00_cphRoblox_actualGenreSelection" value="1">
                                </div>
                            
    </div>
                            
                        </fieldset>
                    </div>
                
</div>
                
                
                
                
                
                
                
                <div class="Buttons">
                    <button type="submit" name="upload" class="btn-small btn-neutral" style="height:22px;">
                   <!--a id="ctl00_cphRoblox_SubmitButtonTop" tabindex="4" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$SubmitButtonTop&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">
                        Save
                    </a-->
					Save
                    <span class="btn-text">Save</span>
                    </button>&nbsp;
                    
                    <button class="btn-small btn-negative" style="height:22px;">
                    <!--a id="ctl00_cphRoblox_CancelButtonTop" tabindex="5" href="/Item.aspx?id=<?=$asset["AssetId"]?>">
                        Cancel
                    </a-->
					Cancel
                    <span class="btn-text">Cancel</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div style="clear: both;"></div>
    

<div id="BCOnlyModalSelling" class="modalPopup unifiedModal smallModal" style="display:none;">
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
                Selling is a premium feature only available to users with Builders Club Membership.
            </div>
        </div>
        <div style="clear:both;"></div>
        <div style="clear:both;"></div>
        <div class="GenericModalButtonContainer" style="padding-bottom: 13px">
            <div style="text-align:center">
                <button class="btn-primary btn-large" style="height:50px;">
                    <a id="BClink" href="/Upgrade.aspx?ctx=bc-only-item">
                    Upgrade Now
                    </a>
                    <span class="btn-text">Upgrade Now</span>
                </button>
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
            $("#BCOnlyModalSelling").modal(modalProperties);
        else
            $("#" + modalId).modal(modalProperties);
    }
    $(document).ready(function () {
        $('#SellThisItemCheckbox').click(function () {
            showBCOnlyModal("BCOnlyModalSelling");
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
            <a class="ImageButton btn-neutral btn-large roblox-ok">OK</a> 
        </div>  
    </div>
</div>


    
    <script type="text/javascript">
        $(function () {
            var isPlaceAsset = false;
            MyItemPage.Initialize(
                0, 
                0, 
                0.9, 
                0, 
                0, 
                999999999,
                999999999,
                <?php if($asset['Creator']['MembershipLevel'] > 0) {echo('true');} else{echo('false');} ?>, 
                false, 
                isPlaceAsset,
                true);

            
        });

        Roblox.MyItem = Roblox.MyItem || {};

        //<sl:translate>
        Roblox.MyItem.strings = {
            SellingSuspendedTitleText: "Selling Suspended",
            SellingSuspendedBodyContent: "Your account has had the privilege of selling paid access to any of your places on Roblox suspended.",
            PriceChangingThrottledTitleText: "Price update blocked.",
            PriceChangingThrottledBodyContent: "You are changing the price too quickly. Try the update again after a short time.",
            OKText: "OK"
        };
        //</sl:translate>
        Roblox.MyItem.AlertImageUrl = "https://images.rbxcdn.com/cbb24e0c0f1fb97381a065bd1e056fcb.png";
    </script>

                                <div style="clear:both"></div>
                            </div>
                        </div>
                    </div>
                    </div>
        
            
<?php include $_SERVER["DOCUMENT_ROOT"] . "/Footer";?>
    </div>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Post-Footer.php";?>
</body>                
</html>