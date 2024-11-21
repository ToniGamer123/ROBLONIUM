<?php
require $_SERVER["DOCUMENT_ROOT"] . "/global.php";
$user = getNameFromUid($_GET['UserID']);
if(!$user){ redirectToErrorPage(); }

$friends = $pdo->prepare("SELECT * FROM friends WHERE (requesterid = :id OR receiverid = :id) AND status = 1");
$friends->bindParam(":id", $_GET['UserID'], PDO::PARAM_INT);
$friends->execute();

require $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Top.php";
?>
<style type="text/css">
#Body {
	padding: 10px;
}
</style>
<h1><?=$user?>'s Friends</h1>
<div id="FriendTabs" class="horizontaltabs ui-tabs ui-widget ui-widget-content ui-corner-all">
    <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
        <li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="FriendsTab" aria-labelledby="ui-id-1" aria-selected="true"><a href="#FriendsTab" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">Friends</a></li>
    </ul>
	<div id="FriendsTab" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-expanded="true" aria-hidden="false">    
		<?php if(!$friends->rowCount()) { ?><h3>Find friends on<a href="/games"> ROBLONIUM games.</a></h3><?php } ?>
		<div class="friends-container">
		<?php while ($row = $friends->fetch(PDO::FETCH_OBJ)) { if($row->requesterId == $_GET['UserID']){ $friendID = $row->receiverId; } else { $friendID = $row->requesterId; } ?>
			<div class="friend-container notranslate">
	            <div class="friend-hover">
	                <div class="friend-avatar">
	                    <a class="roblox-avatar-image" data-user-id="<?=$friendID?>" data-image-size="small" href="/User.aspx?ID=<?=$friendID?>"></a>
	                </div>
	            </div>
	            <div class="friend-name">
	                <img src="/images/offline.png" alt="<?=getNameFromUid($friendID)?> is offline (last seen at 3/5/2013 3:53:35 PM." />
	                <a class="text-link" title="<?=getNameFromUid($friendID)?>" href="/User.aspx?ID=<?=$friendID?>"><?=getNameFromUid($friendID)?></a>
	            </div>
	        </div>
		<?php } ?>
		</div>
		<div class="friends-pager">
		</div>
	</div>
</div>
<script type="text/javascript">
    InitializeFriends(false);
</script>
<div style="clear:both"></div>
<?php require $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Bottom.php"; ?>