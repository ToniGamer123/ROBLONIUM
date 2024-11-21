<?php 
 	require_once $_SERVER['DOCUMENT_ROOT']."/Hexine/api/core_functions.php";
	//header('Content-Type: application/octet-stream'); 
	//header("Content-Transfer-Encoding: Binary"); 
	header('content-type: text/plain');

	$auth = false;

	if(isset($_GET['ticket']))
	{ 
		$ticket = explode(";", base64_decode($_GET['ticket']));

		@$cookie = $ticket[0];
		@$signature = $ticket[1];

		openssl_sign($cookie, $signaturecmp, openssl_pkey_get_private("file://C:/signing/privatekey.pem"), OPENSSL_ALGO_SHA1);

		if($_GET['ticket'] === base64_encode($cookie.";".$signaturecmp)) // authentication key validated
		{
			$query = $pdo->prepare("SELECT * FROM sessions WHERE sessionkey = :sesskey");
			$query->bindParam(":sesskey", $cookie, PDO::PARAM_STR);
			$query->execute();
			$row = $query->fetch(PDO::FETCH_OBJ);

			if($query->rowCount() && $row->created+(86400*3) > time() && $row->loginIp == getIpAddress())
			{ 
				$auth = getUserInfoFromUid($row->userId);
			}
		}
	}

	$placeId = -1;
	$server = "localhost";
	$port = 53640;
	$baseUrl = "http://sitetest1.roblonium.com/";
	$apiUrl = "http://api.roblonium.com/";

	$membershipIndex = [0=>"None", 1=>"BuildersClub", 2=>"TurboBuildersClub", 3=>"OutrageousBuildersClub"];

	if($auth)
	{
		$memberType = "Enum.MembershipType.".$membershipIndex[$auth->MembershipLevel];
		$userName = $auth->Name;
		$userId = $auth->Id;
		$ssc = "false";
		$charApp = $baseUrl."Asset/CharacterFetch.ashx?userId=".$userId;
	}
	else
	{
		$guestId = rand(1, 9999);
		$memberType = "Enum.MembershipType.None";
		$userName = "Guest $guestId";
		$userId = -$guestId;
		$ssc = "true";
		$charApp = $baseUrl."Asset/CharacterFetch.ashx?userId=1";
	}
	
	ob_start(); 
?>

-- march 2011 and above joinscript by pizzaboxer

-- functions --------------------------
function onPlayerAdded(player)
	-- override
end

function reportError(err)
	print("***ERROR*** " .. err)
	if not test then visit:SetUploadUrl("") end
	client:Disconnect()
	wait(4)
	game:SetMessage("Error: " .. err)
end

-- arguments --------------------------
local threadSleepTime = ...

if threadSleepTime==nil then 
	threadSleepTime = 15 
end

local test = false

print("! Joining game '<?=$gameId ?? ""?>' place <?=$placeId?> at <?=$server?>")
-- set globals --------------------------

client = game:GetService("NetworkClient")
visit = game:GetService("Visit")

game:GetService("ScriptInformationProvider"):SetAssetUrl("http://www.roblox.com/Asset/")
settings().Diagnostics:LegacyScriptMode()

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

-- client/server disconnection --------------------------

function onDisconnection(_, lostConnection)
	if lostConnection then
		game:SetMessage("You have lost the connection to the game")
	else
		game:SetMessage("This game has shut down")
	end
end

-- requests character --------------------------

function requestCharacter(replicator) 

	local connection = player.Changed:connect(function(property) 
		if property=="Character" then 
			--game:ClearMessage() 
			game:SetMessage(game:GetService("CookiesService"):GetCookieValue("_ROBLOSECURITY"))
			connection:disconnect() 
		end 
	end) 

	game:SetMessage("Requesting character")

	local success, err = pcall(function() 
		replicator:RequestCharacter() 
		game:SetMessage("Waiting for character")
		waitingForCharacter = true
	end)
	
	if not success then
		reportError(err)
		return
	end
end 

-- when the server accepts the connection --------------------------

function onConnectionAccepted(_, replicator)
	local waitingForMarker = true
		
	local success, err = pcall(function()
		if not test then 
		    visit:SetPing("", 300) --todo - put the ping url in here
		end

		game:SetMessageBrickCount() 

		replicator.Disconnection:connect(onDisconnection) 
		local marker = replicator:SendMarker() 
	
		marker.Received:connect(function() 
			waitingForMarker = false 
			requestCharacter(replicator) 
		end) 
	end)
	
	if not success then
		reportError(err)
		return
	end
	
	while waitingForMarker do 
		workspace:ZoomToExtents() 
		wait(0.5) 
	end 
end

-- when there's no response from the server on connection - aka when the connection fails --------------------------

function onConnectionFailed(_, errcode)
	game:SetMessage("Failed to connect to the Game. (ID="..errcode..")")
end

-- when the connection is rejected by the server [how tf do you even trigger this on the server???] --------------------------

function onConnectionRejected()
	game:SetMessage("Connection rejected by the server.")
end

-- disconnect player when idled --------------------------

idled = false
function onPlayerIdled(time)
	if time > 20*60 then
		game:SetMessage(string.format("You were disconnected for being idle %d minutes", time/60))
		client:Disconnect()
		if not idled then
			idled = true
		end
	end
end


-- main joinscript code is in this pcall --------------------------

local success, err = pcall(function()

	game:SetRemoteBuildMode(true)

	game:SetMessage("Connecting to Server")
	client.ConnectionAccepted:connect(onConnectionAccepted)
	client.ConnectionRejected:connect(onConnectionRejected)
	client.ConnectionFailed:connect(onConnectionFailed)
	
	player = client:PlayerConnect(<?=$userId?>, "<?=$server?>", <?=$port?>, 0, threadSleepTime) 

	player.Name = [========[<?=$userName?>]========]
	player.CharacterAppearance = "<?=$charApp?>"
	player:SetSuperSafeChat(<?=$ssc?>)
	player:SetMembershipType(<?=$memberType?>)
	player:SetAccountAge(0)
	<?php if($userId<=0){ echo 'pcall(function() settings().FastLogSettings:SetVariable("UseLuaChat", true) end)'; } ?>
	player.Idled:connect(onPlayerIdled)

	if not test then visit:SetUploadUrl("") end

	-- Overriden --------------------------
	onPlayerAdded(player)

end)

if not success then
	reportError(err)
end

--PS Scripts
if workspace:FindFirstChild("IsPersonalServer") ~= nil then
game:GetService("ScriptContext"):AddCoreScript(27, scriptContext,"CoreScripts/BuildToolsScripts/BuildToolManager")
end
game:GetService("InsertService"):SetTrustLevel(0)

pcall(function() game:SetScreenshotInfo("") end)
pcall(function() game:SetVideoInfo('<?php echo '<?xml version="1.0"?>';?><entry xmlns="http://www.w3.org/2005/Atom" xmlns:media="http://search.yahoo.com/mrss/" xmlns:yt="http://gdata.youtube.com/schemas/2007"><media:group><media:title type="plain"><![CDATA[ROBLOX Place]]></media:title><media:description type="plain"><![CDATA[ For more games visit http://www.roblox.com]]></media:description><media:category scheme="http://gdata.youtube.com/schemas/2007/categories.cat">Games</media:category><media:keywords>ROBLOX, video, free game, online virtual world</media:keywords></media:group></entry>') end) 
-- use single quotes here because the video info string may have unescaped double quotes

<?php 
	$script = ob_get_clean();
	$privatekey = openssl_pkey_get_private("file://C:/signing/privatekey.pem");
	openssl_sign($script, $signature, $privatekey, OPENSSL_ALGO_SHA1);
	echo "--rbxsig%" . base64_encode($signature) . "%" . $script;