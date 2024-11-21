<?php

require $_SERVER["DOCUMENT_ROOT"] . '/global.php';
requireLogin();

$page_config["ScriptIncludes"] = 
[
    $page_config["DefaultScriptBundles"]["master"],
    "GPTAdScript.js",
    "jquery.simplemodal-1.3.5.js",
    "GenericModal.js",
    "DataPager.js",
    "Sets/SetsPane.js",
    "extensions/string.js",
    "accordion.js",
    "UserPlacesPane.js",
    "ItemPurchase.js",
    "modules/Widgets/ItemImage.js",
    "UserAssetsPane.js",
    "CreateSetPanel.js",
    "GenericConfirmation.js",
    "PlaceProductPromotion.js",
    "jquery.dotdotdot-1.5.7-packed.js",
    "widgets/Favorites.js",
    "modules/Widgets/AvatarImage.js",
    "fileUploadUnsupported.js",
    "SuperSafePrivacyIndicator.js",
];

$page_config["CSSIncludes"] = [
    "CSS/Pages/User/UserPane.css",
    "CSS/Pages/Inventory/Inventory.css"
];

require $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Top.php";

?>
<div id="UserContainer">
  <div id="UserAssetsPane">
    <div id="ctl00_cphRoblox_rbxUserAssetsPane_upUserAssetsPane">
      <h2 class="title" display="block" style="width:970px">
        <span>
        Inventory
        </span>
      </h2>
      <div id="UserAssets">
        <div id="AssetsMenu"  class="divider-right">
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl00_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl00_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl00$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Heads</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl01_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl01_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl01$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Faces</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl02_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl02_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl02$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Gear</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl03_AssetCategorySelectorPanel" class="verticaltab selected">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl03_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl03$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Hats</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl04_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl04_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl04$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">T-Shirts</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl05_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl05_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl05$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Shirts</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl06_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl06_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl06$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Pants</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl07_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl07_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl07$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Decals</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl08_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl08_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl08$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Models</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl09_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl09_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl09$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Plugins</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl10_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl10_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl10$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Places</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl11_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl11_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl11$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Game Passes</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl12_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl12_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl12$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Audio</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl13_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl13_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl13$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Badges</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl14_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl14_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl14$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Left Arms</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl15_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl15_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl15$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Right Arms</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl16_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl16_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl16$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Left Legs</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl17_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl17_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl17$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Right Legs</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl18_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl18_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl18$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Torsos</a>
          </div>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl19_AssetCategorySelectorPanel" class="verticaltab">
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl19_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl19$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Packages</a>
          </div>
        </div>
        <div id="AssetsContent">
          <table id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList" cellspacing="0" border="0" style="border-collapse:collapse;">
            <tr>
              <td class="Asset" valign="top">
                <div style="padding: 5px">
                  <div class="AssetThumbnail">
                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl00_AssetThumbnailHyperLink" class=" notranslate" title="Red Plaid Golf Cap" class=" notranslate" href="/Red-Plaid-Golf-Cap-item?id=125861531" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t2.rbxcdn.com/e8ed1c7cb1846126666183997dbd69d1" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Red Plaid Golf Cap" class=" notranslate" /></a>
                  </div>
                  <div class="AssetDetails">
                    <div class="AssetName">
                      <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl00_AssetNameHyperLink" class="noranslate" href="/Red-Plaid-Golf-Cap-item?id=125861531">Red Plaid Golf Cap</a>
                    </div>
                    <div class="AssetCreator">
                      <span class="Label">Creator: </span><span class="Detail notranslate">
                      <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl00_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span>
                    </div>
                    <div id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl00_Div1" class="AssetPrice">
                      <span class="PriceInRobux notranslate">
                      R$: 15</span>
                    </div>
                  </div>
                </div>
              </td>
            </tr>
          </table>
          <div id="ctl00_cphRoblox_rbxUserAssetsPane_FooterPagerPanel" class="FooterPager" style="width: 780px">
            <span class="pager previous disabled"></span>
            <span id="ctl00_cphRoblox_rbxUserAssetsPane_FooterPagerLabel" style="vertical-align: top; display: inline-block; padding: 5px; padding-top: 6px">Page 1 of 252</span>
            <a id="ctl00_cphRoblox_rbxUserAssetsPane_FooterPageSelector_Next" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$FooterPageSelector_Next&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))"><span class="pager next"></span></a>
          </div>
        </div>
        <div style="clear: both;"></div>
        <div id="ctl00_cphRoblox_rbxUserAssetsPane_CreateSetPanelDiv" class="createSetPanelPopup" style="width: 400px; height: 100%; padding: 0px; float: left; display: none">         </div>
        <div style="clear:both"></div>
      </div>
    </div>
  </div>
</div>