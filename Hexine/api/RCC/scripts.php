<?php
/*TODO: Figure out how to post thumbnails to the site. RCCService certainly can't return them through the current POST request.
Sending them through Lua might work, but sending the API key in a URL parameter probably isn't the wisest idea.
*/

require "functions.php";

//global variables used when building Lua scripts
$RCC->baseUrl = "http://sitetest1.roblonium.com/";
$RCC->LoadUnload = "local url = ...\n".
				"local objs = game.Workspace:InsertContent(url)\n".
				"for _, instance in ipairs(objs) do\n".
				" instance:Remove()\n".
				"end\n";
//Begin Lua Scripts
$RCC->Scripts->GetClientCount = "return game:GetService(\"NetworkServer\"):GetClientCount()";
$RCC->Scripts->BusyScript = function() { global $RCC; return "loadfile('" + $RCC->baseUrl + "admi/games/bot.ashx')()"; };
$RCC->Scripts->ToolThumbScript =
"local comment = 'Model thumbnail'
url, ext, h, v, scriptIcon, toolIcon = ...
function tryorelse(tryfunc, failfunc)
   local r
   if(pcall(function () r = tryfunc() end)) then
	   return
   else
	   return failfunc()
   end
end
t = game:GetService('ThumbnailGenerator')
game:GetService('ScriptContext').ScriptsDisabled = true
for _,i in ipairs(game:GetObjects(url)) do
	if i.className=='Sky' then
	   return tryorelse(
		   function() return t:ClickTexture(i.SkyboxFt, ext, h, v) end,
		   function() return t:Click(ext, h, v, true) end)
	elseif (i.className=='Tool' or i.className=='HopperBin') and i.TextureId~='' then
	   return tryorelse(
		   function() return t:ClickTexture(i.TextureId, ext, h, v) end,
		   function() return t:ClickTexture(toolIcon, ext, h, v) end)
	elseif i.className=='Script' then
		return t:ClickTexture(scriptIcon, ext, h, v)
	elseif i.className=='SpecialMesh' then
		part = Instance:new('Part')
		part.Parent = workspace
		i.Parent = part
		return t:Click(ext, h, v, true)
	else
		i.Parent = workspace
	end
end
return t:Click(ext, h, v, true)";
$RCC->Scripts->PlaceThumbScript =
"local comment = 'Place thumbnail'
url, ext, x, y = ...
game:GetService('ContentProvider'):SetbaseUrl(url)
game:GetService('ThumbnailGenerator').GraphicsMode=4
game:GetService('ScriptContext').ScriptsDisabled=true game:Load(url) return game:GetService('ThumbnailGenerator'):Click(ext, x, y, false)";
$RCC->Scripts->AvatarThumbScript =
"local comment = 'Avatar thumbnail'
asseturl, url, fileExtension, x, y, userId = ...
print('Rendering avatar ' .. userId .. '...')
game:GetService('ScriptContext').ScriptsDisabled=true
pcall(function() game:GetService('ContentProvider'):SetBaseUrl(url) end)
pcall(function() game:GetService('Lighting').Outlines = false end)
player = game:GetService('Players'):CreateLocalPlayer(0)
player.CharacterAppearance = asseturl
player:LoadCharacter(false)

if (player.Character ~= nil) then
    local c = player.Character:GetChildren()
    for i=1,#c do
        if (c[i].className == 'Tool') then
            player.Character.Torso['Right Shoulder'].CurrentAngle = 1.57
            break
        elseif (c[i].className == 'Part') then
			c[i].Material = 'SmoothPlastic'
		elseif (c[i].className == 'Hat') then
			c[i].Handle.Material = 'SmoothPlastic'
		end
    end
end

game:GetService('ThumbnailGenerator').GraphicsMode = 4
game:HttpPost(game:GetService('ContentProvider').BaseUrl .. 'Game/Tools/Avatar.ashx?userId=' .. userId, game:GetService('ThumbnailGenerator'):Click(fileExtension, x, y, true), true)
print('Finished rendering avatar ' .. userId .. '!')
--return game:GetService('ThumbnailGenerator'):Click(fileExtension, x, y, true)";
$RCC->Scripts->BodyPartScript =
"local comment = 'BodyPart thumbnail'
asseturl, url, ext, h, v, guyUrl, customurl = ...
pcall(function() game:GetService('ContentProvider'):SetbaseUrl(url) end)
game:GetService('ScriptContext').ScriptsDisabled = true
local guy = game:GetObjects(guyUrl)[1]
guy.Parent = workspace

pcall(function()
	local objects = game:GetObjects(asseturl)
	for key, object in pairs(objects) do
		object.Parent = guy
	end
end)

pcall(function()
	game:GetObjects(customurl)[1].Parent = guy
end)

t = game:GetService('ThumbnailGenerator')
game:GetService('ThumbnailGenerator').GraphicsMode = 4
return t:Click(ext, h, v, true) ";
$RCC->Scripts->ShirtScript =
"local comment = 'Shirt thumbnail'
asseturl, ext, h, v, url, guyUrl = ...
pcall(function() game:GetService('ContentProvider'):SetbaseUrl(url) end)
game:GetService('ScriptContext').ScriptsDisabled = true
local guy = game:GetObjects(guyUrl)[1]
guy.Parent = workspace
c = Instance.new('Shirt')
c.ShirtTemplate = game:GetObjects(asseturl)[1].ShirtTemplate
c.Parent = guy
t = game:GetService('ThumbnailGenerator')
game:GetService('ThumbnailGenerator').GraphicsMode = 4
return t:Click(ext, h, v, true)";
$RCC->Scripts->PantsScript =
"local comment = 'Custom pants thumbnail'
asseturl, ext, h, v, url, guyUrl = ...
pcall(function() game:GetService('ContentProvider'):SetbaseUrl(url) end)
game:GetService('ScriptContext').ScriptsDisabled = true
local guy = game:GetObjects(guyUrl)[1]
guy.Parent = workspace
c = Instance.new('Pants')
c.PantsTemplate = game:GetObjects(asseturl)[1].PantsTemplate
c.Parent = guy
t = game:GetService('ThumbnailGenerator')
game:GetService('ThumbnailGenerator').GraphicsMode = 4
";
$RCC->Scripts->HeadScript =
"local comment = 'Head thumbnail'
asseturl, url, ext, h, v, guyUrl = ... 
pcall(function() game:GetService('ContentProvider'):SetbaseUrl(url) end)
game:GetService('ThumbnailGenerator').GraphicsMode = 4
game:GetService('ScriptContext').ScriptsDisabled = true
local guy = game:GetObjects(guyUrl)[1]
guy.Parent = workspace
local mesh = game:GetObjects(asseturl)[1]
guy.Head.BrickColor = BrickColor.Gray()
guy.Head.Mesh:remove()
mesh.Parent = guy.Head
guy.Torso:remove()
guy['Right Arm']:remove()
guy['Left Arm']:remove()
guy['Right Leg']:remove()
guy['Left Leg']:remove()
t = game:GetService('ThumbnailGenerator')
return t:Click(ext, h, v, true)";
$RCC->Scripts->ModelThumbScript =
"local comment = 'Model thumbnail' 
url, baseUrl, ext, h, v, scriptIcon, toolIcon = ... 
pcall(function() game:GetService('ContentProvider'):SetBaseUrl(baseUrl) end)
game:GetService('ThumbnailGenerator').GraphicsMode = 4 
t = game:GetService('ThumbnailGenerator') 
game:GetService('ScriptContext').ScriptsDisabled = true 
for _,i in ipairs(game:GetObjects(url)) do 
	if i.className=='Script' then
		return t:ClickTexture(scriptIcon, ext, h, v)
	elseif i.className=='SpecialMesh' then
		part = Instance:new('Part') 
		part.Parent = workspace 
		i.Parent = part 
		return t:Click(ext, h, v, true) 
	else
		i.Parent = workspace 
	end 
end 
return t:Click(ext, h, v, true)";
$RCC->Scripts->GearThumbScript =
"local comment = 'Gear thumbnail'
url, baseUrl, ext, h, v  = ...
pcall(function() game:GetService('ContentProvider'):SetBaseUrl(baseUrl) end)
game:GetService('ThumbnailGenerator').GraphicsMode = 4
t = game:GetService('ThumbnailGenerator')
game:GetService('ScriptContext').ScriptsDisabled = true
for _,i in ipairs(game:GetObjects(url)) do
	i.Parent = workspace
end
return t:Click(ext, h, v, true)";

$RCC->Scripts->PackagedThumbScript =
"baseUrl, url, ext, v, h, assetId = ...
print('Rendering asset ' .. assetId .. '...')
scriptIcon = baseUrl .. 'Thumbs/Script.png'
toolIcon = baseUrl .. 'Thumbs/Tool.png'

pcall(function() game:GetService('ContentProvider'):SetBaseUrl(baseUrl) end)
game:GetService('InsertService'):SetAssetUrl(baseUrl .. '/Asset/?id=%d')

pcall(function() game:GetService('Lighting').Outlines = false end)

--[[settings().Rendering.Antialiasing = 1
settings().Rendering.AASamples = 8]]--

---[[Thumbnail Scripts]]---

---TOOL THUMBNAIL---
function getToolThumb(...)
local comment = 'Model thumbnail'
url, ext, h, v, scriptIcon, toolIcon = ...
function tryorelse(tryfunc, failfunc)
   local r
   if(pcall(function () r = tryfunc() end)) then
	   return
   else
	   return failfunc()
   end
end
t = game:GetService('ThumbnailGenerator')
game:GetService('ScriptContext').ScriptsDisabled = true
for _,i in ipairs(game:GetObjects(url)) do
	if i.className=='Sky' then
	   return tryorelse(
		   function() return t:ClickTexture(i.SkyboxFt, ext, h, v) end,
		   function() return t:Click(ext, h, v, true) end)
	elseif (i.className=='Tool' or i.className=='HopperBin') and i.TextureId~='' then
	   return tryorelse(
		   function() return t:ClickTexture(i.TextureId, ext, h, v) end,
		   function() return t:ClickTexture(toolIcon, ext, h, v) end)
	elseif i.className=='Script' then
		return t:ClickTexture(scriptIcon, ext, h, v)
	elseif i.className=='SpecialMesh' then
		part = Instance.new('Part')
		part.Parent = workspace
		-- Shiny
		part.Material = 'SmoothPlastic'
		i.Parent = part
		return t:Click(ext, h, v, true)
	elseif i.className=='ShirtGraphic' then
		return t:ClickTexture(i.Graphic, ext, h, v)
	elseif i.className=='Shirt' then
		return t:ClickTexture(i.ShirtTemplate, ext, h, v)
	elseif i.className=='Pants' then
		return t:ClickTexture(i.PantsTemplate, ext, h, v)
	elseif i.className=='Decal' then
		return t:ClickTexture(i.Texture, ext, h, v)
	else
		-- Shiny
		if i.className=='Hat' then
			i.Handle.Material = 'SmoothPlastic'
		elseif i.className=='Part' then
			i.Material = 'SmoothPlastic'
		end
		i.Parent = workspace
	end
end
return t:Click(ext, h, v, true, true)
end
---PLACE THUMBNAIL---
function getPlaceThumb(...)
local comment = 'Place thumbnail'
url, ext, x, y = ...
pcall(function() game:GetService('ContentProvider'):SetbaseUrl(url) end)
game:GetService('ThumbnailGenerator').GraphicsMode=4
game:GetService('ScriptContext').ScriptsDisabled=true
game:Load(url)
-- This is definitely not gonna be made shiny via lua. lol
return game:GetService('ThumbnailGenerator'):Click(ext, x, y, false)
end
---AVATAR THUMBNAIL---
function getAvatarThumb(...)
local comment = 'Avatar thumbnail'
asseturl, url, fileExtension, x, y = ...
print('Rendering avatar '..asseturl..'...')
game:GetService('ScriptContext').ScriptsDisabled=true
pcall(function() game:GetService('ContentProvider'):SetbaseUrl(url) end)
player = game:GetService('Players'):CreateLocalPlayer(0)
player.CharacterAppearance = asseturl
player:LoadCharacter(false)

if (player.Character ~= nil) then
	local c = player.Character:GetChildren()
	for i=1,#c do
		if (c[i].className == 'Tool') then
			player.Character.Torso['Right Shoulder'].CurrentAngle = 1.57
			break
		end
	end
end

game:GetService('ThumbnailGenerator').GraphicsMode = 4
print('Finished rendering avatar '..asseturl..'!')
return game:GetService('ThumbnailGenerator'):Click(fileExtension, x, y, true)
end
---BODYPART THUMBNAIL---
function getBodyPartThumb(...)
local comment = 'BodyPart thumbnail'
asseturl, url, ext, h, v, guyUrl, customurl = ...
pcall(function() game:GetService('ContentProvider'):SetbaseUrl(url) end)
game:GetService('ScriptContext').ScriptsDisabled = true
local guy = game:GetObjects(guyUrl)[1]
guy.Parent = workspace

-- Shiny
c = guy:GetChildren()
for i=1,#c do
	if (c[i].className == 'Part') then
		c[i].Material = 'SmoothPlastic'
	elseif (c[i].className == 'Hat') then
		c[i].Handle.Material = 'SmoothPlastic'
	end
end

pcall(function()
	local objects = game:GetObjects(asseturl)
	for key, object in pairs(objects) do
		object.Parent = guy
	end
end)

pcall(function()
	game:GetObjects(customurl)[1].Parent = guy
end)

t = game:GetService('ThumbnailGenerator')
game:GetService('ThumbnailGenerator').GraphicsMode = 4
return t:Click(ext, h, v, true)
end
---SHIRT THUMBNAIL---
function getShirtThumb(...)
local comment = 'Shirt thumbnail'
asseturl, ext, h, v, url, guyUrl = ...
pcall(function() game:GetService('ContentProvider'):SetbaseUrl(url) end)
game:GetService('ScriptContext').ScriptsDisabled = true
local guy = game:GetObjects(guyUrl)[1]
guy.Parent = workspace

-- Shiny
c = guy:GetChildren()
for i=1,#c do
	if (c[i].className == 'Part') then
		c[i].Material = 'SmoothPlastic'
	elseif (c[i].className == 'Hat') then
		c[i].Handle.Material = 'SmoothPlastic'
	end
end

c = Instance.new('Shirt')
c.ShirtTemplate = game:GetObjects(asseturl)[1].ShirtTemplate
c.Parent = guy
t = game:GetService('ThumbnailGenerator')
game:GetService('ThumbnailGenerator').GraphicsMode = 4
return t:Click(ext, h, v, true)
end
---PANTS THUMBNAIL---
function getPantsThumb(...)
local comment = 'Custom pants thumbnail'
asseturl, ext, h, v, url, guyUrl = ...
pcall(function() game:GetService('ContentProvider'):SetbaseUrl(url) end)
game:GetService('ScriptContext').ScriptsDisabled = true
local guy = game:GetObjects(guyUrl)[1]
guy.Parent = workspace

-- Shiny
c = guy:GetChildren()
for i=1,#c do
	if (c[i].className == 'Part') then
		c[i].Material = 'SmoothPlastic'
	elseif (c[i].className == 'Hat') then
		c[i].Handle.Material = 'SmoothPlastic'
	end
end

c = Instance.new('Pants')
c.PantsTemplate = game:GetObjects(asseturl)[1].PantsTemplate
c.Parent = guy
t = game:GetService('ThumbnailGenerator')
game:GetService('ThumbnailGenerator').GraphicsMode = 4
return t:Click(ext, h, v, true)
end
---HEAD THUMBNAIL---
function getHeadThumb(...)
local comment = 'Head thumbnail'
asseturl, url, ext, h, v, guyUrl = ... 
pcall(function() game:GetService('ContentProvider'):SetbaseUrl(url) end)
game:GetService('ThumbnailGenerator').GraphicsMode = 4
game:GetService('ScriptContext').ScriptsDisabled = true
local guy = game:GetObjects(guyUrl)[1]
guy.Parent = workspace

-- Shiny
c = guy:GetChildren()
for i=1,#c do
	if (c[i].className == 'Part') then
		c[i].Material = 'SmoothPlastic'
	elseif (c[i].className == 'Hat') then
		c[i].Handle.Material = 'SmoothPlastic'
	end
end

local mesh = game:GetObjects(asseturl)[1]
guy.Head.BrickColor = BrickColor.Gray()
guy.Head.Mesh:remove()
mesh.Parent = guy.Head
guy.Torso:remove()
guy['Right Arm']:remove()
guy['Left Arm']:remove()
guy['Right Leg']:remove()
guy['Left Leg']:remove()
t = game:GetService('ThumbnailGenerator')
return t:Click(ext, h, v, true)
end
---MODEL THUMBNAIL---
function getModelThumb(...)
local comment = 'Model thumbnail' 
url, baseUrl, ext, h, v, scriptIcon, toolIcon = ... 
pcall(function() game:GetService('ContentProvider'):SetBaseUrl(baseUrl) end)
game:GetService('ThumbnailGenerator').GraphicsMode = 4 
t = game:GetService('ThumbnailGenerator') 
game:GetService('ScriptContext').ScriptsDisabled = true 
for _,i in ipairs(game:GetObjects(url)) do 
	if i.className=='Script' then
		return t:ClickTexture(scriptIcon, ext, h, v)
	elseif i.className=='SpecialMesh' then
		part = Instance.new('Part') 
		-- Shiny
		part.Material = 'SmoothPlastic'
		part.Parent = workspace 
		i.Parent = part 
		return t:Click(ext, h, v, true) 
	else
		-- Shiny
		if i.className=='Hat' then
			i.Handle.Material = 'SmoothPlastic'
		elseif i.className=='Part' then
			i.Material = 'SmoothPlastic'
		end
	end 
end 
return t:Click(ext, h, v, true)
end
---GEAR THUMBNAIL---
function getGearThumb(...)
local comment = 'Gear thumbnail'
url, baseUrl, ext, h, v  = ...
pcall(function() game:GetService('ContentProvider'):SetBaseUrl(baseUrl) end)
game:GetService('ThumbnailGenerator').GraphicsMode = 4
t = game:GetService('ThumbnailGenerator')
game:GetService('ScriptContext').ScriptsDisabled = true
for _,i in ipairs(game:GetObjects(url)) do
	i.Parent = workspace
	-- Shiny
	if i:IsA('Part') then
		i.Material = 'SmoothPlastic'
	end
end
return t:Click(ext, h, v, true)
end

---[[End Thumbnail Scripts]]---

--[[game.Workspace.CurrentCamera.CameraType = 'Fixed'
game.Workspace.CurrentCamera.CoordinateFrame = CFrame.new(2.09919071, 100.099197, 3.73974943, 0.896169245, -0.179961309, 0.405579507, -0, 0.914059222, 0.405580819, -0.443712562, -0.363469064, 0.81915164)
game.Workspace:ZoomToExtents()]]--

asset = game:GetService('MarketplaceService'):GetProductInfo(assetId)

if asset.AssetTypeId == 11 then
	thumbnail = getShirtThumb(url, ext, h, v, baseUrl, baseUrl .. 'Asset/?id=' .. 1785197)
elseif asset.AssetTypeId == 12 then
	thumbnail = getPantsThumb(url, ext, h, v, baseUrl, baseUrl .. 'Asset/?id=' .. 1785197)
elseif asset.AssetTypeId == 9 then
	thumbnail = getPlaceThumb(url, ext, 1000, 560)
elseif asset.AssetTypeId == 19 then
	thumbnail = getGearThumb(url, baseUrl, ext, h, v)
elseif asset.AssetTypeId == 27 and asset.AssetTypeId <= 31 then
	thumbnail = getBodyPartThumb(url, baseUrl, ext, h, v, baseUrl .. 'Asset/?id=' .. 1785197)
else
	thumbnail = getToolThumb(url, ext, h, v, scriptIcon, toolIcon)
end
game:HttpPost(game:GetService('ContentProvider').BaseUrl .. 'Game/Tools/ThumbnailAsset.ashx?assetId=' .. assetId, thumbnail, true)
print('Finished rendering asset ' .. assetId .. '!')";
//End Lua Scripts

/*
Name: Start Game Server
Description: This function loads and runs the gameserver script via the baseUrl. NOTE: This should not be used under normal circumstances.
Parameters: []
*/
/*
function StartGameServer()
{
	global $RCC;
	return "local gameport = ...\n".
		"loadfile('" . $RCC->baseUrl . "game/gameserver.ashx')(0, gameport, nil, nil, nil, nil, nil, 30)\n";
}
*/

/*
Name: Make Load Place Script
Description: This function builds and returns a script needed to load a place file.
Parameters: [
	"placeId" => "The ID of the place you wish to load."
]
*/
function MakeLoadPlaceScript($placeId)
{
	global $RCC;
	return ExecuteScript('LoadPlace-'.$placeId, "game:Load('" . $RCC->baseUrl . "asset/?id={$placeId}')", array());
}

/*
Name: Make Join Game Script
Description: This function loads and runs the join script via the baseUrl.
Parameters: [
	"host" => "The IP of the server to join.",
	"gamePort" => "The port of the server to join."
]
*/
function MakeJoinGameScript($host, $gamePort)
{
	// other params: UserID=0
	global $RCC;
	return ExecuteScript('JoinGame-'.$host, "loadfile('" . $RCC->baseUrl . "game/join.ashx?server={$host}&serverPort={$gamePort}')()", array());
}

/*
Name: Make Busy Script
Description: This function populates the server with bots.
Parameters: []
*/
function MakeBusyScript()
{
	global $RCC;
	return ExecuteScript('MakeBusyScript', $RCC->Scripts->BusyScript(), array());
}

/*
Name: Make Tool Thumb Script
Description: This function generates and returns(?) a tool thumbnail.
Parameters: [
	"assetId" => "The ID of the asset to render.",
	"Width" => "The width of the image in pixels.",
	"Height" => "The height of the image in pixels."
]
*/
function MakeToolThumbScript($assetId, $Width, $Height)
{
	global $RCC;

	//string url = Web.ApplicationURL + "/Asset/?versionid=" + model.CurrentVersion.ID;
	$url = $RCC->baseUrl . "Asset/?id=" . $assetId;
	return ExecuteScript(
		"ToolThumb-".$assetId,
		$RCC->Scripts->ToolThumbScript,
		array($url,
		"PNG",
		$Width,
		$Height,
		$RCC->baseUrl + "Thumbs/Script.png",
		$RCC->baseUrl + "Thumbs/Tool.png")
	);
}

/*
Name: Make Thumb Script
Description: This function generates and returns(?) an asset thumbnail. This function is primarily used for body parts, places, and gear.
Parameters: [
	"baseScript" => "The script that's going to be executed by RCCService to render and return the thumbnail.",
	"id" => "The ID of the asset to render. (Set this to 0 to use the versionId parameter instead.)",
	"versionId" => "The version ID of the asset.",
	"Width" => "The width of the image in pixels.",
	"Height" => "The height of the image in pixels.",
	"needsbaseUrl" => "Used to determine wether a baseUrl needs to be given to the script.",
	"guyId" => "The asset id of the default character (MrGrey 1785197) to be used when obtaining body parts."
]
*/
function MakeThumbScript($baseScript, $id, $versionId, $Width, $Height, $needsbaseUrl, $guyId)
{
	global $RCC;
	if ($id != 0)
	{
		$url = $RCC->baseUrl . "Asset/?id=" . $id;
	}
	else
	{
		$url = $RCC->baseUrl . "Asset/?versionid=" . $versionId;
	}

	$guyUrl = "";
	if ($guyId != -1)
	{
		$guyUrl = $RCC->baseUrl . "Asset/?id=" . $guyId;
	}

	if ($needsbaseUrl == true)
	{
		return ExecuteScript(
			"AssetThumb-".$id,
			$baseScript,
			array($url,
			$baseUrl,
			"PNG",
			$Width,
			$Height,
			$guyUrl)
		);
	}
	else
	{
		/*return ExecuteScript(
			"AssetThumb-".$id,
			$baseScript,
			array($url,
			"PNG",
			$Width,
			$Height,
			$guyUrl)
		);*/
		return ExecuteScript(
			"AssetThumb-".$id,
			$baseScript,
			array($url,
			"PNG",
			$Width,
			$Height,
			$baseUrl,
			$guyUrl)
		);
	}
}

/*
Name: Make Head Script
Description: This function generates and returns(?) a head thumbnail. This function may be used for body parts.
Parameters: [
	"assetId" => "The ID of the asset to render.",
	"Width" => "The width of the image in pixels.",
	"Height" => "The height of the image in pixels."
]
*/
function MakeHeadScript($assetId, $Width, $Height)
{
	global $RCC;
	return MakeThumbScript($RCC->Scripts->HeadScript, $assetId, 0, $Width, $Height, true, 1785197);
}

/*
Name: Make Place Thumb Script
Description: This function generates and returns(?) a place thumbnail. It doesn't use any particular camera angle.
Parameters: [
	"id" => "The ID of the place to render. (Set this to 0 to use the versionId parameter instead.)",
	"versionId" => "The version ID of the asset.",
	"Width" => "The width of the image in pixels.",
	"Height" => "The height of the image in pixels."
]
*/
function MakePlaceThumbScript($id, $versionId, $Width, $Height)
{
	global $RCC;
	return MakeThumbScript($RCC->Scripts->PlaceThumbScript, $id, $versionId, $Width, $Height, false, -1);
}

/*
Name: Make Custom Thumb Script
Description: This function runs the given script with parameters used for thumbnail rendering.
Parameters: [
	"baseScript" => "The script that's going to be executed by RCCService to render the thumbnail.",
	"url" => "The URL used to load the asset. ex: http://sitetest1.roblonium.com/Asset/?id=100",
	"Width" => "The width of the image in pixels.",
	"Height" => "The height of the image in pixels."
]
*/
function MakeCustomThumbScript($RCCServiceSoap, $baseScript, $url, $Width, $Height, $assetId = null)
{
	global $RCC;
	/*return ExecuteScript(
		"MakeCustomThumbScript",
		$baseScript,
		array($url,
		"PNG",
		$Width,
		$Height)
	);*/
	/*return ExecuteScript(
		"MakeCustomThumbScript",
		$baseScript,
		array($url,
		"PNG",
		$Width,
		$Height,
		$assetId)
	);*/
	return OpenJob(
		$RCCServiceSoap,
		"MakeCustomThumbScript-".$assetId,
		$baseScript,
		[$RCC->baseUrl,
		$url,
		"PNG",
		$Width,
		$Height,
		$assetId]
	);
}

/*
Name: Make Model Thumb Script
Description: This function generates and returns(?) a model thumbnail.
Parameters: [
	"id" => "The ID of the model to render. (Set this to 0 to use the versionId parameter instead.)",
	"versionId" => "The version ID of the model.",
	"Width" => "The width of the image in pixels.",
	"Height" => "The height of the image in pixels."
]
*/
function MakeModelThumbScript($id, $versionId, $Width, $Height)
{
	global $RCC;
	if ($id != 0)
	{
		$url = $RCC->baseUrl . "Asset/?id=" . $id;
	}
	else
	{
		$url = $baseUrl . "Asset/?versionid=" . $versionId;
	}
	return ExecuteScript(
		"ModelThumb-".$id,
		$RCC->Scripts->ModelThumbScript,
		array($url,
		$baseUrl,
		"PNG",
		$Width,
		$Height,
		$baseUrl . "/Thumbs/Script.png",
		$baseUrl . "/Thumbs/Tool.png")
	);
}

/*
Name: Make Gear Thumb Script
Description: This function generates and returns(?) a gear thumbnail. I'm not exactly sure what the difference is between MakeToolThumbScript and MakeGearThumbScript.
Parameters: [
	"id" => "The ID of the gear to render. (Set this to 0 to use the versionId parameter instead.)",
	"versionId" => "The version ID of the gear.",
	"Width" => "The width of the image in pixels.",
	"Height" => "The height of the image in pixels."
]
*/
function MakeGearThumbScript($id, $versionId, $Width, $Height)
{
	global $RCC;
	return MakeThumbScript($RCC->Scripts->GearThumbScript, $id, $versionId, $Width, $Height, true, -1);
}
?>