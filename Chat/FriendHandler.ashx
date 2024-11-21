<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/player.php';
header('Content-Type:application/json');

$cmd = $_GET['cmd'];
$chatData = [
	/* Utilities */
	"Error" => "",
	/* Friends */
	"Count" => 0,
	"Users" => []
];
function newUser($userID) {
	global $chatData;
	$GLOBALS['Id'] = $userID;
	$user = new UserInf();
	array_push($chatData['Users'], [
			"ID" => $userID,
			"Name" => $user->Name,
			"Online" => ($user->IsOnline == 1 ? "true" : "false"),
			"Thumbnail" => '/Game/Tools/Avatar.ashx?userId='.$user->Id,
			"CanAcceptChats" => true,
			"ShowInviteLink" => false
		]);
}
if ($cmd == "friends") {
newUser(8);
}
elseif ($cmd == "bestfriends") {

}
elseif ($cmd == "recents") {

}
else {
	$chatData['Error'] = "Invalid request";
}
$chatData['Count'] = count($chatData['Users']);
die(json_encode($chatData));
?>