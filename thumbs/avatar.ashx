<?php
if (isset($_GET['username'])) {
	header("Location: /Game/Tools/Avatar.ashx?username=".$_GET['username']);
}elseif (isset($_GET['userId'])) {
	header("Location: /Game/Tools/Avatar.ashx?userId=".$_GET['userId']);
}else {
	echo("ERROR");
}
?>