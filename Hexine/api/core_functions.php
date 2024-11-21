<?php
//global_functions but a lot better
require_once $_SERVER['DOCUMENT_ROOT']."/Hexine/api/database_conn.php";
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

function disableErrorReporting()
{
	ini_set('display_errors', 0);
	ini_set('display_startup_errors', 0);
	error_reporting(0);
}

//https://stackoverflow.com/questions/2627523/replace-all-spaces-and-special-symbols-with-dash-in-url-using-php-language
function replaceSpecialChars($string)
{
	return preg_replace("![^a-z0-9]+!i", "-", $string);
}

function getNameFromUid($id)
{
	global $pdo;
	if(!filter_var($id, FILTER_VALIDATE_INT)){ return false; }
	$query = $pdo->prepare("SELECT Name FROM public_users WHERE Id = :id");
	$query->bindParam(":id", $id, PDO::PARAM_INT);
	$query->execute();
	if(!$query->rowCount()){ return false; }
	$row = $query->fetch(PDO::FETCH_OBJ);
	return $row->Name;
}

function getUserInfoFromUid($id)
{
	global $pdo;
	if(!filter_var($id, FILTER_VALIDATE_INT)){ return false; }
	$query = $pdo->prepare("SELECT * FROM public_users WHERE Id = :id");
	$query->bindParam(":id", $id, PDO::PARAM_INT);
	$query->execute();
	if(!$query->rowCount()){ return false; }
	$row = $query->fetch(PDO::FETCH_OBJ);
	return $row;
}

function getUserInfoFromName($name)
{
	global $pdo;
	if (strcasecmp($name, "BrentDaMage") == 0) {
		$name = "Brent Da Mage";
	}
	$query = $pdo->prepare("SELECT * FROM public_users WHERE Name = :name");
	$query->bindParam(":name", $name, PDO::PARAM_STR);
	$query->execute();
	if(!$query->rowCount()){ return false; }
	$row = $query->fetch(PDO::FETCH_OBJ);
	return $row;
}

function convertTimestampToTimeAgo($timestamp)
{
	$difference = time() - $timestamp;
	$minutes = ceil($difference/60);
	$hours = ceil($difference/3600);
	$days = ceil($difference/86400);
	$months = ceil($difference/2628000);
	$years = ceil($difference/3154000);
	
	switch(true)
	{
		case ($minutes <= 30): return 'Just now'; break;
		case ($hours == 1): return '1 hour ago'; break;
		case ($hours < 24): return $hours.' hours ago'; break;
		case ($days == 1): return 'Yesterday'; break;
		case ($days < 31): return $days.' days ago'; break;
		case ($months == 1): return '1 month ago'; break;
		case ($months < 12): return $months.' months ago'; break;
		case ($years == 1): return '1 year ago'; break;
		default: return $years.' years ago'; break;
	}
}

function redirectToErrorPage($code = 400)
{
	die(header("Location: /RobloniumDefaultErrorPage.aspx?code=$code"));
}

function checkIfFriends($user1, $user2, $type = 1)
{
	global $pdo;
	if($user1 == $user2){ return 0; }
	//this is ugly - pls improve if you can
	switch($type)
	{
		case 2: // friends
			$pdoquery = "SELECT * FROM friends WHERE (requesterId = :userid OR receiverId = :userid) AND (requesterId = :recipientid OR receiverId = :recipientid) AND status = 1"; 
			break;
		case 3: // best friends
			$pdoquery = "SELECT * FROM friends WHERE (requesterId = :userid OR receiverId = :userid) AND (requesterId = :recipientid OR receiverId = :recipientid) AND status = 1 AND isbestfriend = 1";
			break;
		default: // pending
			$pdoquery = "SELECT * FROM friends WHERE (requesterId = :userid OR receiverId = :userid) AND (requesterId = :recipientid OR receiverId = :recipientid)";
	}
	$checkquery = $pdo->prepare($pdoquery);
	$checkquery->bindParam(":userid", $user1, PDO::PARAM_INT);
	$checkquery->bindParam(":recipientid", $user2, PDO::PARAM_INT);
	$checkquery->execute();
	return $checkquery->rowCount();
}

function Unfriend($user1, $user2)
{
	global $pdo;
	if(!checkIfFriends($user1, $user2)){ return false; }
	//this is ugly - pls improve if you can
	$friends = $pdo->prepare("DELETE FROM friends WHERE (requesterId = :userid1 OR receiverId = :userid2) AND (requesterId = :recipientid1 OR receiverId = :recipientid2) ");
	$friends->bindParam(":userid1", $user1, PDO::PARAM_INT);
	$friends->bindParam(":userid2", $user1, PDO::PARAM_INT);
	$friends->bindParam(":recipientid1", $user2, PDO::PARAM_INT);
	$friends->bindParam(":recipientid2", $user2, PDO::PARAM_INT);
	return $friends->execute();
}

function BreakFriendship($invitationId)
{
	global $pdo;
	//this is ugly - pls improve if you can
	$friends = $pdo->prepare("DELETE FROM friends WHERE Id = :invitationid ");
	$friends->bindParam(":invitationid", $invitationId, PDO::PsARAM_INT);
	return $friends->execute();
}

// The behemoth of a load friends page function

function loadFriendPage($displayedUserId, $pageNum, $view) {
	global $pdo;
	switch ($view) {
		case "Friends":
			$status = 1;
			$isBestFriend = 0;
			break;
		case "BestFriends":
			$status = 1;
			$isBestFriend = 1;
			break;
		case "FriendRequests":
			$status = 0;
			$isBestFriend = 0;
			break;
		default: 
			return false;
			break;
	}
	
	$friendStrings = [
		"FriendRequests" => ["Accept Friend Request","Decline Friend Request","accept-friend","decline-friend"],
		"Friends" => ["Add Best Friend","Remove Friend","add-best-friend","remove-friend"],
		"BestFriends" => ["Remove Best Friend","Remove Friend","remove-best-friend","remove-friend"]
	];
	
	$friends = $pdo->prepare("SELECT * FROM friends WHERE (receiverId = :displayedUserId)");
	$friends->bindParam(":displayedUserId", $displayedUserId, PDO::PARAM_INT);
	//$friends->bindParam(":status ", $status , PDO::PARAM_INT);
	//$friends->bindParam(":isBestFriend ", $isBestFriend , PDO::PARAM_INT);
	$friends->execute();
	$friends->fetch(PDO::FETCH_OBJ);
	
	die("success");

	if(!$friends->rowCount()){
		echo '<h3><a href="/browse.aspx">Find your friends</a> on ROBLONIUM</h3>';
		return true;
	}
	?>
	<div class="friends-container">
	<?php while ($row = $friends->fetch(PDO::FETCH_OBJ)){ $friend = getUserInfoFromUid($row->requesterId == $userid ? $row->receiverId : $row->requesterId); ?>
		<div class="friend-container notranslate">
			<div class="friend-hover">
				<?php if(SESSION && $userid == SESSION["userid"]) { ?>
				<div class="friend-dropdown">
					<div class="dropdown">
						<div class="button gear"></div>
						<ul class="dropdown-list">
							<li>
							   <a class="<?=$friendStrings[$view][2]?>" data-target-user-id="<?=$friend->Id?>" data-view="<?=$view?> data-page-num="<?=$pageNum?>" data-displayed-user-id="<?=SESSION["userid"]?>"><?=$friendStrings[$view][0]?></a>
							</li>
							<li>
							   <a class="<?=$friendStrings[$view][3]?>" data-target-user-name="<?=$friend->Name?>" data-target-user-id="<?=$friend->Id?>" data-view="<?=$view?>" <?=$pageNum?> data-displayed-user-id="<?=SESSION["userid"]?>"><?=$friendStrings[$view][1]?></a>
							</li>
						</ul>
					</div>
				</div>
				<?php } ?>
				<div class="friend-avatar">
					<a class="roblox-avatar-image" data-user-id="<?=$friend->Id?>" data-image-size="small" href="/User.aspx?ID=<?=$friend->Id?>"></a>
				</div>
			</div>
			<div class="friend-name">
				<img src="/images/offline.png" alt="<?=$friend->Name?> is offline (last seen at 3/5/2013 3:53:35 PM.">
				<a class="text-link" title="<?=$friend->Name?>" href="/User.aspx?ID=<?=$friend->Id?>"><?=$friend->Name?></a>
			</div>
		</div>
	<?php } ?>
	</div>
<?php
	return true;
}

function getMarketplaceInfo($assetId)
{
	global $pdo;
	if(!filter_var($assetId, FILTER_VALIDATE_INT)){ return false; }
	$query = $pdo->prepare("SELECT * FROM asset WHERE AssetId = :id");
	$query->bindParam(":id", $assetId, PDO::PARAM_INT);
	$query->execute();
	if(!$query->rowCount()){ return false; }
	$row = $query->fetch(PDO::FETCH_OBJ);
	return $row;
}

function grantItem($userId, $assetId) 
{
	global $pdo;
	$userInfo = getUserInfoFromUid($userId);
	$asset = getMarketplaceInfo($assetId);

	if(!$userInfo || !$asset){ return false; }

	$inv = json_decode($userInfo->Inventory, true);

	if (!$inv || in_array($assetId, $inv['Inventory'])) { return false; }

	array_push($inv['Inventory'], $assetId); //Add the item to the user's inventory

	$inventory = json_encode($inv);

	$query = $pdo->prepare("UPDATE public_users SET Inventory = :inventory WHERE Id = :userid");
	$query->bindParam(":inventory", $inventory, PDO::PARAM_STR);
	$query->bindParam(":userid", $userId, PDO::PARAM_INT);
	$query->execute();

	$updateSales = $asset->Sales+1;

	$query = $pdo->prepare("UPDATE asset SET Sales = :sales WHERE AssetId = :assetid");
	$query->bindParam(":sales", $updateSales, PDO::PARAM_INT);
	$query->bindParam(":assetid", $assetId, PDO::PARAM_INT);

	return true;
}

function purchaseAsset($userId, $assetId, $expectedCurrency)
{
	global $pdo;
	$assetInfo = getMarketplaceInfo($assetId);
	$userInfo = getUserInfoFromUid($userId);

	if(!$assetInfo || !$userInfo){ return "An error occurred while trying to fetch the requested item information."; }

	if($expectedCurrency == 2)
	{
		$currency = "Tickets";
		$price = $assetInfo->PriceInTickets;
		$balanceAfterSale = $userInfo->Tickets - $price;
		$chargeUserQuery = "UPDATE public_users SET Tickets = :remainingbalance WHERE Id = :userid";
	}
	else
	{
		$currency = "Robux";
		$price = $assetInfo->PriceInRobux;
		$balanceAfterSale = $userInfo->Robux - $price;
		$chargeUserQuery = "UPDATE public_users SET Robux = :remainingbalance WHERE Id = :userid";
	}

	if(!$assetInfo->IsForSale){ return "This item is no longer for sale."; }

	if ($userInfo->Robux < $price and $expectedCurrency == 1) { return "You don't have enough ROBUX to purchase this item."; }		

	if ($userInfo->Tickets < $price and $expectedCurrency == 2) { return "You don't have enough Tickets to purchase this item."; }

	if ($userInfo->MembershipLevel < $assetInfo->MinimumMembershipLevel) { return "Your account doesn't meet the requirements to purchase this item."; }

	if(in_array($assetId, json_decode($userInfo->Inventory,true)['Inventory'])) { return "You already own this item."; }

	if(grantItem($userId, $assetId)) 
	{ 

		$query = $pdo->prepare($chargeUserQuery);
		$query->bindParam(":remainingbalance", $balanceAfterSale, PDO::PARAM_INT);
		$query->bindParam(":userid", $userId, PDO::PARAM_INT);
		$query->execute();
		return "Success"; 
	} 
	else { return "An unexpected error occurred"; }
}

function formatDate($time, $timestamp = false)
{
	if($timestamp){ return date("m/d/Y", $time); }
	else{ return date("m/d/Y", strtotime($time)); }
}

function getIpAddress()
{
    if (!empty($_SERVER['HTTP_CLIENT_IP']))
    {
      return $_SERVER['HTTP_CLIENT_IP'];
    }
    elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))
    {
      return $_SERVER['HTTP_X_FORWARDED_FOR'];
    }
    else
    {
      return $_SERVER['REMOTE_ADDR'];
    }
}

// Returns a RESTful API-like response which can be used to express success in an API request or return an error.
function returnApiResponse($code = 200, $error_msg = "", $type = 0)
{
	switch ($type) {
		case 0:
			$response = [
				"error" => $code,
				"success" => $code == 200 ? true : false, // this might need to be reworked at some point
				"error_msg" => $error_msg
			];
			break;
		case 1:
			$response = [
				"data" => [
					"error" => $code,
					"success" => $code == 200 ? true : false, // this might need to be reworked at some point
					"error_msg" => $error_msg
				]
			];
			break;
		default:
			die(http_response_code(500));
			break;
	}
	header("HTTP/1.1 $code $error_msg");
	die(json_encode($response));
}

/// authentication stuff here

//session system made by pizzaboxer
function createSession($userId)
{
	global $pdo;

	keygen:
	$sessionkey = md5(rand()).md5(rand()).md5(rand()).md5(rand()).md5(rand()).md5(rand()).md5(rand()).md5(rand()); 
	//i need a better solution to session key generation lol as it probably takes up quite a few server resources but it is definitely secure
	//this generates a 256 character long unique key to identify user sessions
	// Maybe try using the UUID generator function in global_functions.php? Also the RCCService backend relies on that function for JobID generation, so it probably won't get removed anytime soon. Plus, ROBLOX uses UUIDs as their RCCService access keys. - Brent

	$query = $pdo->prepare("SELECT * FROM sessions WHERE sessionkey = :sesskey");
	$query->bindParam(":sesskey", $sessionkey, PDO::PARAM_STR);
	$query->execute();

	if($query->rowCount()){ goto keygen; } //if a session with the same key already exists then repeat key generation process

	$create = $pdo->prepare("INSERT INTO sessions (`SESSIONKEY`, `valid`, `userAgent`, `userId`, `loginIp`, `created`) VALUES (:sesskey, 1, :useragent, :userid, :ip, UNIX_TIMESTAMP())");
	$create->bindParam(":sesskey", $sessionkey, PDO::PARAM_STR);
	$create->bindParam(":useragent", $_SERVER['HTTP_USER_AGENT'], PDO::PARAM_STR);
	$create->bindParam(":userid", $userId, PDO::PARAM_INT);
	$create->bindParam(":ip", getIpAddress(), PDO::PARAM_STR);
	$create->execute();

	setcookie(".ROBLOSECURITY", $sessionkey, time()+(86400*3), "/"); //set time to 3 days
	$_SESSION['player'] = $userId; 
	//utilization of php sessions are deprecated now thanks to this new session system but i'm keeping this here for legacy sakes 
	//just in case some page is still using it
}

function requireLogin()
{
	if(!SESSION){ die(header("Location: /newlogin")); }
}

function destroySession($sessionkey)
{
 //todo
}

function invalidateSession($sesskey)
{
	setcookie(".ROBLOSECURITY", $sesskey, 1, "/");
	die(header("Refresh: 0"));
}

//now we set the user's session
if(isset($_COOKIE['_ROBLOSECURITY']))
{
    $sessionkey = $_COOKIE['_ROBLOSECURITY'];
	$query = $pdo->prepare("SELECT * FROM sessions WHERE sessionkey = :sesskey");
	$query->bindParam(":sesskey", $sessionkey, PDO::PARAM_STR);
	$query->execute();
	if(!$query->rowCount()){ invalidateSession($sessionkey); } //reject the session if it doesnt exist
	$row = $query->fetch(PDO::FETCH_OBJ);

	if($row->created+(86400*3) < time()){ invalidateSession($sessionkey); } //todo - maybe set it up so it renews?
	if($row->userAgent != $_SERVER['HTTP_USER_AGENT']){ invalidateSession($sessionkey); } //strict - reject if user agent isnt the same
	if($row->loginIp != getIpAddress()){ invalidateSession($sessionkey); } //strict - reject if ip doesnt match
	//these last two checks in particular should help to stop potential cookie stealing attacks

	$userInfo = getUserInfoFromUid($row->userId);

	$incomingFRs = $pdo->prepare("SELECT COUNT(*) FROM friends WHERE receiverid = :id AND status = 0");
	$incomingFRs->bindParam(":id", $row->userId, PDO::PARAM_INT);
	$incomingFRs->execute();

	define ('SESSION', ["username"=>$userInfo->Name, "userid"=>(int)$userInfo->Id, "robux"=>(int)$userInfo->Robux, "tickets"=>(int)$userInfo->Tickets, "membershiplevel"=>(int)$userInfo->MembershipLevel, "friendrequests"=>(int)$incomingFRs->fetchColumn()]);
}
else
{
	define('SESSION', false);
}
