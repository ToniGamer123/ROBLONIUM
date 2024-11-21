<?php
// Must cache
/*header('Expires: Fri, 20 Jan 1984 01:11:11 GMT');
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");*/

if (file_get_contents("php://input") !== "") {
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/database.php';
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/RCC/functions.php';

$thumb = file_get_contents("php://input");
if (!isset($database) or $database == null or !RCCService::verifyAccessKey($_SERVER['HTTP_ACCESSKEY']) or $_GET['assetId'] == null) {die(Redirect("http://" . $_SERVER['SERVER_NAME'] . "/RobloxDefaultErrorPage.aspx"));}
else {
file_put_contents($_SERVER['DOCUMENT_ROOT'].'/thumbnails/assets/'.$_GET['assetId'], base64_decode(gzdecode($thumb)));
}
die();
}
if ($_GET['fmt'] == null or $_GET['wd'] == null or $_GET['ht'] == null or $_GET['aid'] == null) {
	die("Error: Invalid request");
}
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/global_functions.php';
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/RCC/thumbnailers.php';

//One could consider this efficient
$find = $database->findRow("asset", ["AssetId" => $_GET['aid']], ["AssetId", "AssetTypeId"]);
if ($find && $find->rowCount() > 0){
	$find = $find->fetch(PDO::FETCH_OBJ);
	header('Content-Type: image/png');
	$assetType = $find->AssetTypeId;
if (file_exists($_SERVER['DOCUMENT_ROOT'].'/thumbnails/assets/'.$find->AssetId)) {
if ($renderExclusions[$assetType]){
	if ($imageRenders[$assetType]) {
		/*if (!file_exists($_SERVER['DOCUMENT_ROOT'].'/thumbnails/assets/'.$find->AssetId)) {
			file_put_contents($_SERVER['DOCUMENT_ROOT'].'/thumbnails/assets/'.$find->AssetId, file_get_contents('http://sitetest1.roblonium.com/Asset?id='.$find->AssetId)); //moves old content to a folder
		}*/
		die(file_get_contents('http://sitetest1.roblonium.com/Asset?id='.$find->AssetId));
	}elseif ($renderIcons[$assetType]) {
		die(file_get_contents($_SERVER["DOCUMENT_ROOT"] . $renderIcons[$assetType]));
	}else {
		die(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Thumbs/unknown.png'));
	}
}

	if (file_exists($_SERVER['DOCUMENT_ROOT'].'/thumbnails/assets/'.$find->AssetId)) {
		die(file_get_contents($_SERVER['DOCUMENT_ROOT'].'/thumbnails/assets/'.$find->AssetId));
	}else {
	die(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Thumbs/unknown.png'));
	}

	die(base64_decode($thumb));
}/*elseif ($renderExclusions[$assetType]){
	if ($imageRenders[$assetType]) {
		if (!file_exists($_SERVER['DOCUMENT_ROOT'].'/thumbnails/assets/'.$find->AssetId)) {
			file_put_contents($_SERVER['DOCUMENT_ROOT'].'/thumbnails/assets/'.$find->AssetId, file_get_contents('http://sitetest1.roblonium.com/Asset?id='.$find->AssetId)); //moves old content to a folder
		}
		die(file_get_contents('http://sitetest1.roblonium.com/Asset?id='.$find->AssetId));
	}else {
		die(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Thumbs/unknown.png'));
	}
}*/
elseif (isset($renderExclusions[$assetType]) /*or file_get_contents('http://'.$_SERVER['SERVER_NAME'].'/thumbnails/assets/'.$params[$i]['assetId']) == file_get_contents('http://'.$_SERVER['SERVER_NAME'].'/thumbs/invisible.png')*/){
	//if the item shouldn't be rendered or didn't render properly, display its 2D counterpart
	if (isset($imageRenders[$assetType])) {
		die(file_get_contents('http://sitetest1.roblonium.com/Asset?id='.$find->AssetId));
	}elseif (isset($renderIcons[$assetType])) {
		die(file_get_contents('http://sitetest1.roblonium.com/'.$renderIcons[$assetType]));
	}else {
		die(file_get_contents('http://sitetest1.roblonium.com/Thumbs/unknown.png'));
	}
}
} else {
	Redirect("http://roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=" . $_GET['fmt'] . "&wd=" . $_GET['wd'] . "&ht=" . $_GET['ht'] . "&aid=" . $_GET['aid']);
}

$result = renderAsset($find->AssetId, $assetType);
if (!($result === FALSE)) {
	echo(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Thumbs/ReviewPending.png'));
}else {
	echo(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Thumbs/defaultimage.png'));
}

/*ob_start();
?>
<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns2="http://roblox.com/RCCServiceSoap" xmlns:ns1="http://roblox.com/" xmlns:ns3="http://roblox.com/RCCServiceSoap12">
	<SOAP-ENV:Body>
		<ns1:OpenJob>
			<ns1:job>
				<ns1:id>jobId</ns1:id>
				<ns1:expirationInSeconds>20</ns1:expirationInSeconds>
				<ns1:category>1</ns1:category>
				<ns1:cores>1</ns1:cores>
			</ns1:job>
			<ns1:script>
				<ns1:name>Script</ns1:name>
				<ns1:script>loadstring(game:HttpGetAsync("http://sitetest1.roblonium.com/game/assetrender.php"))()
start("PNG", 420, 420, assetId)</ns1:script>
			</ns1:script>
		</ns1:OpenJob>
	</SOAP-ENV:Body>
</SOAP-ENV:Envelope>
<?php
//die(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Images/Asset.png'));

$soap_request = ob_get_clean();
$soap_request = str_replace("format", $_GET['fmt'], $soap_request);
$soap_request = str_replace("width", $_GET['wd'], $soap_request);
$soap_request = str_replace("height", $_GET['ht'], $soap_request);
$soap_request = str_replace("assetId", $_GET['aid'], $soap_request);
$soap_request = str_replace("jobId", $_GET['aid'], $soap_request);

  $header = array(
    "Content-type: text/xml; charset=\"utf-8\"",
    "Accept: text/xml",
    "Cache-Control: no-cache",
    "Pragma: no-cache",
    "SOAPAction: AssetRender",
    "Content-length: ".strlen($soap_request),
  );

  $soap_do = curl_init();
  curl_setopt($soap_do, CURLOPT_URL, "127.0.0.1:64989" );
  curl_setopt($soap_do, CURLOPT_CONNECTTIMEOUT, 10);
  curl_setopt($soap_do, CURLOPT_TIMEOUT,        10);
  curl_setopt($soap_do, CURLOPT_RETURNTRANSFER, true );
  curl_setopt($soap_do, CURLOPT_SSL_VERIFYPEER, false);
  curl_setopt($soap_do, CURLOPT_SSL_VERIFYHOST, false);
  curl_setopt($soap_do, CURLOPT_POST,           true );
  curl_setopt($soap_do, CURLOPT_POSTFIELDS,     $soap_request);
  curl_setopt($soap_do, CURLOPT_HTTPHEADER,     $header);

  header('Content-Type: text/plain');
  if(curl_exec($soap_do) === false) {
    //$err = 'Curl error: ' . curl_error($soap_do);
    curl_close($soap_do);
    //die('Error: Failed to contact render server');
	echo(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Thumbs/unapproved.png'));
  } else {
    curl_close($soap_do);
    echo(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Thumbs/ReviewPending.png'));
  }*/
?>