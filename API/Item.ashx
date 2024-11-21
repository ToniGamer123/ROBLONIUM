<?php
require $_SERVER["DOCUMENT_ROOT"] . '/global.php';
//if ($_SERVER['REQUEST_METHOD'] !== 'POST') { die(header("Location: /RobloniumDefaultErrorPage.aspx?code=400")); }

function errorModal($title, $errorMsg) 
{
die(json_encode(array(
	'statusCode' => 500,
	'showDivID' => 'TransactionFailureView',
	'title' => $title,
	'errorMsg' => $errorMsg
)));
}

header('Content-Type: application/json; charset=utf-8');
if(!SESSION)
{
	errorModal("Transaction Error", "You are not logged in.");
}

if(!isset($_GET['productID']) || !isset($_GET['expectedCurrency']) || !isset($_GET['expectedPrice']) || !isset($_GET['expectedSellerID']) || !isset($_GET['rqtype']))
{
	errorModal("Transaction Error", "An error occured when trying to fetch data. Please try again.");
}

$assetInfo = getMarketplaceInfo($_GET['productID']);

if(!$assetInfo){ errorModal("Transaction Error", "This item does not exist."); }
if(!$assetInfo->IsForSale){ errorModal("Transaction Error", "This item is not for sale."); }

if(($assetInfo->PriceInRobux || $assetInfo->PriceInRobux + $assetInfo->PriceInTickets == 0) && $_GET['expectedCurrency'] == 1)
{
	$expectedCurrency = 1; 
	$price = $assetInfo->PriceInRobux;
	$balanceAfterSale = SESSION["robux"] - $price;
}
elseif($assetInfo->PriceInTickets && $_GET['expectedCurrency'] == 2)
{
	$expectedCurrency = 2;
	$price = $assetInfo->PriceInTickets;
	$balanceAfterSale = SESSION["tickets"] - $price;
}
elseif($_GET['expectedCurrency'] != $price)
{
	die(json_encode([
		'statusCode' => 500,
		'showDivID' => 'PriceChangedView',
		'title' => 'Price Changed',
		'errorMsg' => 'This item has changed price. Please try again.',
		//'balanceAfterSale' => $balanceAfterSale,
		//'expectedPrice' => $_GET['expectedPrice'],
		//'expectedCurrency' => $_GET['expectedCurrency'],
		//'currentCurrency' => $expectedCurrency,
		//'currentPrice' => $price,
		'AssetID' => $assetInfo->AssetId
	]));
}

if($_GET['expectedSellerID'] != $assetInfo->CreatorId){ errorModal("Transaction Error", "An error occured when verifying data. Please try again."); }

$purchaseResult = purchaseAsset(SESSION["userid"], $assetInfo->AssetId, $expectedCurrency);

if($purchaseResult == "Success")
{
	$purchaseMessage = 
	[
		'TransactionVerb' => 'purchased',
		'AssetName' => $assetInfo->Name,
		'AssetType' => assetTypeToString($assetInfo->AssetTypeId),
		'Price' => $price,
		'Currency' => 1,
		'SellerName' => getNameFromUid($assetInfo->CreatorId), //this is changed later based on the seller name
		'AssetID' => $assetInfo->AssetId,
		'expectedCurrency' => $expectedCurrency,
		'currentCurrency' => $_GET['expectedCurrency']
	];
	echo json_encode($purchaseMessage);
}
else
{
	die(errorModal("Transaction Error", $purchaseResult));
}