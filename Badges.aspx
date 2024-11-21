<?php
session_start();
include_once $_SERVER["DOCUMENT_ROOT"] . '/global.php';
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<meta http-equiv="X-UA-Compatible" content="IE=edge,requiresActiveX=true"/><title>
	ROBLONIUM - Badges
</title>
<link rel="stylesheet" href="/roblonium.css"/>

<link rel="stylesheet" href="/roblonium1.css"/>
<link rel="icon" type="image/vnd.microsoft.icon" href="/favicon.ico"/><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="Content-Language" content="en-us"/><meta name="author" content="ROBLONIUM"/><meta id="ctl00_metadescription" name="description" content="User-generated MMO gaming site for kids, teens, and adults. Players architect their own worlds. Builders create free online games that simulate the real world. Create and play amazing 3D games. An online gaming cloud and distributed physics engine."/><meta id="ctl00_metakeywords" name="keywords" content="free games, online games, building games, virtual worlds, free mmo, gaming cloud, physics engine"/>

<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/ScriptGlobals.php";?>
</head>
<body roblox-js-usercheckcontrollerenabled="True">

    <script type="text/javascript">Roblox.XsrfToken.setToken('');</script>
 
    <script type="text/javascript">
        if (top.location != self.location) {
            top.location = self.location.href;
        }
    </script>
  
<style type="text/css">
    
</style>
<form name="aspnetForm" method="post" action="/Badges.aspx" id="aspnetForm">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTQ2MjgzMTMxOQ9kFgJmD2QWAgIBEBYCHgZhY3Rpb24FDS9CYWRnZXMuYXNweD9kFggCAw8PFgIeB1Zpc2libGVoZBYCZg9kFggCAQ8QZGQWAGQCAg8QZGQWAWZkAgMPEGRkFgFmZAIEDxBkZBYBZmQCBA8PFgIfAWhkZAILDw8WAh8BaGRkAhEPDxYCHwFoZGQYBAUjY3RsMDAkTGVmdEd1dHRlckFkJEFzeW5jQWRNdWx0aVZpZXcPD2QCA2QFI2N0bDAwJHJieEdvb2dsZUFuYWx5dGljcyRNdWx0aVZpZXcxDw9kZmQFL2N0bDAwJGNwaEJhbm5lckFkJEl0ZW1CYW5uZXJBZCRBc3luY0FkTXVsdGlWaWV3Dw9kAgNkBSRjdGwwMCRSaWdodEd1dHRlckFkJEFzeW5jQWRNdWx0aVZpZXcPD2QCA2Rttl0oq3V+aoIjYnD43dvCNCmdKg=="/>
</div>


<script src="/ScriptResource.axd?d=hUbyVCWDcRmikM3tO-QWgiU9QRmST8S7BPxWou7Mzt-pNBVT-Is2KGk96aGOUdQpifQfj65G7McMxgPfN2eNQOTL9O3A1FKcYCCwrovdjHLwBKJijrZ8s6_Ew6ErJ72aIove8-TcrvdTzRuYfbbjB3J4lvtOApd9TFYhK0QLEbCxrFIhaA6pgaHtT_wAICinzZ_4D8U78h9Sox-26lxICd6XSpdJEv4js9MMndbPyznIxvI3OC7FcxPbCMdXZ_YmDnrKIv9d50mFceZ78kiH4MDIYed4juvSQoDN8A-_Mw5pyT8FzuUYxr3x7TccRLAU5Ma55ma_sbG6p5qJBXWEqjhBzmOSNgOPG-JvMRDoB836CDvQ1nVdrskvy-bYvZyR9vTIGZ2zPNrKXpWb2fmxEAln-op-yxqSYaoW5qSUFKoqFXXAMhXEickCS3m5SXDze-IQcg2" type="text/javascript"></script>
    <div id="fb-root">
    </div>
    
    
         
    

    
    <div id="MasterContainer">
                   


<script type="text/javascript">

        

        
        <div id="Container">
            
                   

<style type="text/css">
    div.mySubmenuFixed {
        top: 36px;
        background-color: #191919;
        height: 25px;
        *top: 0px;
    }
</style> 

   

<?php include $_SERVER["DOCUMENT_ROOT"] . '/Banner' ;?>
</div>
<script type="text/javascript">
    $(function () {
        $('.moreLink').bind('showDropDown', function (e) {
            var maxWidth = $('#NavRedesign .dropdownnavcontainer').width();
            $('a.dropdownoption span').each(function (index, elem) {
                elem = $(elem);
                if (elem.outerWidth() > maxWidth) {
                    maxWidth = elem.outerWidth();
                }
            });
            maxWidth = maxWidth + 5;
            $('#NavRedesign .dropdownoption').each(function (index, elem) {
                elem = $(elem);
                if (elem.width() < maxWidth) {
                    elem.width(maxWidth);
                }
            });

        });
    });
</script>  


                
        </div>

        
            



        <noscript><div class="SystemAlert"><div class="SystemAlertText">Please enable Javascript to use all the features on this site.</div></div></noscript>  <?php include $_SERVER["DOCUMENT_ROOT"] . "/Announcement" ;?><div id="BodyWrapper">
            <div id="RepositionBody"><div id="Body" style="">
                
    
<div id="NewBadgesContainer" class="text">
    <h1>Badges</h1>
        <div class="BadgeCategory">
            <h2>Community Badges</h2>
            <ul>
                    <li id="Badge1" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/dce5126c1c5f9f56109df14f6f1e62d1.png" alt="Administrator" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Administrator Badge</h3>
                                <p class="notranslate">This badge identifies an account as belonging to a Roblox administrator. Only official Roblox administrators will possess this badge. If someone claims to be an admin, but does not have this badge, they are potentially trying to mislead you. If this happens, please report abuse and we will delete the imposter&#39;s account.</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
                    <li id="Badge12" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/088451f70609387491bbf8e85f285065.png" alt="Veteran" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Veteran Badge</h3>
                                <p class="notranslate">This decoration is awarded to all citizens who have played ROBLOX for at least a year. It recognizes stalwart community members who have stuck with us over countless releases and have helped shape ROBLOX into the game that it is today. These medalists are the true steel, the core of the Robloxian history ... and its future.</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
                    <li id="Badge9" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/df659818025cdf3422da7e04475656ac.png" alt="Forum Moderator" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Forum Moderator Badge</h3>
                                <p class="notranslate">Users with this badge are forum moderators. They have special powers on the ROBLOX forum and are able to delete threads that violate the Community Guidelines. Users who are exemplary citizens on ROBLOX over a long period of time may be invited to be moderators. This badge is granted by invitation only.</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
                    <li id="Badge10" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/ca460efad9ffdbce1f982672d0bf5e2a.png" alt="Image Moderator" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Image Moderator Badge</h3>
                                <p class="notranslate">Users with this badge are image moderators. Image moderators have special powers on ROBLOX that allow them to approve or disapprove images that other users upload. Rejected images are immediately banished from the site. Users who are exemplary citizens on ROBLOX over a long period of time may be invited to be moderators. This badge is granted by invitation only.</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
            </ul>
        </div>
        <div class="BadgeCategory">
            <h2>Builders Club Badges</h2>
            <ul>
                    <li id="Badge11" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/049d72ade1586da1cfe2e48618cc3959.png" alt="Builders Club" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Builders Club Badge</h3>
                                <p class="notranslate">Members of the illustrious Builders Club display this badge proudly. The Builders Club is a paid premium service. Members receive several benefits: they get ten places on their account instead of one, they earn a daily income of 15 ROBUX, they can sell their creations to others in the ROBLOX Catalog, they get the ability to browse the web site without external ads, and they receive the exclusive Builders Club construction hat.</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
                    <li id="Badge15" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/709c584f36286157c955ffcbb8dbfe36.png" alt="Turbo Builders Club" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Turbo Builders Club Badge</h3>
                                <p class="notranslate">Members of the exclusive Turbo Builders Club are some of the most dedicated ROBLOXians. The Turbo Builders Club is a paid premium service. Members receive many of the benefits received in the regular Builders Club, in addition to a few more exclusive upgrades: they get twenty-five places on their account instead of ten from regular Builders Club, they earn a daily income of 35 ROBUX, they can sell their creations to others in the ROBLOX Catalog, they get the ability to browse the web site without external ads, they receive the exclusive Turbo Builders Club red site managers hat, and they receive an exclusive gear item.</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
                    <li id="Badge16" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/50e4f48e4007754b55c82fc3d50c9c12.png" alt="Outrageous Builders Club" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Outrageous Builders Club Badge</h3>
                                <p class="notranslate">Members of Outrageous Builders Club are VIP ROBLOXians. They are the cream of the crop. The Outrageous Builders Club is a paid premium service. Members receive 100 places, 100 groups, 60 ROBUX per day, unlock the Outrageous website theme, get access to the CEO and devs of ROBLOX through Outrageous-cast, and many other benefits.</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
            </ul>
        </div>
        <div class="BadgeCategory">
            <h2>Builder Badges</h2>
            <ul>
                    <li id="Badge6" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/26bdc9274d6c2520b3d72ebaa71e50f7.png" alt="Homestead" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Homestead Badge</h3>
                                <p class="notranslate">The homestead badge is earned by having your personal place visited 100 times. Players who achieve this have demonstrated their ability to build cool things that other Robloxians were interested enough in to check out. Get a jump-start on earning this reward by inviting people to come visit your place.</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
                    <li id="Badge7" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/4e483c695695b47c92591825929d1059.png" alt="Bricksmith" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Bricksmith Badge</h3>
                                <p class="notranslate">The Bricksmith badge is earned by having a popular personal place. Once your place has been visited 1000 times, you will receive this award. Robloxians with Bricksmith badges are accomplished builders who were able to create a place that people wanted to explore a thousand times. They no doubt know a thing or two about putting bricks together.</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
            </ul>
        </div>
        <div class="BadgeCategory">
            <h2>Friendship Badges</h2>
            <ul>
                    <li id="Badge2" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/46c15f2030a8c68ab1ff4329765e515a.png" alt="Friendship" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Friendship Badge</h3>
                                <p class="notranslate">This badge is given to players who have embraced the Roblox community and have made at least 20 friends. People who have this badge are good people to know and can probably help you out if you are having trouble.</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
                    <li id="Badge8" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/156b077267b7848d38df4471e2a2c540.png" alt="Inviter" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Inviter Badge</h3>
                                <p class="notranslate">Robloxia is a vast uncharted realm, as large as the imagination. Individuals who invite others to join in the effort of mapping this mysterious region are honored in Robloxian society. Citizens who successfully recruit three or more fellow explorers via the Share Roblox with a Friend mechanism are awarded with this badge.</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
            </ul>
        </div>
        <div class="BadgeCategory">
            <h2>Combat Badges</h2>
            <ul>
                    <li id="Badge3" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/d111059fca163b9824716cff2fe4aec5.png" alt="Combat Initiation" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Combat Initiation Badge</h3>
                                <p class="notranslate">This badge is given to any player who has proven his or her combat abilities by accumulating 10 victories in battle. Players who have this badge are not complete newbies and probably know how to handle their weapons.</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
                    <li id="Badge4" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/14652f1598ba5520515965b4038214c0.png" alt="Warrior" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Warrior Badge</h3>
                                <p class="notranslate">This badge is given to the warriors of Robloxia, who have time and time again overwhelmed their foes in battle. To earn this badge, you must rack up 100 knockouts. Anyone with this badge knows what to do in a fight!</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
                    <li id="Badge5" class="divider-bottom">
                        <div class="BadgePadding">&nbsp;</div>
                        <div class="BadgeContent">
                            <div class="BadgeImage">
                                <img src="http://imagesak.roblox.com/4cb4d69560f1f3478c314b24a52d2644.png" alt="Bloxxer" width="75" height="75"/>
                            </div>
                            <div class="BadgeDescription">
                                <h3>Bloxxer Badge</h3>
                                <p class="notranslate">Anyone who has earned this badge is a very dangerous player indeed. Those Robloxians who excel at combat can one day hope to achieve this honor, the Bloxxer Badge. It is given to the warrior who has bloxxed at least 250 enemies and who has tasted victory more times than he or she has suffered defeat. Salute!</p>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </li>
            </ul>
        </div>
</div>

<script type="text/javascript">
    $(function () {
        // Has a hash, highlight that element
        if (window.location.hash.length != 0) {
            var highlight = $(window.location.hash + ' .BadgeContent');
            highlight.css('background-color', '#71a5ec').animate({
                backgroundColor: '#e9f1fc'
            }, 1500, 'easeInCubic');
        }
    });
</script>

                <div style="clear:both"></div>
            </div>
        </div></div> 
        </div>
        
            
<?php include $_SERVER["DOCUMENT_ROOT"] . "/Footer";?>
	</div>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Post-Footer.php";?>
</body>                
</html>