<?php
header("content-type: application/json; charset=utf-8");
require_once $_SERVER['DOCUMENT_ROOT']."/Hexine/api/core_functions.php";

function returnError($code, $message, $type = 0)
{
	if($type == 0){ $array = ["code" => $code, "message" => $message]; }
	else{ $array = ['errors' =>[['code' => 400,'message' => 'BadRequest']]]; }
	header("HTTP/1.1 $code $message");
	die(json_encode($array));
}

// some checks
if(isset($_GET['assetId'])){ $assetId = $_GET['assetId']; } else { returnError(500, "InternalServerError"); }
if(!filter_var($assetId, FILTER_VALIDATE_INT)){ returnError(500, "InternalServerError"); }
if(isset($_GET['rbx'])){ die(file_get_contents("http://api.roblox.com/marketplace/productinfo?".$_SERVER['QUERY_STRING'])); }

//then query
$query = $pdo->prepare("SELECT * FROM asset WHERE AssetId = :id");
$query->bindParam(":id", $assetId, PDO::PARAM_INT);
$query->execute();
if(!$query->rowCount()){ returnError(400, "BadRequest", 1); }
$row = $query->fetch(PDO::FETCH_OBJ);

//check if the item was created in the last 3 days to determine whether it's new or not
$timestamp = strtotime($row->Created);
if($timestamp + 259200 > time()){ $IsNew = true; } else{ $IsNew = false; }

$data =
[
  'TargetId' => intval($row->AssetId),
  'ProductType' => 'User Product',
  'AssetId' => intval($row->AssetId),
  'ProductId' => 1305046,
  'Name' => $row->Name,
  'Description' => $row->Description,
  'AssetTypeId' => $row->AssetTypeId,
  'Creator' => 
  [
    'Id' => intval($row->CreatorId),
    'Name' => getNameFromUid($row->CreatorId),
    'CreatorType' => 'User',
    'CreatorTargetId' => intval($row->CreatorId)
  ],
  'IconImageAssetId' => 607948062,
  'Created' => $row->Created,
  'Updated' => $row->Updated,
  'PriceInRobux' => intval($row->PriceInRobux),
  'PriceInTickets' => intval($row->PriceInTickets),
  'Sales' => intval($row->Sales),
  'IsNew' => $IsNew,
  'IsForSale' => boolval($row->IsForSale),
  'IsPublicDomain' => boolval($row->IsPublicDomain),
  'IsLimited' => boolval($row->IsLimited),
  'IsLimitedUnique' => boolval($row->IsLimitedUnique),
  'Remaining' => intval($row->Remaining),
  'MinimumMembershipLevel' => intval($row->MinimumMembershipLevel),
  'ContentRatingTypeId' => intval($row->ContentRatingTypeId)
];

die(json_encode($data));