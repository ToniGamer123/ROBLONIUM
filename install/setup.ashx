<?php
function Redirect($url, $permanent = false) {
    header('Location: ' . $url, true, $permanent ? 301 : 302);

    exit();
}
$version = file_get_contents($_SERVER["DOCUMENT_ROOT"] . "/version");
if ($version !== FALSE) {
	Redirect("https://" . $_SERVER['SERVER_NAME'] . "/" . $version . "-HexineLauncher.exe");
}else {
	Redirect("https://" . $_SERVER['SERVER_NAME'] . "/HexineLauncher.exe");
}
//Redirect("https://cdn.discordapp.com/attachments/606238647515348993/606238923202756609/HexineLauncher.exe");
?>
