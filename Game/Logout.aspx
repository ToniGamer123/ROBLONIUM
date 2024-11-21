<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/player.php';
if (isset($_SESSION['player'])) {
	$player = new Player($_SESSION['player'] );
	$player->logOut();
	//function attempt(){
	//	$this->updateRow("public_users", ["IsOnline" => 0], ["Id" => $_SESSION['player']]);
	//}
	unset ($_SESSION["player"]);
	unset ($_COOKIE["userToken"]);
	session_destroy();
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<title>Logout - ROBLONIUM</title>
<script type="text/javascript" src="../jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="https://s3.amazonaws.com/js.roblox.com/c89f93934e866904b7e2c6cf9653b112.js"></script>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/ScriptGlobals.php";?>
</head>
<html>
<body>
<?php include $_SERVER["DOCUMENT_ROOT"] . '/Banner' ;?>
<div id="ErrorPage">    
    <img src="/images/RobloniumAdminLogo.png" alt="Alert" class="ErrorAlert"/>
    
    <h1>Goodbye!</h1>
    <h3>Ok, please leave.</h3>
    <p>Go awae.</p>
    <pre><span id="ctl00_cphRoblox_errorMsgLbl"></span></pre>

    <div class="divideTitleAndBackButtons">&nbsp;</div>

    <div class="CenterNavigationButtonsForFloat">
		<a class="GoToPreviousPageButton" title="Go to Previous Page Button" onclick="history.back();return false;" href="#"></a>
        <a class="ReturnHomeButton" title="Return Home" href="/"></a>
        <div style="clear:both"></div>
    </div>
</div>

</body>
</html>