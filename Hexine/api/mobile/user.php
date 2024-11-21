<?php
require $_SERVER["DOCUMENT_ROOT"] . '../RobloxWebSite/Hexine/api/private/register.php';

// MOBILE USERS API //

function getUserInfo($userId, $userName = "") { // TODO: add support to get user info via username?
												// TODO: have this return error codes based on the ability to retrieve the information
	$GLOBALS['Id'] = $userId;
	$user = new UserInf();

	$userout = [
		'UserName' 					=> $user->Name,
		'RobuxBalance' 				=> $user->Robux,
		'TicketsBalance' 			=> $user->Tickets,
		'IsAnyBuildersClubMember' 	=> $user->MembershipLevel > 0,
		'ThumbnailUrl' 				=> 'http://www.roblonium.com/Game/Tools/Avatar.ashx?userId='.$user->Id, //'http://'.$_SERVER['SERVER_NAME'].'/Game/Tools/Avatar.ashx?userId='.$user->Id,
		'UserID' 					=> $user->Id
	];
	
	return $userout;
}
