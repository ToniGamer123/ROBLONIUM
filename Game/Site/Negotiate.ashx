<?php
//negotiate.ashx system written by pizzaboxer
require_once $_SERVER['DOCUMENT_ROOT']."/Hexine/api/core_functions.php";
header("content-type: text/plain");

if($_SERVER['HTTP_USER_AGENT'] != 'Roblox/Windows'){ die(header("Location: /RobloniumDefaultErrorPage.aspx?code=400")); }

invalidateSession();

if(!isset($_GET['suggest'])){ die('<Value Type="bool">false</Value>'); }

$ticket = explode(";", base64_decode($_GET['suggest']));

@$cookie = $ticket[0];
@$signature = $ticket[1];

openssl_sign($cookie, $signaturecmp, openssl_pkey_get_private("file://C:/signing/privatekey.pem"), OPENSSL_ALGO_SHA1);

if($_GET['suggest'] === base64_encode($cookie.";".$signaturecmp)) // authentication key validated
{
	$query = $pdo->prepare("SELECT * FROM sessions WHERE sessionkey = :sesskey");
	$query->bindParam(":sesskey", $cookie, PDO::PARAM_STR);
	$query->execute();
	if(!$query->rowCount()){ die('<Value Type="bool">false</Value>'); }
	$row = $query->fetch(PDO::FETCH_OBJ);

	if($row->created+(86400*3) < time()){ die('<Value Type="bool">false</Value>'); }
	if($row->loginIp != getIpAddress()){ die('<Value Type="bool">false</Value>'); }

	setcookie(".ROBLOSECURITY", $cookie, $row->created+(86400*3), "/"); //set time to 3 days
	$_SESSION['player'] = $row->userId; 

	die('<Value Type="bool">true</Value>');
}
else
{
	die('<Value Type="bool">false</Value>');
}