<?php
session_start();
require 'api/private/database.php';

require 'api/private/register.php';
require 'api/form.php';

$login = new login;
$error = Array();
if (isset($_POST["username"])){
	$login->username = $_POST["username"];
	$login->password = $_POST["password"];
	$account = $login->attempt();
	$error = $account["error"];
	if (isset($account["player"])){
		$_SESSION['player'] = $account["player"]; 
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

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  	width: 50%

}
</style>
<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>

	</head>
	<body>
		<b><?=$player->username?></b>
		<h1>Login</h1>
		
		<div>
		<form method="post"  action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
			Username:<br>
			<input type="text" name="username" maxlength="20" value="<?=$login->username?>">
			<?=$form->error($error,"username")?>
			<br>
			Password:<br>
			<input type="password" name="password" maxlength="30" value="<?=$login->password?>">
			<?=$form->error($error,"password")?>
			<br><br>
			<input type="submit" value="Submit">
		</form> 
		</div>
	</body>
</html>