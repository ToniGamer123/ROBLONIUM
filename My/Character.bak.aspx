<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/global.php';

$user = new PublicUser();
$inv = json_decode($user->Inventory,true)['Inventory'];
$characterAppearance = json_decode(file_get_contents("http://" . $_SERVER['SERVER_NAME'] . "/v1.1/avatar-fetch?userId=".$user->Id."&raw=1&cPage=1"),true);
$avatarRules = json_decode(file_get_contents('http://'.$_SERVER['SERVER_NAME'].'/API/AvatarRules.ashx/userId='.$user->Id), true);

function brickColorToHex($part) //sadly this is specific to avatar body parts
{
	global $characterAppearance;
	global $avatarRules;
	$hexColor = array_search($characterAppearance['bodyColors'][$part.'Color'], array_column($avatarRules['bodyColorsPalette'], 'brickColorId'));
	if ($hexColor === FALSE)
	{
		return '#ff0000';
	}
	return $avatarRules['bodyColorsPalette'][$hexColor]['hexColor'];
}

function assetTypeSorter($assetTypeId) {
	global $assetType;
	if ($assetType == $assetTypeId) {
		return '_Selected';
	}
}
/*function catSelect($category) {
	global $assetType;
	if ($assetType) == $category) {
		return 'selected="selected" ';
	}
}*/

$page = file_get_contents("Char.php");
$assetType = 8;

if (isset($_POST['__EVENTTARGET']))
{
function updateCharapp() {
	global $database;
	global $characterAppearance;
	global $user;
	$charapp = $characterAppearance;
	$charapp['accessoryIds'] = array_values($charapp['accessoryIds']);
	$charapp['backpackGearIds'] = array_values($charapp['backpackGearIds']);
	$charapp['equippedGearIds'] = array_values($charapp['equippedGearIds']);
	unset($charapp['allEquippedAssets']);
	$database->updateRow("public_users", [
	"CharacterAppearance" => json_encode($charapp, JSON_NUMERIC_CHECK),
	], ["Id" => $user->Id]);
}
	/*$params = explode(",", $_POST['__EVENTTARGET']);
	if (substr($_POST['__EVENTTARGET'], -1) == "thing")
	{
		$assetId = substr($_POST['__EVENTTARGET'], 12, strlen($_POST['__EVENTTARGET']));
		
	}*/
	//set character appearance based on the posted __EVENTTARGET, then return something like https://pastebin.com/raw/2teHxmMw
	//or just use the __EVENTARGUMENT. lol
	//This should be the first step to emulating ROBLOX's __doPostBack response.
	
	// (old) TODO: Have Char.php get asset type ids and use them as parameters in the __doPostBack function that the category selection tabs execute.
	
	if (!(strpos($_POST['__EVENTTARGET'], "RemoveAccoutrementButton") === FALSE)) //if the purpose of the post is to remove an accountrement (accessory/asset), modify and post the new character appearance to the database
	{
		$assetId = $_POST['__EVENTARGUMENT'];
		if (in_array($assetId, $characterAppearance['accessoryIds']) and in_array($assetId, $inv)) //checks if the user owns the asset and that they have it equipped
		{
			unset($characterAppearance['accessoryIds'][array_search($assetId, $characterAppearance['accessoryIds'])]);
			unset($characterAppearance['allEquippedAssets'][array_search($assetId, $characterAppearance['allEquippedAssets'])]);
			updateCharapp();
		}
		else
		{
			if (in_array($assetId, $characterAppearance['backpackGearIds']) and in_array($assetId, $inv)) //checks if the user owns the asset and that they don't already have it equipped
			{
				unset($characterAppearance['backpackGearIds'][array_search($assetId, $characterAppearance['backpackGearIds'])]);
				unset($characterAppearance['allEquippedAssets'][array_search($assetId, $characterAppearance['allEquippedAssets'])]);
				if (isset($characterAppearance['equippedGearIds'][array_search($assetId, $characterAppearance['equippedGearIds'])])) {
					unset($characterAppearance['equippedGearIds'][array_search($assetId, $characterAppearance['equippedGearIds'])]);
				}
				updateCharapp();
			}
			//print("User ".$user->Id." attempted to apply item ".$assetId." to their character appearance but failed because they already have the item equipped or they don't own it.");
		}
	}
	if (!(strpos($_POST['__EVENTTARGET'], "WearAccoutrementButton") === FALSE)) //if the purpose of the post is to wear an accountrement (accessory/asset), modify and post the new character appearance to the database
	{
		$assetId = $_POST['__EVENTARGUMENT'];
		//$asset = json_decode(file_get_contents('http://' . $_SERVER['SERVER_NAME'] . '/AssetInfo?id='.$assetId.'&rbxAsset=1'),true);
		$asset = $itemApi->GetAssetInfo($assetId, false, true);
		if (!(array_search($asset['AssetTypeId'], array_column($avatarRules['wearableAssetTypes'], 'id')) === FALSE)) { //checks to make sure the asset is equippable
		if (!in_array($assetId, $characterAppearance['accessoryIds']) and in_array($assetId, $inv) and $asset['AssetTypeId'] !== '19') //checks if the user owns the asset and that they don't already have it equipped
		{
			array_push($characterAppearance['accessoryIds'], $assetId);
			array_push($characterAppearance['allEquippedAssets'], $assetId);
			updateCharapp();
		}
		else
		{
			if (!in_array($assetId, $characterAppearance['backpackGearIds']) and in_array($assetId, $inv) and $asset['AssetTypeId'] == '19') //checks if the user owns the asset and that they don't already have it equipped
			{
				array_push($characterAppearance['backpackGearIds'], $assetId);
				array_push($characterAppearance['allEquippedAssets'], $assetId);
				/*if (isset($characterAppearance['equippedGearIds'][array_search($assetId, $characterAppearance['equippedGearIds'])])) {
					array_push($characterAppearance['equippedGearIds'], $assetId);
				}*/
				updateCharapp();
			}
			//print("User ".$user->Id." attempted to apply item ".$assetId." to their character appearance but failed because they already have the item equipped or they don't own it.");
		}
		}
	}
	if (!(strpos($_POST['__EVENTTARGET'], "DataListColors") === FALSE))
	{
		$bodyPart = substr($_POST['__EVENTTARGET'], strpos($_POST['__EVENTTARGET'], '$ColorChooser')+13, strpos($_POST['__EVENTTARGET'], '$DataListColors')-(strpos($_POST['__EVENTTARGET'], '$ColorChooser')+13));
		$bodyColor = $_POST['__EVENTARGUMENT'];
		if ($characterAppearance['bodyColors'][$bodyPart.'Color'] !== $bodyColor and !(array_search($bodyColor, array_column($avatarRules['bodyColorsPalette'], 'brickColorId')) === FALSE)) //checks that the body color is valid
		{
			$characterAppearance['bodyColors'][$bodyPart.'Color'] = $bodyColor;
			updateCharapp();
		}
	}
	if (!(strpos($_POST['__EVENTTARGET'], "cmdInvalidateThumbnails") === FALSE))
	{
		$assetId = $_POST['__EVENTARGUMENT'];
		if (file_exists($_SERVER['DOCUMENT_ROOT'].'/thumbnails/users/'.$find->Id))
		{
			//delete thumbnail from site folder
			unlink($_SERVER['DOCUMENT_ROOT'].'/thumbnails/users/'.$user->Id);
		}
	}
	if (!(strpos($_POST['__EVENTTARGET'], "CategorySelector") === FALSE))
	{
		$assetType = $_POST['__EVENTARGUMENT'];
	}
	if (!(strpos($_POST['__EVENTTARGET'], "WardrobeNextBtn") === FALSE) || !(strpos($_POST['__EVENTTARGET'], "WardrobePrevBtn") === FALSE))
	{
		$parameters = html_entity_decode($_POST['__EVENTARGUMENT']);
		$parameters = str_replace("$", "_", $parameters);
		$parameters = explode("|", $parameters);
		$pageNum = $parameters[0];
		$assetType = $parameters[1];
		$invAdj = $inv;
		$count = count($invAdj);
		$assets = 0;
		$deletedAssets = array();
		for($i = 0; $i < $count and $assets < (($pageNum - 1) * 8); ++$i) {
			$assetId = $invAdj[$i];
			//$asset = json_decode(file_get_contents('http://' . $_SERVER['SERVER_NAME'] . '/AssetInfo?id='.$assetId.'&rbxAsset=1'),true);
			$asset = $itemApi->GetAssetInfo($assetId, false, true);
			if ($asset['AssetTypeId'] == $assetType and $invAdj[$i] !== null and !in_array($assetId, $characterAppearance['allEquippedAssets'])) {
				unset($invAdj[$i]);
				$assets++;
				array_push($deletedAssets, $assetId);
			}
		}
		/*
		if ($i >= $count) {
			die("EEEE");
		}
		if ($assets >= (($pageNum - 1) * 8)) {
			print_r($deletedAssets);
			die("\n" . "REEEE Assets deleted: ". $assets. " Assets found: " . $count);
		}
		*/
		//reindex array so that Char.php can read it properly
		$invAdj = array_values($invAdj);
	}
}

if (isset($_POST['ctl00$ctl00$ScriptManager']))
{
	$actions = html_entity_decode($_POST['ctl00$ctl00$ScriptManager']);
	$actions = str_replace("$", "_", $actions);
	$actions = explode("|", $actions);
	$dom = new DOMDocument();
	//$dom->loadHTML($page);
	$dom->loadHTML(eval('ob_start();?>'.$page.'<?php return ob_get_clean();?>'));
	//I moved html contents of this page to an external document because I'm now able to use the most up-to-date values when processing the requested updatePanels.
	//This prevents outdated values from being used in new panels while the database is still updating.
	//This page MUST be evaluated after the values have been updated.
	if (!(strpos($_POST['__EVENTTARGET'], "ColorChooser") === FALSE))
	{
		/*$content = eval('ob_start();?>'.$BodyColorsPanel.'<?php return ob_get_clean();?>'); //holy shit. you really have to think outside the box. idk if I'm bad at PHP or what, but this feels like hell both effort and efficiency wise*/
		$content = $dom->saveHTML($dom->getElementById('ctl00_ctl00_cphRoblox_cphMyRobloxContent_UpdatePanelBodyColors'));
		$content = substr($content, strpos($content, '>')+1, strlen($content)-6);
		/*$content = eval('ob_start();?>'.html_entity_decode($content).'<?php return ob_get_clean();?>');*/
		echo(strlen($content)."|updatePanel|ctl00_ctl00_cphRoblox_cphMyRobloxContent_UpdatePanelBodyColors|".$content."|");
	}
	foreach ($actions as $action){
		// this handles panel updates like ASP.NET
		//add face ctl00$ctl00$cphRoblox$cphMyRobloxContent$UpdatePanelWardrobe
		//remove face ctl00$ctl00$cphRoblox$cphMyRobloxContent$UpdatePanelAccoutrements
		if (!(strpos($action, "UpdatePanel") === FALSE))
		{
			$content = $dom->saveHTML($dom->getElementById($action));
			$content = substr($content, strpos($content, '>')+1, strlen($content)-6); //omfl
			//$content = str_replace('&gt;', '>', $content);
			//die($content);
			/*$content = eval('ob_start();?>'.$content.'<?php return ob_get_clean();?>');*/
			echo(strlen($content)."|updatePanel|".$action."|".$content."|");
			
			if (!(strpos($action, "UpdatePanelWardrobe") === FALSE) and !in_array('ctl00_ctl00_cphRoblox_cphMyRobloxContent_UpdatePanelAccoutrements', $actions))
			{
				//die("VROOM VROOM");
				//array_push($actions, 'ctl00$ctl00$cphRoblox$cphMyRobloxContent$UpdatePanelAccoutrements');
				$action = 'ctl00_ctl00_cphRoblox_cphMyRobloxContent_UpdatePanelAccoutrements';
				$content = $dom->saveHTML($dom->getElementById($action));
				$content = substr($content, strpos($content, '>')+1, strlen($content)-6);
				echo(strlen($content)."|updatePanel|".$action."|".$content."|");
				
			}elseif (!(strpos($action, "UpdatePanelAccoutrements") === FALSE) and !in_array('ctl00_ctl00_cphRoblox_cphMyRobloxContent_UpdatePanelWardrobe', $actions))
			{
				//die("BEEP BEEP");
				//array_push($actions, 'ctl00$ctl00$cphRoblox$cphMyRobloxContent$UpdatePanelWardrobe');
				$action = 'ctl00_ctl00_cphRoblox_cphMyRobloxContent_UpdatePanelWardrobe';
				$content = $dom->saveHTML($dom->getElementById($action));
				$content = substr($content, strpos($content, '>')+1, strlen($content)-6);
				echo(strlen($content)."|updatePanel|".$action."|".$content."|");
			}
		}
	}
}else {
	die(eval("?>".$page));
}
?>