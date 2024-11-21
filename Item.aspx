<?php
  //require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/global_functions.php';
  require_once $_SERVER['DOCUMENT_ROOT']."/global.php";
  
  if(isset($_GET['ID'])){ $id = $_GET['ID']; }
  elseif(isset($_GET['id'])){ $id = $_GET['id']; }
  else{ die(header("Location: /Browse.aspx")); }

  if(!filter_var($id, FILTER_VALIDATE_INT)){ die(header("Location: /RobloniumDefaultErrorPage.aspx?code=400")); }
  
  $cataloginfo = getMarketplaceInfo($id);
  
  if(!$cataloginfo){ die(header("Location: /RobloniumDefaultErrorPage.aspx?code=404")); }
  if($cataloginfo->AssetTypeId == 9){ die(header("Location: /".replaceSpecialChars($cataloginfo->Name)."-place?id=".$id)); }

  $inventory = json_decode($userInfo->Inventory,true);

  //new item update part
  //quite the yike organization wise tbh
  
  /*if (isset($_POST['upload'])) 
  {
  	$uploadOK = false;
  	$type = $_POST['type'];
  	if ($_POST['forsale'] == "on" and (($_POST['price-robux'] !== null and isset($_POST['price-robux'])) or ($_POST['price-tickets'] !== null and isset($_POST['price-tickets'])))) {
  		$forsale = 1;
  	}else {
  		$forsale = 0;
  	}
  	if ($type !== 4) {
  		if ($_POST['price-robux'] !== null and isset($_POST['price-robux'])) {
  			$priceRobux = $_POST['price-robux'];
  		}
  		if ($_POST['price-tickets'] !== null and isset($_POST['price-tickets'])) {
  			$priceTickets = $_POST['price-tickets'];
  		}
  	}
  	$description = $_POST['description'];
  	$title = $_POST['title'];
  	//check here if user is admin
  	$dbtype = $type;
  	$title = preg_replace("/[^ \w]+/", "", $title);
  	$title = preg_replace('!\s+!', ' ', $title);
  	$description = preg_replace('!\s+!', ' ', $description);
  	if (strlen($title) > 36) {
  		header("Location: /My/Item.aspx?id=".$id."&error=2");
  		
  		exit;
  	}
  	if (strlen($title) < 1) {
  		header("Location: /My/Item.aspx?id=".$id."&error=5");
  		
  		exit;
  	}
  	if (strlen($description) > 800) {
  		header("Location: /My/Item.aspx?id=".$id."&error=1");
  		
  		exit;
  	}
  	if (($priceRobux < 0 and $priceTickets < 0) and $dbtype !== 13) {
  		header("Location: /My/Item.aspx?id=".$id."&error=4");
  		
  		exit;
  	}
  	if (($priceRobux > 99999 or $priceTickets > 99999) and $dbtype !== 13) {
  		header("Location: /My/Item.aspx?id=".$id."&error=3");
  		
  		exit;
  	}
  	if ($dbtype == 13) {
  		$priceRobux = 0;
  		$priceTickets = 0;
  	}
  }*/
  
  /*if (isset($_POST['upload'])) {
  	die(print_r($_POST));
  }*/
  
  
  //end item update
  //now we can show the user their updated asset :)
  
  /*if ($_SERVER['HTTP_USER_AGENT'] == 'Mozilla/5.0 (compatible; Discordbot/2.0; +https://discordapp.com)')
  { //Discord-specific embed
  	die('<head id="ctl00_Head1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,requiresActiveX=true"/><title>
  	'.htmlspecialchars($cataloginfo->Name).', a '.assetTypeToString($cataloginfo->AssetTypeId).' by '.getNameFromUid($cataloginfo->CreatorId).' - ROBLONIUM
  </title>
  <link rel="icon" type="image/vnd.microsoft.icon" href="/favicon.ico"/><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="Content-Language" content="en-us"/><meta name="author" content="ROBLONIUM"/><meta id="ctl00_metadescription" name="description" content="'.htmlspecialchars($cataloginfo->Name).', a '.assetTypeToString($cataloginfo->AssetTypeId).' by '.getNameFromUid($cataloginfo->CreatorId).' - ROBLONIUM (updated '.$cataloginfo->Updated.'): ItemDescription"/><meta id="ctl00_metakeywords" name="keywords" content="'.htmlspecialchars($cataloginfo->Name).', a '.assetTypeToString($cataloginfo->AssetTypeId).' by '.getNameFromUid($cataloginfo->CreatorId).' - ROBLONIUM (updated '.$cataloginfo->Updated.') items, ROBLONIUM '.htmlspecialchars($cataloginfo->Name).', a '.assetTypeToString($cataloginfo->AssetTypeId).' by '.getNameFromUid($cataloginfo->CreatorId).' - ROBLONIUM (updated '.$cataloginfo->Updated.')"/>
  
  <meta property="og:title" content="'.htmlspecialchars($cataloginfo->Name).'"/><meta property="og:type" content="Game"/>
  <meta property="og:url" content="http://'.$_SERVER['SERVER_NAME'].'/Item.aspx?id='.$cataloginfo->AssetId.'"/>
  <meta property="og:site_name" content="ROBLONIUM"/>
  <meta property="fb:app_id" content="190191627665278"/>
  <meta property="og:description" content="'.htmlspecialchars($cataloginfo->Description).'"/>
  <meta property="og:image" content="http://' . $_SERVER['SERVER_NAME'] . '/Game/Tools/ThumbnailAsset.ashx?aid=' . $cataloginfo->AssetId . '&fmt=png&wd=320&ht=320'.'"/>
  </head>');
  }*/
  if (isset($_POST['upload'])) {
    if ($cataloginfo->CreatorId !== $_SESSION["player"] or verify_user() !== true) {
      //They're legit
      if ($_SESSION["player"] == 1 and verify_user() == true) {
      }else {
      			Redirect("http://" . $_SERVER['SERVER_NAME'] . "/RobloxDefaultErrorPage.aspx");
      			die();
      		}
      	}
      	//moved up to prevent headers from being prematurely sent
      	if (isset($_POST['forsale']) and $_POST['forsale'] == "on" and (!isset($priceRobux) and !isset($priceTickets))) {
      		$forsale = 1;
      		$priceRobux = $cataloginfo->PriceInRobux;
      		$priceTickets = $cataloginfo->PriceInTickets;
      	}
      	if ($priceRobux == null) {
      		$priceRobux = 0; //could be skipped to make it null in database (MULTI-SELL)
      	}
      	if ($priceTickets == null) {
      		$priceTickets = 0; //could be skipped to make it null in database (MULTI-SELL)
      	}
      				if ($user->Robux < 0) {
      					echo('<br>' . alert('You do not have enough ROBUX.', '#dada01') . '<br>');
      				}else{
      							/*$user->Robux = $user->Robux-5;
      							$userinfo = $database->updateRow("public_users", [ // update code in secondary database
      									"Robux" => $user->Robux
      							], ["Id" => $user->Id]);*/
      							$newasset = $database->updateRow("asset", [
      								"Name" => $title,
      								"Description" => $description,
      								"PriceInRobux" => $priceRobux,
      								"PriceInTickets" => $priceTickets,
      								"IsForSale" => $forsale,
      								"Updated" => date('Y-m-d G:i:s')
      							], ["AssetId" => $cataloginfo->AssetId]);
      							echo('<br>' . alert('Asset successfully updated!', 'green') . '<br>');
      					}
      	//fetch the asset data again as it's now been updated by the user
      	// TODO: Make this more efficient
      	$asset = $itemApi->GetAssetInfo($id);
      	if ($asset === FALSE) {
      		Redirect("http://" . $_SERVER['SERVER_NAME'] . "/RobloxDefaultErrorPage.aspx");
      		die();
      	}
      }
      $page_config["ScriptIncludes"] = 
      [
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
        "GenericConfirmation.js"
      ];

      $page_config["CSSIncludes"] = 
      [
        "CSS/Widgets/Flyouts.css",
        "CSS/Pages/VotingPanel.css",
        "CSS/Pages/PrivateGameInstances/PrivateGameInstances.css",
        //"CSS/PartialViews/Navigation.css",
        "CSS/Pages/GamePage.css",
        "CSS/Widgets/Favorites.css",
        "CSS/Pages/Thumbnails/AssetMedia.css"
      ];

      require $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Top.php";?>
          <div id="ItemContainer" class="text">
            <div>
              <div id="ctl00_cphRoblox_GearDropDown" class="SetList ItemOptions <?php 
                if ($cataloginfo->CreatorId !== $_SESSION["player"] or verify_user() !== true) {
                	$resp = 'invisible';
                	if ($_SESSION["player"] == 1 and verify_user() == true) {
                		//They're very legit
                		$resp = '';
                	}
                }else {
                	//They're legit
                	$resp = '';
                }
                echo($resp);
                ?>">
                <a href="#" class="btn-dropdown">
                <img src="/images/icons/gearicon.png"/>
                </a>
                <div class="clear"></div>
                <div class="SetListDropDown">
                  <div class="SetListDropDownList invisible">
                    <div class="menu invisible">
                      <div id="ctl00_cphRoblox_ItemOwnershipPanel" class="<?php 
                        if ($cataloginfo->CreatorId !== $_SESSION["player"] or verify_user() !== true or !in_array($cataloginfo->AssetId,$inventory['Inventory'])) {
                        	$resp = 'invisible';
                        	//They're legit
                        	if ($_SESSION["player"] == 1 and verify_user() == true) {
                        		$resp = '';
                        	}
                        }else {
                        	$resp = '';
                        }
                        echo($resp);
                        ?>">
                        <!--This is kinda cool ngl.-->
                        <a onclick="confirmDelete(this);return false;" id="ctl00_cphRoblox_btnDelete" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$btnDelete&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Delete from My Stuff</a>
                        <?php 
                          if (($cataloginfo->CreatorId == $_SESSION["player"] and verify_user() == true) or ($_SESSION["player"] == 1 and verify_user() == true)) {
                          	echo('								<a id="ctl00_cphRoblox_btnConfigure" href="http://'.$_SERVER['SERVER_NAME'].'/My/Item.aspx?id='.$cataloginfo->AssetId.'">Configure</a>');
                          }
                          ?>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <h1 class="notranslate" data-se="item-name">
                <?=htmlspecialchars($cataloginfo->Name)?>
              </h1>
              <h3>
                ROBLONIUM <?=assetTypeToString($cataloginfo->AssetTypeId)?>
              </h3>
            </div>
            <div id="Item">
              <div id="Details">
                <div id="assetContainer">
                  <div id="Thumbnail">
                    <a id="ctl00_cphRoblox_AssetThumbnailImage" disabled="disabled" class="AssetThumbnailImage" title="<?=htmlspecialchars($cataloginfo->Name)?>" onclick="return false" style="display:inline-block;height:320px;width:320px;">
                      <div class="roblox-item-image image-big" data-item-id="<?=$cataloginfo->AssetId?>" data-image-size="big" data-no-click="true"></div>
                    </a>
                  </div>
                </div>
                <div id="Summary">
                  <div class="SummaryDetails">
                    <div id="Creator" class="Creator">
                      <div class="Avatar">
                        <a id="ctl00_cphRoblox_AvatarImage" class="tooltip-right" title="<?=getNameFromUid($cataloginfo->CreatorId)?>" href="/User.aspx?ID=<?=$cataloginfo->CreatorId?>" style="display:inline-block;height:70px;width:70px;cursor:pointer;">
                          <div class="roblox-avatar-image image-small" data-user-id="<?=$cataloginfo->CreatorId?>" data-image-size="custom" data-image-size-x="70" data-image-size-y="70" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="<?=getNameFromUid($cataloginfo->CreatorId)?>"></div>
                        </a>
                      </div>
                    </div>
                    <div class="item-detail">
                      <span class="stat-label notranslate">Creator:</span>
                      <a id="ctl00_cphRoblox_CreatorHyperLink" class="stat notranslate" href="User.aspx?ID=<?=$cataloginfo->CreatorId?>"><?=getNameFromUid($cataloginfo->CreatorId)?></a>
                      <div>
                        <span class="stat-label">Created:</span>
                        <span class="stat">
                        <?=date_format(date_create($cataloginfo->Created),'n/j/Y')?>
                        </span>
                      </div>
                      <div id="LastUpdate">
                        <span class="stat-label">Updated:</span>
                        <span class="stat">
                        <?=date_format(date_create($cataloginfo->Updated),'n/j/Y')?>
                        </span>
                      </div>
                    </div>
                    <div id="ctl00_cphRoblox_DescriptionPanel" class="DescriptionPanel notranslate">
                      <pre class="Description Full text"><?=htmlspecialchars($cataloginfo->Description)?></pre>
                      <pre class="Description body text"><?=htmlspecialchars($cataloginfo->Description)?></pre>
                    </div>
                    <div class="ReportAbuse">
                      <div id="ctl00_cphRoblox_AbuseReportButton1_AbuseReportPanel" class="ReportAbuse">
                        <span class="AbuseIcon"><a id="ctl00_cphRoblox_AbuseReportButton1_ReportAbuseIconHyperLink" href="AbuseReport/Asset.aspx?ID=<?=$cataloginfo->AssetId?>&amp;RedirectUrl=http%3a%2f%2fwww.roblox.com%2fitem.aspx%3fseoname%3dGravity-Coil%26id%3d16688968"><img src="/images/abuse.PNG?v=2" alt="Report Abuse" style="border-width:0px;"/></a></span>
                        <span class="AbuseButton"><a id="ctl00_cphRoblox_AbuseReportButton1_ReportAbuseTextHyperLink" href="AbuseReport/Asset.aspx?ID=<?=$cataloginfo->AssetId?>&amp;RedirectUrl=http%3a%2f%2fwww.roblox.com%2fitem.aspx%3fseoname%3dGravity-Coil%26id%3d16688968">Report Abuse</a></span>
                      </div>
                    </div>
                  </div>
                  <div class="BuyPriceBoxContainer">
                    <div class="BuyPriceBox">
                    <?php
                      if(!$cataloginfo->IsForSale || ($inventory && in_array($cataloginfo->AssetId,$inventory['Inventory'])))
                        { $purchaseDisabled = "disabled-"; $purchasedTooltip = 'original-title="You already own this item."'; }
                      else
                        { $purchaseDisabled = $purchasedTooltip = false; }

                      if($cataloginfo->PriceInRobux + $cataloginfo->PriceInTickets == 0) { ?>

                      <div id="ctl00_cphRoblox_RobuxPurchasePanel">
                        <div id="RobuxPurchase">
                          <div id="PriceInRobux">
                            Price: <span class="robux-text " data-se="item-price-free">FREE</span>
                          </div>
                          <div id="BuyWithRobux">
                            <div data-expected-currency="1" 
                            data-asset-type="<?=assetTypeToString($cataloginfo->AssetTypeId)?>" 
                            class="btn-<?=$purchaseDisabled?>primary btn-medium PurchaseButton " 
                            data-se="item-buyforrobux" 
                            data-item-name="<?=htmlspecialchars($cataloginfo->Name)?>" 
                            data-item-id="<?=$cataloginfo->AssetId?>" 
                            data-expected-price="0" 
                            data-product-id="<?=$cataloginfo->AssetId?>" 
                            data-expected-seller-id="<?=$cataloginfo->CreatorId?>" 
                            data-bc-requirement="<?=$cataloginfo->MinimumMembershipLevel?>" 
                            data-seller-name="<?=getNameFromUid($cataloginfo->CreatorId)?>"
                            <?=$purchasedTooltip?>>
                              Take One
                              <span class="btn-text">Take One</span>
                            </div>
                          </div>
                        </div>
                        <div class="clear"></div>
                      </div>

                      <?php } else { if($cataloginfo->PriceInRobux){ ?>

                      <div id="ctl00_cphRoblox_RobuxPurchasePanel">
                        <div id="RobuxPurchase">
                          <div id="PriceInRobux">
                            Price: <span class="robux " data-se="item-priceinrobux"><?=number_format($cataloginfo->PriceInRobux)?></span>
                          </div>
                          <div id="BuyWithRobux">
                            <div data-expected-currency="1" 
                            data-asset-type="<?=assetTypeToString($cataloginfo->AssetTypeId)?>" 
                            class="btn-<?=$purchaseDisabled?>primary btn-medium PurchaseButton " 
                            data-se="item-buyforrobux" 
                            data-item-name="<?=htmlspecialchars($cataloginfo->Name)?>" 
                            data-item-id="<?=$cataloginfo->AssetId?>" 
                            data-expected-price="<?=$cataloginfo->PriceInRobux?>" 
                            data-product-id="<?=$cataloginfo->AssetId?>" 
                            data-expected-seller-id="<?=$cataloginfo->CreatorId?>" 
                            data-bc-requirement="<?=$cataloginfo->MinimumMembershipLevel?>" 
                            data-seller-name="<?=getNameFromUid($cataloginfo->CreatorId)?>"
                            <?=$purchasedTooltip?>>
                              Buy with R$
                              <span class="btn-text">Buy with R$</span>
                            </div>
                          </div>
                        </div>
                        <div class="clear"></div>
                      </div>

                      <?php } if($cataloginfo->PriceInRobux && $cataloginfo->PriceInTickets) {?>

                      <div id="ctl00_cphRoblox_RobuxAndTicketsPurchasePanel" class="RobuxAndTicketsPurchasePanel">
                      </div>

                      <?php } if($cataloginfo->PriceInTickets) { ?>

                      <div id="ctl00_cphRoblox_TicketsPurchasePanel">
                        <div id="TicketsPurchase">
                          <div id="PriceInTickets">
                            Price: <span class="tickets " data-se="item-priceintickets"><?=number_format($cataloginfo->PriceInTickets)?></span>
                          </div>
                          <div id="BuyWithTickets">
                            <div data-expected-currency="2" 
                            data-asset-type="<?=assetTypeToString($cataloginfo->AssetTypeId)?>" 
                            class="btn-<?=$purchaseDisabled?>primary btn-medium PurchaseButton " 
                            data-se="item-buyfortickets" 
                            data-item-name="<?=htmlspecialchars($cataloginfo->Name)?>" 
                            data-item-id="<?=$cataloginfo->AssetId?>" 
                            data-expected-price="<?=$cataloginfo->PriceInTickets?>" 
                            data-product-id="<?=$cataloginfo->AssetId?>" 
                            data-expected-seller-id="<?=$cataloginfo->CreatorId?>" 
                            data-bc-requirement="<?=$cataloginfo->MinimumMembershipLevel?>" 
                            data-seller-name="<?=getNameFromUid($cataloginfo->CreatorId)?>"
                            <?=$purchasedTooltip?>>
                              Buy with Tx
                              <span class="btn-text">Buy with Tx</span>
                            </div>
                          </div>
                        </div>
                      </div>

                      <?php } } ?>

                      <div class="clear">
                      </div>
                      <div class="footnote">
                        <div id="ctl00_cphRoblox_Sold">
                          (<span data-se="item-numbersold"><?=$cataloginfo->Sales?></span> 
                          <?php if ($cataloginfo->PriceInRobux <= 0 and $cataloginfo->PriceInTickets <= 0 and $cataloginfo->IsForSale == 1) {echo('Taken');}else {echo('Sold');}?>)
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                    <span>
                    <span class="FavoriteStar" data-se="item-numberfavorited">
                    0 
                    </span>
                    </span>
                  </div>
                  <div class="clear"></div>
                </div>
                <div class="clear"></div>
              </div>
              <div class="PrivateSales divider-top invisible">
                <h2>PRIVATE SALES</h2>
                <div id="UserSalesTab">
                  <div class="empty">
                    Sorry, no one is privately selling this item at the moment.
                  </div>
                  <div class="pgItemsForResale">
                    <span id="ctl00_cphRoblox_pgItemsForResale"><a disabled="disabled">First</a>&nbsp;<a disabled="disabled">Previous</a>&nbsp;<a disabled="disabled">Next</a>&nbsp;<a disabled="disabled">Last</a>&nbsp;</span>
                  </div>
                </div>
                <div class="clear"></div>
              </div>
            </div>
          </div>
        </div>
        <?php include $_SERVER["DOCUMENT_ROOT"] . '/puzzle/ItemPurchaseAjaxContainer.php';?>
        <div id="ctl00_cphRoblox_CreateSetPanelDiv" class="createSetPanelPopup">
        </div>
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
          
          var commentsLoaded = false;
          
          //Tabs
          function SwitchTabs(nextTabElem) {
              $('.WhiteSquareTabsContainer .selected,  .TabContent.selected').removeClass('selected');
              nextTabElem.addClass('selected');
              $('#' + nextTabElem.attr('contentid')).addClass('selected');
          
              var label = $.trim(nextTabElem.attr('contentid'));
              if(label == "CommentaryTab" && !commentsLoaded) {
                  Roblox.CommentsPane.getComments(0);
                  commentsLoaded = true;
                  if(Roblox.SuperSafePrivacyMode != undefined) {
                      Roblox.SuperSafePrivacyMode.initModals();
                  }
                  return false;
              }
          }
          
              SwitchTabs($('#RecommendationsTabHeader'));
          
          $('.WhiteSquareTabsContainer li').bind('click', function (event) {
              event.preventDefault();
              SwitchTabs($(this));
          });
          
          
          function confirmDelete() {
              Roblox.GenericConfirmation.open({
                  //<sl:translate>
                  titleText: "Delete Item",
                  bodyContent: "Are you sure you want to permanently DELETE this item from your inventory?",
                  //</sl:translate>
                  onAccept: function () {
                      javascript: __doPostBack('ctl00$cphRoblox$btnDelete', '');
                  },
                  acceptColor: Roblox.GenericConfirmation.blue,
                  //<sl:translate>
                  acceptText: "OK"
                  //</sl:translate>
              });
          }
          
          function confirmSubmit() {
              Roblox.GenericConfirmation.open({
                  //<sl:translate>
                  titleText: "Create New Badge Giver",
                  bodyContent: "This will add a new badge giver model to your inventory. Are you sure you want to do this?",
                  //</sl:translate>
                  onAccept: function () {
                      window.location.href = $('#ctl00_cphRoblox_btnSubmit').attr('href');
                  },
                  acceptColor: Roblox.GenericConfirmation.blue,
                  //<sl:translate>
                  acceptText: "OK"
                  //</sl:translate>
              });
          }
          
          modalProperties = { escClose: true, opacity: 80, overlayCss: { backgroundColor: "#000"} };
          
          // Code for Modal Popups
          $(function() {
              $(".btn-disabled-primary").removeClass("Button").tipsy({ gravity: 's' }).attr("href", "javascript: return false;");
          });
          function ModalClose(popup) {
              $.modal.close('.' + popup);
          }
        </script>
        <div style="clear:both"></div>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Bottom.php";?>