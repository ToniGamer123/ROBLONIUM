<?php
require_once $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/global_functions.php';
require_once $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/core_functions.php';

// Default Page Configuration
$page_config = [
	"ScriptIncludes" => [],
	"CSSIncludes" => [],
	"ManualIncludes" => [],
	"DefaultScriptBundles" => [
		"master" => [
			"roblox.js",
			"jquery.json-2.2.js",
			"jquery.simplemodal-1.3.5.js",
			"jquery.tipsy.js",
			"AjaxAvatarThumbnail.js",
			"extensions/string.js",
			"StringTruncator.js",
			"json2.min.js",
			"webkit.js",
			"GoogleAnalytics/GoogleAnalyticsEvents.js",
			"MasterPageUI.js",
			"jquery.cookie.js",
			"jquery.jsoncookie.js",
			"JSErrorTracker.js",
			"RobloxEventManager.js",
			"RobloxEventListener.js",
			"GoogleEventListener.js",
			"MongoEventListener.js",
			"SiteTouchEvent.js",
			"jPlayer/2.4.0/jquery.jplayer.min.js",
			"XsrfToken.js",
			"jquery.ba-postmessage.min.js",
			"parentFrameLogin.js",
			"DropDownNav.js",
			"UpsellAdModal.js",
			"CharacterSelect.js",
			"MadStatus.js",
			"PlaceLauncher.js",
			"ABPlaceLauncher.js"
		],
		"videopreroll" => [
			"VideoPreRoll.js"
		],
		"clientinstaller" => [
			"EventTracker.js",
			"ClientInstaller.js",
			"InstallationInstructions.js",
			"IEMetroInstructions.js"
		],
		"placelauncher" => [
			"CharacterSelect.js",
			"MadStatus.js",
			"PlaceLauncher.js",
			"ABPlaceLauncher.js"
		],
		"nonLoggedIn" => [
			"jquery.ba-postmessage.min.js",
			"parentFrameLogin.js"
		],
		"chat" => [
			"jquery.cookies.2.2.0.1.js",
			"blockUI.js",
			"chat_v1.js",
			"jquery-extensions.js",
			"party.js"
		]
	],
	"DefaultStyleBundles" => [
		"main" => [
			"CSS/Base/CSS/Roblox.css",
			"CSS/RBXCommon.css",
			"CSS/Base/CSS/Ads.css",
			"CSS/Base/CSS/carouselpager.css",
			"CSS/Base/CSS/ContentBuilder.css",
			"CSS/Base/CSS/Footer.css",
			"CSS/Base/CSS/GroupRoleSetMembersPane.css",
			"CSS/Base/CSS/Groups.css",
			"CSS/Base/CSS/Header.css",
			"CSS/Base/CSS/iFrameLogin.css",
			"CSS/Base/CSS/Item.css",
			"CSS/Base/CSS/ManageAccount.css",
			"CSS/Base/CSS/MediaThumb.css",
			"CSS/Base/CSS/Modals.css",
			"CSS/Base/CSS/Navigation2014.css",
			"CSS/Base/CSS/Party.css",
			"CSS/Base/CSS/PersonalServerAccessPrivilegesRoleSet.css",
			"CSS/Base/CSS/Place.css",
			"CSS/Base/CSS/PlaceItem.css",
			"CSS/Base/CSS/PlaceLauncher.css",
			"CSS/Base/CSS/RevisedCharacterSelectModal.css",
			"CSS/Base/CSS/Sets.css",
			"CSS/Base/CSS/Signup.css",
			"CSS/Base/CSS/tipsy.css",
			"CSS/Base/CSS/Trade.css",
			"CSS/Base/CSS/Upgrades.css",
			"CSS/Base/CSS/User.css",
			"CSS/Base/CSS/Utility.css",
			"CSS/Base/CSS/VideoPreRoll.css",
			"CSS/Base/CSS/StyleGuide.css",
			"CSS/RBX2/CSS/Utility.css"
		]
	],
	"EnableBanner" => true,
	"EnableAlerts" => true,
	"EnableFooter" => true,
	"EnablePostFooter" => true,
	"EnableSimpleContainer" => false,
	"Title" => "ROBLONIUM.com",
	"FavIcon" => "favicon.ico",
	"CustomBodyCSS" => "width:970px",
	"IncludeScriptGlobals" => true
];

if(strpos($_SERVER['HTTP_HOST'], "sitetest"))
{ 
  ini_set('display_errors', 1);
  ini_set('display_startup_errors', 1);
  error_reporting(E_ALL);
}

if (session_started() === FALSE and !headers_sent()) {
	session_start();
}

if (verify_user() == true) {
	$globaluserinfo = $database->findRow("public_users", ["Id" => substr($_COOKIE["userToken"], 0, (strpos($_COOKIE["userToken"], ":")))], ["Id", "Name"]);
	if ($globaluserinfo && $globaluserinfo->rowCount() > 0){$globaluserinfo = $globaluserinfo->fetch(PDO::FETCH_OBJ);}else {header("Location: /"); die();}
	$login = new login;
	$login->username = $globaluserinfo->Name;
	$login->password = substr($_COOKIE["userToken"], (strpos($_COOKIE["userToken"], ":") + 1), strlen($_COOKIE["userToken"]));
	$account = $login->attempt();
	$error = $account["error"];
	if (isset($account["player"]))
	{
		$_SESSION['player'] = $account["player"]; 
		/*header("Location: /welcome.php");
		die();*/
	}
	else 
	{
		if (!isset($isIndex)) {
		//header("Location: http://" . $_SERVER['SERVER_NAME'] . "/");
		//die("");
		}
	}
}
//redirecting
/*if (!isset($isIndex)) 
{
	if (!isset($_SESSION['player']->username) or $_SESSION['player']->username == "Guest" or !isset($_SESSION["player"]) or verify_user() !== true){
		//header("Location: http://" . $_SERVER['SERVER_NAME'] . "/");
		die("0x1");
	}
}*/
?>