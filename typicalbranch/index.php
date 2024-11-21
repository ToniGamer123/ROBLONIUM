<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="css/global.css">
		<!--link rel="stylesheet" href="css/header.css"-->
		<link rel="stylesheet" href="css/landing.css">
	</head>
	<body style="background-image: url(<?php
	//https://spacemy.xyz/pfp/842CC84F-B4B4-4FC7-920D-569586EA33BB.gif)
	$images = explode("\n", file_get_contents("./img/background_images.txt"));
	// Picks a random image from the array
	$image = $images[rand(0, count($images)-1)];
	echo($image);
	?>);">
		<?php
			require("important/header.php");
		?>
		<div id="Body">
			<br><br><br><br><br><br><br><br><br><br><br><br>
			
			<center style="letter-spacing: 0.03em;color: white;">
				<div>
				<h1 style="display: inline-block; padding: 0px; margin: 0px; font-weight: 500;">Welcome to <b>ROBLONIUM.</b></h1>
				</div
				><br><br>
				<div style="font-weight: 200;">The free online building game.</div><br><br>
				<div style="letter-spacing: 0.2em; font-weight: 600; padding-right: 12px;">TAKE A TOUR.</div>
			</center>
			<br>
			<div class="left" style="height: 200px;">
				<form action="" method="post">
					<input type="email" name="a" placeholder="Username"><br>
					<input type="password" name="a" placeholder="Password">
				</form>
			</div>
			<div class="mainDivider"></div>
			<div class="right" style="height: 200px;">
				<div class="button" style="background-color: rgb(29,158,254);">
					<center>
						<span style="font-weight:600;">Sign Up</span><br>
						<div class="subText">It'll only take a minute to start playing.</div>
					</center>
				</div><br>
				<div class="button" style="background-color: #1e63fb;">
					<center>
						<span style="font-weight:600;">Play Now</span><br>
						<div class="subText">No sign-up required.</div>
					</center>
				</div>
			</div>
		</div>
		<?php
			require("important/footer.php");
		?>
	</body>
</html>

