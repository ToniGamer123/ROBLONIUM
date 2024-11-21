<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/player.php';
header('Content-Type:application/json');

$reqType = $_GET['reqType'];
$chatData = [
	/* Utilities */
	"Error" => "",
	/* Party */
	"PartyStatus" => null,
	"Party" => null,
	/* Chat */
	"Chats" => []
];
function newChat($senderID, $showInviteLink = false, $hasNewMessages = false) {
	global $chatData;
	$GLOBALS['Id'] = $senderID;
	$user = new UserInf();
	if ($user->IsOnline == 0) {
		$location = "offline";
	}else {
		if (1) {
			$location = [
				"GameAssetName" => substr("When The Ballzes Come", 0, 16),
				"GameAssetURL" => "/Place.aspx?ID=",
				"GameThumbnailURL" => "/Images/WTBC_62x45.jpg"
			];
		}else {
			$location = "website";
		}
	}
	array_push($chatData['Chats'], [
			"SenderID" => $senderID,
			"SenderUserName" => $user->Name,
			"CachedOnClient" => false,
			"Online" => ($user->IsOnline == 1),
			"Thumbnail" => '/Game/Tools/Avatar.ashx?userId='.$user->Id,
			"Location" => $location,
			"ShowInviteLink" => false,
			"HasNewMessages" => false,
			"Conversation" => []
		]);
}
if ($reqType == "getallchatswithdata") {
newChat(8);
}
else {
	$chatData['Error'] = "Invalid request";
}
die(json_encode($chatData));
?>