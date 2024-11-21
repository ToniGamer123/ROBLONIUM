<?php
require $_SERVER["DOCUMENT_ROOT"] . "/global.php";
requireLogin();

if(!isset($_GET['RecipientID'])){ redirectToErrorPage(); }
if(!filter_var($_GET['RecipientID'], FILTER_VALIDATE_INT)){ redirectToErrorPage(); }
if(!getNameFromUid($_GET['RecipientID'])){ redirectToErrorPage(); } //if user doesnt exist
if($_GET['RecipientID'] == SESSION["userid"]){ redirectToErrorPage(); } //if user tries to friend themselves


$userid = SESSION["userid"];
$recipientid = $_GET['RecipientID'];

if(checkIfFriends($userid, $recipientid)){ die("Error: You are already friends"); }

$friendsquery = $pdo->prepare("INSERT INTO friends (requesterId, receiverId, status) VALUES (:userid, :recipientid, 0)");
$friendsquery->bindParam(":userid", $userid, PDO::PARAM_INT);
$friendsquery->bindParam(":recipientid", $recipientid, PDO::PARAM_INT);
$friendsquery->execute();

header("Location: /User.aspx?ID=".$recipientid);