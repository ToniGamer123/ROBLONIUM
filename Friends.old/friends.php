<?php 
require $_SERVER["DOCUMENT_ROOT"] . '/Hexine/api/core_functions.php';

if(!isset($_GET['DisplayedUserID'])){ die("Could not fetch friends"); }
if(!isset($_GET['PageNum'])){ $page = 1; }

$userid = $_GET['DisplayedUserID'];

$friends = $pdo->prepare("SELECT * FROM friends WHERE (requesterid = :id OR receiverid = :id) AND status = 1");
$friends->bindParam(":id", $userid, PDO::PARAM_INT);
$friends->execute();
$friends->fetch(PDO::FETCH_OBJ);

if(!$friends->rowCount()){ echo '<h3><a href="/browse.aspx">Find your friends</a> on ROBLONIUM</h3>'; }
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
                           <a class="add-best-friend" data-target-user-id="<?=$friend->Id?>" data-view="Friends" data-page-num="1" data-displayed-user-id="<?=SESSION["userid"]?>">Add Best Friend</a>
                        </li>
                        <li>
                           <a class="remove-friend" data-target-user-name="<?=$friend->Name?>" data-target-user-id="<?=$friend->Id?>" data-view="Friends" data-page-num="1" data-displayed-user-id="<?=SESSION["userid"]?>">Remove Friend</a>
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