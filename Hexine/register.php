<?php
session_start();
require 'api/private/register.php';
require 'api/form.php';
require 'api/private/database.php';
require 'api/core_functions.php';


//for maintenance
//if (getRealIpAddr() !== "162.104.212.174") {
//	header("Location: /maintenance.html");
//}

$create = new register;
$error = Array();
if (isset($_POST["username"])){
	$create->username = $_POST["username"];
	$create->password = $_POST["password"];
	$create->password2 = $_POST["passwordConfirm"];
	$create->email = $_POST["email"];
	$create->captcha = $_POST["g-recaptcha-response"];
	$account = $create->attempt();
	$error = $account["error"];
	if (isset($account["player"])){
		//$_SESSION['player'] = $account["player"]; 
		createSession($account["player"]);
		header("Location: /welcome.php");
		die();
	}
}
$player = new Player($_SESSION['player'] );
if ($player->id !== 0 and $player->id !== null){
	header("Location: /welcome.php");
	die();
}

?>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
<title>Registration - ROBLONIUM </title>
<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
<link href="/roblonium.css" rel="stylesheet" type="text/css">
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<style>
form {
	margin:0;	
}
body {
	font-family: 'Source Sans Pro', sans-serif;
}
input[type=text], select, input[type=password],input[type=email] {
  width: 100%;
  padding: 5px 15px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 15px 25px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

/*div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  	width: 50%

}*/
.btn-large {
	border-width: 1px;
	border-style: solid;
	border-color: #007001;
	background-image: url(/images/Buttons/StyleGuide/bg-btn-blue.png);
	color: #013401;
	height: 50px;
	width: 100%;
	border-radius: 0.04in;
}
.btn-large:hover {
	background-position:left -48px;
}
</style>
	</head>
	<body style="background: steelblue url('/images/PBSSpace.png') !important; background-size: 100% 100%; background-size: cover !important; overflow: hidden !important;">
		<center class="center">
		<img src="../images/ROBLONIUM.png" alt="" class="RobloniumLogo" />
		<br/>
		<br/>
		<text id = "loadtext" class ="loading_text" style="margin-top: 48px; text-align: center; font-size: 48px; font-family: helvetica; color: rgba(255, 255, 255, 1); letter-spacing: -1px; text-shadow: 0px 0px 3px black; overflow: hidden; white-space: nowrap;">Registration</text>
		<br/>
		<br/>
		<div class="StandardBoxHeader" style="width: 620px; background: url(/images/cssspecific/rbx2/tab_black_33h_t1.png) no-repeat left top; border-radius: 0px;"><span style="background: url(/images/cssspecific/rbx2/tab_black_33h_t2.png) no-repeat right top; overflow: hidden;">Create a Free ROBLONIUM Account</span></div>
		<div class="StandardBox" style="width: 620px; border-radius: 0px;">
		<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" style="text-align: left;">
			Username:<br>
			<input type="text" name="username" maxlength="20" value="<?=$create->username?>">
			<?=$form->error($error,"username")?>
			<br>
			Password:<br>
			<input type="password" name="password" maxlength="30" value="<?=$create->password?>">
			<?=$form->error($error,"password")?>
			<br>
			Confirm Password:<br>
			<input type="password" name="passwordConfirm" maxlength="30" value="<?=$create->password2?>">
			<?=$form->error($error,"password2")?>
			<br>
			Email:<br>
			<input type="email" name="email" maxlength="30" value="<?=$create->email?>">
			<?=$form->error($error,"email")?>
			<br><br>
			<div class="g-recaptcha" data-sitekey="6Lc2YbMZAAAAAENm5tKCkYbgzRA3uPK9Fd4PKntT"></div>
			<?=$form->error($error,"captcha")?>
			<br><br>
			<button type="submit" style="" class="btn-large">Sign Up<span class="btn-text">Sign Up</span></button>
		</form>
		<script src="js/jquery.js"></script>
		</center>
		<script type="text/javascript">

			$(window).resize(function(){

				$('.center').css({
					width: ($(window).width()),
					height: ($(window).height())
				});
	
				});

				// To initially run the function:
				$(window).resize();
		</script>
	</body>
</html>