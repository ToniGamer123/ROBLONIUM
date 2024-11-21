<?php //games api written by pizzaboxer
header('Content-Type: application/json');
require_once $_SERVER['DOCUMENT_ROOT']."/Hexine/api/core_functions.php";

//http://sitetest1.roblonium.com/GetGames.ashx?GameType=Play&m=Relevance&t=Now&g=all&MinBCLevel=None&p=2&PageSize=12
//keeping url here with all the get parameters for reference

if(isset($_GET['p'])){ $Page = $_GET['p']; } else { $Page=1; }
if(isset($_GET['PageSize'])){ $PageSize = $_GET['PageSize']; } else { $PageSize=12; }

$numGames = $pdo->query("SELECT COUNT(*) FROM asset WHERE AssetTypeId = 9")->fetch()[0];
$Pages = ceil($numGames/$PageSize);
$Offset = ($Page - 1)*$PageSize;

$query = $pdo->prepare("SELECT * FROM asset WHERE AssetTypeId = 9 ORDER BY AssetId ASC LIMIT :limit OFFSET :offset");

$query->bindParam(":limit", $PageSize, PDO::PARAM_INT);
$query->bindParam(":offset", $Offset, PDO::PARAM_INT);
$query->execute();
if(!$query->rowCount()){ echo "bruh no results"; }

$places = ['TotalPages' => $Pages, 'Count' => $numGames, 'LatestID' => 1, 'Items'=>[]];

while ($row = $query->fetch(PDO::FETCH_OBJ))
{
	// should probably make "timestamp to time ago" a global function
	$timestamp = strtotime($row->Created);
	$difference = time() - $timestamp;
	$minutes = ceil($difference/60);
	$hours = ceil($difference/3600);
	$days = ceil($difference/86400);
	$months = ceil($difference/2628000);
	$years = ceil($difference/3154000);
	
	switch(true)
	{
		case ($minutes <= 30): $LastUpdated = 'Just now'; break;
		case ($hours == 1): $LastUpdated = '1 hour ago'; break;
		case ($hours < 24): $LastUpdated = $hours.' hours ago'; break;
		case ($days == 1): $LastUpdated = 'Yesterday'; break;
		case ($days < 31): $LastUpdated = $days.' days ago'; break;
		case ($months == 1): $LastUpdated = '1 month ago'; break;
		case ($months < 12): $LastUpdated = $months.' months ago'; break;
		case ($years == 1): $LastUpdated = '1 year ago'; break;
		default: $LastUpdated = $years.' years ago'; break;
	}

	$placeInfo = 
	[
		'BCOverlay' => ['Alt' => NULL, 'Url' => NULL],
		'Creator' => ['Name' => getNameFromUid($row->CreatorId), 'Url' => '~/User.aspx?ID='.$row->CreatorId, 'Id' => $row->CreatorId],
		'GearIcon' => ['Alt' => 'No gear allowed', 'Url' => '~/images/NoSuitcase16x16.png'],
		'GenreIcon' => ['Alt' => 'Classic', 'Url' => '~/images/GenreIcons/Classic.png'],
		'ItemID' => $row->AssetId, 
		'MegaOverlay' => ['Alt' => NULL, 'Url' => NULL],
		'Name' => $row->Name, 
		'NavigateUrl' => '/PlaceItem.aspx?ID='.$row->AssetId, 
		'PersonalPlaceOverlay' => ['Alt' => NULL, 'Url' => NULL],
		'Stats' => ['CurrentPlayersCount' => 0, 'FavoritesCount' => '0 times', 'LastUpdated' => $LastUpdated, 'PlaysCount' => '0 times'],
		'ThumbnailFinal' => true, 
		'ThumbnailUrl' => '/NotFound.jpg',
		'YouTubeTrailerID' => NULL
	];

	array_push($places['Items'], $placeInfo);
}

echo json_encode($places);

/*
if (isset($_GET['GameType']) && $_GET['GameType'] == 'PersonalServers')
{
    $array = 
    [
	    'TotalPages' => 1, 'Count' => 1, 'LatestID' => 203087, 'Items' =>
	    [
		    [ // item start
			    'BCOverlay' => ['Alt' => NULL, 'Url' => NULL],
			    'Creator' => ['Name' => 'dawsonjam101', 'Url' => '~/User.aspx?ID=203087', 'Id' => '203087'],
			    'GearIcon' => ['Alt' => 'No gear allowed', 'Url' => '~/images/NoSuitcase16x16.png'],
			    'GenreIcon' => ['Alt' => 'Classic', 'Url' => '~/images/GenreIcons/Classic.png'],
			    'ItemID' => 2439,
			    'MegaOverlay' => ['Alt' => NULL, 'Url' => NULL],
			    'Name' => 'dde3',
			    'NavigateUrl' => '/Place.aspx?ID=2439',
			    'PersonalPlaceOverlay' => ['Alt' => 'Personal Place', 'Url' => '\images\icons\overlay_personal.png'],
			    'Stats' => ['CurrentPlayersCount' => 0, 'FavoritesCount' => '0 times', 'LastUpdated' => 'Just now', 'PlaysCount' => '0 times'],
			    'ThumbnailFinal' => true,
			    'ThumbnailUrl' => '/NotFound.jpg',
			    'YouTubeTrailerID' => NULL
			], // item end  
		]
	];
}
elseif (isset($_GET['GameType']) && $_GET['GameType'] == 'Play')
{
    $array = 
    [
    	'TotalPages' => 2, 'Count' => 3, 'LatestID' => 2449, 'Items' =>
    	[
		    [ // item start
			    'BCOverlay' => ['Alt' => NULL, 'Url' => NULL],
			    'Creator' => ['Name' => 'pizzaboxer', 'Url' => '~/User.aspx?ID=28', 'Id' => '28'],
			    'GearIcon' => ['Alt' => 'No gear allowed', 'Url' => '~/images/NoSuitcase16x16.png'],
			    'GenreIcon' => ['Alt' => 'Classic', 'Url' => '~/images/GenreIcons/Classic.png'],
			    'ItemID' => 2449, 
			    'MegaOverlay' => ['Alt' => NULL, 'Url' => NULL],
			    'Name' => 'test lol', 
			    'NavigateUrl' => '/Place.aspx?ID=2449', 
			    'PersonalPlaceOverlay' => ['Alt' => NULL, 'Url' => NULL],
			    'Stats' => ['CurrentPlayersCount' => 0, 'FavoritesCount' => '0 times', 'LastUpdated' => 'Just now', 'PlaysCount' => '0 times'],
			    'ThumbnailFinal' => true, 
			    'ThumbnailUrl' => '/NotFound.jpg',
			    'YouTubeTrailerID' => NULL
			], // item end
			[ // item start
			    'BCOverlay' => ['Alt' => NULL, 'Url' => NULL],
			    'Creator' => ['Name' => 'pizzaboxer', 'Url' => '~/User.aspx?ID=28', 'Id' => '28'],
			    'GearIcon' => ['Alt' => 'No gear allowed', 'Url' => '~/images/NoSuitcase16x16.png'],
			    'GenreIcon' => ['Alt' => 'Classic', 'Url' => '~/images/GenreIcons/Classic.png'],
			    'ItemID' => 2449, 
			    'MegaOverlay' => ['Alt' => NULL, 'Url' => NULL],
			    'Name' => 'Poop', 
			    'NavigateUrl' => '/Place.aspx?ID=2449', 
			    'PersonalPlaceOverlay' => ['Alt' => NULL, 'Url' => NULL],
			    'Stats' => ['CurrentPlayersCount' => 0, 'FavoritesCount' => '0 times', 'LastUpdated' => 'Just now', 'PlaysCount' => '0 times'],
			    'ThumbnailFinal' => true, 
			    'ThumbnailUrl' => '/NotFound.jpg',
			    'YouTubeTrailerID' => NULL
			], // item end
			[ // item start
			    'BCOverlay' => ['Alt' => NULL, 'Url' => NULL],
			    'Creator' => ['Name' => 'stars', 'Url' => '~/User.aspx?ID=203088', 'Id' => '203088'],
			    'GearIcon' => ['Alt' => 'No gear allowed', 'Url' => '~/images/NoSuitcase16x16.png'],
			    'GenreIcon' => ['Alt' => 'Classic', 'Url' => '~/images/GenreIcons/Classic.png'],
			    'ItemID' => 2449, 
			    'MegaOverlay' => ['Alt' => NULL, 'Url' => NULL],
			    'Name' => 'Unnamed Place', 
			    'NavigateUrl' => '/Place.aspx?ID=2449', 
			    'PersonalPlaceOverlay' => ['Alt' => NULL, 'Url' => NULL],
			    'Stats' => ['CurrentPlayersCount' => 0, 'FavoritesCount' => '0 times', 'LastUpdated' => 'Just now', 'PlaysCount' => '0 times'],
			    'ThumbnailFinal' => true, 
			    'ThumbnailUrl' => '/NotFound.jpg',
			    'YouTubeTrailerID' => NULL
			], // item end
		]
    ];
}
else
{
	$array = [ 'TotalPages' => 1, 'Count' => 0, 'LatestID' => 0, 'Items' => [] ];
}

echo json_encode($array, JSON_PRETTY_PRINT);

*/