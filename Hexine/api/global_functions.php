<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/register.php';

//TODO: Rewrite the awful functions

// Base Website Functions
if (!function_exists('session_started')) {
function session_started() //Check if session has started or not
	{
		if ( php_sapi_name() !== 'cli' ) {
			if ( version_compare(phpversion(), '5.4.0', '>=') ) {
				return session_status() === PHP_SESSION_ACTIVE ? TRUE : FALSE;
			} else {
				return session_id() === '' ? FALSE : TRUE;
			}
		}
		return FALSE;
	}
}

// Alerts
if (!function_exists('alert')) {
	function alert($text, $color) {
		return('<div id="ctl00_Announcement"><div id="ctl00_SystemAlertDiv" class="SystemAlert" style="background-color:'.$color.';"><div id="ctl00_SystemAlertTextColor" class="SystemAlertText"><div id="ctl00_LabelAnnouncement">'.$text.'</div></div></div></div>');
	}
}

// Overlays
if (!function_exists('overlayUrl')) {

	function overlayUrl($overlay, $size = 1) {
		$sizes = [0  => "small", 1  => "", 2  => "big"];
		if ($size == 1) 
		{
			return '/Images/Overlays/overlay_'.$overlay.'.png';
		}
		else 
		{
			return '/Images/Overlays/overlay_'.$overlay.'_'.$sizes[$size].'.png';
		}
	}
	
	function overlayUrlDependent($depVar, $overlay, $size) 
	{ //This probably won't be used anywhere else but the ItemImage api but idc.
		if ($depVar == 1) 
		{
			return overlayUrl($overlay, $size);
		}
		else 
		{
			return 'null';
		}
	}
	
	function membershipLevelToString($membershipLevel) 
	{
		$membershipLevels = [0  => null, 1  => "BC", 2  => "TBC", 3  => "OBC"];
		return $membershipLevels[$membershipLevel];
	}

	function MembershipLabel($mlevel, $size) 
	{
		if (membershipLevelToString($mlevel) !== "None" and membershipLevelToString($mlevel) !== null) 
		{
			return overlayUrl(membershipLevelToString($mlevel).'Only', $size);
		}
		else
		{
			return null;
		}
	}
}

// Assets/Catalog
	
if (!function_exists('assetTypeToString')) 
{
	// oi, this isn't so ugly anymore
	function assetTypeToString($assetType) 
	{
		$assetTypes = 
		[
			1  => "Image",
			2  => "T-Shirt",
			3  => "Audio",
			4  => "Mesh",
			5  => "Lua",
			6  => "HTML",
			7  => "Text",
			8  => "Hat",
			9  => "Place",
			10 => "Model",
			11 => "Shirt",
			12 => "Pants",
			13 => "Decal",
			16 => "Avatar",
			17 => "Head",
			18 => "Face",
			19 => "Gear",
			21 => "Badge",
			22 => "Group Emblem",
			24 => "Animation",
			25 => "Arms",
			26 => "Legs",
			27 => "Torso",
			28 => "Right Arm",
			29 => "Left Arm",
			30 => "Left Leg",
			31 => "Right Leg",
			32 => "Package",
			33 => "YouTube Video",
			34 => "Game Pass",
			0  => "Product"
		];
		return $assetTypes[$assetType];
	}
}

if (!function_exists('currencyTypeToString')) {
function currencyTypeToString($currencyType) 
{
	if ($currencyType == 2) {
		return "Tix";
	}
	else
	{
		return "R$";
	}
}
}
	
if (!function_exists('itemPrice')) 
{
	function itemPrice($asset, $sellerId) 
	{
			
		$itemInf = ['expectedCurrency' => 1, 'expectedPrice' => 0];
			
		if ($sellerId == $asset['Creator']['Id']) 
		{ //Selling to the creator
			//Decide which currency to use
			if ($asset['PriceInRobux'] == null and $asset['PriceInTickets'] !== null) 
			{
				$itemInf['expectedCurrency'] = 2;
			}
			elseif ($asset['PriceInRobux'] !== null and $asset['PriceInTickets'] == null) 
			{
				$itemInf['expectedCurrency'] = 1;
			}
			else 
			{
				$itemInf['expectedCurrency'] = 1;
			}
			//Get item price
			if ($itemInf['expectedCurrency'] == 1) 
			{
				$itemInf['expectedPrice'] = (int)$asset['PriceInRobux'];
			}
			elseif ($itemInf['expectedCurrency'] == 2) 
			{
				$itemInf['expectedPrice'] = (int)$asset['PriceInTickets'];
			}
		}
		elseif (in_array($sellerId, $asset['Sellers'])) 
		{ //Selling to a private seller
			$itemInf['expectedCurrency'] = (int)$asset['Sellers'][$sellerId]['expectedCurrency'];
			$itemInf['expectedPrice'] = (int)$asset['Sellers'][$sellerId]['expectedPrice'];
		}
		else 
		{
			return false;
		}
		return $itemInf;
	}
}
	
if(!class_exists('itemApi', true))
{
	class itemApi
	{
		function GetMarketplaceFee($itemPrice) 
		{
			$MarketplaceTaxRate = 0.9;
			$minimumFee = 1;
			
		    $derivedFee = round($itemPrice * $MarketplaceTaxRate);

		    if ($derivedFee > $minimumFee)
				$fee = $derivedFee;
		    else
		        $fee = $minimumFee;

		    return $fee;
		}
			
		function GetUserProfit($itemPrice) 
		{
			global $itemApi;
			if ($itemPrice <= 0 or $itemPrice == "0") 
			{
				return 0;
			}
			else 
			{
				return $itemPrice - $itemApi->GetMarketplaceFee($itemPrice);
			}
		}
			
		function GetAssetInfo($id, $json = false, $rbxAsset = false) //this looks like ass - pizzaboxer
		{
			//The most optimized of its kind :/
			//nvm I should really update this method
			global $database;
			if (!isset($database) or $database == null) {return "Error: Unable to communicate with database";};
			$asset = $database->findRow("asset", ["AssetId" => $id], ["AssetTypeId"]);
			if ($asset && $asset->rowCount() > 0 && $asset->rowCount() !== null) 
			{
				$asset = $asset->fetch(PDO::FETCH_OBJ);
			}
			if ($asset->AssetTypeId == 9) {
				$asset = $database->findRow("asset", ["AssetId" => $id], ["AssetId", "Name", "Description", "Created", "Updated", "IsPublicDomain", "MinimumMembershipLevel", "ContentRatingTypeId", "AssetTypeId", "CreatorId", "Favorited", "Visited", "MaxPlayers", "UpVotes", "DownVotes"]);
			}
			else
			{
				$asset = $database->findRow("asset", ["AssetId" => $id], ["AssetId", "Name", "Description", "Created", "Updated", "PriceInRobux", "PriceInTickets", "Sales", "IsForSale", "IsPublicDomain", "IsLimited", "IsLimitedUnique", "Remaining", "MinimumMembershipLevel", "ContentRatingTypeId", "AssetTypeId", "CreatorId"]); //Make sure these are all spelled correctly
			}
			if ($asset && $asset->rowCount() > 0 && $asset->rowCount() !== null) 
			{
				$asset = $asset->fetch(PDO::FETCH_OBJ);
			}
			else 
			{
				$asset = false;
			}
			if ($asset) 
			{
				//Even more efficient :)
				$user = $database->findRow("public_users", ["Id" => $asset->CreatorId], ["Id", "Name", "MembershipLevel"]);
				if ($user && $user->rowCount() > 0){$user = $user->fetch(PDO::FETCH_OBJ);}
				$asset->Creator = 
				[
					'Id' => $asset->CreatorId, 
					'Name' => $user->Name, 
					'CreatorType' => 'User', 
					'CreatorTargetId' => $asset->CreatorId,
					'MembershipLevel' => $user->MembershipLevel,
				];
				unset($asset->CreatorId);
				$asset->ProductType = assetTypeToString($asset->AssetTypeId);
				$asset->ThumbnailUrl = "/Game/Tools/ThumbnailAsset.ashx?aid=" . $id . "&fmt=png&wd=420&ht=420";
				if(date('Y-m-d G:i:s') > date('Y-m-d G:i:s', strtotime("+1 days", strtotime($asset->Created)))) 
				{
					$asset->IsNew = 0;
				}
				else
				{
					$asset->IsNew = 1;
				}
					
				if ($asset->AssetTypeId !== 9) 
				{
					//Support for legacy items
					if ($asset->PriceInRobux == 0 and $asset->PriceInTickets > 0) 
					{
						$asset->PriceInRobux = null;
					}
					elseif ($asset->PriceInRobux > 0 and $asset->PriceInTickets == 0) 
					{
						$asset->PriceInTickets = null;
					}
					elseif ($asset->PriceInRobux > 0 and $asset->PriceInTickets > 0) 
					{
						//No dual-currency options >:(
						$asset->PriceInTickets = null;
					}
				}
				
				if ($json == true) 
				{
					$jsonData = json_encode($asset);
					if ($jsonData == false) 
					{
						return $json ? "Error: Failed to parse JSON" : false;
					}
					return $jsonData;
				}
				else
				{
					return (array) $asset;
				}
			}
			else 
			{
				if ($rbxAsset == true)
				{
					$info = json_decode(file_get_contents('http://api.roblox.com/Marketplace/ProductInfo?assetId='.$id), true);
					if ($info['IconImageAssetId'] !== 0)
					{
						$info['ThumbnailUrl'] = 'https://roblox.com/Asset?id='.$info['IconImageAssetId'];
					}
					else
					{
						$info['ThumbnailUrl'] = "https://roblox.com/Game/Tools/ThumbnailAsset.ashx?aid=" . $id . "&fmt=png&wd=420&ht=420";
					}
					$info['ProductType'] = assetTypeToString($info['AssetTypeId']);
					return $json ? json_encode($info) : $info;
				}
				return $json ? "Error: Asset info not found." : false;
			}
		}
	}
	$itemApi = new itemApi();
}

if (!function_exists('giveItem')) 
{
	function giveItem($userId, $assetId) 
	{
		global $itemApi;
		$database = $GLOBALS['database'];
		$GLOBALS['Id'] = $userId;
		$user = new UserInf();
		/*$jsonData = file_get_contents("http://" . $_SERVER['SERVER_NAME'] . "/AssetInfo?id=".$assetId);
		$asset = json_decode($jsonData,true);*/
		$asset = $itemApi->GetAssetInfo($assetId);
		
		if ($user->Inventory == "" or $user->Inventory == null or !isset($user->Inventory)) 
		{ //Their inventory doesn't exist. It's ok to overwrite it.
			$user->Inventory = '{"Inventory":[101]}'; //wait until the item transaction has finished to write to the database
			$database->updateRow("asset", ["Sales" => $asset['Sales']+1], ["AssetId" => 101]); //update the sales on the Roblox hat
		}
		$inv = json_decode($user->Inventory, true);
		if ($inv == false) 
		{
			return false;
		}

		if ($user->Name == "Error" or substr(file_get_contents("http://" . $_SERVER['SERVER_NAME'] . "/AssetInfo?id=".$assetId),0,6) == "Error:" or in_array($assetId, $inv['Inventory'])) 
		{
			return false;
		}

		array_push($inv['Inventory'], $assetId); //Add the item to the user's inventory
		$database->updateRow("public_users", ["Inventory" => json_encode($inv)], ["Id" => $userId]);
		$database->updateRow("asset", ["Sales" => $asset['Sales']+1], ["AssetId" => $assetId]);
		return true;
	}
}

if (!function_exists('purchaseItem')) 
{
	function purchaseItem($userId, $assetId, $sellerId) 
	{ //this function is massive
		$database = $GLOBALS['database'];
		global $itemApi;
		//$jsonData = file_get_contents("http://" . $_SERVER['SERVER_NAME'] . "/AssetInfo?id=".$assetId);
		$asset = $itemApi->GetAssetInfo($assetId);
		if ($asset === FALSE) 
		{
			return "An error occurred while trying to fetch the requested item information.";
			die();
		}
			
		//I really need a good way to tell if the item is coming from a seller
		$itemInf = itemPrice($asset, $sellerId);
		$expectedPrice = $itemInf['expectedPrice'];
		$expectedCurrency = $itemInf['expectedCurrency'];

		if (($userId == null and $userId !== 0) or ($sellerId == null and $sellerId !== 0) or ($expectedPrice == null and $expectedPrice !== 0) or ($expectedCurrency == null and $expectedCurrency !== 0) or !isset($expectedCurrency)) 
		{
			return "An error occurred while processing the transaction information.";
		}
			
		//oml
		$userId = (int)$userId;
		$assetId = (int)$assetId;
		$sellerId = (int)$sellerId;
		//$expectedPrice = (int)$expectedPrice;
			
		$GLOBALS['Id'] = $userId;
		$user = new UserInf();
		$GLOBALS['Id'] = $sellerId;
		$seller = new UserInf();
			
		//return "Seller profit: ".GetUserProfit($expectedPrice);

		//purchase enforcements
		/*if ($expectedPrice !== $givenPrice or $expectedCurrency !== $givenCurrency) {
			return 'While you were shopping, the price of this item changed from <span class="currency CurrencyColor'.$givenCurrency.'">'.$givenPrice.'</span> to <span class="currency CurrencyColor'.$expectedCurrency.'">'.$expectedPrice.'</span>.';
			}*/
		if ($asset['IsForSale'] !== "1" and $asset['IsForSale'] !== 1) 
		{ //asset isn't for sale
			return "This item is no longer for sale.";
		}

		if ($user->MembershipLevel < $asset['MinimumMembershipLevel']) 
		{ //user doesn't meet required membership level
			return "Your account doesn't meet the requirements to purchase this item.";
		}

		if ($user->Robux < $expectedPrice and $expectedCurrency == 1) 
		{ //user doesn't have enough Robux to purchase the item
			return "You don't have enough Robux to purchase this item.";
		}

		if ($user->Tickets < $expectedPrice and $expectedCurrency == 2) 
		{ //user doesn't have enough Robux to purchase the item
			return "You don't have enough Tix to purchase this item.";
		}
			
		if(($asset['IsLimited'] !== "0" or $asset['IsLimitedUnique'] !== "0") and $asset['Remaining'] <= 0) 
		{ //asset is limited and no copies remain
			return "There are no more copies of this item remaining.";
		}
		
		if(in_array($assetId, json_decode($user->Inventory,true)['Inventory'])) 
		{ //asset is limited and no copies remain
			return "You already own this item.";
		}
			
		if ($sellerId !== (int)$asset['Creator']['Id']) 
		{//private seller
			if ($expectedPrice !== (int)$asset['Sellers'][$sellerId]['expectedPrice'] or $expectedCurrency !== (int)$asset['Sellers'][$sellerId]['expectedCurrency']) 
			{
				return "An error occurred while verifying the transaction with the seller.";
			}
		}
		elseif ($expectedCurrency == 1) 
		{
			if ($expectedPrice !== (int)$asset['PriceInRobux'] or ($asset['PriceInRobux'] == null and (int)$asset['PriceInRobux'] !== 0)) 
			{
				return "An error occurred while verifying the transaction of Robux.";
			}
		}
		elseif ($expectedCurrency == 2) 
		{
			if ($expectedPrice !== (int)$asset['PriceInTickets'] or ($asset['PriceInTickets'] == null and (int)$asset['PriceInTickets'] !== 0)) 
			{
				return "An error occurred while verifying the transaction of Tix.";
			}
		}
		else 
		{
			return "An unknown error occurred while verifying the transaction.";
		}
			
		if (giveItem($userId, $assetId) == true)
		{ //the user has successfully received the item. now charge the user
			$expectedProfit = $itemApi->GetUserProfit($expectedPrice);
			if ($expectedCurrency == 1) 
			{ //expected currency is Robux
				//user
				$user->Robux = $user->Robux-$expectedPrice; //charge the user
				$database->updateRow("public_users", ["Robux" => $user->Robux], ["Id" => $user->Id]);
				//seller
				$seller->Robux = $seller->Robux+$expectedProfit; //pay the seller
				$database->updateRow("public_users", ["Robux" => $seller->Robux], ["Id" => $sellerId]);
			}
			elseif ($expectedCurrency == 2) 
			{ //expected currency is Tickets
				//user
				$user->Tickets = $user->Tickets-$expectedPrice; //charge the user
				$database->updateRow("public_users", ["Tickets" => $user->Tickets], ["Id" => $user->Id]);
				//seller
				$seller->Tickets = $seller->Tickets+$expectedProfit; //pay the seller
				$database->updateRow("public_users", ["Tickets" => $seller->Tickets], ["Id" => $sellerId]);
			}
			//store the user's owned items in a json array
			//store an array of user ids who're selling the limited item in the database
			//have the AssetInfo api implement this into its response for use by Item.ashx
			//["1":{"sellerId": 1, "sellerName": "Brent Da Mage", "expectedPrice": 12, "expectedCurrency": 1}]
			return "Success";
		}
		return "An error occurred while giving you your item. Your account has not been charged.";
	}
}

	
$catName =
[
	1 => 'All Categories',
	0 => 'Featured',
	2 => 'Collectibles',
	3 => 'Clothing',
	4 => 'Body Parts',
	5 => 'Gear',
	8 => 'Decals',
	6 => 'Models',
	9 => 'Audio',
	7 => 'Plugins'
];

$catType =
[
	1 => [0],				//All Categories
	0 => [0], 				//Featured (JSON list of featured assets' ids'.) (Now shows all categories)
	2 => [0], 				//Collectibles
	3 => [8,2,11,12,32],	//Clothing
	4 => [32,17,18],		//Body Parts
	5 => [19],				//Gear
	8 => [13],				//Decals
	6 => [10],				//Models
	9 => [3],				//Audio
	7 => [10]				//Plugins (They're essentially models without thumbnails. They're just scripts.)
];

$catSubType = 
[
	0  => 0,			//All Items
	1  => 19,			//Melee Weapon
	2  => 19,			//Ranged Weapon
	3  => 19,			//Explosive
	4  => 19,			//Power Up
	5  => 19,			//Navigation Enhancer
	6  => 19,			//Musical Instrument
	7  => 19,			//Social Item
	8  => 19,			//Building Tool
	9  => 8,			//Hats [Personal Transport]
	10 => 18,			//Faces
	11 => 32,			//Packages
	12 => 11,			//Shirts
	13 => 2,			//T-Shirts
	14 => 12,			//Pants
	15 => 17			//Heads
];

$catSortType = 
[
	0  => 'AssetId',		//Relevance
	1  => 'AssetId',		//Most Favorited
	2  => 'Sales',			//Bestselling
	3  => 'Updated',		//Recently updated
	4  => 'PriceInRobux',	//Price (Low to High)
	5  => 'PriceInRobux'	//Price (High to Low)
];

if (!function_exists('catManager')) 
{
	function catManager($cat, $subcat, $catType, $catSubType) 
	{
		if ($subcat == 0) 
		{
			$productType = $catType[$cat][0]; //returns the first item type in the array
		}
		else 
		{
			$productType = $catSubType[$subcat]; //returns the product type for the set sub-category
		}
		return $productType;
	}
}

//Thumbnails

$renderExclusions = 
[ //All of these assets are excluded from 3D thumbnail rendering
	1  => "Image",
	//2  => "T-Shirt",
	3  => "Audio",
	5  => "Lua",
	6  => "HTML",
	7  => "Text",
	//11 => "Shirt",
	//12 => "Pants",
	//13 => "Decal",
	//18 => "Face",
	21 => "Badge",
	22 => "Group Emblem",
	33 => "YouTube Video",
	34 => "Game Pass",
	0  => "Product"
];

$renderIcons = 
[ //All of these asset types are given special thumbnails
	3  => "/Thumbs/audio.png",
	5  => "/Thumbs/Script.png",
	6  => "/Thumbs/unknown.png",
	7  => "/Thumbs/unknown.png",
	33 => "/Thumbs/unknown.png",
	0  => "/Thumbs/unknown.png"
];

$imageRenders = 
[
	1  => "Image",
	//2  => "T-Shirt", //what's the worst that could happen?
	//11 => "Shirt",
	//12 => "Pants",
	//13 => "Decal",
	//18 => "Face",
	21 => "Badge",
	22 => "Group Emblem",
	34 => "Game Pass"
];

$imageReliantAssetTypes = 
[ //these need an image asset uploaded before the processed asset is uploaded dumbass
	2  => "T-Shirt",
	11 => "Shirt",
	12 => "Pants",
	13 => "Decal",
	18 => "Face"
	/*21 => "Badge",
	22 => "Group Emblem",
	34 => "Game Pass",*/
];

if (!function_exists('processAsset')) 
{
	function processAsset($assetTypeId, $params) 
	{
		$robloxXMLHeader = '<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4">
		  <External>null</External>
		  <External>nil</External>
		';
		$robloxXMLFooter = '
		</roblox>';
		$assetPresets = [
			2 => '  <Item class="ShirtGraphic" referent="RBX0">
		    <Properties>
		      <Content name="Graphic">
		        <url>'.$params[0].'</url>
		      </Content>
		      <string name="Name">Shirt Graphic</string>
		      <bool name="archivable">true</bool>
		    </Properties>
		  </Item>',
			11 => '  <Item class="Shirt" referent="RBX0">
		    <Properties>
		      <Content name="ShirtTemplate">
		        <url>'.$params[0].'</url>
		      </Content>
		      <string name="Name">Shirt</string>
		      <bool name="archivable">true</bool>
		    </Properties>
		  </Item>',
			12 => '  <Item class="Pants" referent="RBX0">
		    <Properties>
		      <Content name="PantsTemplate">
		        <url>'.$params[0].'</url>
		      </Content>
		      <string name="Name">Pants</string>
		      <bool name="archivable">true</bool>
		    </Properties>
		  </Item>',
			13 => '  <Item class="Decal" referent="RBX0">
		    <Properties>
		      <token name="Face">5</token>
		      <string name="Name">Decal</string>
		      <float name="Shiny">20</float>
		      <float name="Specular">0</float>
		      <Content name="Texture">
		        <url>'.$params[0].'</url>
		      </Content>
		      <bool name="archivable">true</bool>
		    </Properties>
		  </Item>',
			18 => '  <Item class="Decal" referent="RBX0">
			<Properties>
				<token name="Face">5</token>
				<string name="Name">face</string>
				<float name="Shiny">20</float>
				<float name="Specular">0</float>
				<Content name="Texture"><url>'.$params[0].'</url></Content>
				<bool name="archivable">true</bool>
			</Properties>
		  </Item>'
		];
		if (isset($assetPresets[$assetTypeId])) 
		{
			return $robloxXMLHeader.$assetPresets[$assetTypeId].$robloxXMLFooter;
		}
		return false;
	}
}