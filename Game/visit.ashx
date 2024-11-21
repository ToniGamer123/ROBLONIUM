<?php
//All PHP code written by Brent Da Mage
header('Content-Type: text/plain; X-Robots-Tag: noindex');
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/register.php';

// some nice very epic constants :)
$baseUrl = "http://".$_SERVER['SERVER_NAME']."/";
if (!(strpos($_SERVER['SERVER_NAME'], "www.") === FALSE)) {
	$apiUrl = "http://api.".substr($_SERVER['SERVER_NAME'], strpos($_SERVER['SERVER_NAME'], "www.")+4, strlen($_SERVER['SERVER_NAME'])-4)."/";
}else {
	$apiUrl = "http://api.".$_SERVER['SERVER_NAME']."/"; // TODO: should be https in 2013
}

$placeId = (int)($_GET['PlaceID'] ?? $_GET['placeID'] ?? $_GET['placeId'] ?? $_GET['placeid'] ?? 0);
// DEFAULTS
// TODO: implement support for actual users
$userId = $_GET['UserID'] ?? $_GET['userId'];
$user = new User($userId);
if (!isset($userId)) {
	$userId = 0;
}else {
	$userId = (int)$userId < 0 ? rand(-9999, -1) : 0;
}
$memberType = "Enum.MembershipType.None";
if (!isset($user)) {
	$userId = $user->Id;
	$userName = $user->Name;
	// Membership switch
	switch ($user->MembershipLevel) {
		case 1:
			$memberType = "Enum.MembershipType.BuildersClub";
			break;
		case 2:
			$memberType = "Enum.MembershipType.TurboBuildersClub";
			break;
		case 3:
			$memberType = "Enum.MembershipType.OutrageousBuildersClub";
			break;
	}
}else {
	$userName = ($userId < 0) ? "Guest ".(-($userId)) : ($userId > 0 ? "Player ".$userId : "Player");
}

// TODO: implement support for actual places

//coke is very epic
ob_start();
?>
-- Prepended to Edit.lua and Visit.lua and Studio.lua and PlaySolo.lua--

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
pcall(function() game:SetCreatorID(<?=$creatorId ?? 0?>, Enum.CreatorType.User) end)

ifSeleniumThenSetCookie("SeleniumTest3", "Set creator ID")

pcall(function() game:SetScreenshotInfo("<?php
if ($placeId > 0) {
echo(urlencode($placeName ?? "ROBLONIUM Place".'
A '.$placeGenre ?? "Classic".' game by '.$placeCreator ?? "Player".'
Built in ROBLONIUM, the free online building game. 
https://www.'.$_SERVER["SERVER_NAME"].'/games/1818/Classic-Crossroads
More about this level:
The classic ROBLOX level is back!'));
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

pcall(function() settings().Rendering.EnableFRM = true end)
pcall(function() settings()["Task Scheduler"].PriorityMethod = Enum.PriorityMethod.AccumulatedError end)

game:GetService("ChangeHistoryService"):SetEnabled(false)
pcall(function() game:GetService("Players"):SetBuildUserPermissionsUrl("<?=$baseUrl?>Game/BuildActionPermissionCheck.ashx?assetId=<?=$placeId?>&userId=%d&isSolo=true") end)

workspace:SetPhysicsThrottleEnabled(true)

local addedBuildTools = false
local screenGui = game:GetService("CoreGui"):FindFirstChild("RobloxGui")

local inStudio = <?php if ($_SERVER['HTTP_USER_AGENT'] == "RobloxStudio/WinINet") { echo("true");} else { echo("false");}?> or false

function doVisit()
	message.Text = "Loading Game"
	if false then
		if false then
			success, err = pcall(function() game:Load("<?php
if ($placeId > 0) {
	echo($baseUrl."Asset/?id=".$placeId);
}?>") end)
			if not success then
				message.Text = "Could not teleport"
				return
			end
		end
	else
		if <?php if ($_SERVER['HTTP_USER_AGENT'] == "RobloxStudio/WinINet") { echo("true");} else { echo("false");}?> then
			game:Load("<?php
if ($placeId > 0) {
	echo($baseUrl."Asset/?id=".$placeId);
}?>")
			pcall(function() visit:SetUploadUrl("") end)
		else
			pcall(function() visit:SetUploadUrl("") end)
		end
	end

	message.Text = "Running"
	game:GetService("RunService"):Run()

	message.Text = "Creating Player"
	if false then
		player = game:GetService("Players"):CreateLocalPlayer(<?=$userId?>)
		if not inStudio then
			player.Name = [====[<?=$userName?>]====]
		end
	else
		player = game:GetService("Players"):CreateLocalPlayer(<?=$userId?>)
	end
	player.CharacterAppearance = "<?=$baseUrl?>Asset/CharacterFetch.ashx?userId=<?=$userId?>&placeId=<?=$placeId?>"
	local propExists, canAutoLoadChar = false
	propExists = pcall(function()  canAutoLoadChar = game.Players.CharacterAutoLoads end)

	if (propExists and canAutoLoadChar) or (not propExists) then
		player:LoadCharacter()
	end
	
	message.Text = "Setting GUI"
	player:SetSuperSafeChat(true)
	pcall(function() player:SetUnder13(True) end)
	pcall(function() player:SetMembershipType(<?=$memberType?>) end)
	pcall(function() player:SetAccountAge(0) end)
	<?php if ($userId > 0) {echo('settings().FastLogSettings:SetVariable("UseLuaChat", true)');}?>
	if not inStudio and false then
		message.Text = "Setting Ping"
		visit:SetPing("<?=$baseUrl?>Game/ClientPresence.ashx?version=old&PlaceID=<?=$placeId?>", 120)

		message.Text = "Sending Stats"
		game:HttpGet("<?=$baseUrl?>Game/Statistics.ashx?UserID=<?=$userId?>&AssociatedCreatorID=<?=$creatorId?>&AssociatedCreatorType=User&AssociatedPlaceID=<?=$placeId?>")
	end
	
end

success, err = pcall(doVisit)

if not inStudio and not addedBuildTools then
	local playerName = Instance.new("StringValue")
	playerName.Name = "PlayerName"
	playerName.Value = player.Name
	playerName.RobloxLocked = true
	playerName.Parent = screenGui
				
	pcall(function() game:GetService("ScriptContext"):AddCoreScript(27,screenGui,"BuildToolsScript") end)
	addedBuildTools = true
end

if success then
	message.Parent = nil
else
	print(err)
	if not inStudio then
		if false then
			pcall(function() visit:SetUploadUrl("") end)
		end
	end
	wait(5)
	message.Text = "Error on visit: " .. err
	if not inStudio then
		if false then
			game:HttpPost("<?=$baseUrl?>Error/Lua.ashx?", "Visit.lua: " .. err)
		end
	end
end


<?php
//this is a snippet of code from the coke14 webserver itself
$data = "\n" . ob_get_clean();
$key = file_get_contents("file:///C:/signing/privatekey.pem");
openssl_sign($data, $sig, $key, OPENSSL_ALGO_SHA1);
echo "--rbxsig%" . base64_encode($sig) . "%" . $data;
?>