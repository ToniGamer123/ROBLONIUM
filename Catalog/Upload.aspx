<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/global.php';
requireLogin();
$userInfo = getUserInfoFromUid(SESSION["userid"]);

//checks if user is admin
//$badges = json_decode($user->Badges, true);
//if (verify_user() !== true and $user->Name == "dreamer") {die("dreamer moment");}

if (/*in_array(1, $badges["Badges"]) !== true*/$userInfo->MembershipLevel < 3) 
{
	die(header("Location: /RobloniumDefaultErrorPage.aspx"));
}

//moved up here since this involves header changes
if (isset($_POST['upload'])) 
{
	$uploadOK = false;
	$type = $_POST['type'];
	$forsale = $_POST['forsale'];
	if ($forsale == true) {
	$forsale = 1;}else{
	$forsale = 0;}
	$currency = $_POST['currency'];
	if ($type !== 4) {
		$price = $_POST['price'];
	}
	$description = $_POST['description'];
	$title = $_POST['title'];
	//check here if user is admin
	$dbtype = $type;
	$title = preg_replace("/[^ \w]+/", "", $title);
	$title = preg_replace('!\s+!', ' ', $title);
	$description = preg_replace('<(|\/|[^\/>][^>]+|\/[^>][^>]+)>', ' ', $description);
	$description = preg_replace('!\s+!', ' ', $description);
	if (strlen($title) > 36) {
		header("Location: /catalog/upload.aspx?error=2");
		
		exit;
	}
	if (strlen($title) < 1) {
		header("Location: /catalog/upload.aspx?error=5");
		
		exit;
	}
	if (strlen($description) > 800) {
		header("Location: /catalog/upload.aspx?error=1");
		
		exit;
	}
	if ($price < 0 and $dbtype !== 13) {
		header("Location: /catalog/upload.aspx?error=4");
		
		exit;
	}
	if ($price > 99999 and $dbtype !== 13) {
		header("Location: /catalog/upload.aspx?error=3");
		
		exit;
	}
	if ($dbtype == 13) {
		$price = 0;
	}
}

function newAssetId() {
	global $database;
	//$query = "SELECT * FROM asset WHERE AssetTypeId=".$dbtype." ORDER BY AssetId DESC LIMIT 1;";
	$query = "SELECT * FROM asset ORDER BY AssetId DESC LIMIT 1;";
	$execute = $database->query($query);
	if ($execute !== false) {
		//$final = $execute->fetchAll();
		$result = $execute->fetch(PDO::FETCH_ASSOC);
		//die(print_r($result));
	}else {
		return false;
	}
	if (!is_array($result)) {
		$assetId = 1;
	}else{
		$assetId = $result['AssetId']+1;
		while (file_exists($_SERVER["DOCUMENT_ROOT"].'/Asset/'.$assetId)) {
			$assetId = $assetId+1;
		}
	}
	return $assetId;
}
?>
<!DOCTYPE html>
<html lang="en">
<head id="ctl00_Head1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,requiresActiveX=true"/><title>
	Upload - ROBLONIUM
</title>
<link rel="icon" type="image/vnd.microsoft.icon" href="/favicon.ico"/><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="Content-Language" content="en-us"/>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/ScriptGlobals.php";?>
<style>
input[type=text], select, input[type=password],input[type=email],input[type=number],textarea {
  width: 100%;
  padding: 5px 15px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 15px 25px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}
</style>
</head>
	<body>
		<div id="MasterContainer">
                   


<script type="text/javascript">
$(function(){
    function trackReturns() {
	    function dayDiff(d1, d2) {
		    return Math.floor((d1-d2)/86400000);
	    }

	    var cookieName = 'RBXReturn';
	    var cookieOptions = {expires:9001};
        var cookie = $.getJSONCookie(cookieName);

	    if (typeof cookie.ts === "undefined" || isNaN(new Date(cookie.ts))) {
	        $.setJSONCookie(cookieName, { ts: new Date().toDateString() }, cookieOptions);
		    return;
	    }

	    var daysSinceFirstVisit = dayDiff(new Date(), new Date(cookie.ts));
	    if (daysSinceFirstVisit == 1 && typeof cookie.odr === "undefined") {
		    RobloxEventManager.triggerEvent('rbx_evt_odr', {});
		    cookie.odr = 1;
	    }
	    if (daysSinceFirstVisit >= 1 && daysSinceFirstVisit <= 7 && typeof cookie.sdr === "undefined") {
		    RobloxEventManager.triggerEvent('rbx_evt_sdr', {});
		    cookie.sdr = 1;
	    }
	
	    $.setJSONCookie(cookieName, cookie, cookieOptions);
    }

    
        RobloxListener.restUrl = window.location.protocol + "//" + "<?=$_SERVER['SERVER_NAME']?>/Game/EventTracker.ashx";
        RobloxListener.init();
    
    
        GoogleListener.init();
    
    
    
    
        RobloxEventManager.initialize(true);
        RobloxEventManager.triggerEvent('rbx_evt_pageview');
        trackReturns();
    
    
    
        RobloxEventManager._idleInterval = 450000;
        RobloxEventManager.registerCookieStoreEvent('rbx_evt_initial_install_start');
        RobloxEventManager.registerCookieStoreEvent('rbx_evt_ftp');
        RobloxEventManager.registerCookieStoreEvent('rbx_evt_initial_install_success');
        RobloxEventManager.registerCookieStoreEvent('rbx_evt_fmp');
        RobloxEventManager.startMonitor();
    

});

</script>


        

        <script type="text/javascript">Roblox.FixedUI.gutterAdsEnabled=false;</script>
        

<?php include $_SERVER["DOCUMENT_ROOT"] . '/Banner' ;?>
        




        <noscript><div class="SystemAlert"><div class="SystemAlertText">Please enable Javascript to use all the features on this site.</div></div></noscript>
			<?php
				if (isset($_GET['error'])) {
					$id = $_GET['error'];
					if ($id == 1) {
						echo alert('Your description is too long!', '#dada01');
					}elseif($id == 2) {
						echo alert('Your asset name is too long!', '#dada01');
					}elseif($id == 3) {
						echo alert('Your asset price cannot be higher than <span class="robux money">99999</span>.', '#dada01');
					}elseif($id == 4) {
						echo alert('Your asset price cannot be lower than <span class="robux money">0</span>.', '#dada01');
					}elseif($id == 5) {
						echo alert('Your asset name must be at least 1 character in length.', '#dada01');
					}elseif($id == 6) {
						echo alert('Illegal character has been detected!', 'red');
					}
				}
			?>
		<div id="BodyWrapper">
            <div id="RepositionBody">
			<div id="Body" style="width:970px; padding: 5px 0 80px 0;">
			<div class="row">
				<div class="col-xs-8">
					<div class="divider-right" style="width: 484px; float: left; padding-left: 0.2in;">
						<h2 class="title">
							<span>Upload</span>
						</h2>
						<div class="panel-body">
							<form method="post" enctype="multipart/form-data">
								Name:<br>
								<input type="text" name="title" maxlength="36" class="form-control" style="width:3in;">
								<br>
								Description:<br>
								<textarea name="description" maxlength="800" class="form-control" rows="10" style="width:3in;"></textarea>
								<br>
								Price: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For Sale
								<br>
								<input type="number" name="price" maxlength="5" class="form-control" style="width:2.7in;"><input type="checkbox" name="forsale" class="form-control" style="width:0.2in;">
								<br>
								Currency:
								<br>
								<input type="radio" name="currency" value="1" class="form-control" style="width:0.2in;">
								<span class="robux money">Robux</span>
								<input type="radio" name="currency" value="2" class="form-control" style="width:0.2in;">
								<span class="tickets money">Tix</span>
								<br>
								Type:<br>
								<select name="type" style="width:3in;">
									<?php
									if($userInfo->Id == 1) {echo('									<option value="0">Product</option>
									<option value="1">Image</option>
									<option value="2">T-Shirt</option>
									<option value="3">Audio</option>
									<option value="4">Mesh</option>
									<option value="5">Lua</option>
									<option value="6">HTML</option>
									<option value="7">Text</option>
									<option value="8">Hat</option>
									<option value="9">Place</option>
									<option value="10">Model</option>
									<option value="11">Shirt</option>
									<option value="12">Pants</option>
									<option value="13">Decal</option>
									<option value="16">Avatar</option>
									<option value="17">Head</option>
									<option value="18">Face</option>
									<option value="19">Gear</option>
									<option value="21">Badge</option>
									<option value="22">Group Emblem</option>
									<option value="24">Animation</option>
									<option value="25">Arms</option>
									<option value="26">Legs</option>
									<option value="27">Torso</option>
									<option value="28">Right Arm</option>
									<option value="29">Left Arm</option>
									<option value="42">Left Leg</option>
									<option value="31">Right Leg</option>
									<option value="32">Package</option>
									<option value="33">YouTube Video</option>
									<option value="34">Game Pass</option>');
									}else{echo('									<option value="1">Image</option>
									<option value="2">T-Shirt</option>
									<option value="3">Audio</option>
									<!--option value="4">Mesh</option-->
									<option value="8">Hat</option>
									<option value="10">Model</option>
									<option value="11">Shirt</option>
									<option value="12">Pants</option>
									<option value="13">Decal</option>
									<option value="18">Face</option>
									<option value="19">Gear</option>
									<option value="24">Animation</option>');
									}
									?>
								</select>
								<br>
								<p style="display:inline;">
								File:<br> 
								<input style="display:inline;" type="file" name="file">
								</p>
								<br><br>
								<button type="submit" name="upload" name="upload" class="btn-medium btn-primary btn-level-element " style="padding: 4px 13px 1px 13px; height: 33px;">Upload<span class="btn-text">Upload</span></button>
							</form>
						</div>
					</div>
					<div class="divider-left" style="width: 420px; float: right; align-self: center; border-left: 0px; padding-right: 0.2in;">
					<h2 class="title" style="margin-bottom: 0px;">
						<span>Uploading Info</span>
					</h2>
					<pre class="Description body text">This is where you can upload assets such as T-Shirts, Decals, and Pants. Uploading an asset costs <span class="robux money">20</span>. You'll need to wait for your asset to be approved before you can use it. If a moderator decides that your asset is against our terms of service, they have every right to delete your asset without compensation.</pre>
					</div>
				</div>
			</div>
			</div>
			</div>
			</div>
		</div>
		<?php
								if (isset($_POST['upload'])) {
									//moved up to prevent headers from being prematurely sent
								$assetId = newAssetId();
								if ($assetId !== false) {
									$target_dir = $_SERVER["DOCUMENT_ROOT"]."/assets/";
									$target_file = $target_dir.$assetId;
									$check = @getimagesize($_FILES["file"]["tmp_name"]);
									list($width, $height) = @getimagesize($_FILES["file"]["tmp_name"]);
									/*if ($auth_uid == 11) {
										echo '<script>alert("'.$width.'");</script>';
										echo '<script>alert("'.$height.'");</script>';
									}*/
									if ($width != 580 and $height != 556) {
										if ($dbtype == 11 or $dbtype == 12) {
											$uploadOK = false;
										}
									}
									$uploadOK = true;
									if ($check == false and ($dbtype == 11 or $dbtype == 12 or $dbtype == 13 or $dbtype == 2 or $dbtype == 1)) {
										echo('<br>' . alert('The file you tried to upload is not an image.', '#dada01') . '<br>');
										$uploadOK = false;
									}else{
									/*if ($dbtype !== 11 and $dbtype !== 12 and $dbtype !== 13 and $dbtype !== 2 and $dbtype !== 1) {
										$xml=simplexml_load_string(file_get_contents($target_file));
										if ($xml === false) {
											echo('<br>' . alert("The asset you tried to upload isn't in XML format. (It's too new)", '#dada01') . '<br>');
											$uploadOK = false;
										}
									}*/
										$imageFileType = pathinfo($_FILES['file']["name"], PATHINFO_EXTENSION);
										if ($_FILES["file"]["size"] > 30000000) {
											echo('<br>' . alert('The file you tried to upload is greater than 30 MB.', '#dada01') . '<br>');
											$uploadOK = false;
										}else{
											$finfo = finfo_open(FILEINFO_MIME_TYPE);
											$mime = finfo_file($finfo, $_FILES['file']['tmp_name']);
											if (($dbtype == 11 or $dbtype == 12 or $dbtype == 13 or $dbtype == 2 or $dbtype == 1) && $imageFileType != "jpg" && $imageFileType != "JPG" && $imageFileType != "png" && $imageFileType != "PNG" && $imageFileType != "jpeg" && $imageFileType != "JPEG" && $mime != "image/png" && $mime != "image/jpeg") {
												//echo 'The file you tried to upload is not allowed. Only JPG, JPEG and PNG are allowed.';
												echo('<br>' . alert('The file you tried to upload is not allowed.', '#dada01') . '<br>');
												$uploadOK = false;
											}else{
												if ($userInfo->Robux < 20) {
													echo('<br>' . alert('You do not have enough ROBUX. :(', '#dada01') . '<br>');
												}else{
													if ($uploadOK == true) {
														if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
															$userInfo->Robux = $userInfo->Robux-20;
															$userInfo = $database->updateRow("public_users", [ // update code in secondary database
																	"Robux" => $userInfo->Robux
															], ["Id" => $userInfo->Id]);
															
															if (isset($imageReliantAssetTypes[$dbtype])) {
															$database->insertRow("asset", [ // upload secondary asset
																"Name" => $title,
																"Description" => assetTypeToString($dbtype)." Image",
																"PriceInRobux" => 0,
																"PriceInTickets" => 0,
																"IsForSale" => 0,
																"AssetTypeId" => 1,
																"CreatorId" => $userInfo->Id,
																"AssetId" => $assetId,
															], "AssetId");
															giveItem($userInfo->Id, $assetId); 																		//give the owner the texture
															//the texture has been uploaded now to upload the user's requested asset...
															//handle the asset that the user was trying to upload rather than the texture
															$processedAsset = processAsset($dbtype, array('http://sitetest1.roblonium.com/asset/?id='.$assetId));				//append the proper text to the asset
															$assetId = newAssetId(); 																			//generate a new asset id
															$target_file = $target_dir.$assetId;																//generate a new target file for the requested asset
															if ($processedAsset !== false) {
																file_put_contents($target_file, $processedAsset);												//upload the user's requested asset
															}
															}

															if ($currency == 2) {
															$newasset = $database->insertRow("asset", [ // upload asset with Tickets currency
																"Name" => $title,
																"Description" => $description,
																"PriceInRobux" => 0,
																"PriceInTickets" => $price,
																"IsForSale" => $forsale,
																"AssetTypeId" => $dbtype,
																"CreatorId" => $userInfo->Id,
																"AssetId" => $assetId,
															], "AssetId");

															}else {
															$newasset = $database->insertRow("asset", [ // upload asset with Robux currency
																"Name" => $title,
																"Description" => $description,
																"PriceInRobux" => $price,
																"PriceInTickets" => 0,
																"IsForSale" => $forsale,
																"AssetTypeId" => $dbtype,
																"CreatorId" => $userInfo->Id,
																"AssetId" => $assetId,
															], "AssetId");
															}

															echo('<br>' . alert('Asset successfully uploaded!', 'green') . '<br>');
															/*//ping thumbnail to start rendering
															file_get_contents('http://'.$_SERVER['SERVER_NAME'].'/Game/Tools/ThumbnailAsset.ashx?aid='.$assetId.'&fmt=png&wd=320&ht=320');
															*/
															giveItem($userInfo->Id, $assetId);
															echo('		<script type="text/javascript">

		    window.parent.location = "/Item.aspx?id='.$assetId.'";
		</script>');
															
														}else{
															if ($_FILES['file']['error'] == 1) {
																echo('<br>' . alert('[The uploaded file size exceeds the file size limit.]', 'red') . '<br>');
															} else{
																echo('<br>' . alert('An error occurred while uploading. Please try again soon! ['.$_FILES['file']['error'].']', 'red') . '<br>');
															}
														}
													}else{
														echo('<br>' . alert('Could not upload your file. Are you using the correct template?', '#dada01') . '<br>');
													}
													}
												}
											}
										}
									}else{
										echo('<br>' . alert('Critical Error!', 'red') . '<br>');
									}
								}else{
									echo('<br>' . alert('Fill in the fields above and press upload to upload an asset.', 'black') . '<br>');
								}
		?>

			<?php include $_SERVER["DOCUMENT_ROOT"] . "/Footer";?>
		</div>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Post-Footer.php";?>
	</body>                
</html>