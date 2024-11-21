<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/global.php';


//I guess the dead system can stay...
//It's a bit messy though :/
$ded = 0;
if (($_GET["id"] == "" or $_GET["id"] == null) and ($_GET["ID"] == "" or $_GET["ID"] == null)){
$ded = 1;
}else {
if ($_GET["id"] == "" or $_GET["id"] == null) {
	$id = $_GET['ID'];
}else{
	$id = $_GET['id'];
}
}

if ((int)$id == false) {
	$ded = 1;
}

if ($ded !== 1) {
	$GLOBALS['Id'] = $id;
	$user = new UserInf();
}else {
	$user = new PublicUser();
}
if ($user->Name == "Error" or $user->Name == null or $user->Name == "") {
	die(Redirect("http://" . $_SERVER['SERVER_NAME'] . "/RobloxDefaultErrorPage.aspx"));
}


$page_config["ScriptIncludes"] = [ ];

$page_config["CSSIncludes"] = [ ];

require $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Top.php";

?>
                
    <style type="text/css">
        #Body {
            padding: 10px;
        }
    </style>
    <div>
        
	<div style="width:900px;height:30px;clear:both; display:none;">
		<span id="ctl00_cphRoblox_rbxHeaderPane_nameRegion" style="font-size:20px; font-weight:bold;">Hi, <?=$user->Name?></span>
	</div>

<?php if($ded == 1): ?>
	<div id="ctl00_cphRoblox_rbxHeaderPane_statusBox" class="blank-box" style="width:951px; padding: 8px;word-wrap: break-word;display:block;">
		<span style="font-size:12px;color: #888;word-wrap: normal;">
			Right now I'm:
		</span> &nbsp;&nbsp;
		<span id="ctl00_cphRoblox_rbxHeaderPane_statusRegion" style="font-size:14px;" class="notranslate"><i>"Playing Roblox"</i></span>&nbsp;&nbsp;
		<a href="UserControls/#" id="ctl00_cphRoblox_rbxHeaderPane_updateStatusLink" style="font-size:14px;word-wrap:normal;display:block;" onclick="if (!window.__cfRLUnblockHandlers) return false; document.getElementById('updateStatusBox').style.display='block';document.getElementById('ctl00_cphRoblox_rbxHeaderPane_updateStatusLink').style.display='none'; return false;">&gt; Update My Status</a>
		<div id="updateStatusBox" style="display:none;">
			<input type="text" style="visibility:hidden;position:absolute">
				<span style="position:relative">
				<input name="ctl00$cphRoblox$rbxHeaderPane$txtStatusMessage" type="text" id="ctl00_cphRoblox_rbxHeaderPane_txtStatusMessage" style="margin-bottom:5px;width:560px;height:17px;" maxlength="254" value="Playing Roblox">&nbsp;&nbsp;
			</span>
			<input type="submit" name="ctl00$cphRoblox$rbxHeaderPane$btnUpdateStatus" value="Save" onclick="if (!window.__cfRLUnblockHandlers) return false; javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxHeaderPane$btnUpdateStatus&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, false))" id="ctl00_cphRoblox_rbxHeaderPane_btnUpdateStatus" class="translate">&nbsp;<input type="button" value="Cancel" onclick="if (!window.__cfRLUnblockHandlers) return false; document.getElementById('updateStatusBox').style.display='none';document.getElementById('ctl00_cphRoblox_rbxHeaderPane_updateStatusLink').style.display='inline';" <br="">
		</div>
	</div>
<?php endif; ?>

        
        <div style="clear: both; margin: 0; padding: 0;">
        </div>
        <!--[if IE 6]>
      <table><tr><td width="450px" valign="top">
      <![endif]-->
        <div class="divider-right" style="width: 484px; float: left">
            

<h2 class="title">
    <span id="ctl00_cphRoblox_rbxUserPane_lUserRobloxURL"><?php if ($ded !== 1) {echo("$user->Name's Profile");}else {echo("Your Profile");}?></span>
</h2>
<div class="divider-bottom" style="position: relative;z-index:3;padding-bottom: 20px">
    <div style="width: 100%">
        <div>
            <div>
				<div class="UserPaneContainer">
					<?php if($ded == 2): ?>
					<div style="margin-bottom: 10px;">
						<div id="ctl00_cphRoblox_rbxUserPane_pnlViewPublic" style="font-size: 13px;">
							<a href="User.aspx?ID=59896360&amp;ForcePublicView=true" id="ctl00_cphRoblox_rbxUserPane_lnkPublicView">(View Public Profile)</a>
						</div>
					</div>
					<?php endif; ?>
					<center>
						<div style="margin-bottom: 10px;">
							
						</div>
						<div style="margin-bottom: 10px;">
							<span style="font-size: 13px;">
								<a id="ctl00_cphRoblox_rbxUserPane_hlUserRobloxURL" href="User.aspx?ID=<?=$user->Id?>">http://<?=$_SERVER['SERVER_NAME']?>/User.aspx?ID=<?=$user->Id?></a></span><br>
							
						</div>
						<a id="ctl00_cphRoblox_rbxUserPane_AvatarImage" disabled="disabled" class=" notranslate" title="<?=$user->Name?>" class=" notranslate" onclick="return false" style="display:inline-block;height:200px;width:200px;">
							<div class="roblox-avatar-image image-medium" data-user-id="<?=$user->Id?>" data-image-size="custom" data-image-size-x="200" data-image-size-y="200" data-no-click="true" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="<?=$user->Name?>"></div>
						</a>
						<br/>
						
						
<?php if($ded !== 1): ?>
	<div class="UserBlurb" style="margin-top: 10px; overflow-y: auto; max-height: 450px; ">
		<?=$user->Bio?>
	</div>
	<div id="ProfileButtons" style="margin:10px auto;">
		
				<a id="FriendButton" class="GrayButton <?php
		if (!isset($_SESSION["player"]) or $_SESSION["player"][Id] == $user->Id) {
			echo('Disabled');
		}else {
			echo('" href="/My/FriendInvitation.aspx?RecipientID=' . $user->Id);
		}
		?>
		">Send Friend Request</a>
		<div class="SendMessageProfileBtnDiv">
				<a id="MessageButton" style="margin:0 5px" class="GrayButton <?php
		if (!isset($_SESSION["player"]) or $_SESSION["player"][Id] == $user->Id) {
			echo('Disabled');
		}else {
			echo('" href="/My/PrivateMessage.aspx?RecipientID=' . $user->Id);
		}
		?>
		">Send Message</a>
		</div>
		
		<div class="clear"></div>
		<script type="text/javascript">
			function hideDropdowns() {
				$('.GrayDropdown .Button.Active').removeClass('Active').siblings('.Menu').hide();
			}

			$('#ProfileButtons').width($('#FriendButton').outerWidth() + $('#MessageButton').outerWidth() + $('#MoreButton').outerWidth() + 10);
			$('.GrayDropdown .Button').click(function () {
				var show = !$(this).hasClass('Active');
				hideDropdowns();
				if (show) {
					$(this).addClass('Active').siblings('.Menu').show();
				}

				return false;
			});
			$(document).click(function () {
				hideDropdowns();
			});
			$('#MoreButton [original-title]').tipsy();
			var friendRequestButton = $(".friend-request-button");
			
				friendRequestButton.click(function () { window.location = "/Login/Signup.aspx"; });
			
		</script>
	</div>
<?php else: ?>
						<div class="ProfileAlertPanel" style=" margin: 15px auto 0px auto; width: 205px;">
							<div id="ctl00_cphRoblox_rbxUserPane_Alerts1_AlertSpacePanel">
								<div class="SmallHeaderAlertSpaceLeft">
									<div class="AlertSpace">
										<div class="MessageAlert">
											<a id="ctl00_cphRoblox_rbxUserPane_Alerts1_MessageAlertCaptionHyperLink" class="MessageAlertCaption tooltip-bottom" href="/My/Messages.aspx" original-title="Inbox"><?=$user->Messages ?? 0?></a>
										</div>
										<div class="FriendsAlert">
											<a id="ctl00_cphRoblox_rbxUserPane_Alerts1_FriendsAlertCaptionHyperLink" class="FriendsAlertCaption tooltip-bottom" href="Friends.aspx" original-title="Friend Requests"><?=$user->FriendRequests ?? 0?></a>
										</div>
										<div class="RobuxAlert">
											<a id="ctl00_cphRoblox_rbxUserPane_Alerts1_RobuxAlertCaptionHyperLink" class="RobuxAlertCaption tooltip-bottom" href="My/Money.aspx?tab=MyTransactions" original-title="ROBUX"><?=$user->Robux ?? 0?></a>
										</div>
										<div class="TicketsAlert">
											<a id="ctl00_cphRoblox_rbxUserPane_Alerts1_TicketsAlertCaptionHyperLink" class="TicketsAlertCaption tooltip-bottom" href="My/Money.aspx?tab=MyTransactions" original-title="Tickets"><?=$user->Tickets ?? 0?></a>
										</div>
									</div>
								</div>
							</div>
							<br>
						</div>
<?php endif; ?>
						<br/>
						<div style="margin-right: 20px">
							
						</div>
						
						
					</center>
				</div>
			</div>
        </div>
    </div>
</div>

            


<h2 class="title">
<span>ROBLONIUM Badges</span>
</h2>

<div class="divider-bottom" style="padding-bottom: 20px">
    <div style="display: inline-block">
	    <table id="ctl00_cphRoblox_rbxUserBadgesPane_dlBadges" cellspacing="0" align="Left" border="0" style="border-collapse:collapse;">
	<tr>
	<?php
	$badges = 0;
	$badgelist = '';
	$gamingvar = json_decode($user->Badges,true);
	//I'm gonna have to deal with making a dynamic max value at some point
	for ($i = 1; $i <= 16; $i++) {
		if (in_array($i, $gamingvar['Badges'])) {
		$badgeinfo = file_get_contents("http://" . $_SERVER['SERVER_NAME'] . "/Badge.ashx?id=" . $i);
		if (substr($badgeinfo,0,6) !== "Error:") {
			//Badge exists in database
			if ($badges == 5) {
				$badgelist = $badgelist . '<tr>';
			}
			$badge = json_decode($badgeinfo,true);
			$badges++;
			$badgelist = $badgelist . '<td>
	<div class="Badge" class="notranslate">
		<div class="BadgeImage"><a id="ctl00_cphRoblox_rbxUserBadgesPane_dlBadges_ctl0'.$badge["Id"].'_hlHeader" href="Badges.aspx#Badge'.$badge["Id"].'"><img id="ctl00_cphRoblox_rbxUserBadgesPane_dlBadges_ctl0'.$badge["Id"].'_iBadge" src="'.$badge["Thumbnail"].'" alt="'.$badge["Description"].'" style="height:75px;width:75px;border-width:0px;"/></a></div>
		<div class="BadgeLabel"><a id="ctl00_cphRoblox_rbxUserBadgesPane_dlBadges_ctl0'.$badge["Id"].'_HyperLink1" href="Badges.aspx#Badge'.$badge["Id"].'">'.$badge["Name"].'</a></div>
	</div>
</td>';

			if ($badges <= 10) {
			} else{
				break;
			}
		}
		}
	}
	if ($badges >= 5) {
		$badgelist = $badgelist . '</tr>';
	}
	if ($badges == 0) {
	$badgelist = '<div class="UserBlurb" style="margin-top: 10px; overflow-y: auto; max-height: 450px; ">
    This user has no badges.
</div>';
	}
	echo($badgelist);
	?>
	</tr>
</table>
	    
    </div>
</div>
<!--
            <div id="BadgesDisplayPane" class="divider-bottom" style="clear: both; padding-bottom: 20px">
                



<h2 class="title"><span>Player Badges</span></h2>
<div class="" style="min-height:300px;">
	    
    <div id="ctl00_cphRoblox_rbxBadgesDisplay_BadgesUpdatePanel" class="BadgesUpdatePanel">
	
            <div class="BadgesLoading_Container"></div>
            <div class="BadgesListView_Container">
                
                         
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl0_AssetThumbnailHyperLink" title="You visited my place! (ROBLOX has!) (Creator: mew903)" href="/You-visited-my-place-ROBLOX-has-item?id=94278219" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t0.rbxcdn.com/c991b75efb67ae4e195261f6027c456a" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="You visited my place! (ROBLOX has!) (Creator: mew903)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1088076886">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl0_AssetNameHyperLink" title="click to view" href="/You-visited-my-place-ROBLOX-has-item?id=94278219">You visited my place! (ROBLOX has!)</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl0_AssetCreatorHyperLink" href="User.aspx?ID=771417">mew903</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl1_AssetThumbnailHyperLink" title="Breakout (Creator: LegoHeroFactory)" href="/Breakout-item?id=89175794" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t2.rbxcdn.com/15c01b957a3e3f1c775b4673fbe214c6" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Breakout (Creator: LegoHeroFactory)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1043084385">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl1_AssetNameHyperLink" title="click to view" href="/Breakout-item?id=89175794">Breakout</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl1_AssetCreatorHyperLink" href="User.aspx?ID=9546823">LegoHeroFactory</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl2_AssetThumbnailHyperLink" title="The Law (Creator: LegoHeroFactory)" href="/The-Law-item?id=89175852" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t6.rbxcdn.com/12fd8e5bac42699ae91c9ee097b72f3b" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="The Law (Creator: LegoHeroFactory)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1043077949">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl2_AssetNameHyperLink" title="click to view" href="/The-Law-item?id=89175852">The Law</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl2_AssetCreatorHyperLink" href="User.aspx?ID=9546823">LegoHeroFactory</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl3_AssetThumbnailHyperLink" title="Welcome to Spleef! (Creator: CloneTrooper1019)" href="/Welcome-to-Spleef-item?id=76285821" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t2.rbxcdn.com/12048869c353206685f857509620561b" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Welcome to Spleef! (Creator: CloneTrooper1019)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1021466069">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl3_AssetNameHyperLink" title="click to view" href="/Welcome-to-Spleef-item?id=76285821">Welcome to Spleef!</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl3_AssetCreatorHyperLink" href="User.aspx?ID=2032622">CloneTrooper1019</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl4_AssetThumbnailHyperLink" title="OMG ITS CLONETROOPER1019! (You Met the Creator!) (Creator: CloneTrooper1019)" href="/OMG-ITS-CLONETROOPER1019-You-Met-the-Creator-item?id=76286530" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t3.rbxcdn.com/7b889afcfdbe0609aff1c8da3c765f20" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="OMG ITS CLONETROOPER1019! (You Met the Creator!) (Creator: CloneTrooper1019)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1021442851">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl4_AssetNameHyperLink" title="click to view" href="/OMG-ITS-CLONETROOPER1019-You-Met-the-Creator-item?id=76286530">OMG ITS CLONETROOPER1019! (You Met the Creator!)</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl4_AssetCreatorHyperLink" href="User.aspx?ID=2032622">CloneTrooper1019</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl5_AssetThumbnailHyperLink" title="House Tipper (Creator: CloneTrooper1019)" href="/House-Tipper-item?id=76286206" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t5.rbxcdn.com/1334fe98c66f0ae85b2af1e39c6ef7cb" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="House Tipper (Creator: CloneTrooper1019)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1021442848">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl5_AssetNameHyperLink" title="click to view" href="/House-Tipper-item?id=76286206">House Tipper</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl5_AssetCreatorHyperLink" href="User.aspx?ID=2032622">CloneTrooper1019</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl6_AssetThumbnailHyperLink" title="Winner! (Creator: CloneTrooper1019)" href="/Winner-item?id=76285879" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t4.rbxcdn.com/098b55cdf66658b60a4503d9fec1a536" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Winner! (Creator: CloneTrooper1019)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1021442846">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl6_AssetNameHyperLink" title="click to view" href="/Winner-item?id=76285879">Winner!</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl6_AssetCreatorHyperLink" href="User.aspx?ID=2032622">CloneTrooper1019</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl7_AssetThumbnailHyperLink" title="You Entered the Game! (Creator: CloneTrooper1019)" href="/You-Entered-the-Game-item?id=52331725" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t0.rbxcdn.com/a99235c4ba78af93c53749755ae0c021" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="You Entered the Game! (Creator: CloneTrooper1019)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1021437635">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl7_AssetNameHyperLink" title="click to view" href="/You-Entered-the-Game-item?id=52331725">You Entered the Game!</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl7_AssetCreatorHyperLink" href="User.aspx?ID=2032622">CloneTrooper1019</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl8_AssetThumbnailHyperLink" title="Scr͏ipte̛r ͢B́adge (Creator: brad1342)" href="/Scr-ipte-r-B-adge-item?id=83516904" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t2.rbxcdn.com/9317f97d44a962ecbf1c973aed90f6d9" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Scr͏ipte̛r ͢B́adge (Creator: brad1342)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1021250652">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl8_AssetNameHyperLink" title="click to view" href="/Scr-ipte-r-B-adge-item?id=83516904">Scr͏ipte̛r ͢B́adge</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl8_AssetCreatorHyperLink" href="User.aspx?ID=2467279">brad1342</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl9_AssetThumbnailHyperLink" title="The Muscly Egg of Boing Boing (Creator: CloneTrooper1019)" href="/The-Muscly-Egg-of-Boing-Boing-item?id=50544634" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t7.rbxcdn.com/4ba521fe13b211d1284864a08e4e3034" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="The Muscly Egg of Boing Boing (Creator: CloneTrooper1019)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1020729980">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl9_AssetNameHyperLink" title="click to view" href="/The-Muscly-Egg-of-Boing-Boing-item?id=50544634">The Muscly Egg of Boing Boing</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl9_AssetCreatorHyperLink" href="User.aspx?ID=2032622">CloneTrooper1019</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl10_AssetThumbnailHyperLink" title="Shiny Red Egg of Confusion (Creator: CloneTrooper1019)" href="/Shiny-Red-Egg-of-Confusion-item?id=54507938" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t1.rbxcdn.com/ed6cafbb12f1c28d7b9508e278673a71" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Shiny Red Egg of Confusion (Creator: CloneTrooper1019)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1020729947">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl10_AssetNameHyperLink" title="click to view" href="/Shiny-Red-Egg-of-Confusion-item?id=54507938">Shiny Red Egg of Confusion</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl10_AssetCreatorHyperLink" href="User.aspx?ID=2032622">CloneTrooper1019</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl11_AssetThumbnailHyperLink" title="The Egg of KOOL KILLER VI The Final Inception (Creator: CloneTrooper1019)" href="/The-Egg-of-KOOL-KILLER-VI-The-Final-Inception-item?id=54507390" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t3.rbxcdn.com/ec33656e4ead21a0a7d138ca94b02434" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="The Egg of KOOL KILLER VI The Final Inception (Creator: CloneTrooper1019)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1020729944">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl11_AssetNameHyperLink" title="click to view" href="/The-Egg-of-KOOL-KILLER-VI-The-Final-Inception-item?id=54507390">The Egg of KOOL KILLER VI The Final Inception</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl11_AssetCreatorHyperLink" href="User.aspx?ID=2032622">CloneTrooper1019</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl12_AssetThumbnailHyperLink" title="You own KOOL KILLER VIP (Creator: CloneTrooper1019)" href="/You-own-KOOL-KILLER-VIP-item?id=52331105" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t7.rbxcdn.com/a9889b93cf114bce809f889a980840e3" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="You own KOOL KILLER VIP (Creator: CloneTrooper1019)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1020729941">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl12_AssetNameHyperLink" title="click to view" href="/You-own-KOOL-KILLER-VIP-item?id=52331105">You own KOOL KILLER VIP</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl12_AssetCreatorHyperLink" href="User.aspx?ID=2032622">CloneTrooper1019</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl13_AssetThumbnailHyperLink" title="Turkey? (Creator: CloneTrooper1019)" href="/Turkey-item?id=44218791" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t7.rbxcdn.com/dd2325b4b5a45f24ab52a4200e019a66" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Turkey? (Creator: CloneTrooper1019)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1020729937">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl13_AssetNameHyperLink" title="click to view" href="/Turkey-item?id=44218791">Turkey?</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl13_AssetCreatorHyperLink" href="User.aspx?ID=2032622">CloneTrooper1019</a></span></div>
                            </div>
                        </div>
                    
                        <div class="TileBadges">
                                <a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl14_AssetThumbnailHyperLink" title="OMG ITS CLONETROOPER1019! (You met The Creator!) (Creator: CloneTrooper1019)" href="/OMG-ITS-CLONETROOPER1019-You-met-The-Creator-item?id=43192401" style="display:inline-block;height:75px;width:75px;cursor:pointer;"><img src="http://t0.rbxcdn.com/d6c2216002d23576f8f610ba932f3478" height="75" width="75" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="OMG ITS CLONETROOPER1019! (You met The Creator!) (Creator: CloneTrooper1019)"/></a>
                        
                    
                            <div class="AssetDetails" style="display:none;" id="badgeInfo1020729936">
                                <div class="AssetName notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl14_AssetNameHyperLink" title="click to view" href="/OMG-ITS-CLONETROOPER1019-You-met-The-Creator-item?id=43192401">OMG ITS CLONETROOPER1019! (You met The Creator!)</a></div>
                                <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail notranslate"><a id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeListView_ctrl14_AssetCreatorHyperLink" href="User.aspx?ID=2032622">CloneTrooper1019</a></span></div>
                            </div>
                        </div>
                    
                    
            </div>
            
            <div class="BadgesPager_Container" style="clear:both;text-align:center;bottom: 5px;left: 75px;">
                <span id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeDataPagerFooter"><a disabled="disabled" class="pager previous"></a>&nbsp;
                        <span style="display: inline-block; padding: 5px; vertical-align: top">
                        Page
                        <span id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeDataPagerFooter_ctl01_CurrentPageLabel">1</span>
                        of
                        <span id="ctl00_cphRoblox_rbxBadgesDisplay_BadgeDataPagerFooter_ctl01_TotalPagesLabel">9</span>
                        </span>
                        <a class="pager next" href="javascript:__doPostBack('ctl00$cphRoblox$rbxBadgesDisplay$BadgeDataPagerFooter$ctl02$ctl00','')"></a>&nbsp;</span>
            </div>
        
</div>
	<div style="clear:both;"></div>
</div>
-->
<script type="text/javascript">
    $('#' + 'ctl00_cphRoblox_rbxBadgesDisplay_BadgesUpdatePanel').bind('click', function (e) {
        var target = $(e.target);
        if (target.parentsUntil('.BadgesUpdatePanel', '.BadgesPager_Container').length > 0 && target[0].tagName == 'A') {
            //put up loading sign
            $('.BadgesListView_Container').html("");

            window.setTimeout(function () {
                if ($('.BadgesListView_Container').html() == "") {
                    $('.BadgesLoading_Container').html('<div style="text-align: center;margin-top: 25px;"><img src="/images/ProgressIndicator4.gif" alt="Loading..." /></div>');
                }
            }, 1000);
        }
    });
</script>
            </div>
            

<style>
.statsLabel { font-weight:bold; width:200px; text-align:right; padding-right:10px;}
.statsValue { font-weight:normal; width:200px; text-align:left;}
.statsTable { width:400px; }
</style>
<!--
<h2 class="title"><span>Statistics</span></h2>

<div class="divider-bottom" style="padding-bottom: 20px">
<table class="statsTable">
    <tr>
        <td class="statsLabel">
        <acronym title="The number of this user's friends.">Friends</acronym>:
        </td>
        <td class="statsValue">
        <span id="ctl00_cphRoblox_rbxUserStatisticsPane_lFriendsStatistics">0</span>
        </td>
    </tr>
    
    <tr>
        <td class="statsLabel"><acronym title="The number of posts this user has made to the ROBLOX forum.">Forum Posts</acronym>:</td>
        <td class="statsValue"><span id="ctl00_cphRoblox_rbxUserStatisticsPane_lForumPostsStatistics" class="notranslate">289</span></td>
    </tr>
    <tr>
        <td class="statsLabel"><acronym title="The number of times this user's place has been visited.">Place Visits</acronym>:</td>
        <td class="statsValue"><span id="ctl00_cphRoblox_rbxUserStatisticsPane_lPlaceVisitsStatistics" class="notranslate">23,371,554</span></td>
    </tr>
    <tr>
        <td class="statsLabel"><acronym title="The number of times this user's character has destroyed another user's character in-game.">Knockouts</acronym>:</td>
        <td class="statsValue"><span id="ctl00_cphRoblox_rbxUserStatisticsPane_lKillsStatistics" class="notranslate">3,330</span></td>
    </tr>
    
     <tr>
        <td class="statsLabel"><acronym title="The all-time highest voting accuracy this user has achieved when voting in contests.">Highest Ever Voting Accuracy</acronym>:</td>
        <td class="statsValue"><span id="ctl00_cphRoblox_rbxUserStatisticsPane_lHighestEverVotingAccuracyStatistics">78</span>%</td>
    </tr>
     
</table>    
</div>
            

<div class="divider-bottom" style="padding-bottom: 20px">
    <div>
        <h2 class="title" style="display:block;float: left;">
            <span class="notranslate">ROBLOX</span>'s Sets
        </h2>
        <a data-js-my-button href class="btn-small btn-neutral" id="ToggleBetweenOwnedSubscribedSets" style="float: right; margin-right: 20px; margin-top: 25px" onclick="Roblox.SetsPaneObject.toggleBetweenSetsOwnedSubscribed();return false;">View Subscribed<span class="btn-text" id="SetsToggleSpan">View Subscribed</span></a>
        <div class="clear"></div>
    </div>
    <div id="OwnedSetsContainerDiv" style="padding-bottom:0;">
        <div id="SetsItemContainer" style="margin-bottom: 30px; margin-left: 15px"></div>
        <div style="clear:both;"></div>
        <div class="SetsPager_Container" style="position: relative">
            <div id="SetsPagerContainer"></div>
        </div>
    </div>
    <div id="SubscribedSetsContainerDiv" style="display:none; padding-top: 50px; padding-bottom: 0px">
        <div id="SubscribedSetsItemContainer" style="margin-bottom: 30px; margin-left: 15px"></div>
        <div style="clear:both;"></div>
        <div class="SetsPager_Container" style="position: relative">
            <div id="SubscribedSetsPagerContainer"></div>
        </div>
    </div>
    
    <div id="SetsPaneItemTemplate" style="display:none;">
        <div class="AssetThumbnail">
            <img class="$ImageAssetID"></img>
        </div>
        <div class="AssetDetails">
            <div class="AssetName notranslate">
                <a href="/My/Sets.aspx?id=$ID">$Name</a>
            </div>
            <div class="AssetCreator">
                <span class="Label">Creator:&nbsp;</span>
                <span class="Detail">
                    <a href="/User.aspx?id=$Creator<?=$user->Id?>" class="notranslate">$CreatorName</a>
                </span>
            </div>
        </div>
    </div>
</div>
-->
<script type="text/javascript">
    if (typeof Roblox === "undefined") {
        Roblox = {};
    }

    $(function () {
        Roblox.SetsPaneObject = Roblox.SetsPane('/', 1);

        var options = { Paging_PageNumbers_AreLinks: false };
        Roblox.OwnedSetsJSDataPager = new DataPager(5, 9, 'SetsItemContainer', 'SetsPagerContainer',
            Roblox.SetsPaneObject.getSetsPaged, Roblox.SetsPaneObject.ownedItemFormatter, Roblox.SetsPaneObject.getSetAssetImageThumbnail, options
        );
        Roblox.SubscribedSetsJSDataPager = new DataPager(0, 9, 'SubscribedSetsItemContainer', 'SubscribedSetsPagerContainer',
            Roblox.SetsPaneObject.getSubscribedSetsPaged, Roblox.SetsPaneObject.subscribedItemFormatter, Roblox.SetsPaneObject.getSetAssetImageThumbnail, options
        );
    });
</script>

 <!--           
            <div id="UserGroupsPane" style="clear: both;">
                <h2 class="title">
                    <span>Groups</span></h2>
                

<div style="clear:both; padding-bottom: 20px; padding-left: 30px">
    
    <div id="ctl00_cphRoblox_rbxUserGroupsPane_ctl00">
	
            
                        
                    <div id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl0_GroupTemplateItem" style="float: left">
		
                        <div class="groupEmblemThumbnail" style="width:70px; overflow:hidden;margin:15px">
                            <div class="groupEmblemImage notranslate" style="width: 70px; height:72px; margin: 0px 0px 0px 0px; padding-top: 0px; background-repeat:no-repeat; background-image:none ">
                                <a id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl0_AssetImage1" title="Administrators" href="/Groups/group.aspx?gid=10" style="display:inline-block;height:62px;width:60px;cursor:pointer;"><img src="http://t3.rbxcdn.com/3d964c6ba46e4d0f40836527016c4350" height="62" width="60" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Administrators"/></a>
                            </div>
                        </div>
                    
	</div>
                
                    <div id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl1_GroupTemplateItem" style="float: left">
		
                        <div class="groupEmblemThumbnail" style="width:70px; overflow:hidden;margin:15px">
                            <div class="groupEmblemImage notranslate" style="width: 70px; height:72px; margin: 0px 0px 0px 0px; padding-top: 0px; background-repeat:no-repeat; background-image:none ">
                                <a id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl1_AssetImage1" title="Builders Club" href="/Groups/group.aspx?gid=8" style="display:inline-block;height:62px;width:60px;cursor:pointer;"><img src="http://t5.rbxcdn.com/3f900bdedb9a53ca10b1a7f97752ba19" height="62" width="60" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Builders Club"/></a>
                            </div>
                        </div>
                    
	</div>
                
                    <div id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl2_GroupTemplateItem" style="float: left">
		
                        <div class="groupEmblemThumbnail" style="width:70px; overflow:hidden;margin:15px">
                            <div class="groupEmblemImage notranslate" style="width: 70px; height:72px; margin: 0px 0px 0px 0px; padding-top: 0px; background-repeat:no-repeat; background-image:none ">
                                <a id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl2_AssetImage1" title="Emerald Knights of the Seventh Sanctum" href="/Groups/group.aspx?gid=377291" style="display:inline-block;height:62px;width:60px;cursor:pointer;"><img src="http://t0.rbxcdn.com/758b8052ec290c36c0389c2ac8f89262" height="62" width="60" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Emerald Knights of the Seventh Sanctum"/></a>
                            </div>
                        </div>
                    
	</div>
                
                    <div id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl3_GroupTemplateItem" style="float: left">
		
                        <div class="groupEmblemThumbnail" style="width:70px; overflow:hidden;margin:15px">
                            <div class="groupEmblemImage notranslate" style="width: 70px; height:72px; margin: 0px 0px 0px 0px; padding-top: 0px; background-repeat:no-repeat; background-image:none ">
                                <a id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl3_AssetImage1" title="Knights of RedCliff" href="/Groups/group.aspx?gid=271454" style="display:inline-block;height:62px;width:60px;cursor:pointer;"><img src="http://t0.rbxcdn.com/16f5fbd0bcb27e77c6368c7113d3e7b8" height="62" width="60" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Knights of RedCliff"/></a>
                            </div>
                        </div>
                    
	</div>
                
                    <div id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl4_GroupTemplateItem" style="float: left">
		
                        <div class="groupEmblemThumbnail" style="width:70px; overflow:hidden;margin:15px">
                            <div class="groupEmblemImage notranslate" style="width: 70px; height:72px; margin: 0px 0px 0px 0px; padding-top: 0px; background-repeat:no-repeat; background-image:none ">
                                <a id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl4_AssetImage1" title="Knights of the Splintered Skies " href="/Groups/group.aspx?gid=288278" style="display:inline-block;height:62px;width:60px;cursor:pointer;"><img src="http://t1.rbxcdn.com/d838db919b4b20e7361c51860a1e5340" height="62" width="60" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Knights of the Splintered Skies "/></a>
                            </div>
                        </div>
                    
	</div>
                
                    <div id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl5_GroupTemplateItem" style="float: left">
		
                        <div class="groupEmblemThumbnail" style="width:70px; overflow:hidden;margin:15px">
                            <div class="groupEmblemImage notranslate" style="width: 70px; height:72px; margin: 0px 0px 0px 0px; padding-top: 0px; background-repeat:no-repeat; background-image:none ">
                                <a id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl5_AssetImage1" title="Roblox" href="/Groups/group.aspx?gid=7" style="display:inline-block;height:62px;width:60px;cursor:pointer;"><img src="http://t5.rbxcdn.com/438ad6126f307065f5831002cb21b4cf" height="62" width="60" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Roblox"/></a>
                            </div>
                        </div>
                    
	</div>
                
                    <div id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl6_GroupTemplateItem" style="float: left">
		
                        <div class="groupEmblemThumbnail" style="width:70px; overflow:hidden;margin:15px">
                            <div class="groupEmblemImage notranslate" style="width: 70px; height:72px; margin: 0px 0px 0px 0px; padding-top: 0px; background-repeat:no-repeat; background-image:none ">
                                <a id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl6_AssetImage1" title="Staff" href="/Groups/group.aspx?gid=3829" style="display:inline-block;height:62px;width:60px;cursor:pointer;"><img src="http://t1.rbxcdn.com/c04ac1a556c511fb69af1a6b6c939d54" height="62" width="60" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Staff"/></a>
                            </div>
                        </div>
                    
	</div>
                
                    <div id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl7_GroupTemplateItem" style="float: left">
		
                        <div class="groupEmblemThumbnail" style="width:70px; overflow:hidden;margin:15px">
                            <div class="groupEmblemImage notranslate" style="width: 70px; height:72px; margin: 0px 0px 0px 0px; padding-top: 0px; background-repeat:no-repeat; background-image:none ">
                                <a id="ctl00_cphRoblox_rbxUserGroupsPane_GroupListView_ctrl7_AssetImage1" title="Turbo Builders Club" href="/Groups/group.aspx?gid=9" style="display:inline-block;height:62px;width:60px;cursor:pointer;"><img src="http://t0.rbxcdn.com/de683f4cd739d7f53cad28430482d37e" height="62" width="60" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Turbo Builders Club"/></a>
                            </div>
                        </div>
                    
	</div>
                
                
            
        
</div>
</div>

            </div>
        </div>
        <!--[if IE 6]>
      </td><td width="450px" valign="top">
      <![endif]-->
<!--
        <div class="divider-left" style="width: 484px; float: left; position: relative; left: -1px">
            <div class="divider-bottom" style="padding-bottom: 20px; padding-left: 20px">
                <h2 class="title" style="float: left">
                    <span>Active Places</span>
                </h2>
                
                <div id="UserPlacesPane">
                    <div id="ctl00_cphRoblox_rbxUserPlacesPane_pnlUserPlaces">
	
<div id="UserPlaces" style="overflow: hidden">

    <div id="accordion" class="accordion">
    
        <div>
            <h3 class="notranslate" style="display: block; font-size: 15px; font-weight: bold; color: #363636; float: left; overflow:hidden; height: 22px;">
			Welcome to ROBLOX Building
            </h3>
        </div>
        <div class="notranslate" style="margin:0px; padding-left: 20px; padding-right: 20px; padding-top: 0px">
			

<div class="Place">
    
    <div class="PlayStatus">
        
<span class="PlaceAccessIndicator">
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl00_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyLocked" style="display: none">
        <a class="iLocked tooltip" title="Friends Only"></a><span class="invisible">&nbsp;Friends-only</span>
	</span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl00_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyUnlocked" style="display: none">
        <a class="iUnlocked tooltip" title="Friends Only - You are friends"></a><span class="invisible">&nbsp;Friends-only: You are friends</span>
	</span>
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl00_rbxPlatform_rbxPlaceAccessIndicator_ExpiredSelf" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">&nbsp;Your Outrageous Builders Club, Turbo Builders Club, or Builders Club membership has expired, so you can
        only have one open place. Your places will not be deleted, and you can <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl00_rbxPlatform_rbxPlaceAccessIndicator_RBXLDownloadLink">download the RBXL here.</a> To unlock all of your places,
        please <a href="/upgrades/BuildersClubMemberships.aspx">re-order Outrageous Builders Club, Turbo Builders Club, or Builders
            Club </a>.<br/></span>
    </span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl00_rbxPlatform_rbxPlaceAccessIndicator_ExpiredOther" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">This place is locked because the creator's <a href="/upgrades/BuildersClubMemberships.aspx">Builders
            Club / Turbo Builders Club / Outrageous Builders Club </a>has expired.
		</span>
	</span>	
</span>
	
    </div>
    <br>
    <div class="Statistics" style="color: #999; font-size: 14px; letter-spacing: normal">
        <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl00_rbxPlatform_lStatistics">Visited 14,964,112 times (16,737 last week)</span></div>
    <div class="Thumbnail" style="width:414px;overflow:hidden;position: relative;">
        <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl00_rbxPlatform_rbxPlaceThumbnail" title="Welcome to ROBLOX Building" href="/Welcome-to-ROBLOX-Building-place?id=41324860" style="display:inline-block;height:230px;width:420px;cursor:pointer;"><img src="http://t1.rbxcdn.com/cd49e9718255ddd639f104fc2a03a795" height="230" width="420" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Welcome to ROBLOX Building"/></a>
        
    </div>
    <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl00_rbxPlatform_pDescription">
		
        <div class="Description" style="font-family: arial; color: #666; font-size: 12px;line-height: inherit; border: none">
            <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl00_rbxPlatform_lDescription">What will you build?</span>
        </div>
    
	</div>
    <div class="PlayOptions" style="display:block">
        
        <div class="VisitButtonContainer" data-item-id="41324860">
            
        <div class="VisitButtonsLeft Centered">
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl00_rbxPlatform_rbxVisitButtons_MultiplayerVisitButton" class="VisitButton VisitButtonPlay" placeid="41324860">
                <a class="btn-medium btn-primary">Play</a>
            </div>  
            
            
            
        </div>
    

    <script type="text/javascript">
        var play_placeId = 41324860;
        function redirectPlaceLauncherToLogin() {
            location.href = "/login/default.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function redirectPlaceLauncherToRegister() {
            location.href = "/login/NewAge.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function fireEventAction(action) {
            RobloxEventManager.triggerEvent('rbx_evt_popup_action', { action: action });
        }
    </script>
    

<div id="BCOnlyModal" class="modalPopup unifiedModal smallModal" style="display:none;">
 	<div style="margin:4px 0px;">
        <span>Builders Club Only</span>
    </div>
    <div class="simplemodal-close">
        <a class="ImageButton closeBtnCircle_20h" style="margin-left:400px;"></a>
    </div>
    <div class="unifiedModalContent" style="padding-top:5px; margin-bottom: 3px; margin-left: 3px; margin-right: 3px">
        <div class="ImageContainer">
            <img class="GenericModalImage BCModalImage" alt="Builder's Club" src="http://images.rbxcdn.com/ae345c0d59b00329758518edc104d573.png"/>
            <div id="BCMessageDiv" class="BCMessage Message">
                Builders Club membership is required to play in this place.
            </div>
        </div>
        <div style="clear:both;"></div>
        <div style="clear:both;"></div>
        <div class="GenericModalButtonContainer" style="padding-bottom: 13px">
            <div class="ButtonUpgradeNow">
                <a id="BClink" href="/Upgrades/BuildersClubMemberships.aspx" style="display:block; height:50px; width:173px;"></a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<script type="text/javascript">
    function showBCOnlyModal(modalId) {
        var modalProperties = { overlayClose: true, escClose: true, opacity: 80, overlayCss: { backgroundColor: "#000" } };
        if (typeof modalId === "undefined")
            $("#BCOnlyModal").modal(modalProperties);
        else
            $("#" + modalId).modal(modalProperties);
    }
    $(document).ready(function () {
        $('#VOID').click(function () {
            showBCOnlyModal("BCOnlyModal");
            return false;
        });
    });
</script>
 

<div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
    <div class="Title"></div>
    <div class="GenericModalBody">
        <div>
            <div class="ImageContainer roblox-item-image" data-image-size="small" data-no-overlays data-no-click>
                <img class="GenericModalImage" alt="generic image"/>
            </div>
            <div class="Message"></div>  
            <div style="clear:both"></div>
        </div>
        <div class="GenericModalButtonContainer">
            <a class="ImageButton btn-neutral btn-large roblox-ok">OK<span class="btn-text">OK</span></a> 
        </div>  
    </div>
</div>


 
<script type="text/javascript">
    $(function () {
        Roblox.Client.Resources = {
            //<sl:translate>
            here: "here",
            youNeedTheLatest: "You need Our Plugin for this.  Get the latest version from ",
            plugInInstallationFailed: "Plugin installation failed!",
            errorUpdating: "Error updating: "
            //</sl:translate>
        };
    });
</script>

        </div>
    </div>
</div>

			
        </div>
		
        <div>
            <h3 class="notranslate" style="display: block; font-size: 15px; font-weight: bold; color: #363636; float: left; overflow:hidden; height: 22px;">
			Building With Friends
            </h3>
        </div>
        <div class="notranslate" style="margin:0px; padding-left: 20px; padding-right: 20px; padding-top: 0px">
			

<div class="Place">
    
    <div class="PlayStatus">
        
<span class="PlaceAccessIndicator">
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl01_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyLocked" style="display: none">
        <a class="iLocked tooltip" title="Friends Only"></a><span class="invisible">&nbsp;Friends-only</span>
	</span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl01_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyUnlocked" style="display: none">
        <a class="iUnlocked tooltip" title="Friends Only - You are friends"></a><span class="invisible">&nbsp;Friends-only: You are friends</span>
	</span>
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl01_rbxPlatform_rbxPlaceAccessIndicator_ExpiredSelf" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">&nbsp;Your Outrageous Builders Club, Turbo Builders Club, or Builders Club membership has expired, so you can
        only have one open place. Your places will not be deleted, and you can <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl01_rbxPlatform_rbxPlaceAccessIndicator_RBXLDownloadLink">download the RBXL here.</a> To unlock all of your places,
        please <a href="/upgrades/BuildersClubMemberships.aspx">re-order Outrageous Builders Club, Turbo Builders Club, or Builders
            Club </a>.<br/></span>
    </span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl01_rbxPlatform_rbxPlaceAccessIndicator_ExpiredOther" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">This place is locked because the creator's <a href="/upgrades/BuildersClubMemberships.aspx">Builders
            Club / Turbo Builders Club / Outrageous Builders Club </a>has expired.
		</span>
	</span>	
</span>
	
    </div>
    <br>
    <div class="Statistics" style="color: #999; font-size: 14px; letter-spacing: normal">
        <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl01_rbxPlatform_lStatistics">Visited 85,878 times (173 last week)</span></div>
    <div class="Thumbnail" style="width:414px;overflow:hidden;position: relative;">
        <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl01_rbxPlatform_rbxPlaceThumbnail" title="Building With Friends" href="/Building-With-Friends-place?id=16184658" style="display:inline-block;height:230px;width:420px;cursor:pointer;"><img src="http://t5.rbxcdn.com/4aff48f25c4856c20126591c5c4e30aa" height="230" width="420" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Building With Friends"/></a>
        
    </div>
    
    <div class="PlayOptions" style="display:block">
        
        <div class="VisitButtonContainer" data-item-id="16184658">
            
        <div class="VisitButtonsLeft ">
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl01_rbxPlatform_rbxVisitButtons_MultiplayerVisitButton" class="VisitButton VisitButtonPlay" placeid="16184658">
                <a class="btn-medium btn-primary">Play</a>
            </div>  
            
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl01_rbxPlatform_rbxVisitButtons_EditButton" class="VisitButton VisitButtonEdit" placeid="16184658">
                <a title="Open in Studio Mode" class="btn-medium btn-primary tooltip">Edit</a>
            </div>
        </div>
    

    <script type="text/javascript">
        var play_placeId = 16184658;
        function redirectPlaceLauncherToLogin() {
            location.href = "/login/default.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function redirectPlaceLauncherToRegister() {
            location.href = "/login/NewAge.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function fireEventAction(action) {
            RobloxEventManager.triggerEvent('rbx_evt_popup_action', { action: action });
        }
    </script>
    

<div id="BCOnlyModal" class="modalPopup unifiedModal smallModal" style="display:none;">
 	<div style="margin:4px 0px;">
        <span>Builders Club Only</span>
    </div>
    <div class="simplemodal-close">
        <a class="ImageButton closeBtnCircle_20h" style="margin-left:400px;"></a>
    </div>
    <div class="unifiedModalContent" style="padding-top:5px; margin-bottom: 3px; margin-left: 3px; margin-right: 3px">
        <div class="ImageContainer">
            <img class="GenericModalImage BCModalImage" alt="Builder's Club" src="http://images.rbxcdn.com/ae345c0d59b00329758518edc104d573.png"/>
            <div id="BCMessageDiv" class="BCMessage Message">
                Builders Club membership is required to play in this place.
            </div>
        </div>
        <div style="clear:both;"></div>
        <div style="clear:both;"></div>
        <div class="GenericModalButtonContainer" style="padding-bottom: 13px">
            <div class="ButtonUpgradeNow">
                <a id="BClink" href="/Upgrades/BuildersClubMemberships.aspx" style="display:block; height:50px; width:173px;"></a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<script type="text/javascript">
    function showBCOnlyModal(modalId) {
        var modalProperties = { overlayClose: true, escClose: true, opacity: 80, overlayCss: { backgroundColor: "#000" } };
        if (typeof modalId === "undefined")
            $("#BCOnlyModal").modal(modalProperties);
        else
            $("#" + modalId).modal(modalProperties);
    }
    $(document).ready(function () {
        $('#VOID').click(function () {
            showBCOnlyModal("BCOnlyModal");
            return false;
        });
    });
</script>
 

<div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
    <div class="Title"></div>
    <div class="GenericModalBody">
        <div>
            <div class="ImageContainer roblox-item-image" data-image-size="small" data-no-overlays data-no-click>
                <img class="GenericModalImage" alt="generic image"/>
            </div>
            <div class="Message"></div>  
            <div style="clear:both"></div>
        </div>
        <div class="GenericModalButtonContainer">
            <a class="ImageButton btn-neutral btn-large roblox-ok">OK<span class="btn-text">OK</span></a> 
        </div>  
    </div>
</div>


 
<script type="text/javascript">
    $(function () {
        Roblox.Client.Resources = {
            //<sl:translate>
            here: "here",
            youNeedTheLatest: "You need Our Plugin for this.  Get the latest version from ",
            plugInInstallationFailed: "Plugin installation failed!",
            errorUpdating: "Error updating: "
            //</sl:translate>
        };
    });
</script>

        </div>
    </div>
</div>

			
        </div>
		
        <div>
            <h3 class="notranslate" style="display: block; font-size: 15px; font-weight: bold; color: #363636; float: left; overflow:hidden; height: 22px;">
			Happy Home in Robloxia
            </h3>
        </div>
        <div class="notranslate" style="margin:0px; padding-left: 20px; padding-right: 20px; padding-top: 0px">
			

<div class="Place">
    
    <div class="PlayStatus">
        
<span class="PlaceAccessIndicator">
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl02_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyLocked" style="display: none">
        <a class="iLocked tooltip" title="Friends Only"></a><span class="invisible">&nbsp;Friends-only</span>
	</span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl02_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyUnlocked" style="display: none">
        <a class="iUnlocked tooltip" title="Friends Only - You are friends"></a><span class="invisible">&nbsp;Friends-only: You are friends</span>
	</span>
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl02_rbxPlatform_rbxPlaceAccessIndicator_ExpiredSelf" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">&nbsp;Your Outrageous Builders Club, Turbo Builders Club, or Builders Club membership has expired, so you can
        only have one open place. Your places will not be deleted, and you can <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl02_rbxPlatform_rbxPlaceAccessIndicator_RBXLDownloadLink">download the RBXL here.</a> To unlock all of your places,
        please <a href="/upgrades/BuildersClubMemberships.aspx">re-order Outrageous Builders Club, Turbo Builders Club, or Builders
            Club </a>.<br/></span>
    </span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl02_rbxPlatform_rbxPlaceAccessIndicator_ExpiredOther" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">This place is locked because the creator's <a href="/upgrades/BuildersClubMemberships.aspx">Builders
            Club / Turbo Builders Club / Outrageous Builders Club </a>has expired.
		</span>
	</span>	
</span>
	
    </div>
    <br>
    <div class="Statistics" style="color: #999; font-size: 14px; letter-spacing: normal">
        <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl02_rbxPlatform_lStatistics">Visited 218,034 times (504 last week)</span></div>
    <div class="Thumbnail" style="width:414px;overflow:hidden;position: relative;">
        <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl02_rbxPlatform_rbxPlaceThumbnail" title="Happy Home in Robloxia" href="/Happy-Home-in-Robloxia-place?id=65033" style="display:inline-block;height:230px;width:420px;cursor:pointer;"><img src="http://t1.rbxcdn.com/4bbaa18e6073ee4e1f6d86a83cbb8bc6" height="230" width="420" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Happy Home in Robloxia"/></a>
        
    </div>
    <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl02_rbxPlatform_pDescription">
		
        <div class="Description" style="font-family: arial; color: #666; font-size: 12px;line-height: inherit; border: none">
            <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl02_rbxPlatform_lDescription">A nice peaceful level with a starting house and a car. Hop in your car and explore the world! Insert furniture into your house! Start a garden! Add houses for friends! Grow your starting level into a huge city! Spice your game up with some hilarious weapons! A police station! A bank! A mountain lair for a criminal mastermind! Your imagination is the limit! Welcome to ROBLOX!</span>
        </div>
    
	</div>
    <div class="PlayOptions" style="display:block">
        
        <div class="VisitButtonContainer" data-item-id="65033">
            
        <div class="VisitButtonsLeft ">
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl02_rbxPlatform_rbxVisitButtons_MultiplayerVisitButton" class="VisitButton VisitButtonPlay" placeid="65033">
                <a class="btn-medium btn-primary">Play</a>
            </div>  
            
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl02_rbxPlatform_rbxVisitButtons_EditButton" class="VisitButton VisitButtonEdit" placeid="65033">
                <a title="Open in Studio Mode" class="btn-medium btn-primary tooltip">Edit</a>
            </div>
        </div>
    

    <script type="text/javascript">
        var play_placeId = 65033;
        function redirectPlaceLauncherToLogin() {
            location.href = "/login/default.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function redirectPlaceLauncherToRegister() {
            location.href = "/login/NewAge.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function fireEventAction(action) {
            RobloxEventManager.triggerEvent('rbx_evt_popup_action', { action: action });
        }
    </script>
    

<div id="BCOnlyModal" class="modalPopup unifiedModal smallModal" style="display:none;">
 	<div style="margin:4px 0px;">
        <span>Builders Club Only</span>
    </div>
    <div class="simplemodal-close">
        <a class="ImageButton closeBtnCircle_20h" style="margin-left:400px;"></a>
    </div>
    <div class="unifiedModalContent" style="padding-top:5px; margin-bottom: 3px; margin-left: 3px; margin-right: 3px">
        <div class="ImageContainer">
            <img class="GenericModalImage BCModalImage" alt="Builder's Club" src="http://images.rbxcdn.com/ae345c0d59b00329758518edc104d573.png"/>
            <div id="BCMessageDiv" class="BCMessage Message">
                Builders Club membership is required to play in this place.
            </div>
        </div>
        <div style="clear:both;"></div>
        <div style="clear:both;"></div>
        <div class="GenericModalButtonContainer" style="padding-bottom: 13px">
            <div class="ButtonUpgradeNow">
                <a id="BClink" href="/Upgrades/BuildersClubMemberships.aspx" style="display:block; height:50px; width:173px;"></a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<script type="text/javascript">
    function showBCOnlyModal(modalId) {
        var modalProperties = { overlayClose: true, escClose: true, opacity: 80, overlayCss: { backgroundColor: "#000" } };
        if (typeof modalId === "undefined")
            $("#BCOnlyModal").modal(modalProperties);
        else
            $("#" + modalId).modal(modalProperties);
    }
    $(document).ready(function () {
        $('#VOID').click(function () {
            showBCOnlyModal("BCOnlyModal");
            return false;
        });
    });
</script>
 

<div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
    <div class="Title"></div>
    <div class="GenericModalBody">
        <div>
            <div class="ImageContainer roblox-item-image" data-image-size="small" data-no-overlays data-no-click>
                <img class="GenericModalImage" alt="generic image"/>
            </div>
            <div class="Message"></div>  
            <div style="clear:both"></div>
        </div>
        <div class="GenericModalButtonContainer">
            <a class="ImageButton btn-neutral btn-large roblox-ok">OK<span class="btn-text">OK</span></a> 
        </div>  
    </div>
</div>


 
<script type="text/javascript">
    $(function () {
        Roblox.Client.Resources = {
            //<sl:translate>
            here: "here",
            youNeedTheLatest: "You need Our Plugin for this.  Get the latest version from ",
            plugInInstallationFailed: "Plugin installation failed!",
            errorUpdating: "Error updating: "
            //</sl:translate>
        };
    });
</script>

        </div>
    </div>
</div>

			
        </div>
		
        <div>
            <h3 class="notranslate" style="display: block; font-size: 15px; font-weight: bold; color: #363636; float: left; overflow:hidden; height: 22px;">
			Glass Houses
            </h3>
        </div>
        <div class="notranslate" style="margin:0px; padding-left: 20px; padding-right: 20px; padding-top: 0px">
			

<div class="Place">
    
    <div class="PlayStatus">
        
<span class="PlaceAccessIndicator">
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl03_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyLocked" style="display: none">
        <a class="iLocked tooltip" title="Friends Only"></a><span class="invisible">&nbsp;Friends-only</span>
	</span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl03_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyUnlocked" style="display: none">
        <a class="iUnlocked tooltip" title="Friends Only - You are friends"></a><span class="invisible">&nbsp;Friends-only: You are friends</span>
	</span>
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl03_rbxPlatform_rbxPlaceAccessIndicator_ExpiredSelf" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">&nbsp;Your Outrageous Builders Club, Turbo Builders Club, or Builders Club membership has expired, so you can
        only have one open place. Your places will not be deleted, and you can <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl03_rbxPlatform_rbxPlaceAccessIndicator_RBXLDownloadLink">download the RBXL here.</a> To unlock all of your places,
        please <a href="/upgrades/BuildersClubMemberships.aspx">re-order Outrageous Builders Club, Turbo Builders Club, or Builders
            Club </a>.<br/></span>
    </span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl03_rbxPlatform_rbxPlaceAccessIndicator_ExpiredOther" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">This place is locked because the creator's <a href="/upgrades/BuildersClubMemberships.aspx">Builders
            Club / Turbo Builders Club / Outrageous Builders Club </a>has expired.
		</span>
	</span>	
</span>
	
    </div>
    <br>
    <div class="Statistics" style="color: #999; font-size: 14px; letter-spacing: normal">
        <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl03_rbxPlatform_lStatistics">Visited 284,697 times (117 last week)</span></div>
    <div class="Thumbnail" style="width:414px;overflow:hidden;position: relative;">
        <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl03_rbxPlatform_rbxPlaceThumbnail" title="Glass Houses" href="/Glass-Houses-place?id=33913" style="display:inline-block;height:230px;width:420px;cursor:pointer;"><img src="http://t2.rbxcdn.com/13ccb7ba2827073e2799fc79cf756356" height="230" width="420" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Glass Houses"/></a>
        
    </div>
    
    <div class="PlayOptions" style="display:block">
        
        <div class="VisitButtonContainer" data-item-id="33913">
            
        <div class="VisitButtonsLeft ">
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl03_rbxPlatform_rbxVisitButtons_MultiplayerVisitButton" class="VisitButton VisitButtonPlay" placeid="33913">
                <a class="btn-medium btn-primary">Play</a>
            </div>  
            
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl03_rbxPlatform_rbxVisitButtons_EditButton" class="VisitButton VisitButtonEdit" placeid="33913">
                <a title="Open in Studio Mode" class="btn-medium btn-primary tooltip">Edit</a>
            </div>
        </div>
    

    <script type="text/javascript">
        var play_placeId = 33913;
        function redirectPlaceLauncherToLogin() {
            location.href = "/login/default.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function redirectPlaceLauncherToRegister() {
            location.href = "/login/NewAge.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function fireEventAction(action) {
            RobloxEventManager.triggerEvent('rbx_evt_popup_action', { action: action });
        }
    </script>
    

<div id="BCOnlyModal" class="modalPopup unifiedModal smallModal" style="display:none;">
 	<div style="margin:4px 0px;">
        <span>Builders Club Only</span>
    </div>
    <div class="simplemodal-close">
        <a class="ImageButton closeBtnCircle_20h" style="margin-left:400px;"></a>
    </div>
    <div class="unifiedModalContent" style="padding-top:5px; margin-bottom: 3px; margin-left: 3px; margin-right: 3px">
        <div class="ImageContainer">
            <img class="GenericModalImage BCModalImage" alt="Builder's Club" src="http://images.rbxcdn.com/ae345c0d59b00329758518edc104d573.png"/>
            <div id="BCMessageDiv" class="BCMessage Message">
                Builders Club membership is required to play in this place.
            </div>
        </div>
        <div style="clear:both;"></div>
        <div style="clear:both;"></div>
        <div class="GenericModalButtonContainer" style="padding-bottom: 13px">
            <div class="ButtonUpgradeNow">
                <a id="BClink" href="/Upgrades/BuildersClubMemberships.aspx" style="display:block; height:50px; width:173px;"></a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<script type="text/javascript">
    function showBCOnlyModal(modalId) {
        var modalProperties = { overlayClose: true, escClose: true, opacity: 80, overlayCss: { backgroundColor: "#000" } };
        if (typeof modalId === "undefined")
            $("#BCOnlyModal").modal(modalProperties);
        else
            $("#" + modalId).modal(modalProperties);
    }
    $(document).ready(function () {
        $('#VOID').click(function () {
            showBCOnlyModal("BCOnlyModal");
            return false;
        });
    });
</script>
 

<div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
    <div class="Title"></div>
    <div class="GenericModalBody">
        <div>
            <div class="ImageContainer roblox-item-image" data-image-size="small" data-no-overlays data-no-click>
                <img class="GenericModalImage" alt="generic image"/>
            </div>
            <div class="Message"></div>  
            <div style="clear:both"></div>
        </div>
        <div class="GenericModalButtonContainer">
            <a class="ImageButton btn-neutral btn-large roblox-ok">OK<span class="btn-text">OK</span></a> 
        </div>  
    </div>
</div>


 
<script type="text/javascript">
    $(function () {
        Roblox.Client.Resources = {
            //<sl:translate>
            here: "here",
            youNeedTheLatest: "You need Our Plugin for this.  Get the latest version from ",
            plugInInstallationFailed: "Plugin installation failed!",
            errorUpdating: "Error updating: "
            //</sl:translate>
        };
    });
</script>

        </div>
    </div>
</div>

			
        </div>
		
        <div>
            <h3 class="notranslate" style="display: block; font-size: 15px; font-weight: bold; color: #363636; float: left; overflow:hidden; height: 22px;">
			Rocket Arena
            </h3>
        </div>
        <div class="notranslate" style="margin:0px; padding-left: 20px; padding-right: 20px; padding-top: 0px">
			

<div class="Place">
    
    <div class="PlayStatus">
        
<span class="PlaceAccessIndicator">
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl04_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyLocked" style="display: none">
        <a class="iLocked tooltip" title="Friends Only"></a><span class="invisible">&nbsp;Friends-only</span>
	</span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl04_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyUnlocked" style="display: none">
        <a class="iUnlocked tooltip" title="Friends Only - You are friends"></a><span class="invisible">&nbsp;Friends-only: You are friends</span>
	</span>
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl04_rbxPlatform_rbxPlaceAccessIndicator_ExpiredSelf" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">&nbsp;Your Outrageous Builders Club, Turbo Builders Club, or Builders Club membership has expired, so you can
        only have one open place. Your places will not be deleted, and you can <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl04_rbxPlatform_rbxPlaceAccessIndicator_RBXLDownloadLink">download the RBXL here.</a> To unlock all of your places,
        please <a href="/upgrades/BuildersClubMemberships.aspx">re-order Outrageous Builders Club, Turbo Builders Club, or Builders
            Club </a>.<br/></span>
    </span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl04_rbxPlatform_rbxPlaceAccessIndicator_ExpiredOther" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">This place is locked because the creator's <a href="/upgrades/BuildersClubMemberships.aspx">Builders
            Club / Turbo Builders Club / Outrageous Builders Club </a>has expired.
		</span>
	</span>	
</span>
	
    </div>
    <br>
    <div class="Statistics" style="color: #999; font-size: 14px; letter-spacing: normal">
        <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl04_rbxPlatform_lStatistics">Visited 1,865,260 times (1,139 last week)</span></div>
    <div class="Thumbnail" style="width:414px;overflow:hidden;position: relative;">
        <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl04_rbxPlatform_rbxPlaceThumbnail" title="Rocket Arena" href="/Rocket-Arena-place?id=25415" style="display:inline-block;height:230px;width:420px;cursor:pointer;"><img src="http://t4.rbxcdn.com/df48df3fd3c0214820e14a8fbabef16a" height="230" width="420" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Rocket Arena"/></a>
        
    </div>
    <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl04_rbxPlatform_pDescription">
		
        <div class="Description" style="font-family: arial; color: #666; font-size: 12px;line-height: inherit; border: none">
            <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl04_rbxPlatform_lDescription">This map goes back to the basics: rockets, jetboots, and blowing up bridges. Out-maneuver your foes using your jetboots, cut off their escape by nuking the bridges, and rain doom down upon them using a rapid-fire rocket launcher. But don't fall in the lava - ouch!</span>
        </div>
    
	</div>
    <div class="PlayOptions" style="display:block">
        
        <div class="VisitButtonContainer" data-item-id="25415">
            
        <div class="VisitButtonsLeft ">
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl04_rbxPlatform_rbxVisitButtons_MultiplayerVisitButton" class="VisitButton VisitButtonPlay" placeid="25415">
                <a class="btn-medium btn-primary">Play</a>
            </div>  
            
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl04_rbxPlatform_rbxVisitButtons_EditButton" class="VisitButton VisitButtonEdit" placeid="25415">
                <a title="Open in Studio Mode" class="btn-medium btn-primary tooltip">Edit</a>
            </div>
        </div>
    

    <script type="text/javascript">
        var play_placeId = 25415;
        function redirectPlaceLauncherToLogin() {
            location.href = "/login/default.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function redirectPlaceLauncherToRegister() {
            location.href = "/login/NewAge.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function fireEventAction(action) {
            RobloxEventManager.triggerEvent('rbx_evt_popup_action', { action: action });
        }
    </script>
    

<div id="BCOnlyModal" class="modalPopup unifiedModal smallModal" style="display:none;">
 	<div style="margin:4px 0px;">
        <span>Builders Club Only</span>
    </div>
    <div class="simplemodal-close">
        <a class="ImageButton closeBtnCircle_20h" style="margin-left:400px;"></a>
    </div>
    <div class="unifiedModalContent" style="padding-top:5px; margin-bottom: 3px; margin-left: 3px; margin-right: 3px">
        <div class="ImageContainer">
            <img class="GenericModalImage BCModalImage" alt="Builder's Club" src="http://images.rbxcdn.com/ae345c0d59b00329758518edc104d573.png"/>
            <div id="BCMessageDiv" class="BCMessage Message">
                Builders Club membership is required to play in this place.
            </div>
        </div>
        <div style="clear:both;"></div>
        <div style="clear:both;"></div>
        <div class="GenericModalButtonContainer" style="padding-bottom: 13px">
            <div class="ButtonUpgradeNow">
                <a id="BClink" href="/Upgrades/BuildersClubMemberships.aspx" style="display:block; height:50px; width:173px;"></a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<script type="text/javascript">
    function showBCOnlyModal(modalId) {
        var modalProperties = { overlayClose: true, escClose: true, opacity: 80, overlayCss: { backgroundColor: "#000" } };
        if (typeof modalId === "undefined")
            $("#BCOnlyModal").modal(modalProperties);
        else
            $("#" + modalId).modal(modalProperties);
    }
    $(document).ready(function () {
        $('#VOID').click(function () {
            showBCOnlyModal("BCOnlyModal");
            return false;
        });
    });
</script>
 

<div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
    <div class="Title"></div>
    <div class="GenericModalBody">
        <div>
            <div class="ImageContainer roblox-item-image" data-image-size="small" data-no-overlays data-no-click>
                <img class="GenericModalImage" alt="generic image"/>
            </div>
            <div class="Message"></div>  
            <div style="clear:both"></div>
        </div>
        <div class="GenericModalButtonContainer">
            <a class="ImageButton btn-neutral btn-large roblox-ok">OK<span class="btn-text">OK</span></a> 
        </div>  
    </div>
</div>


 
<script type="text/javascript">
    $(function () {
        Roblox.Client.Resources = {
            //<sl:translate>
            here: "here",
            youNeedTheLatest: "You need Our Plugin for this.  Get the latest version from ",
            plugInInstallationFailed: "Plugin installation failed!",
            errorUpdating: "Error updating: "
            //</sl:translate>
        };
    });
</script>

        </div>
    </div>
</div>

			
        </div>
		
        <div>
            <h3 class="notranslate" style="display: block; font-size: 15px; font-weight: bold; color: #363636; float: left; overflow:hidden; height: 22px;">
			Community Construction
            </h3>
        </div>
        <div class="notranslate" style="margin:0px; padding-left: 20px; padding-right: 20px; padding-top: 0px">
			

<div class="Place">
    
    <div class="PlayStatus">
        
<span class="PlaceAccessIndicator">
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl05_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyLocked" style="display: none">
        <a class="iLocked tooltip" title="Friends Only"></a><span class="invisible">&nbsp;Friends-only</span>
	</span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl05_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyUnlocked" style="display: none">
        <a class="iUnlocked tooltip" title="Friends Only - You are friends"></a><span class="invisible">&nbsp;Friends-only: You are friends</span>
	</span>
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl05_rbxPlatform_rbxPlaceAccessIndicator_ExpiredSelf" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">&nbsp;Your Outrageous Builders Club, Turbo Builders Club, or Builders Club membership has expired, so you can
        only have one open place. Your places will not be deleted, and you can <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl05_rbxPlatform_rbxPlaceAccessIndicator_RBXLDownloadLink">download the RBXL here.</a> To unlock all of your places,
        please <a href="/upgrades/BuildersClubMemberships.aspx">re-order Outrageous Builders Club, Turbo Builders Club, or Builders
            Club </a>.<br/></span>
    </span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl05_rbxPlatform_rbxPlaceAccessIndicator_ExpiredOther" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">This place is locked because the creator's <a href="/upgrades/BuildersClubMemberships.aspx">Builders
            Club / Turbo Builders Club / Outrageous Builders Club </a>has expired.
		</span>
	</span>	
</span>
	
    </div>
    <br>
    <div class="Statistics" style="color: #999; font-size: 14px; letter-spacing: normal">
        <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl05_rbxPlatform_lStatistics">Visited 87,507 times (70 last week)</span></div>
    <div class="Thumbnail" style="width:414px;overflow:hidden;position: relative;">
        <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl05_rbxPlatform_rbxPlaceThumbnail" title="Community Construction" href="/Community-Construction-place?id=3271" style="display:inline-block;height:230px;width:420px;cursor:pointer;"><img src="http://t1.rbxcdn.com/dbe0f8d13e6bc875773d5b55c8bc874d" height="230" width="420" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Community Construction"/></a>
        
    </div>
    
    <div class="PlayOptions" style="display:block">
        
        <div class="VisitButtonContainer" data-item-id="3271">
            
        <div class="VisitButtonsLeft ">
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl05_rbxPlatform_rbxVisitButtons_MultiplayerVisitButton" class="VisitButton VisitButtonPlay" placeid="3271">
                <a class="btn-medium btn-primary">Play</a>
            </div>  
            
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl05_rbxPlatform_rbxVisitButtons_EditButton" class="VisitButton VisitButtonEdit" placeid="3271">
                <a title="Open in Studio Mode" class="btn-medium btn-primary tooltip">Edit</a>
            </div>
        </div>
    

    <script type="text/javascript">
        var play_placeId = 3271;
        function redirectPlaceLauncherToLogin() {
            location.href = "/login/default.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function redirectPlaceLauncherToRegister() {
            location.href = "/login/NewAge.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function fireEventAction(action) {
            RobloxEventManager.triggerEvent('rbx_evt_popup_action', { action: action });
        }
    </script>
    

<div id="BCOnlyModal" class="modalPopup unifiedModal smallModal" style="display:none;">
 	<div style="margin:4px 0px;">
        <span>Builders Club Only</span>
    </div>
    <div class="simplemodal-close">
        <a class="ImageButton closeBtnCircle_20h" style="margin-left:400px;"></a>
    </div>
    <div class="unifiedModalContent" style="padding-top:5px; margin-bottom: 3px; margin-left: 3px; margin-right: 3px">
        <div class="ImageContainer">
            <img class="GenericModalImage BCModalImage" alt="Builder's Club" src="http://images.rbxcdn.com/ae345c0d59b00329758518edc104d573.png"/>
            <div id="BCMessageDiv" class="BCMessage Message">
                Builders Club membership is required to play in this place.
            </div>
        </div>
        <div style="clear:both;"></div>
        <div style="clear:both;"></div>
        <div class="GenericModalButtonContainer" style="padding-bottom: 13px">
            <div class="ButtonUpgradeNow">
                <a id="BClink" href="/Upgrades/BuildersClubMemberships.aspx" style="display:block; height:50px; width:173px;"></a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<script type="text/javascript">
    function showBCOnlyModal(modalId) {
        var modalProperties = { overlayClose: true, escClose: true, opacity: 80, overlayCss: { backgroundColor: "#000" } };
        if (typeof modalId === "undefined")
            $("#BCOnlyModal").modal(modalProperties);
        else
            $("#" + modalId).modal(modalProperties);
    }
    $(document).ready(function () {
        $('#VOID').click(function () {
            showBCOnlyModal("BCOnlyModal");
            return false;
        });
    });
</script>
 

<div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
    <div class="Title"></div>
    <div class="GenericModalBody">
        <div>
            <div class="ImageContainer roblox-item-image" data-image-size="small" data-no-overlays data-no-click>
                <img class="GenericModalImage" alt="generic image"/>
            </div>
            <div class="Message"></div>  
            <div style="clear:both"></div>
        </div>
        <div class="GenericModalButtonContainer">
            <a class="ImageButton btn-neutral btn-large roblox-ok">OK<span class="btn-text">OK</span></a> 
        </div>  
    </div>
</div>


 
<script type="text/javascript">
    $(function () {
        Roblox.Client.Resources = {
            //<sl:translate>
            here: "here",
            youNeedTheLatest: "You need Our Plugin for this.  Get the latest version from ",
            plugInInstallationFailed: "Plugin installation failed!",
            errorUpdating: "Error updating: "
            //</sl:translate>
        };
    });
</script>

        </div>
    </div>
</div>

			
        </div>
		
        <div>
            <h3 class="notranslate" style="display: block; font-size: 15px; font-weight: bold; color: #363636; float: left; overflow:hidden; height: 22px;">
			Temple of the Ninja Masters!
            </h3>
        </div>
        <div class="notranslate" style="margin:0px; padding-left: 20px; padding-right: 20px; padding-top: 0px">
			

<div class="Place">
    
    <div class="PlayStatus">
        
<span class="PlaceAccessIndicator">
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl06_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyLocked" style="display: none">
        <a class="iLocked tooltip" title="Friends Only"></a><span class="invisible">&nbsp;Friends-only</span>
	</span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl06_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyUnlocked" style="display: none">
        <a class="iUnlocked tooltip" title="Friends Only - You are friends"></a><span class="invisible">&nbsp;Friends-only: You are friends</span>
	</span>
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl06_rbxPlatform_rbxPlaceAccessIndicator_ExpiredSelf" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">&nbsp;Your Outrageous Builders Club, Turbo Builders Club, or Builders Club membership has expired, so you can
        only have one open place. Your places will not be deleted, and you can <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl06_rbxPlatform_rbxPlaceAccessIndicator_RBXLDownloadLink">download the RBXL here.</a> To unlock all of your places,
        please <a href="/upgrades/BuildersClubMemberships.aspx">re-order Outrageous Builders Club, Turbo Builders Club, or Builders
            Club </a>.<br/></span>
    </span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl06_rbxPlatform_rbxPlaceAccessIndicator_ExpiredOther" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">This place is locked because the creator's <a href="/upgrades/BuildersClubMemberships.aspx">Builders
            Club / Turbo Builders Club / Outrageous Builders Club </a>has expired.
		</span>
	</span>	
</span>
	
    </div>
    <br>
    <div class="Statistics" style="color: #999; font-size: 14px; letter-spacing: normal">
        <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl06_rbxPlatform_lStatistics">Visited 340,906 times (744 last week)</span></div>
    <div class="Thumbnail" style="width:414px;overflow:hidden;position: relative;">
        <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl06_rbxPlatform_rbxPlaceThumbnail" title="Temple of the Ninja Masters!" href="/Temple-of-the-Ninja-Masters-place?id=45778683" style="display:inline-block;height:230px;width:420px;cursor:pointer;"><img src="http://t1.rbxcdn.com/6e3d80b3ddf853af47b0c93b9f6d5789" height="230" width="420" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Temple of the Ninja Masters!"/></a>
        
    </div>
    <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl06_rbxPlatform_pDescription">
		
        <div class="Description" style="font-family: arial; color: #666; font-size: 12px;line-height: inherit; border: none">
            <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl06_rbxPlatform_lDescription">[Challenge Mode: http://www.roblox.com/Temple-of-the-Ninja-Masters-Challenge-Mode-item?id=45778718]

Alone at the edge of the world sits a sacred temple, guarded by 4 powerful Ninja Masters, each given control of one of the elements.  Many brave and powerful warriors have attempted to plunder the treasures of this temple, but all who have attempted it have failed.  Until nao.  Can you and your crew of the world's most resourceful pirates stand against the might of the Ninja Masters?  Only time will tell.</span>
        </div>
    
	</div>
    <div class="PlayOptions" style="display:block">
        
        <div class="VisitButtonContainer" data-item-id="45778683">
            
        <div class="VisitButtonsLeft Centered">
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl06_rbxPlatform_rbxVisitButtons_MultiplayerVisitButton" class="VisitButton VisitButtonPlay" placeid="45778683">
                <a class="btn-medium btn-primary">Play</a>
            </div>  
            
            
            
        </div>
    

    <script type="text/javascript">
        var play_placeId = 45778683;
        function redirectPlaceLauncherToLogin() {
            location.href = "/login/default.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function redirectPlaceLauncherToRegister() {
            location.href = "/login/NewAge.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function fireEventAction(action) {
            RobloxEventManager.triggerEvent('rbx_evt_popup_action', { action: action });
        }
    </script>
    

<div id="BCOnlyModal" class="modalPopup unifiedModal smallModal" style="display:none;">
 	<div style="margin:4px 0px;">
        <span>Builders Club Only</span>
    </div>
    <div class="simplemodal-close">
        <a class="ImageButton closeBtnCircle_20h" style="margin-left:400px;"></a>
    </div>
    <div class="unifiedModalContent" style="padding-top:5px; margin-bottom: 3px; margin-left: 3px; margin-right: 3px">
        <div class="ImageContainer">
            <img class="GenericModalImage BCModalImage" alt="Builder's Club" src="http://images.rbxcdn.com/ae345c0d59b00329758518edc104d573.png"/>
            <div id="BCMessageDiv" class="BCMessage Message">
                Builders Club membership is required to play in this place.
            </div>
        </div>
        <div style="clear:both;"></div>
        <div style="clear:both;"></div>
        <div class="GenericModalButtonContainer" style="padding-bottom: 13px">
            <div class="ButtonUpgradeNow">
                <a id="BClink" href="/Upgrades/BuildersClubMemberships.aspx" style="display:block; height:50px; width:173px;"></a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<script type="text/javascript">
    function showBCOnlyModal(modalId) {
        var modalProperties = { overlayClose: true, escClose: true, opacity: 80, overlayCss: { backgroundColor: "#000" } };
        if (typeof modalId === "undefined")
            $("#BCOnlyModal").modal(modalProperties);
        else
            $("#" + modalId).modal(modalProperties);
    }
    $(document).ready(function () {
        $('#VOID').click(function () {
            showBCOnlyModal("BCOnlyModal");
            return false;
        });
    });
</script>
 

<div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
    <div class="Title"></div>
    <div class="GenericModalBody">
        <div>
            <div class="ImageContainer roblox-item-image" data-image-size="small" data-no-overlays data-no-click>
                <img class="GenericModalImage" alt="generic image"/>
            </div>
            <div class="Message"></div>  
            <div style="clear:both"></div>
        </div>
        <div class="GenericModalButtonContainer">
            <a class="ImageButton btn-neutral btn-large roblox-ok">OK<span class="btn-text">OK</span></a> 
        </div>  
    </div>
</div>


 
<script type="text/javascript">
    $(function () {
        Roblox.Client.Resources = {
            //<sl:translate>
            here: "here",
            youNeedTheLatest: "You need Our Plugin for this.  Get the latest version from ",
            plugInInstallationFailed: "Plugin installation failed!",
            errorUpdating: "Error updating: "
            //</sl:translate>
        };
    });
</script>

        </div>
    </div>
</div>

			
        </div>
		
        <div>
            <h3 class="notranslate" style="display: block; font-size: 15px; font-weight: bold; color: #363636; float: left; overflow:hidden; height: 22px;">
			Temple of the Ninja Masters!  [Challenge Mode]
            </h3>
        </div>
        <div class="notranslate" style="margin:0px; padding-left: 20px; padding-right: 20px; padding-top: 0px">
			

<div class="Place">
    
    <div class="PlayStatus">
        
<span class="PlaceAccessIndicator">
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl07_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyLocked" style="display: none">
        <a class="iLocked tooltip" title="Friends Only"></a><span class="invisible">&nbsp;Friends-only</span>
	</span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl07_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyUnlocked" style="display: none">
        <a class="iUnlocked tooltip" title="Friends Only - You are friends"></a><span class="invisible">&nbsp;Friends-only: You are friends</span>
	</span>
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl07_rbxPlatform_rbxPlaceAccessIndicator_ExpiredSelf" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">&nbsp;Your Outrageous Builders Club, Turbo Builders Club, or Builders Club membership has expired, so you can
        only have one open place. Your places will not be deleted, and you can <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl07_rbxPlatform_rbxPlaceAccessIndicator_RBXLDownloadLink">download the RBXL here.</a> To unlock all of your places,
        please <a href="/upgrades/BuildersClubMemberships.aspx">re-order Outrageous Builders Club, Turbo Builders Club, or Builders
            Club </a>.<br/></span>
    </span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl07_rbxPlatform_rbxPlaceAccessIndicator_ExpiredOther" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">This place is locked because the creator's <a href="/upgrades/BuildersClubMemberships.aspx">Builders
            Club / Turbo Builders Club / Outrageous Builders Club </a>has expired.
		</span>
	</span>	
</span>
	
    </div>
    <br>
    <div class="Statistics" style="color: #999; font-size: 14px; letter-spacing: normal">
        <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl07_rbxPlatform_lStatistics">Visited 198,398 times (404 last week)</span></div>
    <div class="Thumbnail" style="width:414px;overflow:hidden;position: relative;">
        <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl07_rbxPlatform_rbxPlaceThumbnail" title="Temple of the Ninja Masters!  [Challenge Mode]" href="/Temple-of-the-Ninja-Masters-Challenge-Mode-place?id=45778718" style="display:inline-block;height:230px;width:420px;cursor:pointer;"><img src="http://t3.rbxcdn.com/fb2512c2e9ec9af45c5fdf9b01ae10c6" height="230" width="420" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Temple of the Ninja Masters!  [Challenge Mode]"/></a>
        
    </div>
    <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl07_rbxPlatform_pDescription">
		
        <div class="Description" style="font-family: arial; color: #666; font-size: 12px;line-height: inherit; border: none">
            <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl07_rbxPlatform_lDescription">[Normal Mode:  http://www.roblox.com/Temple-of-the-Ninja-Masters-item?id=45778683]
Alone at the edge of the world sits a sacred temple, guarded by 4 powerful Ninja Masters, each given control of one of the elements.  Many brave and powerful warriors have attempted to plunder the treasures of this temple, but all who have attempted it have failed.  Until nao.  Can you and your crew of the world's most resourceful pirates stand against the might of the Ninja Masters at their strongest?  Only time will tell.</span>
        </div>
    
	</div>
    <div class="PlayOptions" style="display:block">
        
        <div class="VisitButtonContainer" data-item-id="45778718">
            
        <div class="VisitButtonsLeft Centered">
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl07_rbxPlatform_rbxVisitButtons_MultiplayerVisitButton" class="VisitButton VisitButtonPlay" placeid="45778718">
                <a class="btn-medium btn-primary">Play</a>
            </div>  
            
            
            
        </div>
    

    <script type="text/javascript">
        var play_placeId = 45778718;
        function redirectPlaceLauncherToLogin() {
            location.href = "/login/default.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function redirectPlaceLauncherToRegister() {
            location.href = "/login/NewAge.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function fireEventAction(action) {
            RobloxEventManager.triggerEvent('rbx_evt_popup_action', { action: action });
        }
    </script>
    

<div id="BCOnlyModal" class="modalPopup unifiedModal smallModal" style="display:none;">
 	<div style="margin:4px 0px;">
        <span>Builders Club Only</span>
    </div>
    <div class="simplemodal-close">
        <a class="ImageButton closeBtnCircle_20h" style="margin-left:400px;"></a>
    </div>
    <div class="unifiedModalContent" style="padding-top:5px; margin-bottom: 3px; margin-left: 3px; margin-right: 3px">
        <div class="ImageContainer">
            <img class="GenericModalImage BCModalImage" alt="Builder's Club" src="http://images.rbxcdn.com/ae345c0d59b00329758518edc104d573.png"/>
            <div id="BCMessageDiv" class="BCMessage Message">
                Builders Club membership is required to play in this place.
            </div>
        </div>
        <div style="clear:both;"></div>
        <div style="clear:both;"></div>
        <div class="GenericModalButtonContainer" style="padding-bottom: 13px">
            <div class="ButtonUpgradeNow">
                <a id="BClink" href="/Upgrades/BuildersClubMemberships.aspx" style="display:block; height:50px; width:173px;"></a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<script type="text/javascript">
    function showBCOnlyModal(modalId) {
        var modalProperties = { overlayClose: true, escClose: true, opacity: 80, overlayCss: { backgroundColor: "#000" } };
        if (typeof modalId === "undefined")
            $("#BCOnlyModal").modal(modalProperties);
        else
            $("#" + modalId).modal(modalProperties);
    }
    $(document).ready(function () {
        $('#VOID').click(function () {
            showBCOnlyModal("BCOnlyModal");
            return false;
        });
    });
</script>
 

<div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
    <div class="Title"></div>
    <div class="GenericModalBody">
        <div>
            <div class="ImageContainer roblox-item-image" data-image-size="small" data-no-overlays data-no-click>
                <img class="GenericModalImage" alt="generic image"/>
            </div>
            <div class="Message"></div>  
            <div style="clear:both"></div>
        </div>
        <div class="GenericModalButtonContainer">
            <a class="ImageButton btn-neutral btn-large roblox-ok">OK<span class="btn-text">OK</span></a> 
        </div>  
    </div>
</div>


 
<script type="text/javascript">
    $(function () {
        Roblox.Client.Resources = {
            //<sl:translate>
            here: "here",
            youNeedTheLatest: "You need Our Plugin for this.  Get the latest version from ",
            plugInInstallationFailed: "Plugin installation failed!",
            errorUpdating: "Error updating: "
            //</sl:translate>
        };
    });
</script>

        </div>
    </div>
</div>

			
        </div>
		
        <div>
            <h3 class="notranslate" style="display: block; font-size: 15px; font-weight: bold; color: #363636; float: left; overflow:hidden; height: 22px;">
			Crossroads
            </h3>
        </div>
        <div class="notranslate" style="margin:0px; padding-left: 20px; padding-right: 20px; padding-top: 0px">
			

<div class="Place">
    
    <div class="PlayStatus">
        
<span class="PlaceAccessIndicator">
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl08_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyLocked" style="display: none">
        <a class="iLocked tooltip" title="Friends Only"></a><span class="invisible">&nbsp;Friends-only</span>
	</span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl08_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyUnlocked" style="display: none">
        <a class="iUnlocked tooltip" title="Friends Only - You are friends"></a><span class="invisible">&nbsp;Friends-only: You are friends</span>
	</span>
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl08_rbxPlatform_rbxPlaceAccessIndicator_ExpiredSelf" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">&nbsp;Your Outrageous Builders Club, Turbo Builders Club, or Builders Club membership has expired, so you can
        only have one open place. Your places will not be deleted, and you can <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl08_rbxPlatform_rbxPlaceAccessIndicator_RBXLDownloadLink">download the RBXL here.</a> To unlock all of your places,
        please <a href="/upgrades/BuildersClubMemberships.aspx">re-order Outrageous Builders Club, Turbo Builders Club, or Builders
            Club </a>.<br/></span>
    </span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl08_rbxPlatform_rbxPlaceAccessIndicator_ExpiredOther" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">This place is locked because the creator's <a href="/upgrades/BuildersClubMemberships.aspx">Builders
            Club / Turbo Builders Club / Outrageous Builders Club </a>has expired.
		</span>
	</span>	
</span>
	
    </div>
    <br>
    <div class="Statistics" style="color: #999; font-size: 14px; letter-spacing: normal">
        <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl08_rbxPlatform_lStatistics">Visited 2,347,143 times (2,369 last week)</span></div>
    <div class="Thumbnail" style="width:414px;overflow:hidden;position: relative;">
        <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl08_rbxPlatform_rbxPlaceThumbnail" title="Crossroads" href="/Crossroads-place?id=1818" style="display:inline-block;height:230px;width:420px;cursor:pointer;"><img src="http://t7.rbxcdn.com/05058ffb13cabf34eeb4f329180c780d" height="230" width="420" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Crossroads"/></a>
        
    </div>
    <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl08_rbxPlatform_pDescription">
		
        <div class="Description" style="font-family: arial; color: #666; font-size: 12px;line-height: inherit; border: none">
            <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl08_rbxPlatform_lDescription">The classic ROBLOX level is back!</span>
        </div>
    
	</div>
    <div class="PlayOptions" style="display:block">
        
        <div class="VisitButtonContainer" data-item-id="1818">
            
        <div class="VisitButtonsLeft ">
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl08_rbxPlatform_rbxVisitButtons_MultiplayerVisitButton" class="VisitButton VisitButtonPlay" placeid="1818">
                <a class="btn-medium btn-primary">Play</a>
            </div>  
            
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl08_rbxPlatform_rbxVisitButtons_EditButton" class="VisitButton VisitButtonEdit" placeid="1818">
                <a title="Open in Studio Mode" class="btn-medium btn-primary tooltip">Edit</a>
            </div>
        </div>
    

    <script type="text/javascript">
        var play_placeId = 1818;
        function redirectPlaceLauncherToLogin() {
            location.href = "/login/default.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function redirectPlaceLauncherToRegister() {
            location.href = "/login/NewAge.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function fireEventAction(action) {
            RobloxEventManager.triggerEvent('rbx_evt_popup_action', { action: action });
        }
    </script>
    

<div id="BCOnlyModal" class="modalPopup unifiedModal smallModal" style="display:none;">
 	<div style="margin:4px 0px;">
        <span>Builders Club Only</span>
    </div>
    <div class="simplemodal-close">
        <a class="ImageButton closeBtnCircle_20h" style="margin-left:400px;"></a>
    </div>
    <div class="unifiedModalContent" style="padding-top:5px; margin-bottom: 3px; margin-left: 3px; margin-right: 3px">
        <div class="ImageContainer">
            <img class="GenericModalImage BCModalImage" alt="Builder's Club" src="http://images.rbxcdn.com/ae345c0d59b00329758518edc104d573.png"/>
            <div id="BCMessageDiv" class="BCMessage Message">
                Builders Club membership is required to play in this place.
            </div>
        </div>
        <div style="clear:both;"></div>
        <div style="clear:both;"></div>
        <div class="GenericModalButtonContainer" style="padding-bottom: 13px">
            <div class="ButtonUpgradeNow">
                <a id="BClink" href="/Upgrades/BuildersClubMemberships.aspx" style="display:block; height:50px; width:173px;"></a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<script type="text/javascript">
    function showBCOnlyModal(modalId) {
        var modalProperties = { overlayClose: true, escClose: true, opacity: 80, overlayCss: { backgroundColor: "#000" } };
        if (typeof modalId === "undefined")
            $("#BCOnlyModal").modal(modalProperties);
        else
            $("#" + modalId).modal(modalProperties);
    }
    $(document).ready(function () {
        $('#VOID').click(function () {
            showBCOnlyModal("BCOnlyModal");
            return false;
        });
    });
</script>
 

<div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
    <div class="Title"></div>
    <div class="GenericModalBody">
        <div>
            <div class="ImageContainer roblox-item-image" data-image-size="small" data-no-overlays data-no-click>
                <img class="GenericModalImage" alt="generic image"/>
            </div>
            <div class="Message"></div>  
            <div style="clear:both"></div>
        </div>
        <div class="GenericModalButtonContainer">
            <a class="ImageButton btn-neutral btn-large roblox-ok">OK<span class="btn-text">OK</span></a> 
        </div>  
    </div>
</div>


 
<script type="text/javascript">
    $(function () {
        Roblox.Client.Resources = {
            //<sl:translate>
            here: "here",
            youNeedTheLatest: "You need Our Plugin for this.  Get the latest version from ",
            plugInInstallationFailed: "Plugin installation failed!",
            errorUpdating: "Error updating: "
            //</sl:translate>
        };
    });
</script>

        </div>
    </div>
</div>

			
        </div>
		
        <div>
            <h3 class="notranslate" style="display: block; font-size: 15px; font-weight: bold; color: #363636; float: left; overflow:hidden; height: 22px;">
			Chaos Canyon
            </h3>
        </div>
        <div class="notranslate" style="margin:0px; padding-left: 20px; padding-right: 20px; padding-top: 0px">
			

<div class="Place">
    
    <div class="PlayStatus">
        
<span class="PlaceAccessIndicator">
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl09_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyLocked" style="display: none">
        <a class="iLocked tooltip" title="Friends Only"></a><span class="invisible">&nbsp;Friends-only</span>
	</span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl09_rbxPlatform_rbxPlaceAccessIndicator_FriendsOnlyUnlocked" style="display: none">
        <a class="iUnlocked tooltip" title="Friends Only - You are friends"></a><span class="invisible">&nbsp;Friends-only: You are friends</span>
	</span>
	<span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl09_rbxPlatform_rbxPlaceAccessIndicator_ExpiredSelf" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">&nbsp;Your Outrageous Builders Club, Turbo Builders Club, or Builders Club membership has expired, so you can
        only have one open place. Your places will not be deleted, and you can <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl09_rbxPlatform_rbxPlaceAccessIndicator_RBXLDownloadLink">download the RBXL here.</a> To unlock all of your places,
        please <a href="/upgrades/BuildersClubMemberships.aspx">re-order Outrageous Builders Club, Turbo Builders Club, or Builders
            Club </a>.<br/></span>
    </span>
    <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl09_rbxPlatform_rbxPlaceAccessIndicator_ExpiredOther" style="display: none">
        <a class="iLocked tooltip" title="Locked"></a>
        <span class="invisible">This place is locked because the creator's <a href="/upgrades/BuildersClubMemberships.aspx">Builders
            Club / Turbo Builders Club / Outrageous Builders Club </a>has expired.
		</span>
	</span>	
</span>
	
    </div>
    <br>
    <div class="Statistics" style="color: #999; font-size: 14px; letter-spacing: normal">
        <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl09_rbxPlatform_lStatistics">Visited 776,575 times (848 last week)</span></div>
    <div class="Thumbnail" style="width:414px;overflow:hidden;position: relative;">
        <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl09_rbxPlatform_rbxPlaceThumbnail" title="Chaos Canyon" href="/Chaos-Canyon-place?id=14403" style="display:inline-block;height:230px;width:420px;cursor:pointer;"><img src="http://t0.rbxcdn.com/11d9ca3d26a281d285349e5dbeba2622" height="230" width="420" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Chaos Canyon"/></a>
        
    </div>
    <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl09_rbxPlatform_pDescription">
		
        <div class="Description" style="font-family: arial; color: #666; font-size: 12px;line-height: inherit; border: none">
            <span id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl09_rbxPlatform_lDescription">Experience Chaos Canyon - Escape from Desolation Valley, explore the ruins on the cliffs, walk on the Sky Bridge and hold the Battle Cube from invaders! This map features models created by the community, including: PilotLuke, tingc222, and Yahoo. </span>
        </div>
    
	</div>
    <div class="PlayOptions" style="display:block">
        
        <div class="VisitButtonContainer" data-item-id="14403">
            
        <div class="VisitButtonsLeft ">
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl09_rbxPlatform_rbxVisitButtons_MultiplayerVisitButton" class="VisitButton VisitButtonPlay" placeid="14403">
                <a class="btn-medium btn-primary">Play</a>
            </div>  
            
            
            <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePlaces_ctl09_rbxPlatform_rbxVisitButtons_EditButton" class="VisitButton VisitButtonEdit" placeid="14403">
                <a title="Open in Studio Mode" class="btn-medium btn-primary tooltip">Edit</a>
            </div>
        </div>
    

    <script type="text/javascript">
        var play_placeId = 14403;
        function redirectPlaceLauncherToLogin() {
            location.href = "/login/default.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function redirectPlaceLauncherToRegister() {
            location.href = "/login/NewAge.aspx?ReturnUrl=" + encodeURIComponent("/User.aspx?ID=1");
        }
        function fireEventAction(action) {
            RobloxEventManager.triggerEvent('rbx_evt_popup_action', { action: action });
        }
    </script>
    

<div id="BCOnlyModal" class="modalPopup unifiedModal smallModal" style="display:none;">
 	<div style="margin:4px 0px;">
        <span>Builders Club Only</span>
    </div>
    <div class="simplemodal-close">
        <a class="ImageButton closeBtnCircle_20h" style="margin-left:400px;"></a>
    </div>
    <div class="unifiedModalContent" style="padding-top:5px; margin-bottom: 3px; margin-left: 3px; margin-right: 3px">
        <div class="ImageContainer">
            <img class="GenericModalImage BCModalImage" alt="Builder's Club" src="http://images.rbxcdn.com/ae345c0d59b00329758518edc104d573.png"/>
            <div id="BCMessageDiv" class="BCMessage Message">
                Builders Club membership is required to play in this place.
            </div>
        </div>
        <div style="clear:both;"></div>
        <div style="clear:both;"></div>
        <div class="GenericModalButtonContainer" style="padding-bottom: 13px">
            <div class="ButtonUpgradeNow">
                <a id="BClink" href="/Upgrades/BuildersClubMemberships.aspx" style="display:block; height:50px; width:173px;"></a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<script type="text/javascript">
    function showBCOnlyModal(modalId) {
        var modalProperties = { overlayClose: true, escClose: true, opacity: 80, overlayCss: { backgroundColor: "#000" } };
        if (typeof modalId === "undefined")
            $("#BCOnlyModal").modal(modalProperties);
        else
            $("#" + modalId).modal(modalProperties);
    }
    $(document).ready(function () {
        $('#VOID').click(function () {
            showBCOnlyModal("BCOnlyModal");
            return false;
        });
    });
</script>
 

<div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
    <div class="Title"></div>
    <div class="GenericModalBody">
        <div>
            <div class="ImageContainer roblox-item-image" data-image-size="small" data-no-overlays data-no-click>
                <img class="GenericModalImage" alt="generic image"/>
            </div>
            <div class="Message"></div>  
            <div style="clear:both"></div>
        </div>
        <div class="GenericModalButtonContainer">
            <a class="ImageButton btn-neutral btn-large roblox-ok">OK<span class="btn-text">OK</span></a> 
        </div>  
    </div>
</div>


 
<script type="text/javascript">
    $(function () {
        Roblox.Client.Resources = {
            //<sl:translate>
            here: "here",
            youNeedTheLatest: "You need Our Plugin for this.  Get the latest version from ",
            plugInInstallationFailed: "Plugin installation failed!",
            errorUpdating: "Error updating: "
            //</sl:translate>
        };
    });
</script>

        </div>
    </div>
</div>

			
        </div>
		
    </div>
    



	<div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcaseFooter" class="PanelFooter" style="margin-top: 5px; margin-left:20px">
		
	    <div id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePager_PanelPages" style="text-align:center;">
			
     <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePager_LinkButtonFirst" class="pager previous disabled"></a>
     
    <span class="PageNumbers" style="vertical-align: top; display: inline-block; padding: 5px; padding-top: 6px">Page 1 of 2</span>
    <a id="ctl00_cphRoblox_rbxUserPlacesPane_ShowcasePager_LinkButtonNext" class="pager next" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserPlacesPane$ShowcasePager$LinkButtonNext&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))"></a>
    

		</div>
	    
	
	</div>
 </div>
 
</div>
 
<?php include $_SERVER["DOCUMENT_ROOT"] . '/puzzle/ItemPurchaseAjaxContainer.php';?>
 <script type="text/javascript">
     Roblox.require('Widgets.DropdownMenu', function (dropdown) {
         dropdown.InitializeDropdown();
     });
</script>
                </div>
            </div>
            <div style="padding-left: 20px" class="divider-bottom">
                

<div style="margin: 12px 0 20px; overflow:visible">
    <h2 style="float: left">ROBLOX's Friends</h2>
    
    <a data-js-my-button style="float: right" href="Friends.aspx?<?=$user->Id?>=1" class="btn-small btn-neutral" id="HeaderButton">See All 0<span class="btn-text">See All 0</span></a>
    
</div>
<div style="padding-top: 50px">
    
	
	<div id="ctl00_cphRoblox_rbxFriendsPane_pNoResults">
	
		<p><span id="ctl00_cphRoblox_rbxFriendsPane_lNoResults">ROBLOX does not have any Roblox friends.</span></p>
	
</div>
</div>

            </div>
            

<div class="divider-bottom" style="padding-left: 20px; padding-bottom: 20px">
    <div id="ctl00_cphRoblox_rbxFavoritesPane_FavoritesPane">
	
	        <div style="overflow: auto">
                <h2 class="title" style="float: left">Favorites</h2>
                <div class="PanelFooter" style="float: right; font: 12px Arial; text-transform: none">
			        Category:&nbsp;
			        <select name="ctl00$cphRoblox$rbxFavoritesPane$AssetCategoryDropDownList" id="ctl00_cphRoblox_rbxFavoritesPane_AssetCategoryDropDownList">
		<option value="17">Heads</option>
		<option value="18">Faces</option>
		<option value="19">Gear</option>
		<option value="8">Hats</option>
		<option value="2">T-Shirts</option>
		<option value="11">Shirts</option>
		<option value="12">Pants</option>
		<option value="13">Decals</option>
		<option value="10">Models</option>
		<option selected="selected" value="9">Places</option>

	</select>
		        </div>
            </div>
		    <div>
			
			    <div id="FavoritesContent">
				    <table id="ctl00_cphRoblox_rbxFavoritesPane_FavoritesDataList" cellspacing="0" border="0" style="border-collapse:collapse;">
		<tr>
			<td class="Asset" valign="top">
					        <div style="padding:5px; margin-right: 30px; margin-left: 10px">
						        <div class="AssetThumbnail notranslate">
							        <a id="ctl00_cphRoblox_rbxFavoritesPane_FavoritesDataList_ctl00_AssetThumbnailHyperLink" class=" notranslate" title="Apocalypse Dogeing" class=" notranslate" href="/Apocalypse-Dogeing-place?id=1600503" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t7.rbxcdn.com/5cdf2ec879ae23daeb0ed8ed4b4df9e5" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Apocalypse Dogeing" class=" notranslate"/></a>
							    
						        </div>
						        <div class="AssetDetails notranslate" style="clear:both;">
							        <div class="AssetName"><a id="ctl00_cphRoblox_rbxFavoritesPane_FavoritesDataList_ctl00_AssetNameHyperLink" href="/Apocalypse-Dogeing-place?id=1600503">Apocalypse Dogeing</a></div>
							        <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail"><a id="ctl00_cphRoblox_rbxFavoritesPane_FavoritesDataList_ctl00_AssetCreatorHyperLink" href="User.aspx?ID=281519">Gusmanak</a></span></div>
						            
						        </div>
						    </div>
					    </td><td class="Asset" valign="top">
					        <div style="padding:5px; margin-right: 30px; margin-left: 10px">
						        <div class="AssetThumbnail notranslate">
							        <a id="ctl00_cphRoblox_rbxFavoritesPane_FavoritesDataList_ctl01_AssetThumbnailHyperLink" class=" notranslate" title="ROBLOX Base Wars FPS" class=" notranslate" href="/ROBLOX-Base-Wars-FPS-place?id=50430" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t3.rbxcdn.com/a691650afb6a0b03282a78ff32ddc171" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="ROBLOX Base Wars FPS" class=" notranslate"/></a>
							    
						        </div>
						        <div class="AssetDetails notranslate" style="clear:both;">
							        <div class="AssetName"><a id="ctl00_cphRoblox_rbxFavoritesPane_FavoritesDataList_ctl01_AssetNameHyperLink" href="/ROBLOX-Base-Wars-FPS-place?id=50430">ROBLOX Base Wars FPS</a></div>
							        <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail"><a id="ctl00_cphRoblox_rbxFavoritesPane_FavoritesDataList_ctl01_AssetCreatorHyperLink" href="User.aspx?ID=21557">Games</a></span></div>
						            
						        </div>
						    </div>
					    </td><td class="Asset" valign="top">
					        <div style="padding:5px; margin-right: 30px; margin-left: 10px">
						        <div class="AssetThumbnail notranslate">
							        <a id="ctl00_cphRoblox_rbxFavoritesPane_FavoritesDataList_ctl02_AssetThumbnailHyperLink" class=" notranslate" title="Doge Fights on the Doge IV" class=" notranslate" href="/Doge-Fights-on-the-Doge-IV-place?id=47324" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t4.rbxcdn.com/ca54f076991fb977f170e256025de77a" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Doge Fights on the Doge IV" class=" notranslate"/></a>
							    
						        </div>
						        <div class="AssetDetails notranslate" style="clear:both;">
							        <div class="AssetName"><a id="ctl00_cphRoblox_rbxFavoritesPane_FavoritesDataList_ctl02_AssetNameHyperLink" href="/Doge-Fights-on-the-Doge-IV-place?id=47324">Doge Fights on the Doge IV</a></div>
							        <div class="AssetCreator"><span class="Label">Creator:</span> <span class="Detail"><a id="ctl00_cphRoblox_rbxFavoritesPane_FavoritesDataList_ctl02_AssetCreatorHyperLink" href="User.aspx?ID=261">Shedletsky</a></span></div>
						            
						        </div>
						    </div>
					    </td>
		</tr>
	</table>
				    
				    
			    </div>
		    </div>
	    
</div>
</div>

            <div style="clear: both; margin: 20px;width:300px;">
                
                
            <div style="width: 300px">
    <span id="3136323832303639" class="GPTAd rectangle" data-js-adtype="gptAd">
        <script type="text/javascript">
            googletag.cmd.push(function () {
                googletag.display("3136323832303639");
            });
        </script>
    </span>
    <div class="ad-annotations " style="width: 300px">
        <span class="ad-identification">Advertisement</span>
            <a class="BadAdButton" href="/Ads/ReportAd.aspx" title="click to report an offensive ad">Report</a>
    </div>
</div>

            </div>
        </div>
        <!--[if IE 6]>
      </td></tr></table>
      <![endif]-->
        <br clear="all"/>
    </div>
<!--
    <div id="UserContainer">
        <div id="UserAssetsPane" style="border-top: 1px solid #ccc;">
            <div id="ctl00_cphRoblox_rbxUserAssetsPane_upUserAssetsPane">
	
        <h2 class="title" display="block" style="width:970px">
            <span>
                Inventory
                
        </span>
        </h2>
        <div id="UserAssets">
            <div id="AssetsMenu" class="divider-right">
                
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl00_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl00_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl00$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Heads</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl01_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl01_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl01$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Faces</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl02_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl02_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl02$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Gear</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl03_AssetCategorySelectorPanel" class="verticaltab selected">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl03_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl03$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Hats</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl04_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl04_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl04$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">T-Shirts</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl05_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl05_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl05$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Shirts</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl06_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl06_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl06$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Pants</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl07_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl07_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl07$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Decals</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl08_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl08_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl08$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Models</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl09_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl09_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl09$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Places</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl10_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl10_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl10$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Game Passes</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl11_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl11_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl11$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Audio</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl12_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl12_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl12$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Badges</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl13_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl13_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl13$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Left Arms</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl14_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl14_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl14$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Right Arms</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl15_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl15_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl15$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Left Legs</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl16_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl16_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl16$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Right Legs</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl17_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl17_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl17$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Torsos</a>
	</div>
                    
                        <div id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl18_AssetCategorySelectorPanel" class="verticaltab">
		
                            <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetCategoryRepeater_ctl18_AssetCategorySelector" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$AssetCategoryRepeater$ctl18$AssetCategorySelector&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">Packages</a>
	</div>
                    
            </div>
            <div id="AssetsContent">
                
                
                
                <table id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList" cellspacing="0" border="0" style="border-collapse:collapse;">
		<tr>
			<td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl00_AssetThumbnailHyperLink" class=" notranslate" title="BLOXikin #09 Zombie StickmasterLuke" class=" notranslate" href="/BLOXikin-09-Zombie-StickmasterLuke-item?id=133873051" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t7.rbxcdn.com/81959e7eb6e1310c685d6038ee78938e" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="BLOXikin #09 Zombie StickmasterLuke" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl00_AssetNameHyperLink" class="noranslate" href="/BLOXikin-09-Zombie-StickmasterLuke-item?id=133873051">BLOXikin #09 Zombie StickmasterLuke</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl00_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl01_AssetThumbnailHyperLink" class=" notranslate" title="BLOXikin #10 Frankenstein Fusroblox" class=" notranslate" href="/BLOXikin-10-Frankenstein-Fusroblox-item?id=133872999" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t3.rbxcdn.com/5feb647702eaf258400685eacb182b42" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="BLOXikin #10 Frankenstein Fusroblox" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl01_AssetNameHyperLink" class="noranslate" href="/BLOXikin-10-Frankenstein-Fusroblox-item?id=133872999">BLOXikin #10 Frankenstein Fusroblox</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl01_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl02_AssetThumbnailHyperLink" class=" notranslate" title="Creepy Scarecrow" class=" notranslate" href="/Creepy-Scarecrow-item?id=133553944" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t5.rbxcdn.com/acaac553ef25e1ecfb4ea11928183597" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Creepy Scarecrow" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl02_AssetNameHyperLink" class="noranslate" href="/Creepy-Scarecrow-item?id=133553944">Creepy Scarecrow</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl02_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                <div id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl02_Div1" class="AssetPrice">
                                    <span class="PriceInRobux notranslate">
                                        R$: 250</span></div>
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl03_AssetThumbnailHyperLink" class=" notranslate" title="Hallow-vision" class=" notranslate" href="/Hallow-vision-item?id=133554220" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t0.rbxcdn.com/980a4e9aa24867c6f1ee3f48b0012f1e" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Hallow-vision" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl03_AssetNameHyperLink" class="noranslate" href="/Hallow-vision-item?id=133554220">Hallow-vision</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl03_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                <div id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl03_Div1" class="AssetPrice">
                                    <span class="PriceInRobux notranslate">
                                        R$: 50</span></div>
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl04_AssetThumbnailHyperLink" class=" notranslate" title="Zombie Shedletsky" class=" notranslate" href="/Zombie-Shedletsky-item?id=133560053" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t5.rbxcdn.com/0eece518d64762c7dd149b89e0bf26d7" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Zombie Shedletsky" class=" notranslate"/></a>
                                <div style="position:relative;left:-21px;top:-13px;"><img src="/web/20131030174347im_http://roblox.com/images/assetIcons/limited.png"/></div>
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl04_AssetNameHyperLink" class="noranslate" href="/Zombie-Shedletsky-item?id=133560053">Zombie Shedletsky</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl04_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                <div id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl04_Div1" class="AssetPrice">
                                    <span class="PriceInRobux notranslate">
                                        Was R$: 2,610</span></div>
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl05_AssetThumbnailHyperLink" class=" notranslate" title="Death's Grip Bowler" class=" notranslate" href="/Deaths-Grip-Bowler-item?id=133559483" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t0.rbxcdn.com/03d0ce8626b969908caa7428f5d28d4f" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Death's Grip Bowler" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl05_AssetNameHyperLink" class="noranslate" href="/Deaths-Grip-Bowler-item?id=133559483">Death&#39;s Grip Bowler</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl05_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                <div id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl05_Div1" class="AssetPrice">
                                    <span class="PriceInRobux notranslate">
                                        R$: 200</span></div>
                                
                                
                            </div>
                        </div>
                    </td>
		</tr><tr>
			<td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl06_AssetThumbnailHyperLink" class=" notranslate" title="Bat O' Lantern" class=" notranslate" href="/Bat-O-Lantern-item?id=133553667" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t7.rbxcdn.com/ee2872c4cbe14693c4fdd06bfd877be5" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Bat O' Lantern" class=" notranslate"/></a>
                                <div style="position:relative;left:-21px;top:-13px;"><img src="/web/20131030174347im_http://roblox.com/images/assetIcons/limited.png"/></div>
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl06_AssetNameHyperLink" class="noranslate" href="/Bat-O-Lantern-item?id=133553667">Bat O&#39; Lantern</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl06_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                <div id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl06_Div1" class="AssetPrice">
                                    <span class="PriceInRobux notranslate">
                                        Was R$: 250</span></div>
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl07_AssetThumbnailHyperLink" class=" notranslate" title="Walking Fred Head" class=" notranslate" href="/Walking-Fred-Head-item?id=133558583" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t5.rbxcdn.com/77045af37456ded3a4dab400d837305a" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Walking Fred Head" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl07_AssetNameHyperLink" class="noranslate" href="/Walking-Fred-Head-item?id=133558583">Walking Fred Head</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl07_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl08_AssetThumbnailHyperLink" class=" notranslate" title="BLOXikin #31 Headless Horseman" class=" notranslate" href="/BLOXikin-31-Headless-Horseman-item?id=133520071" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t1.rbxcdn.com/6731b5ea1fb5a7d2d16601e7709dfa14" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="BLOXikin #31 Headless Horseman" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl08_AssetNameHyperLink" class="noranslate" href="/BLOXikin-31-Headless-Horseman-item?id=133520071">BLOXikin #31 Headless Horseman</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl08_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl09_AssetThumbnailHyperLink" class=" notranslate" title="BLOXikin #29 Hallo-bot" class=" notranslate" href="/BLOXikin-29-Hallo-bot-item?id=133520348" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t4.rbxcdn.com/2d2f92715bdd687712d99b632a65643d" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="BLOXikin #29 Hallo-bot" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl09_AssetNameHyperLink" class="noranslate" href="/BLOXikin-29-Hallo-bot-item?id=133520348">BLOXikin #29 Hallo-bot</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl09_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl10_AssetThumbnailHyperLink" class=" notranslate" title="BLOXikin #25 Scarecrow" class=" notranslate" href="/BLOXikin-25-Scarecrow-item?id=133520230" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t2.rbxcdn.com/5600d7f0dd160567a41d0d952715fae3" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="BLOXikin #25 Scarecrow" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl10_AssetNameHyperLink" class="noranslate" href="/BLOXikin-25-Scarecrow-item?id=133520230">BLOXikin #25 Scarecrow</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl10_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl11_AssetThumbnailHyperLink" class=" notranslate" title="BLOXikin #24 Ooze Monster" class=" notranslate" href="/BLOXikin-24-Ooze-Monster-item?id=133520394" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t1.rbxcdn.com/532aba89c5bb167bb45716b132f91fe1" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="BLOXikin #24 Ooze Monster" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl11_AssetNameHyperLink" class="noranslate" href="/BLOXikin-24-Ooze-Monster-item?id=133520394">BLOXikin #24 Ooze Monster</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl11_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                
                                
                                
                            </div>
                        </div>
                    </td>
		</tr><tr>
			<td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl12_AssetThumbnailHyperLink" class=" notranslate" title="BLOXikin #28 Yodalien" class=" notranslate" href="/BLOXikin-28-Yodalien-item?id=133520293" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t2.rbxcdn.com/7535c994cb734621c94e7dbf12e28390" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="BLOXikin #28 Yodalien" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl12_AssetNameHyperLink" class="noranslate" href="/BLOXikin-28-Yodalien-item?id=133520293">BLOXikin #28 Yodalien</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl12_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl13_AssetThumbnailHyperLink" class=" notranslate" title="BLOXikin #27 Gargoyle" class=" notranslate" href="/BLOXikin-27-Gargoyle-item?id=133520439" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t5.rbxcdn.com/879ddf069cf6320c57d1c48ea316077d" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="BLOXikin #27 Gargoyle" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl13_AssetNameHyperLink" class="noranslate" href="/BLOXikin-27-Gargoyle-item?id=133520439">BLOXikin #27 Gargoyle</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl13_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl14_AssetThumbnailHyperLink" class=" notranslate" title="BLOXikin #26 Bride of Frankenstein" class=" notranslate" href="/BLOXikin-26-Bride-of-Frankenstein-item?id=133520174" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t1.rbxcdn.com/9b7b6a622aa03583ae8f0f08fddc51b3" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="BLOXikin #26 Bride of Frankenstein" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl14_AssetNameHyperLink" class="noranslate" href="/BLOXikin-26-Bride-of-Frankenstein-item?id=133520174">BLOXikin #26 Bride of Frankenstein</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl14_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl15_AssetThumbnailHyperLink" class=" notranslate" title="BLOXikin #17 Bat Girl ROBLOXian" class=" notranslate" href="/BLOXikin-17-Bat-Girl-ROBLOXian-item?id=133519820" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t5.rbxcdn.com/ba5dc35a62d717adc0ee8b08ea6fbdc0" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="BLOXikin #17 Bat Girl ROBLOXian" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl15_AssetNameHyperLink" class="noranslate" href="/BLOXikin-17-Bat-Girl-ROBLOXian-item?id=133519820">BLOXikin #17 Bat Girl ROBLOXian</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl15_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl16_AssetThumbnailHyperLink" class=" notranslate" title="Commander Crow's Wings" class=" notranslate" href="/Commander-Crows-Wings-item?id=133553855" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t2.rbxcdn.com/bc711e68755d568af0068882d4f73ed8" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Commander Crow's Wings" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl16_AssetNameHyperLink" class="noranslate" href="/Commander-Crows-Wings-item?id=133553855">Commander Crow&#39;s Wings</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl16_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                <div id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl16_Div1" class="AssetPrice">
                                    <span class="PriceInRobux notranslate">
                                        R$: 750</span></div>
                                
                                
                            </div>
                        </div>
                    </td><td class="Asset" valign="top">
                        <div style="padding: 5px">
                            <div class="AssetThumbnail">
                                <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl17_AssetThumbnailHyperLink" class=" notranslate" title="Evil Alien Genius" class=" notranslate" href="/Evil-Alien-Genius-item?id=96678470" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t0.rbxcdn.com/5b2aaf17cd41a0ab5c933514e7987670" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Evil Alien Genius" class=" notranslate"/></a>
                                
                            </div>
                            <div class="AssetDetails">
                                <div class="AssetName">
                                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl17_AssetNameHyperLink" class="noranslate" href="/Evil-Alien-Genius-item?id=96678470">Evil Alien Genius</a></div>
                                <div class="AssetCreator">
                                    <span class="Label">Creator: </span><span class="Detail notranslate">
                                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_UserAssetsDataList_ctl17_AssetCreatorHyperLink" href="User.aspx?ID=1">ROBLOX</a></span></div>
                                
                                
                                
                            </div>
                        </div>
                    </td>
		</tr>
	</table>
                <div id="ctl00_cphRoblox_rbxUserAssetsPane_FooterPagerPanel" class="FooterPager" style="width: 780px">
                    <span class="pager previous disabled"></span>
                    
                    <span id="ctl00_cphRoblox_rbxUserAssetsPane_FooterPagerLabel" style="vertical-align: top; display: inline-block; padding: 5px; padding-top: 6px">Page 1 of 237</span>
                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_FooterPageSelector_Next" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$cphRoblox$rbxUserAssetsPane$FooterPageSelector_Next&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))"><span class="pager next"></span></a>
                    
                </div>
                <div style="width:784px;">
                    
    <h3 class="RecommendationHeader2">
        Recommended Hats
        <a href="/Catalog/">See All <span>&#187;</span></a>
    </h3>


    <div class="AssetRecommenderContainer">
    <table id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets" cellspacing="0" align="Center" border="0" style="height:175px;width:784px;border-collapse:collapse;">
		<tr>
			<td>
            <div class="PortraitDiv" style="width: 140px;overflow: hidden;margin:auto;" visible="True" data-se="recommended-items-0">
                <div class="AssetThumbnail">
                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl00_AssetThumbnailHyperLink" class=" notranslate" title="Red Roblox Cap" class=" notranslate" href="/Red-Roblox-Cap-item?id=48474313" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t0.rbxcdn.com/e85edf6c9f814e3e9f7fb8f5df1ef22c" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Red Roblox Cap" class=" notranslate"/></a>
                </div>
                <div class="AssetDetails">
                    <div class="AssetName noTranslate">
                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl00_AssetNameHyperLinkPortrait" href="/Red-Roblox-Cap-item?id=48474313">Red Roblox Cap</a>
                    </div>
                    <div class="AssetCreator">
                        <span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl00_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=1">ROBLOX</a></span>
                    </div>
                </div>
            </div>
        </td><td>
            <div class="PortraitDiv" style="width: 140px;overflow: hidden;margin:auto;" visible="True" data-se="recommended-items-1">
                <div class="AssetThumbnail">
                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl01_AssetThumbnailHyperLink" class=" notranslate" title="Shaggy" class=" notranslate" href="/Shaggy-item?id=20573078" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t1.rbxcdn.com/d8f7da8003e32aad8a06a8474f66fdff" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Shaggy" class=" notranslate"/></a>
                </div>
                <div class="AssetDetails">
                    <div class="AssetName noTranslate">
                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl01_AssetNameHyperLinkPortrait" href="/Shaggy-item?id=20573078">Shaggy</a>
                    </div>
                    <div class="AssetCreator">
                        <span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl01_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=1">ROBLOX</a></span>
                    </div>
                </div>
            </div>
        </td><td>
            <div class="PortraitDiv" style="width: 140px;overflow: hidden;margin:auto;" visible="True" data-se="recommended-items-2">
                <div class="AssetThumbnail">
                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl02_AssetThumbnailHyperLink" class=" notranslate" title="Cake Hat" class=" notranslate" href="/Cake-Hat-item?id=1376467" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t5.rbxcdn.com/ccd3889115ac615766eef84de107dd74" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Cake Hat" class=" notranslate"/></a>
                </div>
                <div class="AssetDetails">
                    <div class="AssetName noTranslate">
                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl02_AssetNameHyperLinkPortrait" href="/Cake-Hat-item?id=1376467">Cake Hat</a>
                    </div>
                    <div class="AssetCreator">
                        <span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl02_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=1">ROBLOX</a></span>
                    </div>
                </div>
            </div>
        </td><td>
            <div class="PortraitDiv" style="width: 140px;overflow: hidden;margin:auto;" visible="True" data-se="recommended-items-3">
                <div class="AssetThumbnail">
                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl03_AssetThumbnailHyperLink" class=" notranslate" title="LEGO Hero Factory: Evil Brain" class=" notranslate" href="/LEGO-Hero-Factory-Evil-Brain-item?id=105177917" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t2.rbxcdn.com/caf97e486a2e969a0bdd6b22f5e29ae6" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="LEGO Hero Factory: Evil Brain" class=" notranslate"/></a>
                </div>
                <div class="AssetDetails">
                    <div class="AssetName noTranslate">
                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl03_AssetNameHyperLinkPortrait" href="/LEGO-Hero-Factory-Evil-Brain-item?id=105177917">LEGO Hero Factory: Evil Brain</a>
                    </div>
                    <div class="AssetCreator">
                        <span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl03_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=1">ROBLOX</a></span>
                    </div>
                </div>
            </div>
        </td><td>
            <div class="PortraitDiv" style="width: 140px;overflow: hidden;margin:auto;" visible="True" data-se="recommended-items-4">
                <div class="AssetThumbnail">
                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl04_AssetThumbnailHyperLink" class=" notranslate" title="Roblox Classic" class=" notranslate" href="/Roblox-Classic-item?id=46839304" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t6.rbxcdn.com/9aee721f9d32327368a7f81ef3be2fbd" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Roblox Classic" class=" notranslate"/></a>
                </div>
                <div class="AssetDetails">
                    <div class="AssetName noTranslate">
                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl04_AssetNameHyperLinkPortrait" href="/Roblox-Classic-item?id=46839304">Roblox Classic</a>
                    </div>
                    <div class="AssetCreator">
                        <span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl04_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=1">ROBLOX</a></span>
                    </div>
                </div>
            </div>
        </td>
		</tr><tr>
			<td>
            <div class="PortraitDiv" style="width: 140px;overflow: hidden;margin:auto;" visible="True" data-se="recommended-items-5">
                <div class="AssetThumbnail">
                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl05_AssetThumbnailHyperLink" class=" notranslate" title="Percy Jackson: Sea of Monsters Cap" class=" notranslate" href="/Percy-Jackson-Sea-of-Monsters-Cap-item?id=123041905" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t6.rbxcdn.com/9432e703167b24f32c4a7e652b863836" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Percy Jackson: Sea of Monsters Cap" class=" notranslate"/></a>
                </div>
                <div class="AssetDetails">
                    <div class="AssetName noTranslate">
                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl05_AssetNameHyperLinkPortrait" href="/Percy-Jackson-Sea-of-Monsters-Cap-item?id=123041905">Percy Jackson: Sea of Monsters Cap</a>
                    </div>
                    <div class="AssetCreator">
                        <span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl05_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=1">ROBLOX</a></span>
                    </div>
                </div>
            </div>
        </td><td>
            <div class="PortraitDiv" style="width: 140px;overflow: hidden;margin:auto;" visible="True" data-se="recommended-items-6">
                <div class="AssetThumbnail">
                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl06_AssetThumbnailHyperLink" class=" notranslate" title="Backwards 'R' Cap" class=" notranslate" href="/Backwards-R-Cap-item?id=17903982" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t2.rbxcdn.com/c69e14cc9c627268e063e1f4ba513ee6" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Backwards 'R' Cap" class=" notranslate"/></a>
                </div>
                <div class="AssetDetails">
                    <div class="AssetName noTranslate">
                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl06_AssetNameHyperLinkPortrait" href="/Backwards-R-Cap-item?id=17903982">Backwards &#39;R&#39; Cap</a>
                    </div>
                    <div class="AssetCreator">
                        <span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl06_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=1">ROBLOX</a></span>
                    </div>
                </div>
            </div>
        </td><td>
            <div class="PortraitDiv" style="width: 140px;overflow: hidden;margin:auto;" visible="True" data-se="recommended-items-7">
                <div class="AssetThumbnail">
                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl07_AssetThumbnailHyperLink" class=" notranslate" title="Summertime R&amp;R&amp;R 2010" class=" notranslate" href="/Summertime-R-R-R-2010-item?id=29294506" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t4.rbxcdn.com/23121e289500dd2131896abdb42e7051" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Summertime R&amp;R&amp;R 2010" class=" notranslate"/></a>
                </div>
                <div class="AssetDetails">
                    <div class="AssetName noTranslate">
                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl07_AssetNameHyperLinkPortrait" href="/Summertime-R-R-R-2010-item?id=29294506">Summertime R&amp;R&amp;R 2010</a>
                    </div>
                    <div class="AssetCreator">
                        <span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl07_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=1">ROBLOX</a></span>
                    </div>
                </div>
            </div>
        </td><td>
            <div class="PortraitDiv" style="width: 140px;overflow: hidden;margin:auto;" visible="True" data-se="recommended-items-8">
                <div class="AssetThumbnail">
                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl08_AssetThumbnailHyperLink" class=" notranslate" title="Sk8r Boi" class=" notranslate" href="/Sk8r-Boi-item?id=16101707" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t4.rbxcdn.com/8e899de05f8ff3bf311dd4771df4e2ea" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Sk8r Boi" class=" notranslate"/></a>
                </div>
                <div class="AssetDetails">
                    <div class="AssetName noTranslate">
                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl08_AssetNameHyperLinkPortrait" href="/Sk8r-Boi-item?id=16101707">Sk8r Boi</a>
                    </div>
                    <div class="AssetCreator">
                        <span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl08_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=1">ROBLOX</a></span>
                    </div>
                </div>
            </div>
        </td><td>
            <div class="PortraitDiv" style="width: 140px;overflow: hidden;margin:auto;" visible="True" data-se="recommended-items-9">
                <div class="AssetThumbnail">
                    <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl09_AssetThumbnailHyperLink" class=" notranslate" title="Radical Orange Helmet" class=" notranslate" href="/Radical-Orange-Helmet-item?id=23155410" style="display:inline-block;height:110px;width:110px;cursor:pointer;"><img src="http://t4.rbxcdn.com/63c68694112683c5f6226b6d280ed1fc" height="110" width="110" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="Radical Orange Helmet" class=" notranslate"/></a>
                </div>
                <div class="AssetDetails">
                    <div class="AssetName noTranslate">
                        <a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl09_AssetNameHyperLinkPortrait" href="/Radical-Orange-Helmet-item?id=23155410">Radical Orange Helmet</a>
                    </div>
                    <div class="AssetCreator">
                        <span class="stat-label">Creator:</span> <span class="Detail stat"><a id="ctl00_cphRoblox_rbxUserAssetsPane_AssetRec_dlAssets_ctl09_CreatorHyperLinkPortrait" class="notranslate" href="User.aspx?ID=1">ROBLOX</a></span>
                    </div>
                </div>
            </div>
        </td>
		</tr>
	</table>
    
</div>

<script type="text/javascript">
    $(function () {
        var itemNames = $('.PortraitDiv .AssetDetails .AssetName a');
        $.each(itemNames, function (index) {
            var elem = $(itemNames[index]);
            elem.html(fitStringToWidthSafe(elem.html(), 200));
        });
        var userNames = $('.PortraitDiv .AssetDetails .AssetCreator .Detail a');
        $.each(userNames, function (index) {
            var elem = $(userNames[index]);
            elem.html(fitStringToWidthSafe(elem.html(), 70));
        });
    });
</script>

                </div>
            </div>
            <div style="clear: both;">
            </div>
        </div>
        <div id="ctl00_cphRoblox_rbxUserAssetsPane_CreateSetPanelDiv" class="createSetPanelPopup" style="width: 400px; height: 100%; padding: 0px; float: left; display: none">
		
            
        
	</div>

    
</div>
        </div>
    </div>
   -->


<div style="clear:both"></div>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Bottom.php";?>