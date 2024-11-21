<?php
//require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/player.php';
if (!defined('SESSION'))
{
die('<!--ItemPurchaseAjaxContainer-->');
}
//$userAjax = new PublicUser();
$userAjax = getUserInfoFromUid(SESSION["userid"]);
?>
<div class="ItemPurchaseAjaxContainer">
	<div id="ItemPurchaseAjaxData" data-authenticateduser-isnull="<?php if ($userAjax->Id) {echo "False"; } else { echo "True";} ?>" data-user-balance-robux="<?=$userAjax->Robux?>" data-user-balance-tickets="<?=$userAjax->Tickets?>" data-user-bc="<?=$userAjax->MembershipLevel?>" data-continueshopping-url="/Catalog" data-imageurl="<?="http://" . $_SERVER['SERVER_NAME'] . "/Game/Tools/ThumbnailAsset.ashx?aid=" . $cataloginfo->AssetId . "&fmt=png&wd=320&ht=320"?>" data-alerturl="http://images.rbxcdn.com/cbb24e0c0f1fb97381a065bd1e056fcb.png" data-builderscluburl="http://images.rbxcdn.com/ae345c0d59b00329758518edc104d573.png"></div>

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
                This is a premium item only available to our Builders Club members.
            </div>
        </div>
        <div style="clear:both;"></div>
        <div style="clear:both;"></div>
        <div class="GenericModalButtonContainer" style="padding-bottom: 13px">
            <div class="modal-footer" style="text-align:center">
                <button class="btn-primary btn-large" onclick="location.reload();" style="height:50px;">
                    Upgrade Now
                    <span class="btn-text">Upgrade Now</span>
                </button>
				<button type="button" class="btn-negative btn-large" onclick="$.modal.close();" style="height:50px;">
					Cancel
                    <span class="btn-text">Cancel</span>
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
			<span class="btn-text">OK</span>
        </div>  
    </div>
</div>

    <div id="ProcessingView" style="display:none">
        <div class="ProcessingModalBody">
            <p style="margin:0px"><img src="http://images.rbxcdn.com/ec4e85b0c4396cf753a06fade0a8d8af.gif" alt="Processing..."/></p>
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
            buildersClubOnlyTitle : "{0} Only",
            buildersClubOnlyText : "You need {0} to buy this item!",
            buyItemTitle : "Buy Item",
            buyItemText : "Would you like to {0} the {1} {2} from {3} for {4}?",
            balanceText : "Your balance after this transaction will be {0}",
            freeText : "Free",
            purchaseCompleteTitle : "Purchase Complete!",
            purchaseCompleteText : "You have successfully {0} the {1} {2} from {3} for {4}.",
            continueShoppingText : "Continue Shopping",
            customizeCharacterText : "Customize Character",
            orText : "or",
            rentText : "rent"
        }
    //</sl:translate>
    </script>
</div>