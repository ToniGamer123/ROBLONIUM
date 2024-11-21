<?php
header('Content-Type: text/plain; X-Robots-Tag: noindex');

// some nice very epic constats :)
$baseUrl = "http://".$_SERVER['SERVER_NAME']."/";
if (!(strpos($_SERVER['SERVER_NAME'], "www.") === FALSE)) {
	$apiUrl = "http://api.".substr($_SERVER['SERVER_NAME'], strpos($_SERVER['SERVER_NAME'], "www.")+4, strlen($_SERVER['SERVER_NAME'])-4)."/";
}else {
	$apiUrl = "http://api.".$_SERVER['SERVER_NAME']."/"; // TODO: should be https in 2013
}

// DEFAULTS
// TODO: implement support for actual places
$placeId = $_GET['PlaceId'] ?? 0;

//coke is very epic
ob_start();
?>
-- Loaded by StartGameSharedScript --
pcall(function() game:SetCreatorID(<?=$creatorId ?? 0?>, Enum.CreatorType.User) end)

pcall(function() game:GetService("SocialService"):SetFriendUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=IsFriendsWith&playerid=%d&userid=%d") end)
pcall(function() game:GetService("SocialService"):SetBestFriendUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=IsBestFriendsWith&playerid=%d&userid=%d") end)
pcall(function() game:GetService("SocialService"):SetGroupUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=IsInGroup&playerid=%d&groupid=%d") end)
pcall(function() game:GetService("SocialService"):SetGroupRankUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=GetGroupRank&playerid=%d&groupid=%d") end)
pcall(function() game:GetService("SocialService"):SetGroupRoleUrl("<?=$baseUrl?>Game/LuaWebService/HandleSocialRequest.ashx?method=GetGroupRole&playerid=%d&groupid=%d") end)
pcall(function() game:GetService("GamePassService"):SetPlayerHasPassUrl("<?=$apiUrl?>Game/GamePass/GamePassHandler.ashx?Action=HasPass&UserID=%d&PassID=%d") end)
pcall(function() game:GetService("MarketplaceService"):SetProductInfoUrl("<?=$apiUrl?>marketplace/productinfo?assetId=%d") end)
pcall(function() game:GetService("MarketplaceService"):SetDevProductInfoUrl("<?=$apiUrl?>marketplace/productDetails?productId=%d") end)
pcall(function() game:GetService("MarketplaceService"):SetPlayerOwnsAssetUrl("<?=$apiUrl?>ownership/hasasset?userId=%d&assetId=%d") end)
pcall(function() game:SetPlaceVersion(<?=$placeVersion ?? 0?>) end)
<?php
//this is a snippet of code from the coke14 webserver itself
$data = "\n" . ob_get_clean();
$key = file_get_contents("file:///C:/signing/privatekey.pem");
openssl_sign($data, $sig, $key, OPENSSL_ALGO_SHA1);
echo "--rbxsig%" . base64_encode($sig) . "%" . $data;
?>