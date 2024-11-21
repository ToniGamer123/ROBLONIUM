<?php
//All PHP code written by Brent Da Mage
$LoveAllAccess = true;
date_default_timezone_set('America/Chicago');

header('Content-Type: text/plain; X-Robots-Tag: noindex');
//auth ticket message format (sign this and give the signature to client)
/*
userId (49215350)
jobId (d8a55c59-e5b8-4895-90c7-9d6471aed68b)
timestamp (2/24/2020 5:40:14 PM)
*/
$ticket = $_SERVER['HTTP_ROBLOX-SESSION-ID'] . ";" . $_SERVER['HTTP_ROBLOX-GAME-ID'] . ";" . date('n\/j\/Y\ g\:i\:s\ A');
if ($LoveAllAccess == true) {
	openssl_sign($ticket, $sig, file_get_contents("file:///C:/signing/privatekey.pem"), OPENSSL_ALGO_SHA1);
	die('<Value Type="string">'.base64_encode($sig).'</Value>');
}else {
	die(base64_encode("error"));
}
?>