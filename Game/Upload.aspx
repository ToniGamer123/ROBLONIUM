<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<title>Publish Place As</title>
<link rel="stylesheet" href="/BuildPage.css"/>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/ScriptGlobals.php";?>
<link rel="stylesheet" href="/roblonium.css?excludeTheme=true"/>
</head>
<div class="boxed-body">
	<h1 class="notranslate" data-se="item-name">
		My Places
	</h1>
		<div class="tab-container">
			<h3>Choose an existing place to overwrite, or create a new place.</h3>
		</div>
	<div>
		<div id="assetList" class="content asset-list tab-active">
			<div class="place asset" id="newasset" onclick="document.location.href = '/ide/publishas/newgame';">
				<a class="game-image">
					<div id="newAssetText">New Place</div>
					<img class="game-image" src="https://images.rbxcdn.com/775a746321fa29fdd977500e15362645.png" alt="Create New"/>
				</a>
				<p class="item-name-container ellipsis-overflow">(Create New)</p>
			</div>

	 
		<script type="text/javascript">
			function editGameInStudio(play_placeId) { RobloxLaunch._GoogleAnalyticsCallback = function() { var isInsideRobloxIDE = 'website'; if (Roblox && Roblox.Client && Roblox.Client.isIDE && Roblox.Client.isIDE()) { isInsideRobloxIDE = 'Studio'; };GoogleAnalyticsEvents.FireEvent(['Plugin Location', 'Launch Attempt', isInsideRobloxIDE]);GoogleAnalyticsEvents.FireEvent(['Plugin', 'Launch Attempt', 'Edit']);EventTracker.fireEvent('GameLaunchAttempt_Win32', 'GameLaunchAttempt_Win32_Plugin'); if (typeof Roblox.GamePlayEvents != 'undefined') { Roblox.GamePlayEvents.SendClientStartAttempt(null, play_placeId); }  };  Roblox.Client.WaitForRoblox(function() { if (Roblox.VideoPreRollDFP) {Roblox.VideoPreRollDFP.showVideoPreRoll = false;}RobloxLaunch.StartGameWithPlaceId('214498127'); }); }
		</script>
	<span id="verifiedEmail" style="display: none"></span>   
		<div class="place asset gameplace" data-placeid="214498127">
			<a class="game-image" href="/ide/publishas/upload?assetid=214498127" data-retry-url="">
				<img class="placeThumbnail" src="/NotFound.jpg" />
			</a>
			<p class="notranslate item-name-container ellipsis-overflow">Place 1</p>
		</div>
		<div class="place asset gameplace" data-placeid="137963644">
			<a class="game-image" href="/ide/publishas/upload?assetid=137963644" data-retry-url="">
				<img class="placeThumbnail" src="/NotFound.jpg" />
			</a>
			<p class="notranslate item-name-container ellipsis-overflow">Place 2</p>
		</div>
		<div class="place asset gameplace" data-placeid="131008974">
			<a class="game-image" href="/ide/publishas/upload?assetid=131008974" data-retry-url="">
				<img class="placeThumbnail" src="/NotFound.jpg" />
			</a>
			<p class="notranslate item-name-container ellipsis-overflow">Place 3</p>
		</div>

		</div>
	</div>
	<div id="Close" class="footer-button-container divider-top">
		<a  class="btn-medium btn-negative" id="closeButton">Cancel</a>
	</div>
</div>
<script type="text/javascript">
	$(function () {
		Roblox.PublishAs.Resources = {
			//<sl:translate>
			accept: "Verify",
			decline: "Cancel",
			continueText: "Continue"
			//</sl:translate>
		};

		Roblox.PublishAs.Initialize();
	});
</script>