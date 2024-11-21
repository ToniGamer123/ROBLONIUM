<?php
// Must cache
/*header('Expires: Fri, 20 Jan 1984 01:11:11 GMT');
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");*/

require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/database.php';
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/RCC/thumbnailers.php';

if (file_get_contents("php://input") !== "") {

$thumb = file_get_contents("php://input");
if (!isset($database) or $database == null or !RCCService::verifyAccessKey($_SERVER['HTTP_ACCESSKEY']) or $_GET['userId'] == null) {die(Redirect("http://" . $_SERVER['SERVER_NAME'] . "/RobloxDefaultErrorPage.aspx"));}
else {
file_put_contents($_SERVER['DOCUMENT_ROOT'].'/thumbnails/users/'.$_GET['userId'], base64_decode(gzdecode($thumb)));
}
die();
}
if ($_GET['userId'] == null && $_GET['username'] == null) {
	die("Error: Invalid request");
}
header('Content-Type: image/png');
//One could consider this efficient
if ($_GET['userId'] !== null) {
	// User ID support
	$find = $database->findRow("public_users", ["Id" => $_GET['userId']], ["Id"]);
}else {
	// Username support
	$find = $database->findRow("public_users", ["Name" => $_GET['username']], ["Id"]);
}
if ($find && $find->rowCount() > 0){
	$find = $find->fetch(PDO::FETCH_OBJ);
if (file_exists($_SERVER['DOCUMENT_ROOT'].'/thumbnails/users/'.$find->Id)) {
	if (file_exists($_SERVER['DOCUMENT_ROOT'].'/thumbnails/users/'.$find->Id)) {
		die(file_get_contents($_SERVER['DOCUMENT_ROOT'].'/thumbnails/users/'.$find->Id));
	}else {
		die(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Thumbs/unknown.png'));
	}
}
} else {
	die(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/thumbnails/users/8'));
	//die("Error: User does not exist");
}
$result = renderAvatar($_GET['userId']);
if (!($result === FALSE)) {
	echo(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Thumbs/ReviewPending.png'));
}else {
	echo(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Thumbs/defaultimage.png'));
}
//if ($_GET['userId'] !== "0") {
//die(file_get_contents("http://imagesak.roblox.com/ca460efad9ffdbce1f982672d0bf5e2a.png")); //We can't let everyone have a gray avatar before we get charapps working
//}
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
				<ns1:script>loadstring(game:HttpGetAsync("http://sitetest1.roblonium.com/game/avatarrender.php"))()
start("PNG", 420, 420, userId)</ns1:script>
			</ns1:script>
		</ns1:OpenJob>
	</SOAP-ENV:Body>
</SOAP-ENV:Envelope>
<?php
//die(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Images/face.png'));

$soap_request = ob_get_clean();
$soap_request = str_replace("userId", $_GET['userId'], $soap_request);
$soap_request = str_replace("jobId", $_GET['userId'], $soap_request);

  $header = array(
    "Content-type: text/xml; charset=\"utf-8\"",
    "Accept: text/xml",
    "Cache-Control: no-cache",
    "Pragma: no-cache",
    "SOAPAction: AvatarRender",
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

  //header('Content-Type: text/plain'); :thonk:
  if(curl_exec($soap_do) === false) {
    //$err = 'Curl error: ' . curl_error($soap_do);
    curl_close($soap_do);
    //die('Error: Failed to contact render server');
	echo(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Thumbs/unapproved.png'));
  } else {
    curl_close($soap_do);
    echo(file_get_contents($_SERVER["DOCUMENT_ROOT"] . '/Thumbs/ReviewPending.png'));
  }
  */
?>