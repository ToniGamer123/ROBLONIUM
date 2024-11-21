<?php
/*if (file_exists($_SERVER["DOCUMENT_ROOT"] . '/user/getcharapp/' . $_GET['userId'])) {
	echo(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/user/getcharapp/' . $_GET['userId']));
}else {
	echo(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/user/getcharapp/default'));
}*/
header('Content-Type: text/plain');
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");

// this is for players in the studio who're doing play solo. they shouldn't look like guests
if ((int)$_GET['userId'] <= 0 && (int)$_GET['exception'] !== 1) {
	die();
}

if (file_exists($_SERVER["DOCUMENT_ROOT"] . '/user/getcharapp/' . $_GET['userId'])) {
	die(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/user/getcharapp/' . $_GET['userId']));
}
$charapp = file_get_contents("http://" . $_SERVER['SERVER_NAME'] . "/v1.1/avatar-fetch?userId=".$_GET['userId']);

if (substr($charapp,0,6) == "Error:") {
	$charapp = file_get_contents("http://" . $_SERVER['SERVER_NAME'] . "/v1.1/avatar-fetch?userId=53"); //if an error occurs, return the default character appearance
}

$charapp = json_decode($charapp, true);
$charappFinal = $charapp['bodyColorsUrl'].';';
foreach ($charapp['accessoryIds'] as $assetId){
	$charappFinal = $charappFinal."http://" . $_SERVER['SERVER_NAME'] . "/Asset?id=".$assetId.';';
}
/* no gears allowed >:(
foreach ($charapp['backpackGearIds'] as $assetId){
	if (in_array($assetId, $charapp['equippedGearIds'])) {
		$charappFinal = $charappFinal."http://" . $_SERVER['SERVER_NAME'] . "/Asset?id=".$assetId.'&equipped=1;';
	}else {
		$charappFinal = $charappFinal."http://" . $_SERVER['SERVER_NAME'] . "/Asset?id=".$assetId.';';
	}
}
*/

echo($charappFinal);
?>