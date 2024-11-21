<?php
if ($_GET['placeId'] == null or $_GET['port'] == null) {
	die("Invalid request");
}
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/RCC/thumbnailers.php';
echo(startGameServer((int)$_GET['placeId'], (int)$_GET['port']));
?>