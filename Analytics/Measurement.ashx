<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/database.php';
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/RCC/thumbnailers.php';

if (isset($_GET['Type']) && RCCService::verifyAccessKey($_SERVER['HTTP_ACCESSKEY'])) {
	$requestType = $_GET['Type'];
	if ($requestType == 'Game.Server.Status') {
		$status = $post = file_get_contents('php://input');
		if ($status == 0) {
			$database->deleteRow("jobs", ["serviceId" => $_SERVER['HTTP_ACCESSKEY']]);
		}else {
			$database->updateRow("jobs", [
				"status" => $status
			], ["serviceId" => $_SERVER['HTTP_ACCESSKEY']]);
		}
	}else {
		die(http_response_code(500));
	}
}else {
	die(http_response_code(409));
}
/*$post = file_get_contents('php://input');
$data = file_get_contents($_SERVER["DOCUMENT_ROOT"]."../Analytics/Logs/Cdn.log") . "\n" . $post;
file_put_contents($_SERVER["DOCUMENT_ROOT"]."../Analytics/Logs/Cdn.log", $data);*/
?>