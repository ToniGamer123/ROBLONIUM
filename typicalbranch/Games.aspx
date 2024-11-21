<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="css/global.css">
		<link rel="stylesheet" href="css/header.css">
		<link rel="stylesheet" href="css/landing.css">
		<link rel="stylesheet" href="css/games.css">
		<style>
			.left {
				padding-left: 20px;
				float: left;
				width: calc(20% - 20px);
				line-height: 20px;
				border-right: 1px solid black;
			}

			.right {
				float: right;
				width: calc(80% - 20px);
			}
			
			.contents {
				width: 67%;
				margin: auto;
			}
			
			.halfhalf {
				background-image: url(http://sitetest1.roblonium.com/typicalbranch/img/roblox-home2_905.png);
				background-repeat: repeat-x;
				background-size: 100% 100%;
				background-color: #f4f4f4;
			}
		</style>
	</head>
	<body class="halfhalf" style="overflow-y: scroll;">
		<?php
			require("important/header.php");
		?>
		
		<div class="contents">
			<br><br>
			<div class="left">
				<h1>Games</h1>
				<big>Search</big><br><br>
				<div class="recommendedTab">
					<h2>Recommended</h2>
					<big>Featured</big><br>
					<big>Popular</big><br>
					<big>Most Favorited</big><br>
					<big>Recently Played</big>
				</div>
				<br><br><br>
				<h2>Genre</h2>
				<small>All</small><br>
				<small>Building</small><br>
				<small>Horror</small><br>
				<small>City</small><br>
				<small>Military</small><br>
				<small>Comedy</small><br>
				<small>Medieval</small><br>
				<small>Adventure</small><br>
				<small>Sci-Fi</small><br>
				<small>Naval</small><br>
				<small>FPS</small><br>
				<small>Sports</small><br>
				<small>Fighting</small><br>
				<small>Western</small><br>
			</div>
			
			<div class="right">
				<div class="grid-container">
					<div class="game" style="text-align: left;font-size: 17px;">
						<b><small>Game game on the Game</small></b><br>
						<span style="color: #303030;">by</span> <b>Example</b>
						<small><span style="float:right; color: red;">1000 players online</span></small><br>
						<img style="width: 240px;" src="https://i.imgur.com/80X3dos.png"><br>
					</div>
				</div>
			</div>
		</div>
		
		<?php
			require("important/footer.php");
		?>
	</body>
</html>

