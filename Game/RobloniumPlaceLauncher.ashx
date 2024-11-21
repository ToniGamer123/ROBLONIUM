<?php
header('Content-Type: application/json; X-Robots-Tag: noindex');

if(!strpos($_SERVER['HTTP_REFERER'], "roblonium.com") && $_SERVER['HTTP_USER_AGENT'] != 'Roblox/WinInet')
{
	$json = 
	[
		'Error' => 'Request is not authorized from specified origin', 
		'userAgent' => $_SERVER['HTTP_USER_AGENT'], 
		'referrer' => $_SERVER['HTTP_REFERER']
	];
	http_response_code(403);
	die(json_encode($json, JSON_UNESCAPED_SLASHES));
}

if(!isset($_GET['request']) || $_GET['request'] != 'RequestGame')
{
	http_response_code(400);
	die(json_encode(['Error' => 'Invalid request type'], JSON_UNESCAPED_SLASHES));
}

if(!isset($_GET['placeId']) || !filter_var($_GET['placeId'], FILTER_VALIDATE_INT))
{
	$json = 
	[
		'status' => 4, 
		'joinScriptUrl' => null, 
		'authenticationUrl' => null, 
		'authenticationTicket' => null, 
		'message' => 'Cannot join game without placeId.'
	];
	http_response_code(400);
	die(json_encode($json, JSON_UNESCAPED_SLASHES));  
}

if(!isset($_COOKIE['_ROBLOSECURITY']))
{
	$json = 
	[
		'status' => 4, 
		'joinScriptUrl' => null, 
		'authenticationUrl' => null, 
		'authenticationTicket' => null, 
		'message' => 'Cannot join game with no authenticated user.'
	];
	http_response_code(400);
	die(json_encode($json, JSON_UNESCAPED_SLASHES));  
}

openssl_sign($_COOKIE['_ROBLOSECURITY'], $signature, openssl_pkey_get_private("file://C:/signing/privatekey.pem"), OPENSSL_ALGO_SHA1);

$authticket = urlencode(base64_encode($_COOKIE['_ROBLOSECURITY'].";".$signature));

$json = 
[
	'status' => 2, 
	'joinScriptUrl' => 'https://sitetest1.roblonium.com/Game/Site/Join.ashx?placeId='.$_GET['placeId']."&ticket=".$authticket, 
	'authenticationUrl' => 'https://sitetest1.roblonium.com/Game/Site/Negotiate.ashx', 
	'authenticationTicket' => '', 
	'message' => null
];
die(json_encode($json, JSON_UNESCAPED_SLASHES)); 

?>