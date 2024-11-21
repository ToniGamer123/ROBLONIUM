<?php 
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/core_functions.php';
requireLogin();

if($_SERVER['REQUEST_METHOD'] != 'POST'){ redirectToErrorPage(405); }

if(!isset($_POST['targetUserID'])){ echo "No target user ID set"; die(header("HTTP/1.1 400 Bad Request")); }
if(!isset($_POST['displayedUserID'])){ echo "No displayed user ID set"; die(header("HTTP/1.1 400 Bad Request")); }
if($_POST['displayedUserID'] != SESSION["userid"]){ echo "Failed to verify data"; die(header("HTTP/1.1 400 Bad Request")); }

$userid = SESSION["userid"];
$friendid = $_POST['targetUserID'];

Unfriend($userid, $friendid);