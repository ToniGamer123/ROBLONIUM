<?php
header("Content-Type: text/plain; charset=utf-8; X-Robots-Tag: noindex");

require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/RCC/functions.php';

function parseFilter($white, $black, $f1 = "white", $f2 = "black") {
	return (json_encode([
		"data" => [
			$f1 => $white,
			$f2 => $black
		]
	]));
}
/*$UserInfo = json_decode(file_get_contents("../Users/" . $_GET["UserID"]), true);
$Name = $UserInfo["Name"];*/
$msg_old = file_get_contents("php://input");
$is_Legacy = false;

if (isset($_POST["text"])) {
	$msg_white = $_POST["text"];
	$msg_black = $_POST["text"];
	$userId = $_POST["userId"];
}
else {
	$is_Legacy = true;
	$msg_white = $msg_old;
	$msg_black = $msg_old;
	$userId = $_GET["UserID"];
}
if ($msg_black == "") {
	die(parseFilter("", ""));
}

$filteredWords = 0;

if (RCCService::verifyAccessKey($_SERVER['HTTP_ACCESSKEY'])) {
	$bad_words = file("../../Filter/profanity_filter.wlist", FILE_IGNORE_NEW_LINES);
	if ($bad_words === FALSE) {
		die(parseFilter("", "[ Failed to Fetch Blacklist ]"));
	}
	foreach ($bad_words as $bad_word) {
		$temp = str_replace($bad_word, str_repeat("#", strlen($bad_word)), $msg_black);
		if (!($temp === FALSE)) {
			//$data = file_get_contents("../../Analytics/Logs/Chat.log") . "\n" . "[DELETED]" . $Name . " (" . $userId . "): " . $msg;
			//file_put_contents("../../Analytics/Logs/Chat.log", $data);
			$msg_black = $temp;
		}
		$filteredWords++;
	}
}
	$data = file_get_contents("../../Analytics/Logs/Chat.log") . "\n" . ((int)$userId < 0 ? "Guest ".$userId : $Name) . " (" . $userId . "): " . $msg_black;
	file_put_contents("../../Analytics/Logs/Chat.log", $data);
if ($is_Legacy == true) {
	if ($filteredWords > 0) {
		$result = "False";
	}else {
		$result = "True";
	}
	die($result);
} else{
	// 2016
	die(parseFilter("", $msg_black));
}
?>