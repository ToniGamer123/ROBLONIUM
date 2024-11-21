<?php
//All PHP code written by Brent Da Mage
header('Content-Type: text/plain; X-Robots-Tag: noindex');
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/database.php';
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/register.php';

$baseUrl = "http://".$_SERVER['SERVER_NAME']."/";
if (!(strpos($_SERVER['SERVER_NAME'], "www.") === FALSE)) {
	$apiUrl = "http://api.".substr($_SERVER['SERVER_NAME'], strpos($_SERVER['SERVER_NAME'], "www.")+4, strlen($_SERVER['SERVER_NAME'])-4)."/";
}else {
	$apiUrl = "http://api.".$_SERVER['SERVER_NAME']."/"; // TODO: should be https in 2013
}

if ($_GET['json'] !== null and $_GET['json'] !== '' and $_GET['json'] !== false) {
	$placeId = $_GET['placeid'] ?? 0; //bruh I should've been doing this all along for so, so, so, sooo many things. E
	$userId = $_GET['userID'] ?? -1;
	$userId = (int)$userId;
	if ($userId > 0) {
		$GLOBALS['Id'] = $userId;
		$user = new UserInf();
		$userId = (int)$user->Id ?? rand(-9999, -1);
	} else {
		$userId = rand(-9999, -1);
	}
	$joinscript = [
   "ClientPort" => 0, 
   "MachineAddress" => $_GET['server'] ?? "127.0.0.1", 
   "ServerPort" => $_GET['serverPort'] ?? 53640, 
   "PingUrl" => "", 
   "PingInterval" => 120, 
   "UserName" => $user->Name ?? ("Guest " . ($userId - ($userId * 2))), 
   "SeleniumTestMode" => false, 
   "UserId" => $userId, 
   "RobloxLocale" => "en_us", 
   "GameLocale" => "en_us", 
   "SuperSafeChat" => ($userId > 0) ? false : true, 
   "CharacterAppearance" => "http://api.".$_SERVER['SERVER_NAME']."/v1.1/avatar-fetch/?placeId=".$placeId."&userId=".$userId, 
   "ClientTicket" => "", 
   "NewClientTicket" => "", 
   "GameId" => "00000000-0000-0000-0000-000000000000", 
   "PlaceId" => $placeId, 
   "MeasurementUrl" => "", 
   "WaitingForCharacterGuid" => "00000000-0000-0000-0000-000000000000", 
   "BaseUrl" => $baseUrl, 
   "ChatStyle" => "Classic", 
   "VendorId" => 0, 
   "ScreenShotInfo" => "", 
   "VideoInfo" => "", 
   "CreatorId" => 0, 
   "CreatorTypeEnum" => "User", 
   "MembershipType" => "None", 
   "AccountAge" => 0, 
   "CookieStoreFirstTimePlayKey" => "rbx_evt_ftp", 
   "CookieStoreFiveMinutePlayKey" => "rbx_evt_fmp", 
   "CookieStoreEnabled" => true, 
   "IsRobloxPlace" => false, 
   "GenerateTeleportJoin" => ($_GET['isTeleport'] !== 'true') ? false : true, 
   "IsUnknownOrUnder13" => ($userId > 0) ? false : true, 
   "GameChatType" => "NoOne", 
   "SessionId" => '{"SessionId":"00000000-0000-0000-0000-000000000000","GameId":"00000000-0000-0000-0000-000000000000","PlaceId":'.$placeId.',"ClientIpAddress":"'.$_SERVER['REMOTE_ADDR'].'","PlatformTypeId":5,"SessionStarted":"2013-12-4T4:20:00.0000000Z","BrowserTrackerId":0,"PartyId":null,"Age":null,"Latitude":null,"Longitude":null,"CountryId":1,"PolicyCountryId":null,"LanguageId":null,"BlockedPlayerIds":null,"JoinType":"Unknown","PlaySessionFlags":0}', 
   "AnalyticsSessionId" => "00000000-0000-0000-0000-000000000000", 
   "DataCenterId" => 0, 
   "UniverseId" => 0, 
   "BrowserTrackerId" => 0, 
   "UsePortraitMode" => false, 
   "FollowUserId" => 0, 
   "characterAppearanceId" => 0, 
   "CountryCode" => "US" 
];
$data = json_encode($joinscript, JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
if ($_GET['nosig'] !== null and $_GET['nosig'] !== '' and $_GET['nosig'] !== false) {
	die($data);
}
$data = "
" . $data;
$key = file_get_contents("file:///C:/signing/privatekey.pem");
openssl_sign($data, $sig, $key, OPENSSL_ALGO_SHA1);
die("--rbxsig%" . base64_encode($sig) . "%" . $data);
}
// DEFAULTS
$userId = ($_GET['UserID'] == "0" and $_GET['server'] == "localhost") ? -1 : rand(-9999, -1);
$userName = ($userId < 0) ? "Guest ".(-($userId)) : "Player ".$userId;
$memberType = "Enum.MembershipType.None";

$placeId = -1;

// replace all variables with the proper value
$server = ($_GET["server"] !== null and (substr_count($_GET['server'], '.') == 3 or $_GET["server"] == "localhost")) ? $_GET['server'] : "localhost";
$port = ($_GET["serverPort"] !== null && $_GET["serverPort"] !== 0) ? $_GET["serverPort"] : 53640;

if (!isset($_GET["UserID"]) or $_GET["UserID"] == null) {
	$GLOBALS['UserName'] = $_GET["UserName"];
	$pname = new idfromuser($inf['user']);
	$GLOBALS['id'] = $pname->Id;
}else {
	$GLOBALS['id'] = $_GET['UserID'];
}
$privateuser = new privateuser($inf['privateuser']);
// FIX THIS IF STATEMENT
if ((!isset($_GET["UserID"]) and !isset($_GET["UserName"])) or ($_GET["UserID"] == null and $_GET["UserName"] == null)) {
	die("I'm calling out from Scatland
I'm calling out from Scatman's world
If you wanna break free you better listen to me
You got to learn how to see in your fantasy
I'm calling out from Scatland
I'm calling out from Scatman's world
If you wanna break free you better listen to me
You got to learn how to see in your fantasy
Everybody's talkin' something very shockin' just to
Keep on blockin' what they're feelin' inside 
But listen to me brother, you just keep on walkin' 'cause
You and me and sister ain't got nothin' to hide
Scatman, fat man, black and white and brown man
Tell me 'bout the colour of your soul
If part of your solution isn't ending the pollution
Then I don't want to hear your stories told
I want to welcome you to Scatman's world
I'm calling out from Scatland
I'm calling out from Scatman's world
If you wanna break free you better listen to me
You got to learn how to see in your fantasy
Everyone's born to compete as he chooses
But how can someone win if winning means that someone loses
I sit and see and wonder what it's like to be in touch
No wonder all my brothers and my sisters need a crutch
I want to be a human being not a human doing
I couldn't keep that pace up if I tried
The source of my intention really isn't crime prevention
My intention is prevention of the lie, yeah
Welcome to the Scatman's world
I'm calling out from Scatland
I'm calling out from Scatman's world
If you wanna break free you better listen to me
You got to learn how to see in your fantasy
I'm calling out from Scatland
I'm calling out from Scatman's world
If you wanna break free you better listen to me
You got to learn how to see in your fantasy
Listen to me
I'm calling out from Scatland
I'm calling out from Scatman's world
If you wanna break free you better listen to me
You got to learn how to see in your fantasy");
}
if (((!isset($_GET["UserID"]) and !isset($_GET["UserName"])) or ($_GET["UserID"] == null and $_GET["UserName"] == null) or getRealIpAddr() !== $privateuser->recentip)/* and $_GET["UserName"] !== "jacobman12"*/) {
	$user = null;
	/*if (getRealIpAddr() !== $privateuser->recentip) {
		die(getRealIpAddr()."|".$privateuser->recentip);
	}else{
		die("idk");
	}*/
}else {
if (isset($_GET["UserID"]) and $_GET['UserID'] !== nil) {
	$GLOBALS['Id'] = $_GET['UserID'];
}else {
	$GLOBALS['Id'] = $GLOBALS['id'];
}
$user = new UserInf($inf['user']);
if ($user->Id == null) {
	$user = null;
	if ($_GET["UserID"] == 0) {
	$userinfo["Name"] = "Player";
	$userinfo["Id"] = 0;
	$userinfo["MembershipLevel"] = 0;
}
	}
}
if ($user !== null) {
$userName = $user->Name;

$memberType = "Enum.MembershipType.None";
// Membership values
$NBC = "Enum.MembershipType.None";
$BC = "Enum.MembershipType.BuildersClub";
$TBC = "Enum.MembershipType.TurboBuildersClub";
$OBC = "Enum.MembershipType.OutrageousBuildersClub";
if ($user->MembershipLevel == 1) {
	$memberType = $BC;
}
if ($user->MembershipLevel == 2) {
	$memberType = $TBC;
}
if ($user->MembershipLevel == 3) {
	$memberType = $OBC;
}
//charapp
$charApp = $baseUrl."Asset/CharacterFetch.ashx?userId=" . $user->Id;
$userId = $user->Id;
$SSC = false;
} else {
$charApp = $baseUrl."Asset/CharacterFetch.ashx?userId=" . $userId;
$SSC = true;
}

//coke is very epic
ob_start();
?>
--[[ Copyleft 2018-2020 ROBLONIUM Developers, All Epicness Reserved ]]--

local forceVersion = false
local devMode = false
if ((version() ~= "2013. 12. 4. 1" and version() ~= "?") or not string.find(Game:GetService('ContentProvider').BaseUrl, "roblonium.com")) and forceVersion == true then
game:SetMessage("ROBLONIUM version is out of date. Please uninstall and try again.")
print('Error: Unexpected BaseUrl "' .. Game:GetService('ContentProvider').BaseUrl .. '"')
else

-- functions --------------------------
function onPlayerAdded(player)
	-- override
end



-- MultiplayerSharedScript.lua inserted here ------ Prepended to Join.lua --

-- log app init time
pcall(function()
	local t = ElapsedTime()
	local platform = settings().Diagnostics.OsPlatform
	game:HttpGet("<?=$baseUrl?>Game/JoinRate.ashx?st=0&i=<?=$userId?>&p=<?=$placeId?>&c=GameAppInit&r=Success&d=" .. (math.floor(t*1000)) .. "&ip=<?=$server?>&errorType=&platform=" .. platform, false)
end)

pcall(function() game:SetPlaceID(<?=$placeId?>, false) end)

local startTime = tick()
local connectResolved = false
local loadResolved = false
local joinResolved = false
local playResolved = true
local playStartTime = 0

local cdnSuccess = 0
local cdnFailure = 0

-- if we are on a touch device, no blocking http calls allowed! This can cause a crash on iOS
-- In general we need a long term strategy to remove blocking http calls from all platforms
local isTouchDevice = Game:GetService("UserInputService").TouchEnabled

settings()["Game Options"].CollisionSoundEnabled = true
pcall(function() settings().Rendering.EnableFRM = true end)
pcall(function() settings().Physics.Is30FpsThrottleEnabled = true end)
pcall(function() settings()["Task Scheduler"].PriorityMethod = Enum.PriorityMethod.AccumulatedError end)
pcall(function() settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.DefaultAuto end)

function reportContentProvider(time, queueLength, blocking)
	pcall(function()
		game:HttpGet("<?=$baseUrl?>Analytics/ContentProvider.ashx?t=" .. time .. "&ql=" .. queueLength, blocking and not isTouchDevice)
	end)
end
function reportCdn(blocking)
	pcall(function()
		local newCdnSuccess = settings().Diagnostics.CdnSuccessCount
		local newCdnFailure = settings().Diagnostics.CdnFailureCount
		local successDelta = newCdnSuccess - cdnSuccess
		local failureDelta = newCdnFailure - cdnFailure
		cdnSuccess = newCdnSuccess
		cdnFailure = newCdnFailure
		if successDelta > 0 or failureDelta > 0 then
			game:HttpGet("<?=$baseUrl?>Game/Cdn.ashx?source=client&success=" .. successDelta .. "&failure=" .. failureDelta, blocking and not isTouchDevice)
		end
	end)
end

function reportDuration(category, result, duration, blocking,errorType)
	if not errorType then
		errorType = ''
	end
	local platform = settings().Diagnostics.OsPlatform
	local bytesReceived = -1
	if stats().Network:getChildren()[2] ~= nil then
		bytesReceived = stats().Network:getChildren()[2].Stats.totalBytesReceived:GetValue()
	end
	pcall(function() game:HttpGet("<?=$baseUrl?>Game/JoinRate.ashx?st=0&i=<?=$userId?>&p=<?=$placeId?>&c=" .. category .. "&r=" .. result .. "&d=" .. (math.floor(duration*1000)) .. "&b=" .. bytesReceived .. "&ip=<?=$server?>&errorType=" .. errorType .. "&platform=" .. platform, blocking and not isTouchDevice) end)
end
-- arguments ---------------------------------------
local threadSleepTime = ...

if threadSleepTime==nil then
	threadSleepTime = 15
end

local test = true

print("! Joining game '<?=$gameId ?? ""?>' place <?=$placeId?> at <?=$server?>")
local closeConnection = game.Close:connect(function() 
	if 0 then
		reportCdn(true)
		if not connectResolved then
			local duration = tick() - startTime;
			reportDuration("GameConnect", "Failure", duration, true)
		elseif (not loadResolved) or (not joinResolved) then
			local duration = tick() - startTime;
			if not loadResolved then
				loadResolved = true
				reportDuration("GameLoad","Cancel", duration, true)
			end
			if not joinResolved then
				joinResolved = true
				reportDuration("GameJoin","Cancel", duration, true)
			end
		elseif not playResolved then
			local duration = tick() - playStartTime;
			playResolved = true
			reportDuration("GameDuration","Success", duration, true)
		end
		if true then pcall(function() game:HttpPost("<?=$apiUrl?>auth/invalidate", "invalidate") end) end
	end
	<?php if ($_GET['debug'] == "1" or $_GET['debug'] == "true") { echo('pcall(function() game:HttpPost("'.$baseUrl.'Analytics/Log.ashx?platform=" .. settings().Diagnostics.OsPlatform .. "&userId='.$userId.'", game:GetService("LogService"):GetLogHistory()) end)'); }?>
end)

game:GetService("ChangeHistoryService"):SetEnabled(false)
game:GetService("ContentProvider"):SetThreadPool(16)
game:GetService("InsertService"):SetBaseSetsUrl("<?=$baseUrl?>Game/Tools/InsertAsset.ashx?nsets=10&type=base")
game:GetService("InsertService"):SetUserSetsUrl("<?=$baseUrl?>Game/Tools/InsertAsset.ashx?nsets=20&type=user&userid=%d")
game:GetService("InsertService"):SetCollectionUrl("<?=$baseUrl?>Game/Tools/InsertAsset.ashx?sid=%d")
game:GetService("InsertService"):SetAssetUrl("<?=$baseUrl?>Asset/?id=%d")
game:GetService("InsertService"):SetAssetVersionUrl("<?=$baseUrl?>Asset/?assetversionid=%d")

pcall(function() game:GetService("SocialService"):SetFriendUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=IsFriendsWith&playerid=%d&userid=%d") end)
pcall(function() game:GetService("SocialService"):SetBestFriendUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=IsBestFriendsWith&playerid=%d&userid=%d") end)
pcall(function() game:GetService("SocialService"):SetGroupUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=IsInGroup&playerid=%d&groupid=%d") end)
pcall(function() game:GetService("SocialService"):SetGroupRankUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=GetGroupRank&playerid=%d&groupid=%d") end)
pcall(function() game:GetService("SocialService"):SetGroupRoleUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=GetGroupRole&playerid=%d&groupid=%d") end)
pcall(function() game:GetService("GamePassService"):SetPlayerHasPassUrl("<?=$baseUrl?>Game/GamePass/GamePassHandler.ashx?Action=HasPass&UserID=%d&PassID=%d") end)
pcall(function() game:GetService("MarketplaceService"):SetProductInfoUrl("<?=$apiUrl?>marketplace/productinfo?assetId=%d") end)
pcall(function() game:GetService("MarketplaceService"):SetPlayerOwnsAssetUrl("<?=$apiUrl?>ownership/hasasset?userId=%d&assetId=%d") end)
pcall(function() game:SetCreatorID(<?=$creatorId ?? 0?>, Enum.CreatorType.User) end)

-- Bubble chat.  This is all-encapsulated to allow us to turn it off with a config setting
--Classic, Bubble, ClassicAndBubble
pcall(function() game:GetService("Players"):SetChatStyle(Enum.ChatStyle.ClassicAndBubble) end)

local waitingForCharacter = false
local waitingForCharacterGuid = "86cadbcc-3b8b-493e-8d7b-4b103ae914e9";
pcall( function()
	if settings().Network.MtuOverride == 0 then
	  settings().Network.MtuOverride = 1400
	end
end)


-- globals -----------------------------------------

client = game:GetService("NetworkClient")
visit = game:GetService("Visit")

-- functions ---------------------------------------
function ifSeleniumThenSetCookie(key, value)
	if false then
		game:GetService("CookiesService"):SetCookieValue(key, value)
	end
end

function setMessage(message)
	-- todo: animated "..."
	if not false then
		game:SetMessage(message)
	else
		-- hack, good enought for now
		game:SetMessage("Teleporting ...")
	end
end

function showErrorWindow(message, errorType, errorCategory)
	if 0 then
		if (not loadResolved) or (not joinResolved) then
			local duration = tick() - startTime;
			if not loadResolved then
				loadResolved = true
				reportDuration("GameLoad","Failure", duration, false,errorType)
			end
			if not joinResolved then
				joinResolved = true
				reportDuration("GameJoin",errorCategory, duration, false,errorType)
			end
			
			pcall(function() game:HttpGet("?FilterName=Type&FilterValue=" .. errorType .. "&Type=JoinFailure", false) end)
		elseif not playResolved then
			local duration = tick() - playStartTime;
			playResolved = true
			reportDuration("GameDuration",errorCategory, duration, false,errorType)

			pcall(function() game:HttpGet("?FilterName=Type&FilterValue=" .. errorType .. "&Type=GameDisconnect", false) end)
		end
	end
	
	game:SetMessage(message)
end

function registerPlay(key)
	if true and game:GetService("CookiesService"):GetCookieValue(key) == "" then
		game:GetService("CookiesService"):SetCookieValue(key, "{ \"userId\" : <?=$userId?>, \"placeId\" : <?=$placeId?>, \"os\" : \"" .. settings().Diagnostics.OsPlatform .. "\" }")
	end
end

function analytics(name)
	if not test and false then 
		pcall(function() game:HttpGet("?IPFilter=Primary&SecondaryFilterName=UserId&SecondaryFilterValue=0&Type=" .. name, false) end)
	end
end

function analyticsGuid(name, guid)
	if not test and false then 
		pcall(function() game:HttpGet("?IPFilter=Primary&SecondaryFilterName=guid&SecondaryFilterValue=" .. guid .. "&Type=" .. name, false) end)
	end
end

function reportError(err, message)
	print("***ERROR*** " .. err)
	if not test then visit:SetUploadUrl("") end
	client:Disconnect()
	wait(4)
	showErrorWindow("Error: " .. err, message, "Other")
end

-- called when the client connection closes
function onDisconnection(peer, lostConnection)
	if lostConnection then
	    if waitingForCharacter then analyticsGuid("Waiting for Character Lost Connection",waitingForCharacterGuid) end
		showErrorWindow("You have lost the connection to the game", "LostConnection", "LostConnection")
	else
	    if waitingForCharacter then analyticsGuid("Waiting for Character Game Shutdown",waitingForCharacterGuid) end
		showErrorWindow("This game has shut down", "Kick", "Kick")
	end
	pcall(function() game:HttpGet("&disconnect=true", true) end)
	if true then pcall(function() game:HttpPost("<?=$apiUrl?>auth/invalidate", "invalidate") end) end
end

function requestCharacter(replicator)
	
	-- prepare code for when the Character appears
	local connection
	connection = player.Changed:connect(function (property)
		if property=="Character" then
			game:ClearMessage()
			waitingForCharacter = false
			analyticsGuid("Waiting for Character Success", waitingForCharacterGuid)
			
			connection:disconnect()
		
			if 0 then
				if not joinResolved then
					local duration = tick() - startTime;
					joinResolved = true
					reportDuration("GameJoin","Success", duration, false)
					
					playStartTime = tick()
					playResolved = false
				end
			end
		end
	end)
	
	setMessage("Requesting character")
	
	if 0 and not loadResolved then
		local duration = tick() - startTime;
		loadResolved = true
		reportDuration("GameLoad","Success", duration, false)
	end

	local success, err = pcall(function()	
		replicator:RequestCharacter()
		setMessage("Waiting for character")
		waitingForCharacter = true
		analyticsGuid("Waiting for Character Begin",waitingForCharacterGuid);
	end)
	if not success then
		reportError(err,"W4C")
		return
	end
end

-- called when the client connection is established
function onConnectionAccepted(url, replicator)
	connectResolved = true
	reportDuration("GameConnect", "Success", tick() - startTime, false)

	local waitingForMarker = true
	
	local success, err = pcall(function()	
		if not test then 
		    visit:SetPing("", 300) 
		end
		
		if not false then
			game:SetMessageBrickCount()
		else
			setMessage("Teleporting ...")
		end

		replicator.Disconnection:connect(onDisconnection)
		
		-- Wait for a marker to return before creating the Player
		local marker = replicator:SendMarker()
		
		marker.Received:connect(function()
			waitingForMarker = false
			requestCharacter(replicator)
		end)
	end)
	
	if not success then
		reportError(err,"ConnectionAccepted")
		return
	end
	
	-- TODO: report marker progress
	
	while waitingForMarker do
		workspace:ZoomToExtents()
		wait(0.5)
	end
end

-- called when the client connection fails
function onConnectionFailed(_, error)
	showErrorWindow("Failed to connect to the Game. (ID=" .. error .. ")", "ID" .. error, "Other")
	--game:HttpPost("<?=$baseUrl?>Analytics/Log.ashx?platform=" .. settings().Diagnostics.OsPlatform .. "&userId=<?=$userId?>", "gaming")
end

-- called when the client connection is rejected
function onConnectionRejected()
	connectionFailed:disconnect()
	showErrorWindow("This game is not available. Please try another", "WrongVersion", "WrongVersion")
end

idled = false
function onPlayerIdled(time)
	if time > 20*60 then
		showErrorWindow(string.format("You were disconnected for being idle %d minutes", time/60), "Idle", "Idle")
		client:Disconnect()
		if not idled then
			idled = true
		end
	end
end


-- main ------------------------------------------------------------

analytics("Start Join Script")

ifSeleniumThenSetCookie("SeleniumTest1", "Started join script")

pcall(function() settings().Diagnostics:LegacyScriptMode() end)
local success, err = pcall(function()	

	game:SetRemoteBuildMode(true)
	
	setMessage("Connecting to Server")
	client.ConnectionAccepted:connect(onConnectionAccepted)
	client.ConnectionRejected:connect(onConnectionRejected)
	connectionFailed = client.ConnectionFailed:connect(onConnectionFailed)
	client.Ticket = "<?=$authTicket ?? ""?>"	
	ifSeleniumThenSetCookie("SeleniumTest2", "Successfully connected to server")
	
	playerConnectSucces, player = pcall(function() return client:PlayerConnect(<?=$userId?>, "<?=$server?>", <?=$port?>, 0, threadSleepTime) end)
	if not playerConnectSucces then
		--Old player connection scheme
		player = game:GetService("Players"):CreateLocalPlayer(<?=$userId?>)
		analytics("Created Player")
		client:Connect("<?=$server?>", <?=$port?>, 0, threadSleepTime)
	else
		analytics("Created Player")
	end

	pcall(function()
		registerPlay("rbx_evt_ftp")
		delay(60*5, function() registerPlay("rbx_evt_fmp") end)
	end)

	-- negotiate an auth token
	if true then
		pcall(function() game:HttpPost("<?=$apiUrl?>auth/negotiate?ticket=", "negotiate") end)
		delay(300, function()
			while true do
				pcall(function() game:HttpPost("<?=$apiUrl?>auth/renew", "renew") end)
				wait(300)
			end
		end)
	end

	player:SetSuperSafeChat(<?php if ($SSC === TRUE) {echo("true");}else {echo("false");}?>)
	pcall(function() player:SetUnder13(false) end)
	pcall(function() player:SetMembershipType(<?=$memberType?>) end)
	pcall(function() player:SetAccountAge(200) end)
	player.Idled:connect(onPlayerIdled)
	<?php if ($userId > 0) {echo('pcall(function() settings().FastLogSettings:SetVariable("UseLuaChat", true) end)');}?>
	-- Overriden
	onPlayerAdded(player)
	
	pcall(function() player.Name = [========[<?=$userName?>]========] end)
	player.CharacterAppearance = "<?=$charApp?>"	
	if not test then visit:SetUploadUrl("")end
	
	analytics("Connect Client")
		
end)

if not success then
	reportError(err,"CreatePlayer")
end

ifSeleniumThenSetCookie("SeleniumTest3", "Successfully created player")

if not test then
	-- TODO: Async get?
	loadfile("")("", <?=$placeId?>, <?=$userId?>)
end

if 0 then
 delay(60*5, function()
	while true do
		reportCdn(false)
		wait(60*5)
	end
 end)
 local cpTime = 30
 delay(cpTime, function()
    while cpTime <= 480 do 
	   reportContentProvider(cpTime, game:GetService("ContentProvider").RequestQueueSize, false)
       wait(cpTime)
       cpTime = cpTime * 2
    end
 end) 
end

--PS Scripts
if workspace:FindFirstChild("IsPersonalServer") ~= nil then
game:GetService("ScriptContext"):AddCoreScript(27, scriptContext,"CoreScripts/BuildToolsScripts/BuildToolManager")
end
game:GetService("InsertService"):SetTrustLevel(0) --I have no idea what to set this to

pcall(function() game:SetScreenshotInfo("") end)
pcall(function() game:SetVideoInfo('<?xml version="1.0"?><entry xmlns="http://www.w3.org/2005/Atom" xmlns:media="http://search.yahoo.com/mrss/" xmlns:yt="http://gdata.youtube.com/schemas/2007"><media:group><media:title type="plain"><![CDATA[ROBLOX Place]]></media:title><media:description type="plain"><![CDATA[ For more games visit http://www.roblox.com]]></media:description><media:category scheme="http://gdata.youtube.com/schemas/2007/categories.cat">Games</media:category><media:keywords>ROBLOX, video, free game, online virtual world</media:keywords></media:group></entry>') end)
-- use single quotes here because the video info string may have unescaped double quotes

analytics("Join Finished")

ifSeleniumThenSetCookie("SeleniumTest4", "Finished join")

end
<?php
//this is a snippet of code from the coke14 webserver itself
$data = ob_get_clean();

if ($_GET['debug'] == "1" or $_GET['debug'] == "true") { //if newer client versions are failing, try disabling debug mode as FastLogSettings was removed from later builds
	$debugList = 'local devMode = true
------------------- DEBUG VARIABLES ----------------------------
--if _G.supportsVersion(2013, 8, 6) then
pcall(function() settings().FastLogSettings:SetVariable("Network", 7) end)
pcall(function() settings().FastLogSettings:SetVariable("NetworkJoin", 7) end)
pcall(function() settings().FastLogSettings:SetVariable("NetworkReadItem", 7) end)
pcall(function() settings().FastLogSettings:SetVariable("NetworkInstances", 7) end)
pcall(function() settings().FastLogSettings:SetVariable("NetworkPacketsReceive", 7) end)
--end

--if _G.supportsVersion(2014, 5, 7) then
pcall(function() settings().Network.printBits = true end)
--end
--these have been around for a very long time
settings().Network.PrintProperties = true
settings().Network.PrintInstances = true
settings().Network.PrintEvents = true

--pcall(function() settings().Network.PhysicsSend = Enum.PhysicsSendMethod.TopNErrors end)
pcall(function() print("PhysicsSend: " .. settings().Network.PhysicsSend.Name) end)
if settings().Network.PrintProperties == true then
	print("settings().Network.PrintProperties: true")
else
	print("settings().Network.PrintProperties: false")
end
pcall(function() print("ExperimentalPhysicsEnabled: " .. settings().Network.ExperimentalPhysicsEnabled) end)

------------------- END DEBUG VARIABLES ------------------------
	';
	$data = str_replace("local devMode = false", $debugList, $data);
}

if ($_GET['nosig'] !== null and $_GET['nosig'] !== '' and $_GET['nosig'] !== false) {
	die($data);
}

$data = "\n" . $data;
$key = file_get_contents("file:///C:/signing/privatekey.pem");
openssl_sign($data, $sig, $key, OPENSSL_ALGO_SHA1);
echo "--rbxsig%" . base64_encode($sig) . "%" .  $data;
?>