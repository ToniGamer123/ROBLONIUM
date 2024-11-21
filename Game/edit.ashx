<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/core_functions.php';
disableErrorReporting();
header('Content-Type: text/plain');
header('X-Robots-Tag: noindex');
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");

// some nice very epic constants :)
$baseUrl = "http://".$_SERVER['SERVER_NAME']."/";
if (!(strpos($_SERVER['SERVER_NAME'], "www.") === FALSE)) {
	$apiUrl = "http://api.".substr($_SERVER['SERVER_NAME'], strpos($_SERVER['SERVER_NAME'], "www.")+4, strlen($_SERVER['SERVER_NAME'])-4)."/";
}else {
	$apiUrl = "http://api.".$_SERVER['SERVER_NAME']."/"; // TODO: should be https in 2013
}

$placeId = $_GET['PlaceID'] ?? $_GET['PlaceId'] ?? $_GET['placeID'] ?? $_GET['placeId'] ?? 0;
// DEFAULTS
if (!isset($_GET['UserID'])) {
	$userId = SESSION["userid"];
}else {
	if (SESSION["userid"]) {
		$userId = SESSION["userid"];
	}else {
		$userId = (int)$_GET['UserID'] < 0 ? rand(-9999, -1) : 0;
	}
}
$place = getMarketplaceInfo($placeId);
$creatorId = $place->CreatorId;

//coke is very epic
ob_start();
?>
-- Prepended to Edit.lua and Visit.lua and Studio.lua--

function ifSeleniumThenSetCookie(key, value)
	if false then
		game:GetService("CookiesService"):SetCookieValue(key, value)
	end
end

ifSeleniumThenSetCookie("SeleniumTest1", "Inside the visit lua script")

pcall(function() game:SetPlaceID(<?=$placeId?>) end)

visit = game:GetService("Visit")

local message = Instance.new("Message")
message.Parent = workspace
message.archivable = false

game:GetService("ScriptInformationProvider"):SetAssetUrl("<?=$baseUrl?>Asset/")
game:GetService("ContentProvider"):SetThreadPool(16)
pcall(function() game:GetService("InsertService"):SetFreeModelUrl("<?=$baseUrl?>Game/Tools/InsertAsset.ashx?type=fm&q=%s&pg=%d&rs=%d") end) -- Used for free model search (insert tool)
pcall(function() game:GetService("InsertService"):SetFreeDecalUrl("<?=$baseUrl?>Game/Tools/InsertAsset.ashx?type=fd&q=%s&pg=%d&rs=%d") end) -- Used for free decal search (insert tool)

ifSeleniumThenSetCookie("SeleniumTest2", "Set URL service")

settings().Diagnostics:LegacyScriptMode()

game:GetService("InsertService"):SetBaseSetsUrl("<?=$baseUrl?>Game/Tools/InsertAsset.ashx?nsets=10&type=base")
game:GetService("InsertService"):SetUserSetsUrl("<?=$baseUrl?>Game/Tools/InsertAsset.ashx?nsets=20&type=user&userid=%d")
game:GetService("InsertService"):SetCollectionUrl("<?=$baseUrl?>Game/Tools/InsertAsset.ashx?sid=%d")
game:GetService("InsertService"):SetAssetUrl("<?=$baseUrl?>Asset/?id=%d")
game:GetService("InsertService"):SetAssetVersionUrl("<?=$baseUrl?>Asset/?assetversionid=%d")

-- TODO: move this to a text file to be included with other scripts
pcall(function() game:GetService("SocialService"):SetFriendUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=IsFriendsWith&playerid=%d&userid=%d") end)
pcall(function() game:GetService("SocialService"):SetBestFriendUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=IsBestFriendsWith&playerid=%d&userid=%d") end)
pcall(function() game:GetService("SocialService"):SetGroupUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=IsInGroup&playerid=%d&groupid=%d") end)
pcall(function() game:GetService("SocialService"):SetGroupRankUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=GetGroupRank&playerid=%d&groupid=%d") end)
pcall(function() game:GetService("SocialService"):SetGroupRoleUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=GetGroupRole&playerid=%d&groupid=%d") end)
pcall(function() game:GetService("GamePassService"):SetPlayerHasPassUrl("<?=$apiUrl?>Game/GamePass/GamePassHandler.ashx?Action=HasPass&UserID=%d&PassID=%d") end)
pcall(function() game:GetService("MarketplaceService"):SetProductInfoUrl("<?=$apiUrl?>marketplace/productinfo?assetId=%d") end)
--pcall(function() game:GetService("MarketplaceService"):SetDevProductInfoUrl("<?=$apiUrl?>marketplace/productDetails?productId=%d") end)
pcall(function() game:GetService("MarketplaceService"):SetPlayerOwnsAssetUrl("<?=$apiUrl?>ownership/hasasset?userId=%d&assetId=%d") end)
pcall(function() game:SetCreatorID(<?=$creatorId?>, Enum.CreatorType.User) end)

ifSeleniumThenSetCookie("SeleniumTest3", "Set creator ID")

pcall(function() game:SetScreenshotInfo("<?php
if ($placeId > 0) {
echo(urlencode(($place->Name ?? "ROBLONIUM Place").'
A Classic game by '.(getNameFromUid($creatorId) ?? "Player").'
Built in ROBLONIUM, the free online building game. 
https://'.$_SERVER["SERVER_NAME"].'/PlaceItem.aspx?ID='.$placeId.'
More about this level:
'.$place->Description.''));
}
?>") end)
pcall(function() game:SetVideoInfo("") end)

function registerPlay(key)
	if true and game:GetService("CookiesService"):GetCookieValue(key) == "" then
		game:GetService("CookiesService"):SetCookieValue(key, "{ \"userId\" : <?=$userId?>, \"placeId\" : <?=$placeId?>, \"os\" : \"" .. settings().Diagnostics.OsPlatform .. "\" }")
	end
end

pcall(function()
	registerPlay("rbx_evt_ftp")
	delay(60*5, function() registerPlay("rbx_evt_fmp") end)
end)

ifSeleniumThenSetCookie("SeleniumTest4", "Exiting SingleplayerSharedScript")-- SingleplayerSharedScript.lua inserted here --

message.Text = "Loading Place. Please wait..." 
coroutine.yield() 
game:Load("<?=$baseUrl?>Asset/?id=<?=$placeId?>") 

if #"" > 0 then
	visit:SetUploadUrl("")
end

message.Parent = nil

game:GetService("ChangeHistoryService"):SetEnabled(true)

visit:SetPing("<?=$baseUrl?>Game/ClientPresence.ashx?version=old&PlaceID=<?=$placeId?>&LocationType=Studio", 120)
game:HttpGet("<?=$baseUrl?>Game/Statistics.ashx?UserID=<?=$userId?>&AssociatedCreatorID=<?=$creatorId?>&AssociatedCreatorType=User&AssociatedPlaceID=<?=$placeId?>")

<?php
//this is a snippet of code from the coke14 webserver itself
$data = "\n" . ob_get_clean();
$key = file_get_contents("file:///C:/signing/privatekey.pem");
openssl_sign($data, $sig, $key, OPENSSL_ALGO_SHA1);
echo "--rbxsig%" . base64_encode($sig) . "%" . $data;
?>