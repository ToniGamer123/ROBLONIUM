<?php //games api written by pizzaboxer
require_once $_SERVER['DOCUMENT_ROOT']."/Hexine/api/core_functions.php";

/*GET parameters with their initial values:
moreresultscached?
SortFilter=0
TimeFilter=0
GenreID=1
GameFilter=1
MinBCLevel=0
StartRows=0
MaxRows=40
IsUserLoggedIn=false
NumberOfRowsToOccupy=1
NumberOfColumns=6
IsInHorizontalScrollMode=true
*/

if(isset($_GET['StartRows'])){ $Page = $_GET['StartRows']+1; } else { $Page = 1; }
if(isset($_GET['NumberOfColumns'])){ $PageSize = $_GET['NumberOfColumns']; } else { $PageSize=6; }
if(isset($_GET['MinBCLevel'])){ $MinBCLevel = $_GET['MinBCLevel']; } else { $MinBCLevel = 0; }

$numGames = $pdo->query("SELECT COUNT(*) FROM asset WHERE AssetTypeId = 9")->fetch()[0];
$Pages = ceil($numGames/$PageSize);
$Offset = ($Page - 1)*$PageSize;

$query = $pdo->prepare("SELECT * FROM asset WHERE AssetTypeId = 9 AND MinimumMembershipLevel >= :minbclevel ORDER BY AssetId ASC LIMIT :limit OFFSET :offset");

$query->bindParam(":minbclevel", $MinBCLevel, PDO::PARAM_INT);
$query->bindParam(":limit", $PageSize, PDO::PARAM_INT);
$query->bindParam(":offset", $Offset, PDO::PARAM_INT);
$query->execute();

while ($row = $query->fetch(PDO::FETCH_OBJ)) { ?>
<div class="game-item">
    <div class="always-shown"> 
        <a class="game-item-anchor" rel="external" href="/<?=replaceSpecialChars($row->Name)?>-place?id=<?=$row->AssetId?>">
            <span class="" ><img  class='game-item-image' src='/Game/Tools/ThumbnailAsset.ashx?aid=<?=$row->AssetId?>&fmt=png&wd=420&ht=420' /></span>
            <div class="game-name notranslate">
                <?=htmlspecialchars($row->Name)?>    
            </div>
        </a>
        <span class="player-count deemphasized notranslate">
            0 players online
        </span>
        <span class="online-player roblox-player-text" style="float: left"></span>

        <div class="show-on-hover-only deemphasized hidden">
            <div class="creator-name notranslate">
                by <a href="/User.aspx?ID=<?=$row->CreatorId?>"><?=getNameFromUid($row->CreatorId)?></a>
            </div>


        </div>
    </div>

    <div class="hover-shown deemphasized ">
        <div class="snap-bottom snap-left">
            <div>
                played <span class="roblox-plays-count notranslate">0</span> times
            </div>
        
                <div class=" game-thumbs-up-down notranslate">
                    <span class="tiny-thumbs-up" />0 &nbsp;  |  &nbsp; 0<span class="tiny-thumbs-down" />
                </div>
        </div>

        <div class="snap-bottom snap-right">
        </div>
    </div>
</div>



<?php } ?>