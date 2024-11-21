<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/global_functions.php';
$user = new PublicUser();
//$asset = json_decode(file_get_contents("http://" . $_SERVER['SERVER_NAME'] . "/AssetInfo?id=101"), true);
$asset = $itemApi->GetAssetInfo(101);
header("Content-Type: application/json");
ob_start();
?>
{"d":"{\"Data\": [\"{\\\"sl_translate\\\":\\\"Date, Description, Amount\\\",\\\"Date\\\":\\\"<?=$user->Joined?>\\\",\\\"Member\\\":\\\"<?=$asset['Creator']['Name']?>\\\",\\\"Description\\\":\\\"Purchased\\\",\\\"Item_Name\\\":\\\"<?=$asset['Name']?>\\\",\\\"Amount\\\":\\\"0\\\",\\\"Member_ID\\\":\\\"<?=$asset['Creator']['Id']?>\\\",\\\"MemberIsGroup\\\":\\\"False\\\",\\\"Group_ID\\\":\\\"\\\",\\\"Amount_Class\\\":\\\"\\\",\\\"Item_Url\\\":\\\"../Item.aspx?id=<?=$asset['AssetId']?>\\\",\\\"Sale_ID\\\":1,\\\"Successful_Payments\\\":0,\\\"Has_Payments\\\":false}\"],\"StartIndex\" : \"1\",\"TotalCount\" : \"1\"}"}<?php
if (json_decode(file_get_contents("php://input"), false)->transactiontype == "purchase" and json_decode(file_get_contents("php://input"), false)->startindex == "0") {
die(ob_get_clean());
}
?>