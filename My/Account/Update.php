<?php
require $_SERVER['DOCUMENT_ROOT']."/global.php";
requireLogin();
if($_SERVER['REQUEST_METHOD'] != 'POST'){ redirectToErrorPage(); }
$userid = SESSION["userid"];
if(isset($_POST['PersonalBlurb']) && strlen($_POST['PersonalBlurb']) <= 1000)
{
	$updateBlurb = $pdo->prepare("UPDATE public_users SET Bio = :bio WHERE Id = :userid");
	$updateBlurb->bindParam(":bio", $_POST['PersonalBlurb'], PDO::PARAM_STR);
	$updateBlurb->bindParam(":userid", $userid, PDO::PARAM_INT);
	$updateBlurb->execute();
}
header("Location: /My/Account.aspx");