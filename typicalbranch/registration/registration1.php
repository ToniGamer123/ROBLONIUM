<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="/css/global.css">
		<link rel="stylesheet" href="/css/header.css">
		<link rel="stylesheet" href="/css/landing.css">
	</head>
	<body>
		<?php
			ini_set('display_errors', 1);
			ini_set('display_startup_errors', 1);
			error_reporting(E_ALL);
			require("../important/header.php");
		?>
		
		<br><br><br><br>
		<h1>Well, hello stranger! It looks<br>
		like you are interested in joining!
		<b>What is your name?</h1>
		
		<form action="" method="post">
			<input type="email" name="a" placeholder="Username">
		</form>
	
		<?php
			require("../important/footer.php");
		?>
	</body>
</html>

