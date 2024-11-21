<?php 
require $_SERVER["DOCUMENT_ROOT"] . "/global.php";
requireLogin();

$userid = SESSION["userid"];

$incomingFRs = $pdo->prepare("SELECT * FROM friends WHERE receiverid = :id AND status = 0");
$incomingFRs->bindParam(":id", $userid, PDO::PARAM_INT);
$incomingFRs->execute();

$friends = $pdo->prepare("SELECT * FROM friends WHERE (requesterid = :id OR receiverid = :id2) AND status = 1");
$friends->bindParam(":id", $userid, PDO::PARAM_INT);
$friends->bindParam(":id2", $userid, PDO::PARAM_INT);
$friends->execute();

$bestfriends = $pdo->prepare("SELECT * FROM friends WHERE requesterid OR receiverid = :id AND status = 1 AND isBestFriend = 1");
$bestfriends->bindParam(":id", $userid, PDO::PARAM_INT);
$bestfriends->execute();
$bestfriends->fetch(PDO::FETCH_OBJ);

$page_config["CSSIncludes"] = [
	/*"CSS/Pages/Friends.css",
	"CSS/PartialViews/Navigation.css"*/
];
$page_config["ScriptIncludes"] = [
	"Friends.js"
];
require $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Top.php";

?>
<style type="text/css">
   #Body {
   padding: 10px;
   }
</style>
<h1>My Friends</h1>
<div id="FriendTabs" class="tab-container tab-history-hash">
   <div class="tab-active">Friends</div>
   <div>Best Friends</div>
   <div>Friend Requests</div>
</div>
<div>
   <div id="FriendsTab" class="tab-active">
      <div class="friends-container">
      <?php if(!$friends->rowCount()) { ?><h3><a href="/browse.aspx">Find your friends</a> on ROBLONIUM</h3><?php }?>
      <?php while ($row = $friends->fetch(PDO::FETCH_OBJ)){ $friend = getUserInfoFromUid($row->requesterId == SESSION["userid"] ? $row->receiverId : $row->requesterId); ?>
         <div class="friend-container notranslate">
            <div class="friend-hover">
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
      <div class="friends-pager"></div>
   </div>
   <div id="BestFriendsTab">
      <div class="friends-container">
         <div class="friend-container notranslate">
            <div class="friend-hover">
               <div class="friend-dropdown">
                  <div class="dropdown">
                     <div class="button gear"></div>
                     <ul class="dropdown-list">
                        <li>
                           <a class="remove-best-friend" data-target-user-id="60533958" data-view="BestFriends" data-page-num="1" data-displayed-user-id="<?=SESSION["userid"]?>">Remove Best Friend</a>
                        </li>
                        <li>
                           <a class="remove-friend" data-target-user-name="goldnight360" data-target-user-id="60533958" data-view="BestFriends" data-page-num="1" data-displayed-user-id="<?=SESSION["userid"]?>">Remove Friend</a>
                        </li>
                     </ul>
                  </div>
               </div>
               <div class="friend-avatar">
                  <a class="roblox-avatar-image" data-user-id="60533958" data-image-size="small" href="/User.aspx?ID=60533958"></a>
               </div>
            </div>
            <div class="friend-name">
               <img src="/images/offline.png" alt="goldnight360 is offline (last seen at 6/19/2014 8:30:14 PM.">
               <a class="text-link" href="/User.aspx?ID=60533958">goldnight360</a>
            </div>
         </div>
      </div>
      <div class="friends-pager"></div>
   </div>
   <div id="FriendRequestsTab">
	  <div class="requests-buttons">
		  <a class="btn-small btn-negative" id="AcceptAllButton" data-displayed-user-id="<?=SESSION["userid"]?>">Accept All<span class="btn-text">Accept All</span></a>
		  <a class="btn-small btn-negative" id="DeclineAllButton" data-displayed-user-id="<?=SESSION["userid"]?>">Decline All<span class="btn-text">Decline All</span></a>
	  </div>
      <?php if(!$incomingFRs->rowCount()) { ?><h3><a href="/browse.aspx">Find your friends</a> on ROBLONIUM</h3><?php } ?>
      <div class="friends-container">
      <?php while ($row = $incomingFRs->fetch(PDO::FETCH_OBJ)){ $requester = getUserInfoFromUid($row->requesterId); ?>
         <div class="friend-container notranslate">
            <div class="friend-hover">
              <div class="friend-dropdown">
                  <div class="dropdown">
                     <div class="button gear"></div>
                     <ul class="dropdown-list">
                        <li>
                           <a class="accept-friend" invitation-id="<?=$row->Id?>" data-target-user-id="<?=$row->requesterId?>" data-view="FriendRequests" data-page-num="1" data-displayed-user-id="<?=SESSION["userid"]?>">Accept Friend Request</a>
                        </li>
                        <li>
                           <a class="decline-friend" invitation-id="<?=$row->Id?>" data-target-user-name="<?=$requester->Name?>" data-target-user-id="<?=$row->requesterId?>" data-view="FriendRequests" data-page-num="1" data-displayed-user-id="<?=SESSION["userid"]?>">Decline Friend Request</a>
                        </li>
                     </ul>
                  </div>
               </div>
               <div class="friend-avatar">
                  <a class="roblox-avatar-image" data-user-id="<?=$row->requesterId?>" data-image-size="custom" data-image-size-x="100" data-image-size-y="100" href="/User.aspx?ID=<?=$row->requesterId?>"></a>
               </div>
            </div>
            <div class="friend-name">
               <img src="/images/offline.png" alt="<?=$requester->Name?> is offline (last seen at 3/5/2013 3:53:35 PM.">
               <a class="text-link" title="<?=$requester->Name?>" href="/User.aspx?ID=<?=$row->requesterId?>"><?=$requester->Name?></a>
            </div>
         </div>
      <?php } ?>
      </div>
      <div class="friends-pager"></div>
      <script type="text/javascript">
         Roblox.Friends = Roblox.Friends || {};
         //<sl:translate>
         Roblox.Friends.Resources = {
             FeatureDisabled: "Feature Disabled",
             AddFriendsDisabled: "Adding friends is currently disabled.",
             RemoveFriend: "Remove Friend",
             RemoveFriendMessage: "Are you sure you want to remove {0} as a friend?"
         };
         //</sl:translate>
      </script>
       <div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
           <div class="Title"></div>
           <div class="GenericModalBody">
               <div>
                   <div class="ImageContainer">
                       <img class="GenericModalImage" alt="generic image" />
                   </div>
                   <div class="Message"></div>
               </div>
               <div class="clear"></div>
               <div id="GenericModalButtonContainer" class="GenericModalButtonContainer">
                   <a class="ImageButton btn-neutral btn-large roblox-ok">OK<span class="btn-text">OK</span></a>
               </div>
           </div>
       </div>

       <script type="text/javascript">
           Roblox = Roblox || {};
           Roblox.GenericModal = Roblox.GenericModal || {};

           Roblox.GenericModal.Resources = {
               //<sl:translate>
               ErrorText: 'Error',
               ErrorMessage: 'Sorry, an error occurred.'
               //</sl:translate>
           };
       </script>
	   </div>
</div>
<script type="text/javascript">
   InitializeFriends(false, false, false);
</script>
<div style="clear:both"></div>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Bottom.php";?>