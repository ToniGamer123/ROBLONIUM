<?php
die(header("Location: /My/Home.aspx"));
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/core_functions.php';
requireLogin();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<title>Welcome Gamer</title>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/ScriptGlobals.php";?>
</head>
<html>
<body>
<?php include $_SERVER["DOCUMENT_ROOT"] . '/Banner' ;?>
<div class="forceSpace">&nbsp;</div>
<div id="ErrorPage">    
    <img src="<?="/Game/Tools/Avatar.ashx?userId=".SESSION["userid"]?>" alt="Alert" class="ErrorAlert"/>
    
    <h1>Welcome <?=SESSION["username"]?>!</h1>
    <h3>This is a welcome page.</h3>
    <p>You are not banned.</p>
    <pre><span id="ctl00_cphRoblox_errorMsgLbl"></span></pre>

    <div class="divideTitleAndBackButtons">&nbsp;</div>

    <div class="CenterNavigationButtonsForFloat">
        <a class="GoToPreviousPageButton" title="Go to My Account" href="/User.aspx?id=<?=$user->Id?>"></a>
        <a class="ReturnHomeButton" title="Return Home" href="/"></a>
        <div style="clear:both"></div>
    </div>
<div class="divideTitleAndBackButtons">&nbsp;</div>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/Footer";?>
</div>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Post-Footer.php";?>
</body>
</html>