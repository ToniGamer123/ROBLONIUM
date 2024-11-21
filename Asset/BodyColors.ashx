<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/core_functions.php';
header('Content-Type: text/plain');
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
$xmlheader = '<?xml version="1.0" encoding="utf-8" ?>
';
$user = getUserInfoFromUid((int)$_GET['userId']);
if (!$user) {
	$user = getUserInfoFromUid(2);
	if ($user and $user->CharacterAppearance !== "" and $user->CharacterAppearance !== null) {
		$bodyColors = json_decode($user->CharacterAppearance, false)->bodyColors;
	}else {
		die("Error: Failed to fetch Guest character appearance");
	}
}
if ($user->CharacterAppearance !== "" and $user->CharacterAppearance !== null) {
	$bodyColors = json_decode($user->CharacterAppearance, false)->bodyColors;
} else{
	$user = getUserInfoFromUid(53);
	if ($user and $user->CharacterAppearance !== "" and $user->CharacterAppearance !== null) {
		$bodyColors = json_decode($user->CharacterAppearance, false)->bodyColors;
	}else {
		die("Error: Failed to fetch Default character appearance");
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