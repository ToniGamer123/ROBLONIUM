<?php 
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/core_functions.php';
requireLogin();

if($_SERVER['REQUEST_METHOD'] != 'POST'){ redirectToErrorPage(405); }

if(!isset($_POST['displayedUserID'])){ echo "No displayed user ID set"; die(header("HTTP/1.1 400 Bad Request")); }
if($_POST['displayedUserID'] != SESSION["userid"]){ echo "Failed to verify data"; die(header("HTTP/1.1 400 Bad Request")); }

$userid = SESSION["userid"];

$incomingFRs = $pdo->prepare("SELECT * FROM friends WHERE receiverid = :id AND status = 0");
$incomingFRs->bindParam(":id", $userid, PDO::PARAM_INT);
$incomingFRs->execute();

if(!$incomingFRs->rowCount()){ die(); }

while ($row = $incomingFRs->fetch(PDO::FETCH_OBJ)) {
	$friends = $pdo->prepare("UPDATE friends SET status = 1 WHERE requesterId = :friendid AND receiverId = :id");
	$friends->bindParam(":friendid", $row->requesterId, PDO::PARAM_INT);
	$friends->bindParam(":id", $userid, PDO::PARAM_INT);
	$friends->execute();
}