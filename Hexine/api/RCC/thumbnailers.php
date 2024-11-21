<?php
require "scripts.php";

function renderAvatar($userId) {
	global $RCC;
	global $RCCServiceSoap;
	return OpenJob($RCCServiceSoap, "RenderAvatar-".$userId, $RCC->Scripts->AvatarThumbScript, array($userId == 0 ? ($RCC->baseUrl.'Asset/CharacterFetch.ashx?userId='.$userId.'&exception=1') : $RCC->baseUrl.'Asset/CharacterFetch.ashx?userId='.$userId, $RCC->baseUrl, 'PNG', 420, 420, $userId));
}
function renderAsset($assetId, $assetTypeId = 0) {
	global $RCC;
	global $RCCServiceSoap;
	
	/*if ($assetTypeId == 11) {
		return MakeThumbScript($RCC->Scripts->ShirtScript, $assetId, null, 420, 420, false, 1785197);
		//$script = $RCC->Scripts->ShirtScript;
		//$args = [$RCC->baseUrl . "Asset/?id=" . $assetId, "PNG", 420, 420, $RCC->baseUrl, $RCC->baseUrl . "Asset/?id=" . 1785197];
	}
	elseif ($assetTypeId == 12) {
		return MakeThumbScript($RCC->Scripts->ShirtScript, $assetId, null, 420, 420, false, 1785197);
		//$script = $RCC->Scripts->ShirtScript;
		//$args = [$RCC->baseUrl . "Asset/?id=" . $assetId, "PNG", 420, 420, $RCC->baseUrl, $RCC->baseUrl . "Asset/?id=" . 1785197];
	}*/
	
	//return OpenJob($RCCServiceSoap, "RenderAsset-".$asset, $script, $args));
	
	return MakeCustomThumbScript($RCCServiceSoap, $RCC->Scripts->PackagedThumbScript, $RCC->baseUrl . "Asset/?id=" . $assetId, 420, 420, $assetId);
}
//TODO: Implement Start Game Script arguments
function startGameServer($placeId = 58, $port = 53640, $groupBuild = false, $maxPlayers = 20, $access = 'test') {
	global $RCC;
	global $RCCServiceSoap;
	//this must be in the same order as it is at the top of the script
	$arguments = [
								 'placeId'	=> $placeId,
								    'port'	=> $port,
							   'sleeptime' 	=> 50,
								  'access' 	=> $access,
									 'url' 	=> 'http://sitetest1.roblonium.com',
								  'killID' 	=> true,
								 'deathID' 	=> true,
								 'timeout' 	=> 30,
					    'autosaveInterval' 	=> 200,
							  'locationID'  => 0,
							  'groupBuild' 	=> $groupBuild,
						  'machineAddress' 	=> file_get_contents('https://roblonium.com/GetCurrentMachineAddress.ashx'),
							 'gsmInterval'  => 0,
								  'gsmUrl'  => 'http://sitetest1.roblonium.com',
							  'maxPlayers'	=> $maxPlayers,
					  'maxSlotsUpperLimit' 	=> $maxPlayers+2,
					  'maxSlotsLowerLimit' 	=> $maxPlayers,
							   'gsmAccess'  => 'http://sitetest1.roblonium.com',
					 'injectScriptAssetID' 	=> $groupBuild ? 25 : 1,
							 'servicesUrl' 	=> 'http://sitetest1.roblonium.com',
				   'permissionsServiceUrl' 	=> 'http://sitetest1.roblonium.com',
								  'apiKey' 	=> 'test',
		'libraryRegistrationScriptAssetID' 	=> 2,
						'isPersonalServer'  => false,
								 'ownerID'  => null
	];
	$i = 0;
	foreach($arguments as $arg){ //for each argument, append its value
		if ($arg == null) {
			$arg = 'nil';
		}
		elseif (is_bool($arg)) {
			if ($arg === FALSE) {
				$arg = 'false';
			}
			elseif ($arg === TRUE) {
				$arg = 'true';
			}
		}
		elseif (is_string($arg))
		{
			$arg = '"'.$arg.'"';
		}
		if ($i == 0) {
			$parsedArguments = $arg;
		}else {
			$parsedArguments = ($parsedArguments . ", " . $arg);
		}
		$i++;
		//echo($arg."\n");
	}
	unset($arg, $i);
	//echo($parsedArguments);
	//either use the baseUrl from the site, or have RCCService use its own. (game:GetService("ContentProvider").BaseUrl)
	$service = $RCCServiceSoap/*GetOpenService()*/;
	return OpenJob($service, 'GameServer-'.$placeId, 'loadfile("'.$RCC->baseUrl.'game/gameserver.ashx")('.$parsedArguments.')', [$arguments['machineAddress'], $port], 300, $placeId);
}
?>