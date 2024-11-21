<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/database.php';
header('Content-Type: text/plain');
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
$xmlheader = '<?xml version="1.0" encoding="utf-8" ?>
';
if (file_exists($_SERVER["DOCUMENT_ROOT"] . '/user/getbodycolors/' . $_GET['userId'])) {
	die(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/user/getbodycolors/' . $_GET['userId']));
} else {
	function load($id){
		global $database;
		global $find;
		$find = $database->findRow("public_users", ["Id" => $id], ["Id", "CharacterAppearance"]);
		if ($find && $find->rowCount() > 0){
			$find = $find->fetch(PDO::FETCH_OBJ);
			return true;
		}
		else {
			return false;
		}
	}
	if (load($_GET['userId']) == true and $find->CharacterAppearance !== "" and $find->CharacterAppearance !== null) {
	$bodyColors = json_decode($find->CharacterAppearance, false)->bodyColors;
	} else{
	load(0);
	$bodyColors = json_decode($find->CharacterAppearance, false)->bodyColors;
	}
}
?>
<?=$xmlheader?>
<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4">
	<External>null</External>
	<External>nil</External>
	<Item class="BodyColors">
		<Properties>
			<int name="HeadColor"><?=$bodyColors->HeadColor?></int>
			<int name="LeftArmColor"><?=$bodyColors->LeftArmColor?></int>
			<int name="LeftLegColor"><?=$bodyColors->LeftLegColor?></int>
			<string name="Name">Body Colors</string>
			<int name="RightArmColor"><?=$bodyColors->RightArmColor?></int>
			<int name="RightLegColor"><?=$bodyColors->RightLegColor?></int>
			<int name="TorsoColor"><?=$bodyColors->TorsoColor?></int>
			<bool name="archivable">true</bool>
		</Properties>
	</Item>
</roblox>