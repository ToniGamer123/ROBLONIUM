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
function start(format, width, height, userId)
print("Rendering avatar " .. userId .. "...")
game:GetService("ContentProvider"):SetBaseUrl("http://sitetest1.roblonium.com/")
game:GetService("ScriptContext").ScriptsDisabled = true
game:GetService("InsertService"):SetAssetUrl(game:GetService("ContentProvider").BaseUrl .. "/Asset/?id=%d")

--game:GetService("Lighting").TimeOfDay = "9:30:00
--game:GetService("Lighting").TimeOfDay = "7:00:00"

local plr = game.Players:CreateLocalPlayer(userId)
-- TODO: move this to PHP
if userId == 0 then
	plr.CharacterAppearance = "http://sitetest1.roblonium.com/asset/CharacterFetch.ashx?userId=" .. userId .. "&exception=1"
else
	plr.CharacterAppearance = "http://sitetest1.roblonium.com/asset/CharacterFetch.ashx?userId=" .. userId
end
--plr.CharacterAppearance = "http://sitetest1.roblonium.com/v1.1/avatar-fetch/?userId=" .. userId
plr:LoadCharacter(false)
plr.CanLoadCharacterAppearance = true
plr:LoadCharacterAppearance(plr.Character)
for i,v in pairs(plr.Character:GetChildren()) do
    --print(v)
    if v:IsA("Tool") then
        plr.Character.Torso["Right Shoulder"].CurrentAngle = math.pi / 2
    elseif v:IsA("Part") then
		v.Material = "SmoothPlastic"
	elseif v:IsA("Hat") then
		v.Handle.Material = "SmoothPlastic"
	end
end

game:HttpPost(game:GetService("ContentProvider").BaseUrl .. "Game/Tools/Avatar.ashx?userId=" .. userId, game:GetService("ThumbnailGenerator"):Click("PNG", width, height, true), true)
print("Finished rendering avatar " .. userId .. "!")
end
<?php
if (RCCService::verifyAccessKey($_SERVER['HTTP_ACCESSKEY'])){
	echo(ob_get_clean());
}else{
	Redirect("http://sitetest1.roblonium.com/RobloxDefaultErrorPage.aspx");
}
?>