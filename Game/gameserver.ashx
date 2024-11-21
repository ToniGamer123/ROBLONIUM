<?php
header('Content-Type: text/plain; X-Robots-Tag: noindex');
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/database.php';
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/register.php';
//coke is very epic
ob_start();
?>
--Written by Brent Da Mage--

--Start Game Script Arguments--
local placeId, port, sleeptime, access, url, killID, deathID, timeout, autosaveInterval, locationID, groupBuild, machineAddress, gsmInterval, gsmUrl, maxPlayers, maxSlotsUpperLimit, maxSlotsLowerLimit, gsmAccess, injectScriptAssetID, servicesUrl, permissionsServiceUrl, apiKey, libraryRegistrationScriptAssetID, isPersonalServer, ownerId = ...
if placeId ~= nil then
	placeId = (placeId <= 0 and 1818 or placeId) --the default was zero which was sending a lot of games into debug mode
else
	placeId = 1818
end
maxPlayers = maxPlayers or 40
port = port or 53640
libraryRegistrationScriptAssetID =  2
injectScriptAssetID = (isPersonalServer and access) and 25 or nil --or 1
--TODO: remove isPersonalServer and just set injectScriptAssetID based on variables on the server-side
killID, deathID = true
sleeptime = 50 or sleeptime
timeout = 30 or timeout
servicesUrl = "http://sitetest1.roblonium.com" or servicesUrl
url = "http://sitetest1.roblonium.com" or url
isPersonalServer = 0 or isPersonalServer


-- Parameter Implementer --
-- 1273 Rockefeller Street --

function printGS(message)
	if access and game.JobId ~= nil then
		print("GS (" .. game.JobId .. "): " .. message)
	end
end
function postStatus(statusId)
	local url = game:GetService("ContentProvider").BaseUrl .. "/Analytics/Measurement.ashx?Type=Game.Server.Status&IPFilter=primary&SecondaryFilterName=PlaceId&SecondaryFilterValue=" .. tostring(placeId);
	if access and game.JobId ~= nil then
		game:HttpPost(url, tostring(statusId), false)
	endf
end

-- StartGame -- 

printGS("Starting game server with place ID " .. placeId .. "...")

-- Custom Script --
if isPersonalServer == true or isPersonalServer == 1 and not access then
print("Adding PS scripts...")
game:GetService("ScriptContext"):AddCoreScript(25, scriptContext,"CoreScripts/BuildToolsScripts/PersonalServerScript")
end
--pcall(function() game:GetService("ScriptContext"):AddStarterScript(injectScriptAssetID) end)
game:GetService("RunService"):Run()



-- REQUIRES: StartGanmeSharedArgs.txt
-- REQUIRES: MonitorGameStatus.txt

------------------- UTILITY FUNCTIONS --------------------------

local cdnSuccess = 0
local cdnFailure = 0

function reportCdn(blocking)
	pcall(function()
		local newCdnSuccess = settings().Diagnostics.CdnSuccessCount
		local newCdnFailure = settings().Diagnostics.CdnFailureCount
		local successDelta = newCdnSuccess - cdnSuccess
		local failureDelta = newCdnFailure - cdnFailure
		cdnSuccess = newCdnSuccess
		cdnFailure = newCdnFailure
		if successDelta > 0 or failureDelta > 0 then
			game:HttpGet("{17}/Game/Cdn.ashx?source=server&success=" .. successDelta .. "&failure=" .. failureDelta, blocking)
		end
	end)
end

function waitForChild(parent, childName)
	while true do
		local child = parent:findFirstChild(childName)
		if child then
			return child
		end
		parent.ChildAdded:wait()
	end
end

-- returns the player object that killed this humanoid
-- returns nil if the killer is no longer in the game
function getKillerOfHumanoidIfStillInGame(humanoid)

	-- check for kill tag on humanoid - may be more than one - todo: deal with this
	local tag = humanoid:findFirstChild("creator")

	-- find player with name on tag
	if tag then
		local killer = tag.Value
		if killer.Parent then -- killer still in game
			return killer
		end
	end

	return nil
end

-- send kill and death stats when a player dies
function onDied(victim, humanoid)
	local killer = getKillerOfHumanoidIfStillInGame(humanoid)
	local victorId = 0
	if killer then
		victorId = killer.userId
		print("STAT: kill by " .. victorId .. " of " .. victim.userId)
		game:HttpGet(url .. "/Game/Knockouts.ashx?UserID=" .. victorId .. "&" .. access)
	end
	print("STAT: death of " .. victim.userId .. " by " .. victorId)
	game:HttpGet(url .. "/Game/Wipeouts.ashx?UserID=" .. victim.userId .. "&" .. access)
end

-----------------------------------END UTILITY FUNCTIONS -------------------------

-----------------------------------"CUSTOM" SHARED CODE----------------------------------

pcall(function() settings().Network.UseInstancePacketCache = true end)
pcall(function() settings().Network.UsePhysicsPacketCache = true end)
--pcall(function() settings()["Task Scheduler"].PriorityMethod = Enum.PriorityMethod.FIFO end)
pcall(function() settings()["Task Scheduler"].PriorityMethod = Enum.PriorityMethod.AccumulatedError end)

--settings().Network.PhysicsSend = 1 -- 1==RoundRobin
settings().Network.PhysicsSend = Enum.PhysicsSendMethod.ErrorComputation2
settings().Network.ExperimentalPhysicsEnabled = true
settings().Network.WaitingForCharacterLogRate = 100
pcall(function() settings().Diagnostics:LegacyScriptMode() end)

-----------------------------------START GAME SHARED SCRIPT------------------------------

local assetId = placeId -- might be able to remove this now

local scriptContext = game:GetService('ScriptContext')
--pcall(function() scriptContext:AddStarterScript(libraryRegistrationScriptAssetID) end) --37801172
scriptContext.ScriptsDisabled = true

--W
--T
--B
--C
game:SetPlaceID(assetId, false)
game:GetService("ChangeHistoryService"):SetEnabled(false)

-- establish this peer as the Server
local ns = game:GetService("NetworkServer")

if url~=nil then
	pcall(function() game:GetService("Players"):SetAbuseReportUrl(url .. "/AbuseReport/InGameChatHandler.ashx") end)
	pcall(function() game:GetService("ScriptInformationProvider"):SetAssetUrl(url .. "/Asset/") end)
	pcall(function() game:GetService("ContentProvider"):SetBaseUrl(url .. "/") end)
	pcall(function() game:GetService("Players"):SetChatFilterUrl(url .. "/Game/ChatFilter.ashx") end)

	if placeId ~= nil then
	game:GetService("BadgeService"):SetPlaceId(placeId)
	end
	if access~=nil then
		game:GetService("BadgeService"):SetAwardBadgeUrl(url .. "/Game/Badge/AwardBadge.ashx?UserID=%d&BadgeID=%d&PlaceID=%d&" .. access)
		game:GetService("BadgeService"):SetHasBadgeUrl(url .. "/Game/Badge/HasBadge.ashx?UserID=%d&BadgeID=%d&" .. access)
		game:GetService("BadgeService"):SetIsBadgeDisabledUrl(url .. "/Game/Badge/IsBadgeDisabled.ashx?BadgeID=%d&PlaceID=%d&" .. access)

		game:GetService("FriendService"):SetMakeFriendUrl(servicesUrl .. "/Friend/CreateFriend?firstUserId=%d&secondUserId=%d&" .. access)
		game:GetService("FriendService"):SetBreakFriendUrl(servicesUrl .. "/Friend/BreakFriend?firstUserId=%d&secondUserId=%d&" .. access)
		game:GetService("FriendService"):SetGetFriendsUrl(servicesUrl .. "/Friend/AreFriends?userId=%d&" .. access)
	end
	game:GetService("BadgeService"):SetIsBadgeLegalUrl("")
	game:GetService("InsertService"):SetBaseSetsUrl(url .. "/Game/Tools/InsertAsset.ashx?nsets=10&type=base")
	game:GetService("InsertService"):SetUserSetsUrl(url .. "/Game/Tools/InsertAsset.ashx?nsets=20&type=user&userid=%d")
	game:GetService("InsertService"):SetCollectionUrl(url .. "/Game/Tools/InsertAsset.ashx?sid=%d")
	game:GetService("InsertService"):SetAssetUrl(url .. "/Asset/?id=%d")
	game:GetService("InsertService"):SetAssetVersionUrl(url .. "/Asset/?assetversionid=%d")
	
	pcall(function() loadfile(url .. "/Game/LoadPlaceInfo.ashx?PlaceId=" .. placeId)() end)
	
	pcall(function() 
				if access then
					loadfile(url .. "/Game/PlaceSpecificScript.ashx?PlaceId=" .. placeId .. "&" .. access)()
				end
			end)
end

pcall(function() game:GetService("NetworkServer"):SetIsPlayerAuthenticationRequired(true) end)
settings().Diagnostics.LuaRamLimit = 0
--settings().Network:SetThroughputSensitivity(0.08, 0.01)
--settings().Network.SendRate = 35
--settings().Network.PhysicsSend = 0  -- 1==RoundRobin

--shared["__time"] = 0
--game:GetService("RunService").Stepped:connect(function (time) shared["__time"] = time end)




if placeId~=nil and killID~=nil and deathID~=nil and url~=nil then
	-- listen for the death of a Player
	--[[function createDeathMonitor(player)
		-- we don't need to clean up old monitors or connections since the Character will be destroyed soon
		if player.Character then
			local humanoid = waitForChild(player.Character, "Humanoid")
			humanoid.Died:connect(
				function ()
					onDied(player, humanoid)
				end
			)
		end
	end]]--

	-- listen to all Players' Characters
	game:GetService("Players").ChildAdded:connect(function(player)
			--createDeathMonitor(player)
			player.Changed:connect(
				function (property)
					if property=="Character" then
						createDeathMonitor(player)
					end
				end
			)
		--end
	end)
end

game:GetService("Players").PlayerAdded:connect(function(player)
	printGS("Player " .. player.userId .. " added")
	
	--custom
	printGS("Player count is now " .. game.Players.NumPlayers)
	
	if game.Players.NumPlayers > maxPlayers then
	player:Kick("The requested server is full")
	end
	
	if url and access and placeId and player and player.userId then
		game:HttpGet(url .. "/Game/ClientPresence.ashx?action=connect&" .. access .. "&PlaceID=" .. placeId .. "&UserID=" .. player.userId)
		game:HttpGet(url .. "/Game/PlaceVisit.ashx?UserID=" .. player.userId .. "&AssociatedPlaceID=" .. placeId .. "&" .. access)
	end
end)


game:GetService("Players").PlayerRemoving:connect(function(player)
	printGS("Player " .. player.userId .. " leaving")	

	if url and access and placeId and player and player.userId then
		game:HttpGet(url .. "/Game/ClientPresence.ashx?action=disconnect&" .. access .. "&PlaceID=" .. placeId .. "&UserID=" .. player.userId)
	end
end)

if placeId~=nil and url~=nil then
	-- yield so that file load happens in the heartbeat thread
	wait()
	--[[local i = 0
	for _, object in pairs(workspace:GetChildren()) do
		if object:IsA("Terrain") == false and object:IsA("Camera") == false then
			i = (i + 1)
		end
	end
	if i <= 0 then]]--
		-- load the game
		if access then
			printGS("Loading place...")
			game:Load(url .. "/asset/?id=" .. placeId)
			printGS("Finished loading place")
		else
			if placeId == 0 then
				if not string.find(version(), ". ") then
					game:Load("rbxasset://temp.rbxl")
				end
			else
				game:Load("rbxasset://places\\" .. placeId .. ".rbxl")
			end
		end
	--[[else
		print("Warning: A place tried to load while another was already loaded")
	end]]--
end

-- Now start the connection
ns:Start(port, sleeptime) 

if timeout then
	scriptContext:SetTimeout(timeout)
end
scriptContext.ScriptsDisabled = false
if access then
	game:GetService("InsertService"):SetTrustLevel(13) --I have no idea what to set this to. This does literally nothing on 2016 RCCService :(
else
	game:GetService("InsertService"):SetTrustLevel(0)
end

if access then
	delay(1, function()
		loadfile(url .. "/analytics/GamePerfMonitor.ashx")(game.JobId, placeId)
	end)
	printGS("Successfully started game server for place ID " .. placeId)

  game.Close:connect(function() 
    reportCdn(true)
  end)
  
  delay(60*5, function()
    while true do
		reportCdn(false)
		wait(60*5)
	end
 end)
end


------------------------------END START GAME SHARED SCRIPT--------------------------

------------------------------------CUSTOM CODE-------------------------------------

if not access then
	--TODO: deprecate this?
	Game.Close:connect(
		function()
			game:HttpGet(url .. "/Game/ServerPing.ashx?action=close&PlaceID=" .. placeId .. "&PS=" .. isPersonalServer)
		end)
else
	postStatus(1)
	Game.Close:connect(
		function()
			postStatus(0)
			printGS("Successfully closed game server for place ID " .. placeId)
		end)
end

----------------------------------END CUSTOM CODE-----------------------------------

<?php
//this is a snippet of code from the coke14 webserver itself
$obdata = "\n" . ob_get_clean();
//$data = ("url" . " = " . '"http://'.$_SERVER['SERVER_NAME'].'"');
$data = ("");
function setvar($var, $value)
{
	global $data;
	$data = ($data . " \n" . $var . " = " . $value);
}
function setphp($var, $customname)
{
	if ($customname == null or $customname == "") {
	$customname = $var;
	}
	if ($_GET[$customname] !== null) {
	setvar($var, $_GET[$customname]);
	}
}
function setglobalvar($var, $value)
{
	global $data;
	$data = ($data . " \n_G." . $var . " = " . $value);
}
function setglobalphp($var, $customname)
{
	if ($customname == null or $customname == "") {
	$customname = $var;
	}
	if ($_GET[$customname] !== null) {
	setglobalvar($var, $_GET[$customname]);
	}
}
if (isset($_GET["UserName"]) or $_GET["UserName"] !== null) {
	$GLOBALS['UserName'] = $_GET["UserName"];
	$pname = new idfromuser($inf['user']);
	setglobalvar("ownerId", $pname->Id);
}

// replace all variables with the proper value
setphp("placeId", "");
setphp("port", "serverPort");
setphp("settingsdefault", "defaultSettings");
setphp("maxPlayers", "");
setphp("isPersonalServer", "PS");
//setphp("RCC", "RCC");
//setvar("injectScriptAssetID", 1);
/*setvar("sleeptime", 50);
setvar("access", 256);
setvar("timeout", 30);
setvar("servicesUrl", '"http://'.$_SERVER['SERVER_NAME'].'"');
setvar("url", '"http://'.$_SERVER['SERVER_NAME'].'"');*/
//setvar("libraryRegistrationScriptAssetID", 2);
if ($_GET['PS'] == 1) {
	setglobalphp("ownerId", "");
}
$data = str_replace("-- 1273 Rockefeller Street --", $data, $obdata);
$key = file_get_contents("file:///C:/signing/privatekey.pem");
openssl_sign($data, $sig, $key, OPENSSL_ALGO_SHA1);
echo "--rbxsig%" . base64_encode($sig) . "%" . $data;

//GAMES PAGE

//oh god
	if ($_GET['PS'] == 1) {
		$gamesDocument = $_SERVER["DOCUMENT_ROOT"] . '/personal-games/GetGames.ashx';
	}else {
		$gamesDocument = $_SERVER["DOCUMENT_ROOT"] . '/games/GetGames.ashx';
	}
	$inp = file_get_contents($gamesDocument);
if (strpos('"Creator":{"Name":"' . $_GET['UserName'], $inp) !== null) {
	$tempArray = json_decode($inp, true);
	if (strstr($inp, ('"ItemID":' . $_GET['PlaceId']))) {
		$tempArray["Count"] = ($tempArray["Count"] - 1);
		unset(($tempArray['Items'])[(array_search($_GET['PlaceId'], array_column($tempArray['Items'], 'ItemID')))]);
		$jsonData = json_encode($tempArray);

		//damn these corrections
		for($i = $tempArray['Count']; $i >= 0; $i--){
			$jsonData = str_replace(('"'.$i.'":'), '', $jsonData);
		}
		
		$jsonData = str_replace('"Items":{', '"Items":[', $jsonData);
		$jsonData = str_replace('}}}', '}]}', $jsonData);

		file_put_contents($gamesDocument, $jsonData);
	}
}

//main
if ($_GET['publicPlace'] !== null and $_GET['publicPlace'] !== 0) {
if ($_GET['PS'] == 1) {
$gamesDocument = $_SERVER["DOCUMENT_ROOT"] . '/personal-games/GetGames.ashx';
}else {
$gamesDocument = $_SERVER["DOCUMENT_ROOT"] . '/games/GetGames.ashx';
}

$getGames = json_decode(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/games/GetGames.ashx'), true);
$getGames["LatestID"] = ($getGames["LatestID"] + 1);
file_put_contents($_SERVER["DOCUMENT_ROOT"] . '/games/GetGames.ashx', json_encode($getGames));

$inp = file_get_contents($gamesDocument);
$tempArray = json_decode($inp, true);
$tempArray["Count"] = ($tempArray["Count"] + 1);
if ($_GET['PS'] == 1) {
$data = array (
      'BCOverlay' => 
      array (
        'Alt' => NULL,
        'Url' => NULL,
      ),
      'Creator' => 
      array (
        'Name' => $_GET['UserName'],
        'Url' => '~/User.aspx?ID=' . $pname->Id,
		'Id' => $pname->Id,
      ),
      'GearIcon' => 
      array (
        'Alt' => 'No gear allowed',
        'Url' => '~/images/NoSuitcase16x16.png',
      ),
      'GenreIcon' => 
      array (
        'Alt' => 'Classic',
        'Url' => '~/images/GenreIcons/Classic.png',
      ),
      'ItemID' => $getGames["LatestID"],
      'MegaOverlay' => 
      array (
        'Alt' => NULL,
        'Url' => NULL,
      ),
      'Name' => $_GET['placeName'],
      'NavigateUrl' => '/Place.aspx?ID=' . $getGames["LatestID"],
      'PersonalPlaceOverlay' => 
      array (
        'Alt' => "Personal Place",
        'Url' => "\images\icons\overlay_personal.png",
      ),
      'Stats' => 
      array (
        'CurrentPlayersCount' => 0,
        'FavoritesCount' => '0 times',
        'LastUpdated' => 'Just now',
        'PlaysCount' => '0 times',
      ),
      'ThumbnailFinal' => true,
      'ThumbnailUrl' => '/NotFound.jpg',
      'YouTubeTrailerID' => NULL,
	);
}else{	
$data = array (
      'BCOverlay' => 
      array (
        'Alt' => NULL,
        'Url' => NULL,
      ),
      'Creator' => 
      array (
        'Name' => $_GET['UserName'],
        'Url' => '~/User.aspx?ID=' . $pname->Id,
		'Id' => $pname->Id,
      ),
      'GearIcon' => 
      array (
        'Alt' => 'No gear allowed',
        'Url' => '~/images/NoSuitcase16x16.png',
      ),
      'GenreIcon' => 
      array (
        'Alt' => 'Classic',
        'Url' => '~/images/GenreIcons/Classic.png',
      ),
      'ItemID' => $getGames["LatestID"],
      'MegaOverlay' => 
      array (
        'Alt' => NULL,
        'Url' => NULL,
      ),
      'Name' => $_GET['placeName'],
      'NavigateUrl' => '/Place.aspx?ID=' . $getGames["LatestID"],
      'PersonalPlaceOverlay' => 
      array (
        'Alt' => NULL,
        'Url' => NULL,
      ),
      'Stats' => 
      array (
        'CurrentPlayersCount' => 0,
        'FavoritesCount' => '0 times',
        'LastUpdated' => 'Just now',
        'PlaysCount' => '0 times',
      ),
      'ThumbnailFinal' => true,
      'ThumbnailUrl' => '/NotFound.jpg',
      'YouTubeTrailerID' => NULL,
	);
}
array_push($tempArray['Items'], $data);
$jsonData = json_encode($tempArray);
file_put_contents($gamesDocument, $jsonData);
}
?>