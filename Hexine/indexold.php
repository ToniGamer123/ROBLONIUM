<?php
require 'api/player.php';

if (!session_started()){
   session_start();
}

$player = new Player($_SESSION['player']);

if (isset($_POST["logout"])){
	$player->logOut();
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
</style>
<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>

	</head>
	<body>
		<a href="/login.php">Login</a>
		<br>
		<a href="/Register.php">Sign Up</a>
		<br><br>
		<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
			<input type="hidden" name="logout" value="logout">
			<input type="submit" value="Logout">
		</form> 
	</body>
</html>