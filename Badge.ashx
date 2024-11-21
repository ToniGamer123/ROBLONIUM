<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/global_functions.php';
if ($_GET['id'] == "" or $_GET['id'] == null){die("Error: Invalid request.");};
//{"Id":1,"Name":"Administrator Badge", "Thumbnail":"http://sitetest1.roblonium.com/images/RobloniumAdmin.png", "Description":"This badge identifies an account as belonging to a Roblonium administrator. Only official Roblonium administrators will possess this badge."}


if (file_exists($_SERVER["DOCUMENT_ROOT"] . '/Badges/' . $_GET['id'])) {
	echo(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Badges/' . $_GET['id']));
} else {
$badge = $database->findRow("badge", ["Id" => $_GET['id']], []);
if ($badge && $badge->rowCount() > 0){$badge = $badge->fetch(PDO::FETCH_OBJ);}
else{die("Error: The requested badge does not exist.");}
echo(json_encode($badge));
}
?>