<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/private/register.php';
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/RCC/thumbnailers.php';
header('Content-Type: application/json; X-Robots-Tag: noindex');
date_default_timezone_set('America/Chicago');

function signAuthTicket($userId, $jobId) {
	//auth ticket message format (sign this and give the signature to client)
	/*
	userId (49215350)
	jobId (d8a55c59-e5b8-4895-90c7-9d6471aed68b)
	timestamp (2/24/2020 5:40:14 PM)
	*/
	$ticket = $userId . ";" . $jobId . ";" . date('n\/j\/Y\ g\:i\:s\ A');
	openssl_sign($ticket, $sig, file_get_contents("file:///C:/signing/privatekey.pem"), OPENSSL_ALGO_SHA1);
	return base64_encode($sig);
}

$user = new PublicUser();

//TODO: This would be really fun to work on. Nostalgia would you wanna work on this?

$parameters = array(
	"jobId" => null,
	"status" => 4,
	"joinScriptUrl" => null,
	"authenticationUrl" => null,
	"authenticationTicket" => null,
	"message" => "Invalid request type."
);
function verifyVar($var) {
	if ($var !== null and $var !== 'null' and $var !== '' and isset($var)) {
		return true;
	}
	return false;
}

// for future reference http://web.archive.org/web/20080531065005id_/roblox.com/Game/PlaceLauncher.asmx?WSDL
/*
PlaceLauncher Status Key

0: "" (Retry for client, no string for MadStatus)
1: "A server is loading the game..." (Retry for client)
2: "The server is ready. Joining the game..."
3: "Joining games is temporarily disabled while we upgrade. Please try again soon." (Displayed by MadStatus but results in an error for the client)
4: "An error occurred. Please try again later." (Displayed by MadStatus but results in an error for the client)
5: "The game you requested has ended." (Displayed by MadStatus but results in an error for the client)
6: "The game you requested is currently full. Waiting for an opening..."
7: "Roblox is updating. Please wait..." (Used by MadStatus)
8: "Requesting a server" (Displayed before a request is sent to PlaceLauncher.ashx)

            // Place join status results
            // Waiting = 0,
            // Loading = 1,
            // Joining = 2,
            // Disabled = 3,
            // Error = 4,
            // GameEnded = 5,
            // GameFull = 6
            // UserLeft = 10
            // Restricted = 11
*/


// Request Game
switch ($_GET["request"]) {
	case "RequestGame":
		if (verifyVar($_GET["placeId"])) {
			$_GET["placeId"] = (int)$_GET["placeId"];
			//	This adds a job to the database where a server can pickup the request. Once the server picks it up, it modifies the status of the request in the database.
			
			//	some exceptions for debugging
			switch ($_GET["placeId"]) {
				case 0:
					$parameters["jobId"] = "test1";
					$parameters["status"] = 2;
					$parameters["joinScriptUrl"] = "http://sitetest1.roblonium.com/game/join.ashx?UserID=0&server=localhost&json=1";
					$parameters["authenticationUrl"] = "http://sitetest1.roblonium.com/Login/Negotiate.ashx";
					$parameters["authenticationTicket"] = null; //does this really have to be a string? probably not
					$parameters["message"] = null;
					break;
				case 1:
					$parameters["jobId"] = "mobiletest1";
					$parameters["status"] = 2;
					$parameters["joinScriptUrl"] = "http://www.roblonium.com/Game/visit.ashx?placeId=58&userId=1";
					$parameters["authenticationUrl"] = "http://sitetest1.roblonium.com/Login/Negotiate.ashx";
					$parameters["authenticationTicket"] = null;
					$parameters["message"] = null;
					break;
				case 2:
					$parameters["jobId"] = "mobiletest2";
					$parameters["status"] = 2;
					$parameters["joinScriptUrl"] = "http://www.roblonium.com/Game/join.ashx?UserID=-12&server=67.6.102.102&debug=1";
					$parameters["authenticationUrl"] = "http://sitetest1.roblonium.com/Login/Negotiate.ashx";
					$parameters["authenticationTicket"] = null;
					$parameters["message"] = null;
					break;
				case 58:
					$parameters["jobId"] = "test2";
					$parameters["status"] = 2;
					$parameters["joinScriptUrl"] = "http://sitetest1.roblonium.com/game/join.ashx?UserID=0&server=162.104.212.174";
					$parameters["authenticationUrl"] = "http://sitetest1.roblonium.com/Login/Negotiate.ashx";
					$parameters["authenticationTicket"] = null;
					$parameters["message"] = null;
					break;
			}
			// this stops before handling the request normally to check if this is a test. if so, proceed with the test and hault further handling
			if (!empty($parameters["jobId"])) {
				break;
			}
			
			// add this back in when testing stops
			if (is_int($_GET["placeId"]) and $_GET["placeId"] <= 0) {
				$parameters["message"] = "Cannot join game without placeId.";
				break;
			}
			//if the job already exists, return it
			$job = $database->findRow("jobs", ["category" => $_GET["placeId"]], ["jobId", "status", "ip", "port"]);
			if ($job && $job->rowCount() > 0){
				$job = $job->fetch(PDO::FETCH_OBJ);	
				$parameters["jobId"] = $job->jobId;
				if ($job->status == 1 && $job->status !== 0) {
					$parameters["status"] = 2;
					$parameters["joinScriptUrl"] = "http://sitetest1.roblonium.com/game/join.ashx?UserID=".$user->Id."&server=".$job->ip."&port=".$job->port;
					$parameters["authenticationUrl"] = "http://sitetest1.roblonium.com/Login/Negotiate.ashx";
					$parameters["authenticationTicket"] = signAuthTicket($user->Id, $job->jobId);
				}else {
					$parameters["status"] = 1;
				}
			}else {
				$parameters["status"] = /*8*/3;
			}
			
			/*$query = "SELECT * FROM job ORDER BY jobId DESC LIMIT 1;";
			$execute = $database->query($query);
			if ($execute == false) {
				die(json_encode($parameters, JSON_UNESCAPED_SLASHES));
			}
			$result = $execute->fetch(PDO::FETCH_ASSOC);
			if (!is_array($result)) {
				$jobId = 1;
			}else{
				$jobId = $result['jobId']+1;
			}*/
			
			/*
			$jobId = UUID::v5('518383a0-66f5-416e-9722-03c8ba625034', 'RequestGame'.$service->url.time());
			$database->insertRow("jobs", [
				"jobId" => $jobId,
				"status" => 8, //the status should now be generated by PHP as well, but it should be based on the placeId of the job in the database or on whatever's happening with the site. (site upgrade, the game's ended, an error occurred, etc.)
				"message" => "Requesting a server", //make PHP generate this based on status
			], "jobId");
			//There is absolutely no need to add thumbnailer jobs to the database. When the site gets the job count of the service from either the stats or via a POST request, if the thumbnailers job has expired or finished, it's not counted.
			*/
			
			/*
			//or do this and have the OpenJob function write to the database
			startGameServer($_GET["placeId"], 53640) //for the port, find an open port on the service. also, don't forget about max players.
			*/
			
			//auth ticket message format (sign this and give the signature to client)
			/*
			userId (49215350)
			jobId (d8a55c59-e5b8-4895-90c7-9d6471aed68b)
			timestamp (10/18/2019+10:09:24+PM)
			*/
			/*
			std::vector<std::string> s;
			boost::split(s, ticket, boost::is_any_of(";"));
			std::string timestamp = s[0];
			std::string signature2 = s[2];
			*/
			//auth ticket format (there might be something between timestamp and signature2 according to the source above)
			/*
			timestamp;signature2
			*/
		}else {
			$parameters["message"] = "Cannot join game without placeId.";
		}
		break;
	case "CheckGameJobStatus":
		// Check Game Job Status
		if (verifyVar($_GET["jobId"])) {
			//This just loads the job's information from the database.
			$job = $database->findRow("jobs", ["jobId" => $_GET["jobId"]], ["jobId", "status", "ip", "port"]);
			if ($job && $job->rowCount() > 0){
				$job = $job->fetch(PDO::FETCH_OBJ);	
				$parameters["jobId"] = $job->jobId;
				if ($job->status == 1 && $job->status !== 0) {
					$parameters["status"] = 2;
					$parameters["joinScriptUrl"] = "http://sitetest1.roblonium.com/game/join.ashx?UserID=".$user->Id."&server=".$job->ip."&port=".$job->port;
					$parameters["authenticationUrl"] = "http://sitetest1.roblonium.com/Login/Negotiate.ashx";
					$parameters["authenticationTicket"] = signAuthTicket($user->Id, $job->jobId);
				}else {
					$parameters["status"] = 1;
				}
			}
		}else {
			$parameters["message"] = "Cannot join game without placeId.";
		}
		break;
}

die(json_encode($parameters, JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK));
?>