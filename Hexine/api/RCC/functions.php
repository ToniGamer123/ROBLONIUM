<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/database.php';

// TODO: Move this to separate file?
class UUID {
  public static function v5($namespace, $name) {
    if(!self::is_valid($namespace)) return false;

    // Get hexadecimal components of namespace
    $nhex = str_replace(array('-','{','}'), '', $namespace);

    // Binary Value
    $nstr = '';

    // Convert Namespace UUID to bits
    for($i = 0; $i < strlen($nhex); $i+=2) {
      $nstr .= chr(hexdec($nhex[$i].$nhex[$i+1]));
    }

    // Calculate hash value
    $hash = sha1($nstr . $name);

    return sprintf('%08s-%04s-%04x-%04x-%12s',

      // 32 bits for "time_low"
      substr($hash, 0, 8),

      // 16 bits for "time_mid"
      substr($hash, 8, 4),

      // 16 bits for "time_hi_and_version",
      // four most significant bits holds version number 5
      (hexdec(substr($hash, 12, 4)) & 0x0fff) | 0x5000,

      // 16 bits, 8 bits for "clk_seq_hi_res",
      // 8 bits for "clk_seq_low",
      // two most significant bits holds zero and one for variant DCE1.1
      (hexdec(substr($hash, 16, 4)) & 0x3fff) | 0x8000,

      // 48 bits for "node"
      substr($hash, 20, 12)
    );
  }

  public static function is_valid($uuid) {
    return preg_match('/^\{?[0-9a-f]{8}\-?[0-9a-f]{4}\-?[0-9a-f]{4}\-?'.
                      '[0-9a-f]{4}\-?[0-9a-f]{12}\}?$/i', $uuid) === 1;
  }
}

//UUID::v5('518383a0-66f5-416e-9722-03c8ba625034', 'SomeRandomString');


//access key UUID base: 42078d04-4a0d-11ea-aca5-e759e6572da7
//access key UUID Name: 127.0.0.1:64989 (url or ip+port)
//TODO: Remove this when support for multiple services has been implemented.
$RCCServiceSoap->ip = "127.0.0.1";
$RCCServiceSoap->url = $RCCServiceSoap->ip . ":64989";

$RCCServiceSoap->access = UUID::v5('42078d04-4a0d-11ea-aca5-e759e6572da7', $RCCServiceSoap->url);
class RCCService {
  public static function verifyAccessKey($accessKey) {
		//global $RCCServiceSoap;
		global $database;
		// Find service with the exact same access key and compare IPs
		$RCCServiceSoap = $database->findRow("cloud", ["access" => $accessKey], ["ip", "port"]);
		if ($RCCServiceSoap && $RCCServiceSoap->rowCount() > 0 && $RCCServiceSoap->rowCount() !== null) {
			$RCCServiceSoap = $RCCServiceSoap->fetch(PDO::FETCH_OBJ);
		}else {
			return false;
		}
		// assemble the url
		$RCCServiceSoap->url = $RCCServiceSoap->ip . ":" . $RCCServiceSoap->port;
		
		if ($_SERVER['REMOTE_ADDR'] == $RCCServiceSoap->ip || $_SERVER['HTTP_X_FORWARDED_FOR'] == $RCCServiceSoap->ip) {
			return true;
		}else {
			return false;
		}
	}
}

//Global variables??
$valueTypes = array( //this array kinda works as a function by converting PHP value types to Lua
	'NULL' 		=> 'LUA_TNIL',
	'boolean'	=> 'LUA_TBOOLEAN',
	'integer'	=> 'LUA_TNUMBER',
	'string'	=> 'LUA_TSTRING',
	'array'		=> 'LUA_TTABLE'
);
/*LuaValue types consist of
LUA_TNIL
LUA_TBOOLEAN
LUA_TNUMBER
LUA_TSTRING
LUA_TTABLE
*/
//TODO: Add support for Lua tables. For now RCCService should just throw an error.
function argumentParser($args) { //new and improved!
	global $valueTypes;
	$data = "";
	$argAmmount = count($args);
	for($i = 0; $i < $argAmmount; $i++){ //for each argument, append its value
		if (gettype($args[$i]) == 'string') {
			// html encode for strings
			$args[$i] = htmlentities($args[$i], ENT_QUOTES);
		}
		$data = $data . "
					<ns1:LuaValue>
						<ns1:type>".$valueTypes[gettype($args[$i])]."</ns1:type>
						<ns1:value>".$args[$i]."</ns1:value>
					</ns1:LuaValue>";
	}
	return $data;
}

class SOAP {
  public static function post($content, $action, $service) {
	  $header = array(
		"Content-type: text/xml; charset=\"utf-8\"",
		"Accept: text/xml",
		"Cache-Control: no-cache",
		"Pragma: no-cache",
		"SOAPAction: ".$action,
		"Content-length: ".strlen($content),
	  );

	  $content = '<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns2="http://roblox.com/RCCServiceSoap" xmlns:ns1="http://roblox.com/" xmlns:ns3="http://roblox.com/RCCServiceSoap12">
	<SOAP-ENV:Body>'.$content;
	  $content = $content.'	</SOAP-ENV:Body>
</SOAP-ENV:Envelope>';
	  
	  $soap_do = curl_init();
	  curl_setopt($soap_do, CURLOPT_URL, $service->url );
	  curl_setopt($soap_do, CURLOPT_CONNECTTIMEOUT, 10);
	  curl_setopt($soap_do, CURLOPT_TIMEOUT,        30);
	  curl_setopt($soap_do, CURLOPT_RETURNTRANSFER, true );
	  curl_setopt($soap_do, CURLOPT_SSL_VERIFYPEER, false);
	  curl_setopt($soap_do, CURLOPT_SSL_VERIFYHOST, false);
	  curl_setopt($soap_do, CURLOPT_POST,           true );
	  curl_setopt($soap_do, CURLOPT_POSTFIELDS,     $content);
	  curl_setopt($soap_do, CURLOPT_HTTPHEADER,     $header);

	  $curl_response = curl_exec($soap_do);
	  if($curl_response === false) {
		curl_close($soap_do);
		return false;
	  } else {
		curl_close($soap_do);
		return $curl_response;
	  }
  return false;
  }
}
/*
DEPRECATED
Name: New Script Raw
Description: This function directly pings RCCService with a POST request.
Parameters: [
	"scriptName" => "The name for the script that's going to be executed. It's also used as the SOAPAction in the header.",
	"baseScript" => "The code that's going to be executed by RCCService.",
	"jobId"		 => "The ID used when creating a job for RCCService."
]
DEPRECATED
*/
/*
function NewScriptRaw($scriptName, $baseScript, $jobId) {
//This way the job never expires. :D
$soap_request = '<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns2="http://roblox.com/RCCServiceSoap" xmlns:ns1="http://roblox.com/" xmlns:ns3="http://roblox.com/RCCServiceSoap12">
	<SOAP-ENV:Body>
		<ns1:Execute>
			<ns1:jobID>'.jobId.'</ns1:jobID>
			<ns1:script>
				<ns1:name>'.$scriptName.'</ns1:name>
				<ns1:script>'.$baseScript.'</ns1:script>
			</ns1:script>
		</ns1:Execute>
	</SOAP-ENV:Body>
</SOAP-ENV:Envelope>';

  $header = array(
    "Content-type: text/xml; charset=\"utf-8\"",
    "Accept: text/xml",
    "Cache-Control: no-cache",
    "Pragma: no-cache",
    "SOAPAction: {$scriptName}",
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
    curl_close($soap_do);
	return false;
  } else {
    curl_close($soap_do);
	return true;
  }
  return false;
}
*/

/*
DEPRECATED
Name: New Script
Description: This function uses the given argument names to create a Lua function which is then executed with the $args variable.
Parameters: [
	"scriptName" => "The name for the script that's going to be executed.",
	"baseScript" => "The code that's going to be inserted into the new function.",
	"jobId"		 => "The ID used when creating a job for RCCService.",
	"args"		 => "These are the parameters used when building and executing the Lua function. 
					ex:	array(
						'url'			=> 'http://sitetest1.roblonium.com/Asset/?id=100',
						'baseUrl'		=> 'http://sitetest1.roblonium.com/',
						'fileType'		=> 'PNG',
						'width'			=> 420,
						'height'		=> 420,
						'scriptIcon'	=> 'http:/roblonium.com/Thumbs/Script.png',
						'toolIcon'		=> 'http:/roblonium.com/Thumbs/Tool.png'
					)"
]
DEPRECATED
*/
/*
function NewScript($scriptName, $jobId, $baseScript, $args) {
function argumentParser($args, $nameOnly) {
	$data = "";
	$argAmmount = count($args);
	if ($nameOnly !== true) {
		for($i = 0; $i <= $argAmmount; $i++){ //for each argument, append its value
			$data = $data . ", " . $args[$i];
		}
	}else {
		for($i = 0; $i <= $argAmmount; $i++){ //for each argument, append its name
			$data = $data . ", " . key($args);
			next($args);
		}
	}
	return $data;
}
//This uses a more basic script execution function to trim down the amount of space it takes up
$functionBase = '
function start('.argumentParser($args, true).')
'.$baseScript.'
end
start('.argumentParser($args, false).')';
return NewScriptRaw($scriptName, $functionBase, $jobId);
}
*/

/*
Name: Execute Script
Description: This function uses the given arguments to execute a script inside an existing job. Do not try to execute a script inside a non-existent job!!!
Parameters: [
	"scriptName" => "The name for the script that's going to be executed.",
	"baseScript" => "The code that's going to be executed.",
	"jobId"		 => "The ID of the job in which the script is executed.",
	"args"		 => "These are the parameters that RCCService uses when building and executing the Lua script. 
					ex:	array('http://sitetest1.roblonium.com/Asset/?id=100', 'http://sitetest1.roblonium.com/', 'PNG', 420, 420, 'http:/roblonium.com/Thumbs/Script.png', 'http:/roblonium.com/Thumbs/Tool.png')
					RCCService would do the following to the script:
					'url, ext, h, v, scriptIcon, toolIcon = ...' (These are set by RCCService based on the order of the given parameters.)
					'print({0}..{1}..{2}..{3})'					 (This would print 'http://sitetest1.roblonium.com/Asset/?id=100http://sitetest1.roblonium.com/PNG420') (This is exclusive to RCCService Arbiter's String.Format function. Though it could be implemented with PHP's sprintf function.)
					"
]
*/
function ExecuteScript($service, $scriptName, $baseScript, $jobId, $args) {
$contents = '		<ns1:Execute>
			<ns1:jobID>'.$jobId.'</ns1:jobID>
			<ns1:script>
				<ns1:name>'.$scriptName.'</ns1:name>
				<ns1:script>'.$baseScript.'</ns1:script>
				<ns1:arguments>'.argumentParser($args).'
				</ns1:arguments>
			</ns1:script>
		</ns1:Execute>';
SOAP::post($contents, "Execute", $service);
}

/*
Name: Open Job
Description: This function opens a job in accordance with the given arguments.
Parameters: [
	"scriptName" => 			   "The name for the script that's going to be executed.",
	"baseScript" => 			   "The code that's going to be executed.",
	"args"		 => 			   "These are the parameters that RCCService uses when building and executing the Lua script. This is an array.",
	"expirationInSeconds" (300) => "The amount of time before the job is terminated.",
	"category" (0) => 		 	   "According to carrot this is the placeId. thx :)",
	"cores" => (1)				   "An unknown variable that RCCService requires. This might control the amount of resources that're allocated to the job."
]
*/
function OpenJob($service, $scriptName, $baseScript, $args = [], $expirationInSeconds = 300 /*(5 minutes) the default time for thumbnails*/, $category = 0, $cores = 1) {
$jobId = UUID::v5('518383a0-66f5-416e-9722-03c8ba625034', $scriptName . $service->url . time());

$contents = '		<ns1:OpenJob>
			<ns1:job>
				<ns1:id>'.$jobId.'</ns1:id>
				<ns1:expirationInSeconds>'.$expirationInSeconds.'</ns1:script>
				<ns1:category>'.$category.'</ns1:category>
				<ns1:cores>'.$cores.'</ns1:cores>
			</ns1:job>
			<ns1:script>
				<ns1:name>'.$scriptName.'</ns1:name>
				<ns1:script><![CDATA['.$baseScript.']]></ns1:script>
				<ns1:arguments>'.argumentParser($args).'
				</ns1:arguments>
			</ns1:script>
		</ns1:OpenJob>';
//return $contents;
if (!(SOAP::post($contents, "OpenJob", $service) === FALSE)) {
	$scriptInfo = explode("-", $scriptName);
	// only add gameserver jobs to the database as thumbnails and stuff like that expire/finish in a matter of seconds
	if ($scriptInfo[0] == "GameServer" || substr($scriptName, 0, 10) == "GameServer") {
		global $database;
		$database->insertRow("jobs", [ // add the job to the jobs database
			"category" => $scriptInfo[1],
			"jobId" => $jobId,
			"ip" => $args[0],
			"port" => $args[1],
			"serviceId" => $service->access
		], "category");
	}
	return true;
}else {
	return false;
}
}
?>