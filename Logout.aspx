<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/player.php';
require $_SERVER["DOCUMENT_ROOT"] . '/global.php';
requireLogin();

if (isset($_SESSION['player']) || defined('SESSION')) 
{
	$player = new Player($_SESSION['player'] );
	$player->logOut();
	//function attempt(){
	//	$this->updateRow("public_users", ["IsOnline" => 0], ["Id" => $_SESSION['player']]);
	//}
	unset ($_SESSION["player"]);
	unset ($_COOKIE["userToken"]);
	session_destroy();
	invalidateSession($_COOKIE['_ROBLOSECURITY']);
	header("Location: /");
}
