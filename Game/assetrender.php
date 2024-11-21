<?php
header('Content-Type: text/plain');
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/database.php';
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/RCC/functions.php';
function Redirect($url, $permanent = false) {
    header('Location: ' . $url, true, $permanent ? 301 : 302);

    exit();
}
ob_start();
?>
function start(ext, v, h, assetId)
print("Rendering asset " .. assetId .. "...")
baseUrl = "http://sitetest1.roblonium.com/"
url = baseUrl .. "Asset/?id=" .. assetId
scriptIcon = baseUrl .. "Thumbs/Script.png"
toolIcon = baseUrl .. "Thumbs/Tool.png"

pcall(function() game:GetService('ContentProvider'):SetBaseUrl(baseUrl) end)
game:GetService("InsertService"):SetAssetUrl(game:GetService("ContentProvider").BaseUrl .. "/Asset/?id=%d")

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
		i.Parent = workspace
	end
end
return t:Click(ext, h, v, true, true)
end
---PLACE THUMBNAIL---
function getPlaceThumb(...)
local comment = 'Place thumbnail'
url, ext, x, y = ...
game:GetService('ContentProvider'):SetbaseUrl(url)
game:GetService('ThumbnailGenerator').GraphicsMode=4
game:GetService('ScriptContext').ScriptsDisabled=true
game:Load(url)
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
		part.Parent = workspace 
		i.Parent = part 
		return t:Click(ext, h, v, true) 
	else
		i.Parent = workspace 
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
end
return t:Click(ext, h, v, true)
end

---[[End Thumbnail Scripts]]---

--[[game.Workspace.CurrentCamera.CameraType = 'Fixed'
game.Workspace.CurrentCamera.CoordinateFrame = CFrame.new(2.09919071, 100.099197, 3.73974943, 0.896169245, -0.179961309, 0.405579507, -0, 0.914059222, 0.405580819, -0.443712562, -0.363469064, 0.81915164)
game.Workspace:ZoomToExtents()]]--

asset = game:GetService("MarketplaceService"):GetProductInfo(assetId)

if asset.AssetTypeId == 11 then
	thumbnail = getShirtThumb(url, ext, h, v, baseUrl, baseUrl .. "Asset/?id=" .. 1785197)
elseif asset.AssetTypeId == 12 then
	thumbnail = getPantsThumb(url, ext, h, v, baseUrl, baseUrl .. "Asset/?id=" .. 1785197)
elseif asset.AssetTypeId == 19 then
	thumbnail = getGearThumb(url, baseUrl, ext, h, v)
else
	thumbnail = getToolThumb(url, ext, h, v, scriptIcon, toolIcon)
end
game:HttpPost(game:GetService("ContentProvider").BaseUrl .. "Game/Tools/ThumbnailAsset.ashx?assetId=" .. assetId, thumbnail, true)
print("Finished rendering asset " .. assetId .. "!")
end

<?php
if (RCCService::verifyAccessKey($_SERVER['HTTP_ACCESSKEY'])){
	echo(ob_get_clean());
}else{
	Redirect("http://sitetest1.roblonium.com/RobloxDefaultErrorPage.aspx");
}
?>