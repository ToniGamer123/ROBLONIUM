<?php
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/global_functions.php';

function results($productType, $sale, $sortType) {
$limit = 800;
$database = $GLOBALS['database'];
$columns = ["Name", "AssetId"];
$columns_table = [];
if($columns != false)
{
	$columns_sql = "`" . implode("`, `", $columns) . "`";
} else {
	$columns_sql = "*";
}
if ($productType !== 0 and $productType !== null) { //Product asset type
	$query = "SELECT {$columns_sql} FROM asset WHERE (AssetTypeId = {$productType}){$sale} ORDER BY {$sortType} DESC LIMIT {$limit};";
}else {
	$query = "SELECT {$columns_sql} FROM asset WHERE (IsForSale = 1) ORDER BY {$sortType} DESC LIMIT {$limit};";
}
$execute = $database->query($query);
if ($execute !== false) {
	$assets = $execute->fetchAll();
}else {return false;}
return count($assets);
}


$limit = 42;
$cat = $_GET['Category'];
$subcat = $_GET['Subcategory'];
header('Content-Type: application/json');
if ($cat == "" or $cat == null){die("Error: No category selected.");};
if ($subcat == "" or $subcat == null){die("Error: No sub-category selected.");};

$productType = catManager($cat, $subcat, $catType, $catSubType);
$sortType = $catSortType[$_GET['SortType']];

if ($sortType == null) {$sortType = 'AssetId';}


if ($_GET['IncludeNotForSale'] == 'true') {
	$sale = '';
}else {
	$sale = ' AND (IsForSale = 1)';
}

//support for multiple pages
$results = results($productType, $sale, $sortType);
//papa bruh's pagination
if($results > $limit) {
    $pages = round(($results+10)/$limit);
    if(!(isset($_GET['PageNumber']))) {
        $page = 1;
        $limit = "LIMIT {$limit} OFFSET ".(($page * $limit) - $limit);
    } else {
        if(is_numeric($_GET['PageNumber'])) {
            $page = (int)$_GET['PageNumber'];
            $limit = "LIMIT {$limit} OFFSET ".(($page * $limit) - $limit);
        } else {
            $page = 1;
            $limit = "LIMIT {$limit} OFFSET ".(($page * $limit) - $limit);
        }
    }
} else {
    $pages = 1;
    $page = 1;
	$limit = "LIMIT {$limit}";
}
//papa shells is epic :D

$list = ''; //42

$columns = ["Name", "AssetId"];
$columns_table = [];
if($columns != false)
{
	$columns_sql = "`" . implode("`, `", $columns) . "`";
} else {
	$columns_sql = "*";
}
if ($productType !== 0 and $productType !== null) { //Product asset type
	$query = "SELECT {$columns_sql} FROM asset WHERE (AssetTypeId = {$productType}){$sale} ORDER BY {$sortType} DESC {$limit};";
}else {
	$query = "SELECT {$columns_sql} FROM asset WHERE (IsForSale = 1) ORDER BY {$sortType} DESC {$limit};";
	//This forces assets that aren't for sale to be hidden. This way when a developer asset type is published, it won't be displayed.
}
$execute = $database->query($query);
if ($execute !== false) {
	$assets = $execute->fetchAll();
}else {die("Error: Failed to fetch assets");}

$count = count($assets);
for($i = 0; $i < $count; ++$i) { //Number of items on each catalog page
	$list = ($list . ',{"AssetId":"'.$assets[$i]['AssetId'].'"}');
	//$list = ($list . ",");
	//$list = ($list . file_get_contents("http://" . $_SERVER['SERVER_NAME'] . "/AssetInfo?id=" . $assets[$i]['AssetId'])); //Appended
}

//Result count

$list = ('[{"Results":'.$results.'}'.$list.']');
echo($list);
?>