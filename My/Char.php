<?php
if (!isset($characterAppearance)) {
	die(":3");
}
$user = getUserInfoFromUid(SESSION["userid"]);
$page_config["Title"] = "Avatar - ROBLONIUM";
include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Top.php";
?>
    <script type="text/javascript">
        Roblox.Thumbs.Image.prototype._doShowSpinner = Roblox.Thumbs.Image.prototype._showSpinner;
        Roblox.Thumbs.Image.prototype._showSpinner = function () {
            if (typeof (this._userID) !== "undefined") {
                this._spinnerUrl = "/images/Spinners/ajax_loader_blue_300.gif";
            }

            this._doShowSpinner();

            if (typeof (this._userID) !== "undefined") {
                this._spinner.style.height = "300px";
                this._spinner.style.width = "300px";
                this._spinner.style.padding = "26px";
                this._spinner.style.backgroundColor = "#fff";
            }
        };
        function changedAvatarType() {
            $(".playerAvatarType").removeClass("selected");
            $(".playerAvatarType input:checked").parent().addClass('selected');
        }
        $(document).on('click', '.playerAvatarType', changedAvatarType);
    </script>
    <script type="text/javascript">
        
        function pageLoad() {
            $(".tooltip-right").tipsy({ 'gravity': 'w' });
        }
    </script>
    <div class="MyRobloxContainer">
        

    <div class="pagification divider-top  divider-bottom">
        <div class="pagification-icon">
            <span class="icon-logo-r"></span>
        </div>
        <div class="pagification-body text collapsed">
            <h4>Hello gamer</h4>
            <div class="pagification-message">This page is still in its experimental phase. Please tell me if you encounter any bugs.</div>
        </div>
    </div>

        <h1>Character Customizer</h1>
        <div class="Column1f left-nav-menu">
            <div style="/*margin-top: 25px;*/">
				<h2 style="font-weight: normal;">Avatar</h2>
				<div>
					<div id="UserAvatar" class="thumbnail-holder" data-reset-enabled-every-page="" data-3d-thumbs-enabled="" data-url="/thumbs/useravatar.ashx?userId=<?=$user->Id?>" style="width:352px; height:352px;">
						<span class="roblox-avatar-image image-medium thumbnail-span" data-no-overlays="true" data-retry-url="/thumbs/jsonavatar.ashx?userId=<?=$user->Id?>" data-user-id="<?=$user->Id?>" data-image-size="custom" data-image-size-x="352" data-image-size-y="352" data-no-click="true" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="<?=$user->Name?>"></span>
					</div>


                </div>
				<div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_CustomizeCharacterUpdatePanelAvatar">
                        <div class="ReDrawAvatar">
                            <span id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_lblInvalidateThumbnails">Something wrong with your avatar?</span><br />
                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_cmdInvalidateThumbnails" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$cmdInvalidateThumbnails&#39;,&#39;&#39;)">Click here to re-draw it!</a>
                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_cmdRefreshAllUpdatePanels2" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$cmdRefreshAllUpdatePanels2&#39;,&#39;&#39;)"></a>
                            <script type="text/javascript">
                                var refreshAllUpdatePanels = function () {
                                    __doPostBack("ctl00$ctl00$cphRoblox$cphMyRobloxContent$cmdRefreshAllUpdatePanels2", "");
                                }
                            </script>
                            
                            <?php
							if ($user->MembershipLevel >= 3)
							{
								echo('
							<input type="hidden" name="ctl00$ctl00$cphRoblox$cphMyRobloxContent$AvatarScaleHeightInput" id="AvatarScaleHeightInput" />
                            <input type="hidden" name="ctl00$ctl00$cphRoblox$cphMyRobloxContent$AvatarScaleWidthInput" id="AvatarScaleWidthInput" />
                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_cmdSetScale" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$cmdSetScale&#39;,&#39;&#39;)"></a>
                            <script type="text/javascript">
                                var setScale = function (height, width) {
                                    $("#AvatarScaleHeightInput").val(height);
                                    $("#AvatarScaleWidthInput").val(width);
                                    __doPostBack("ctl00$ctl00$cphRoblox$cphMyRobloxContent$cmdSetScale", "");
                                }
                            </script>
							');
							}
							?>
                        </div>
					</div>
                    
                
            </div>
			<h2 style="font-weight: normal;">Colors</h2>
            <div>
                <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooser" class="Mannequin">
                    <p>
                        Click a body part to change its color:
                    </p>
                    <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_UpdatePanelBodyColors">
	
<div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserFrame" class="ColorChooserFrame" style="height:240px;width:194px;text-align:center;">
		
                                <div style="position: relative; margin: 11px 4px; height: 1%;">
                                    <div style="position: absolute; left: 72px; top: 0px; cursor: pointer" onclick="HeadOpen()">
                                        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_HeadSelector" class="ColorChooserRegion" style="background-color:<?=brickColorToHex('Head')?>;height:44px;width:44px;">
			
                                        
		</div>
                                    </div>
                                    <div style="position: absolute; left: 0px; top: 52px; cursor: pointer" onclick="RightArmOpen()">
                                        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_RightArmSelector" class="ColorChooserRegion" style="background-color:<?=brickColorToHex('RightArm')?>;height:88px;width:40px;">
			
                                        
		</div>
                                    </div>
                                    <div style="position: absolute; left: 48px; top: 52px; cursor: pointer" onclick="TorsoOpen()">
                                        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_TorsoSelector" class="ColorChooserRegion" style="background-color:<?=brickColorToHex('Torso')?>;height:88px;width:88px;">
			
                                        
		</div>
                                    </div>
                                    <div style="position: absolute; left: 144px; top: 52px; cursor: pointer" onclick="LeftArmOpen()">
                                        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_LeftArmSelector" class="ColorChooserRegion" style="background-color:<?=brickColorToHex('LeftArm')?>;height:88px;width:40px;">
			
                                        
		</div>
                                    </div>
                                    <div style="position: absolute; left: 48px; top: 146px; cursor: pointer" onclick="RightLegOpen()">
                                        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_RightLegSelector" class="ColorChooserRegion" style="background-color:<?=brickColorToHex('RightLeg')?>;height:88px;width:40px;">
			
                                        
		</div>
                                    </div>
                                    <div style="position: absolute; left: 96px; top: 146px; cursor: pointer" onclick="LeftLegOpen()">
                                        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_LeftLegSelector" class="ColorChooserRegion" style="background-color:<?=brickColorToHex('LeftLeg')?>;height:88px;width:40px;">
			
                                        
		</div>
                                    </div>
                                </div>
                            
	</div>

                            <div id="PopupRightLeg" class="modalPopup unifiedModal ColorPickerModal simplemodal-data">
                                <div style="height: 38px; padding-top: 2px;">Choose a Right Leg Color</div>
                                <div class="simplemodal-close"><a class="ImageButton closeBtnCircle_20h" style="left: -36px;"></a></div>
                                <div class="unifiedModalContent ColorPickerContainer">
                                    <table id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors" cellspacing="0" border="0" style="border-width:0px;border-collapse:collapse;">
		<tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl00_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl00$LinkButton1&#39;,&#39;45&#39;)" style="display:inline-block;background-color:#B4D2E4;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl01_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl01$LinkButton1&#39;,&#39;1024&#39;)" style="display:inline-block;background-color:#AFDDFF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl02_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl02$LinkButton1&#39;,&#39;11&#39;)" style="display:inline-block;background-color:#80BBDC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl03_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl03$LinkButton1&#39;,&#39;102&#39;)" style="display:inline-block;background-color:#6E99CA;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl04_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl04$LinkButton1&#39;,&#39;23&#39;)" style="display:inline-block;background-color:#0D69AC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl05_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl05$LinkButton1&#39;,&#39;1010&#39;)" style="display:inline-block;background-color:#0000FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl06_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl06$LinkButton1&#39;,&#39;1012&#39;)" style="display:inline-block;background-color:#2154B9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl07_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl07$LinkButton1&#39;,&#39;1011&#39;)" style="display:inline-block;background-color:#002060;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl08_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl08$LinkButton1&#39;,&#39;1027&#39;)" style="display:inline-block;background-color:#9FF3E9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl09_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl09$LinkButton1&#39;,&#39;1018&#39;)" style="display:inline-block;background-color:#12EED4;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl10_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl10$LinkButton1&#39;,&#39;151&#39;)" style="display:inline-block;background-color:#789082;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl11_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl11$LinkButton1&#39;,&#39;1022&#39;)" style="display:inline-block;background-color:#7F8E64;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl12_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl12$LinkButton1&#39;,&#39;135&#39;)" style="display:inline-block;background-color:#74869D;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl13_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl13$LinkButton1&#39;,&#39;1019&#39;)" style="display:inline-block;background-color:#00FFFF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl14_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl14$LinkButton1&#39;,&#39;1013&#39;)" style="display:inline-block;background-color:#04AFEC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl15_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl15$LinkButton1&#39;,&#39;107&#39;)" style="display:inline-block;background-color:#008F9C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl16_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl16$LinkButton1&#39;,&#39;1028&#39;)" style="display:inline-block;background-color:#CCFFCC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl17_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl17$LinkButton1&#39;,&#39;29&#39;)" style="display:inline-block;background-color:#A1C48C;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl18_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl18$LinkButton1&#39;,&#39;119&#39;)" style="display:inline-block;background-color:#A4BD47;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl19_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl19$LinkButton1&#39;,&#39;37&#39;)" style="display:inline-block;background-color:#4B974B;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl20_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl20$LinkButton1&#39;,&#39;1021&#39;)" style="display:inline-block;background-color:#3A7D15;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl21_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl21$LinkButton1&#39;,&#39;1020&#39;)" style="display:inline-block;background-color:#00FF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl22_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl22$LinkButton1&#39;,&#39;28&#39;)" style="display:inline-block;background-color:#287F47;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl23_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl23$LinkButton1&#39;,&#39;141&#39;)" style="display:inline-block;background-color:#27462D;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl24_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl24$LinkButton1&#39;,&#39;1029&#39;)" style="display:inline-block;background-color:#FFFFCC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl25_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl25$LinkButton1&#39;,&#39;226&#39;)" style="display:inline-block;background-color:#FDEA8D;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl26_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl26$LinkButton1&#39;,&#39;1008&#39;)" style="display:inline-block;background-color:#C1BE42;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl27_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl27$LinkButton1&#39;,&#39;24&#39;)" style="display:inline-block;background-color:#F5CD30;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl28_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl28$LinkButton1&#39;,&#39;1017&#39;)" style="display:inline-block;background-color:#FFAF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl29_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl29$LinkButton1&#39;,&#39;1009&#39;)" style="display:inline-block;background-color:#FFFF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl30_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl30$LinkButton1&#39;,&#39;1005&#39;)" style="display:inline-block;background-color:#FFAF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl31_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl31$LinkButton1&#39;,&#39;105&#39;)" style="display:inline-block;background-color:#E29B40;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl32_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl32$LinkButton1&#39;,&#39;1025&#39;)" style="display:inline-block;background-color:#FFC9C9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl33_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl33$LinkButton1&#39;,&#39;125&#39;)" style="display:inline-block;background-color:#EAB892;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl34_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl34$LinkButton1&#39;,&#39;101&#39;)" style="display:inline-block;background-color:#DA867A;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl35_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl35$LinkButton1&#39;,&#39;1007&#39;)" style="display:inline-block;background-color:#A34B4B;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl36_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl36$LinkButton1&#39;,&#39;1016&#39;)" style="display:inline-block;background-color:#FF66CC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl37_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl37$LinkButton1&#39;,&#39;1032&#39;)" style="display:inline-block;background-color:#FF00BF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl38_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl38$LinkButton1&#39;,&#39;1004&#39;)" style="display:inline-block;background-color:#FF0000;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl39_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl39$LinkButton1&#39;,&#39;21&#39;)" style="display:inline-block;background-color:#C4281C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl40_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl40$LinkButton1&#39;,&#39;9&#39;)" style="display:inline-block;background-color:#E8BAC8;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl41_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl41$LinkButton1&#39;,&#39;1026&#39;)" style="display:inline-block;background-color:#B1A7FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl42_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl42$LinkButton1&#39;,&#39;1006&#39;)" style="display:inline-block;background-color:#B480FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl43_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl43$LinkButton1&#39;,&#39;153&#39;)" style="display:inline-block;background-color:#957977;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl44_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl44$LinkButton1&#39;,&#39;1023&#39;)" style="display:inline-block;background-color:#8C5B9F;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl45_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl45$LinkButton1&#39;,&#39;1015&#39;)" style="display:inline-block;background-color:#AA00AA;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl46_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl46$LinkButton1&#39;,&#39;1031&#39;)" style="display:inline-block;background-color:#6225D1;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl47_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl47$LinkButton1&#39;,&#39;104&#39;)" style="display:inline-block;background-color:#6B327C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl48_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl48$LinkButton1&#39;,&#39;5&#39;)" style="display:inline-block;background-color:#D7C59A;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl49_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl49$LinkButton1&#39;,&#39;1030&#39;)" style="display:inline-block;background-color:#FFCC99;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl50_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl50$LinkButton1&#39;,&#39;18&#39;)" style="display:inline-block;background-color:#CC8E69;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl51_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl51$LinkButton1&#39;,&#39;106&#39;)" style="display:inline-block;background-color:#DA8541;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl52_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl52$LinkButton1&#39;,&#39;38&#39;)" style="display:inline-block;background-color:#A05F35;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl53_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl53$LinkButton1&#39;,&#39;1014&#39;)" style="display:inline-block;background-color:#AA5500;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl54_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl54$LinkButton1&#39;,&#39;217&#39;)" style="display:inline-block;background-color:#7C5C46;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl55_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl55$LinkButton1&#39;,&#39;192&#39;)" style="display:inline-block;background-color:#694028;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl56_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl56$LinkButton1&#39;,&#39;1001&#39;)" style="display:inline-block;background-color:#F8F8F8;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl57_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl57$LinkButton1&#39;,&#39;1&#39;)" style="display:inline-block;background-color:#F2F3F3;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl58_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl58$LinkButton1&#39;,&#39;208&#39;)" style="display:inline-block;background-color:#E5E4DF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl59_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl59$LinkButton1&#39;,&#39;1002&#39;)" style="display:inline-block;background-color:#CDCDCD;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl60_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl60$LinkButton1&#39;,&#39;194&#39;)" style="display:inline-block;background-color:#A3A2A5;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl61_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl61$LinkButton1&#39;,&#39;199&#39;)" style="display:inline-block;background-color:#635F62;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl62_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl62$LinkButton1&#39;,&#39;26&#39;)" style="display:inline-block;background-color:#1B2A35;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightLeg_DataListColors_ctl63_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightLeg$DataListColors$ctl63$LinkButton1&#39;,&#39;1003&#39;)" style="display:inline-block;background-color:#111111;height:40px;width:40px;">

			</div>
    </td>
		</tr>
	</table>
                                </div>
                            </div>
                            <div id="PopupLeftLeg" class="modalPopup unifiedModal ColorPickerModal simplemodal-data">
                                <div style="height: 38px; padding-top: 2px;">Choose a Left Leg Color</div>
                                <div class="simplemodal-close"><a class="ImageButton closeBtnCircle_20h" style="left: -36px;"></a></div>
                                <div class="unifiedModalContent ColorPickerContainer">
                                    <table id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors" cellspacing="0" border="0" style="border-width:0px;border-collapse:collapse;">
		<tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl00_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl00$LinkButton1&#39;,&#39;45&#39;)" style="display:inline-block;background-color:#B4D2E4;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl01_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl01$LinkButton1&#39;,&#39;1024&#39;)" style="display:inline-block;background-color:#AFDDFF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl02_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl02$LinkButton1&#39;,&#39;11&#39;)" style="display:inline-block;background-color:#80BBDC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl03_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl03$LinkButton1&#39;,&#39;102&#39;)" style="display:inline-block;background-color:#6E99CA;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl04_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl04$LinkButton1&#39;,&#39;23&#39;)" style="display:inline-block;background-color:#0D69AC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl05_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl05$LinkButton1&#39;,&#39;1010&#39;)" style="display:inline-block;background-color:#0000FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl06_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl06$LinkButton1&#39;,&#39;1012&#39;)" style="display:inline-block;background-color:#2154B9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl07_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl07$LinkButton1&#39;,&#39;1011&#39;)" style="display:inline-block;background-color:#002060;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl08_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl08$LinkButton1&#39;,&#39;1027&#39;)" style="display:inline-block;background-color:#9FF3E9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl09_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl09$LinkButton1&#39;,&#39;1018&#39;)" style="display:inline-block;background-color:#12EED4;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl10_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl10$LinkButton1&#39;,&#39;151&#39;)" style="display:inline-block;background-color:#789082;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl11_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl11$LinkButton1&#39;,&#39;1022&#39;)" style="display:inline-block;background-color:#7F8E64;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl12_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl12$LinkButton1&#39;,&#39;135&#39;)" style="display:inline-block;background-color:#74869D;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl13_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl13$LinkButton1&#39;,&#39;1019&#39;)" style="display:inline-block;background-color:#00FFFF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl14_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl14$LinkButton1&#39;,&#39;1013&#39;)" style="display:inline-block;background-color:#04AFEC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl15_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl15$LinkButton1&#39;,&#39;107&#39;)" style="display:inline-block;background-color:#008F9C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl16_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl16$LinkButton1&#39;,&#39;1028&#39;)" style="display:inline-block;background-color:#CCFFCC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl17_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl17$LinkButton1&#39;,&#39;29&#39;)" style="display:inline-block;background-color:#A1C48C;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl18_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl18$LinkButton1&#39;,&#39;119&#39;)" style="display:inline-block;background-color:#A4BD47;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl19_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl19$LinkButton1&#39;,&#39;37&#39;)" style="display:inline-block;background-color:#4B974B;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl20_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl20$LinkButton1&#39;,&#39;1021&#39;)" style="display:inline-block;background-color:#3A7D15;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl21_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl21$LinkButton1&#39;,&#39;1020&#39;)" style="display:inline-block;background-color:#00FF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl22_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl22$LinkButton1&#39;,&#39;28&#39;)" style="display:inline-block;background-color:#287F47;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl23_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl23$LinkButton1&#39;,&#39;141&#39;)" style="display:inline-block;background-color:#27462D;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl24_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl24$LinkButton1&#39;,&#39;1029&#39;)" style="display:inline-block;background-color:#FFFFCC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl25_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl25$LinkButton1&#39;,&#39;226&#39;)" style="display:inline-block;background-color:#FDEA8D;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl26_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl26$LinkButton1&#39;,&#39;1008&#39;)" style="display:inline-block;background-color:#C1BE42;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl27_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl27$LinkButton1&#39;,&#39;24&#39;)" style="display:inline-block;background-color:#F5CD30;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl28_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl28$LinkButton1&#39;,&#39;1017&#39;)" style="display:inline-block;background-color:#FFAF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl29_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl29$LinkButton1&#39;,&#39;1009&#39;)" style="display:inline-block;background-color:#FFFF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl30_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl30$LinkButton1&#39;,&#39;1005&#39;)" style="display:inline-block;background-color:#FFAF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl31_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl31$LinkButton1&#39;,&#39;105&#39;)" style="display:inline-block;background-color:#E29B40;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl32_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl32$LinkButton1&#39;,&#39;1025&#39;)" style="display:inline-block;background-color:#FFC9C9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl33_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl33$LinkButton1&#39;,&#39;125&#39;)" style="display:inline-block;background-color:#EAB892;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl34_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl34$LinkButton1&#39;,&#39;101&#39;)" style="display:inline-block;background-color:#DA867A;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl35_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl35$LinkButton1&#39;,&#39;1007&#39;)" style="display:inline-block;background-color:#A34B4B;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl36_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl36$LinkButton1&#39;,&#39;1016&#39;)" style="display:inline-block;background-color:#FF66CC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl37_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl37$LinkButton1&#39;,&#39;1032&#39;)" style="display:inline-block;background-color:#FF00BF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl38_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl38$LinkButton1&#39;,&#39;1004&#39;)" style="display:inline-block;background-color:#FF0000;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl39_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl39$LinkButton1&#39;,&#39;21&#39;)" style="display:inline-block;background-color:#C4281C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl40_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl40$LinkButton1&#39;,&#39;9&#39;)" style="display:inline-block;background-color:#E8BAC8;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl41_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl41$LinkButton1&#39;,&#39;1026&#39;)" style="display:inline-block;background-color:#B1A7FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl42_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl42$LinkButton1&#39;,&#39;1006&#39;)" style="display:inline-block;background-color:#B480FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl43_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl43$LinkButton1&#39;,&#39;153&#39;)" style="display:inline-block;background-color:#957977;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl44_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl44$LinkButton1&#39;,&#39;1023&#39;)" style="display:inline-block;background-color:#8C5B9F;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl45_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl45$LinkButton1&#39;,&#39;1015&#39;)" style="display:inline-block;background-color:#AA00AA;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl46_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl46$LinkButton1&#39;,&#39;1031&#39;)" style="display:inline-block;background-color:#6225D1;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl47_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl47$LinkButton1&#39;,&#39;104&#39;)" style="display:inline-block;background-color:#6B327C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl48_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl48$LinkButton1&#39;,&#39;5&#39;)" style="display:inline-block;background-color:#D7C59A;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl49_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl49$LinkButton1&#39;,&#39;1030&#39;)" style="display:inline-block;background-color:#FFCC99;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl50_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl50$LinkButton1&#39;,&#39;18&#39;)" style="display:inline-block;background-color:#CC8E69;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl51_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl51$LinkButton1&#39;,&#39;106&#39;)" style="display:inline-block;background-color:#DA8541;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl52_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl52$LinkButton1&#39;,&#39;38&#39;)" style="display:inline-block;background-color:#A05F35;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl53_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl53$LinkButton1&#39;,&#39;1014&#39;)" style="display:inline-block;background-color:#AA5500;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl54_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl54$LinkButton1&#39;,&#39;217&#39;)" style="display:inline-block;background-color:#7C5C46;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl55_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl55$LinkButton1&#39;,&#39;192&#39;)" style="display:inline-block;background-color:#694028;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl56_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl56$LinkButton1&#39;,&#39;1001&#39;)" style="display:inline-block;background-color:#F8F8F8;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl57_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl57$LinkButton1&#39;,&#39;1&#39;)" style="display:inline-block;background-color:#F2F3F3;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl58_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl58$LinkButton1&#39;,&#39;208&#39;)" style="display:inline-block;background-color:#E5E4DF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl59_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl59$LinkButton1&#39;,&#39;1002&#39;)" style="display:inline-block;background-color:#CDCDCD;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl60_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl60$LinkButton1&#39;,&#39;194&#39;)" style="display:inline-block;background-color:#A3A2A5;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl61_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl61$LinkButton1&#39;,&#39;199&#39;)" style="display:inline-block;background-color:#635F62;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl62_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl62$LinkButton1&#39;,&#39;26&#39;)" style="display:inline-block;background-color:#1B2A35;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftLeg_DataListColors_ctl63_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftLeg$DataListColors$ctl63$LinkButton1&#39;,&#39;1003&#39;)" style="display:inline-block;background-color:#111111;height:40px;width:40px;">

			</div>
    </td>
		</tr>
	</table>
                                </div>
                            </div>
                            <div id="PopupRightArm" class="modalPopup unifiedModal ColorPickerModal simplemodal-data">
                                <div style="height: 38px; padding-top: 2px;">Choose a Right Arm Color</div>
                                <div class="simplemodal-close"><a class="ImageButton closeBtnCircle_20h" style="left: -36px;"></a></div>
                                <div class="unifiedModalContent ColorPickerContainer">
                                    <table id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors" cellspacing="0" border="0" style="border-width:0px;border-collapse:collapse;">
		<tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl00_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl00$LinkButton1&#39;,&#39;45&#39;)" style="display:inline-block;background-color:#B4D2E4;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl01_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl01$LinkButton1&#39;,&#39;1024&#39;)" style="display:inline-block;background-color:#AFDDFF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl02_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl02$LinkButton1&#39;,&#39;11&#39;)" style="display:inline-block;background-color:#80BBDC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl03_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl03$LinkButton1&#39;,&#39;102&#39;)" style="display:inline-block;background-color:#6E99CA;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl04_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl04$LinkButton1&#39;,&#39;23&#39;)" style="display:inline-block;background-color:#0D69AC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl05_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl05$LinkButton1&#39;,&#39;1010&#39;)" style="display:inline-block;background-color:#0000FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl06_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl06$LinkButton1&#39;,&#39;1012&#39;)" style="display:inline-block;background-color:#2154B9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl07_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl07$LinkButton1&#39;,&#39;1011&#39;)" style="display:inline-block;background-color:#002060;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl08_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl08$LinkButton1&#39;,&#39;1027&#39;)" style="display:inline-block;background-color:#9FF3E9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl09_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl09$LinkButton1&#39;,&#39;1018&#39;)" style="display:inline-block;background-color:#12EED4;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl10_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl10$LinkButton1&#39;,&#39;151&#39;)" style="display:inline-block;background-color:#789082;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl11_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl11$LinkButton1&#39;,&#39;1022&#39;)" style="display:inline-block;background-color:#7F8E64;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl12_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl12$LinkButton1&#39;,&#39;135&#39;)" style="display:inline-block;background-color:#74869D;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl13_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl13$LinkButton1&#39;,&#39;1019&#39;)" style="display:inline-block;background-color:#00FFFF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl14_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl14$LinkButton1&#39;,&#39;1013&#39;)" style="display:inline-block;background-color:#04AFEC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl15_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl15$LinkButton1&#39;,&#39;107&#39;)" style="display:inline-block;background-color:#008F9C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl16_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl16$LinkButton1&#39;,&#39;1028&#39;)" style="display:inline-block;background-color:#CCFFCC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl17_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl17$LinkButton1&#39;,&#39;29&#39;)" style="display:inline-block;background-color:#A1C48C;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl18_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl18$LinkButton1&#39;,&#39;119&#39;)" style="display:inline-block;background-color:#A4BD47;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl19_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl19$LinkButton1&#39;,&#39;37&#39;)" style="display:inline-block;background-color:#4B974B;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl20_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl20$LinkButton1&#39;,&#39;1021&#39;)" style="display:inline-block;background-color:#3A7D15;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl21_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl21$LinkButton1&#39;,&#39;1020&#39;)" style="display:inline-block;background-color:#00FF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl22_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl22$LinkButton1&#39;,&#39;28&#39;)" style="display:inline-block;background-color:#287F47;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl23_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl23$LinkButton1&#39;,&#39;141&#39;)" style="display:inline-block;background-color:#27462D;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl24_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl24$LinkButton1&#39;,&#39;1029&#39;)" style="display:inline-block;background-color:#FFFFCC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl25_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl25$LinkButton1&#39;,&#39;226&#39;)" style="display:inline-block;background-color:#FDEA8D;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl26_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl26$LinkButton1&#39;,&#39;1008&#39;)" style="display:inline-block;background-color:#C1BE42;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl27_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl27$LinkButton1&#39;,&#39;24&#39;)" style="display:inline-block;background-color:#F5CD30;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl28_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl28$LinkButton1&#39;,&#39;1017&#39;)" style="display:inline-block;background-color:#FFAF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl29_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl29$LinkButton1&#39;,&#39;1009&#39;)" style="display:inline-block;background-color:#FFFF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl30_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl30$LinkButton1&#39;,&#39;1005&#39;)" style="display:inline-block;background-color:#FFAF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl31_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl31$LinkButton1&#39;,&#39;105&#39;)" style="display:inline-block;background-color:#E29B40;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl32_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl32$LinkButton1&#39;,&#39;1025&#39;)" style="display:inline-block;background-color:#FFC9C9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl33_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl33$LinkButton1&#39;,&#39;125&#39;)" style="display:inline-block;background-color:#EAB892;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl34_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl34$LinkButton1&#39;,&#39;101&#39;)" style="display:inline-block;background-color:#DA867A;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl35_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl35$LinkButton1&#39;,&#39;1007&#39;)" style="display:inline-block;background-color:#A34B4B;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl36_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl36$LinkButton1&#39;,&#39;1016&#39;)" style="display:inline-block;background-color:#FF66CC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl37_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl37$LinkButton1&#39;,&#39;1032&#39;)" style="display:inline-block;background-color:#FF00BF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl38_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl38$LinkButton1&#39;,&#39;1004&#39;)" style="display:inline-block;background-color:#FF0000;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl39_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl39$LinkButton1&#39;,&#39;21&#39;)" style="display:inline-block;background-color:#C4281C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl40_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl40$LinkButton1&#39;,&#39;9&#39;)" style="display:inline-block;background-color:#E8BAC8;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl41_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl41$LinkButton1&#39;,&#39;1026&#39;)" style="display:inline-block;background-color:#B1A7FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl42_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl42$LinkButton1&#39;,&#39;1006&#39;)" style="display:inline-block;background-color:#B480FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl43_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl43$LinkButton1&#39;,&#39;153&#39;)" style="display:inline-block;background-color:#957977;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl44_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl44$LinkButton1&#39;,&#39;1023&#39;)" style="display:inline-block;background-color:#8C5B9F;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl45_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl45$LinkButton1&#39;,&#39;1015&#39;)" style="display:inline-block;background-color:#AA00AA;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl46_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl46$LinkButton1&#39;,&#39;1031&#39;)" style="display:inline-block;background-color:#6225D1;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl47_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl47$LinkButton1&#39;,&#39;104&#39;)" style="display:inline-block;background-color:#6B327C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl48_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl48$LinkButton1&#39;,&#39;5&#39;)" style="display:inline-block;background-color:#D7C59A;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl49_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl49$LinkButton1&#39;,&#39;1030&#39;)" style="display:inline-block;background-color:#FFCC99;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl50_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl50$LinkButton1&#39;,&#39;18&#39;)" style="display:inline-block;background-color:#CC8E69;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl51_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl51$LinkButton1&#39;,&#39;106&#39;)" style="display:inline-block;background-color:#DA8541;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl52_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl52$LinkButton1&#39;,&#39;38&#39;)" style="display:inline-block;background-color:#A05F35;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl53_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl53$LinkButton1&#39;,&#39;1014&#39;)" style="display:inline-block;background-color:#AA5500;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl54_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl54$LinkButton1&#39;,&#39;217&#39;)" style="display:inline-block;background-color:#7C5C46;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl55_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl55$LinkButton1&#39;,&#39;192&#39;)" style="display:inline-block;background-color:#694028;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl56_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl56$LinkButton1&#39;,&#39;1001&#39;)" style="display:inline-block;background-color:#F8F8F8;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl57_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl57$LinkButton1&#39;,&#39;1&#39;)" style="display:inline-block;background-color:#F2F3F3;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl58_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl58$LinkButton1&#39;,&#39;208&#39;)" style="display:inline-block;background-color:#E5E4DF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl59_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl59$LinkButton1&#39;,&#39;1002&#39;)" style="display:inline-block;background-color:#CDCDCD;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl60_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl60$LinkButton1&#39;,&#39;194&#39;)" style="display:inline-block;background-color:#A3A2A5;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl61_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl61$LinkButton1&#39;,&#39;199&#39;)" style="display:inline-block;background-color:#635F62;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl62_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl62$LinkButton1&#39;,&#39;26&#39;)" style="display:inline-block;background-color:#1B2A35;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserRightArm_DataListColors_ctl63_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserRightArm$DataListColors$ctl63$LinkButton1&#39;,&#39;1003&#39;)" style="display:inline-block;background-color:#111111;height:40px;width:40px;">

			</div>
    </td>
		</tr>
	</table>
                                </div>
                            </div>
                            <div id="PopupLeftArm" class="modalPopup unifiedModal ColorPickerModal simplemodal-data">
                                <div style="height: 38px; padding-top: 2px;">Choose a Left Arm Color</div>
                                <div class="simplemodal-close"><a class="ImageButton closeBtnCircle_20h" style="left: -36px;"></a></div>
                                <div class="unifiedModalContent ColorPickerContainer">
                                    <table id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors" cellspacing="0" border="0" style="border-width:0px;border-collapse:collapse;">
		<tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl00_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl00$LinkButton1&#39;,&#39;45&#39;)" style="display:inline-block;background-color:#B4D2E4;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl01_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl01$LinkButton1&#39;,&#39;1024&#39;)" style="display:inline-block;background-color:#AFDDFF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl02_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl02$LinkButton1&#39;,&#39;11&#39;)" style="display:inline-block;background-color:#80BBDC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl03_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl03$LinkButton1&#39;,&#39;102&#39;)" style="display:inline-block;background-color:#6E99CA;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl04_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl04$LinkButton1&#39;,&#39;23&#39;)" style="display:inline-block;background-color:#0D69AC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl05_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl05$LinkButton1&#39;,&#39;1010&#39;)" style="display:inline-block;background-color:#0000FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl06_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl06$LinkButton1&#39;,&#39;1012&#39;)" style="display:inline-block;background-color:#2154B9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl07_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl07$LinkButton1&#39;,&#39;1011&#39;)" style="display:inline-block;background-color:#002060;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl08_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl08$LinkButton1&#39;,&#39;1027&#39;)" style="display:inline-block;background-color:#9FF3E9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl09_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl09$LinkButton1&#39;,&#39;1018&#39;)" style="display:inline-block;background-color:#12EED4;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl10_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl10$LinkButton1&#39;,&#39;151&#39;)" style="display:inline-block;background-color:#789082;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl11_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl11$LinkButton1&#39;,&#39;1022&#39;)" style="display:inline-block;background-color:#7F8E64;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl12_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl12$LinkButton1&#39;,&#39;135&#39;)" style="display:inline-block;background-color:#74869D;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl13_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl13$LinkButton1&#39;,&#39;1019&#39;)" style="display:inline-block;background-color:#00FFFF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl14_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl14$LinkButton1&#39;,&#39;1013&#39;)" style="display:inline-block;background-color:#04AFEC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl15_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl15$LinkButton1&#39;,&#39;107&#39;)" style="display:inline-block;background-color:#008F9C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl16_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl16$LinkButton1&#39;,&#39;1028&#39;)" style="display:inline-block;background-color:#CCFFCC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl17_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl17$LinkButton1&#39;,&#39;29&#39;)" style="display:inline-block;background-color:#A1C48C;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl18_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl18$LinkButton1&#39;,&#39;119&#39;)" style="display:inline-block;background-color:#A4BD47;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl19_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl19$LinkButton1&#39;,&#39;37&#39;)" style="display:inline-block;background-color:#4B974B;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl20_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl20$LinkButton1&#39;,&#39;1021&#39;)" style="display:inline-block;background-color:#3A7D15;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl21_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl21$LinkButton1&#39;,&#39;1020&#39;)" style="display:inline-block;background-color:#00FF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl22_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl22$LinkButton1&#39;,&#39;28&#39;)" style="display:inline-block;background-color:#287F47;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl23_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl23$LinkButton1&#39;,&#39;141&#39;)" style="display:inline-block;background-color:#27462D;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl24_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl24$LinkButton1&#39;,&#39;1029&#39;)" style="display:inline-block;background-color:#FFFFCC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl25_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl25$LinkButton1&#39;,&#39;226&#39;)" style="display:inline-block;background-color:#FDEA8D;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl26_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl26$LinkButton1&#39;,&#39;1008&#39;)" style="display:inline-block;background-color:#C1BE42;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl27_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl27$LinkButton1&#39;,&#39;24&#39;)" style="display:inline-block;background-color:#F5CD30;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl28_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl28$LinkButton1&#39;,&#39;1017&#39;)" style="display:inline-block;background-color:#FFAF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl29_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl29$LinkButton1&#39;,&#39;1009&#39;)" style="display:inline-block;background-color:#FFFF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl30_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl30$LinkButton1&#39;,&#39;1005&#39;)" style="display:inline-block;background-color:#FFAF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl31_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl31$LinkButton1&#39;,&#39;105&#39;)" style="display:inline-block;background-color:#E29B40;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl32_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl32$LinkButton1&#39;,&#39;1025&#39;)" style="display:inline-block;background-color:#FFC9C9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl33_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl33$LinkButton1&#39;,&#39;125&#39;)" style="display:inline-block;background-color:#EAB892;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl34_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl34$LinkButton1&#39;,&#39;101&#39;)" style="display:inline-block;background-color:#DA867A;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl35_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl35$LinkButton1&#39;,&#39;1007&#39;)" style="display:inline-block;background-color:#A34B4B;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl36_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl36$LinkButton1&#39;,&#39;1016&#39;)" style="display:inline-block;background-color:#FF66CC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl37_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl37$LinkButton1&#39;,&#39;1032&#39;)" style="display:inline-block;background-color:#FF00BF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl38_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl38$LinkButton1&#39;,&#39;1004&#39;)" style="display:inline-block;background-color:#FF0000;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl39_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl39$LinkButton1&#39;,&#39;21&#39;)" style="display:inline-block;background-color:#C4281C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl40_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl40$LinkButton1&#39;,&#39;9&#39;)" style="display:inline-block;background-color:#E8BAC8;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl41_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl41$LinkButton1&#39;,&#39;1026&#39;)" style="display:inline-block;background-color:#B1A7FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl42_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl42$LinkButton1&#39;,&#39;1006&#39;)" style="display:inline-block;background-color:#B480FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl43_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl43$LinkButton1&#39;,&#39;153&#39;)" style="display:inline-block;background-color:#957977;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl44_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl44$LinkButton1&#39;,&#39;1023&#39;)" style="display:inline-block;background-color:#8C5B9F;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl45_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl45$LinkButton1&#39;,&#39;1015&#39;)" style="display:inline-block;background-color:#AA00AA;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl46_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl46$LinkButton1&#39;,&#39;1031&#39;)" style="display:inline-block;background-color:#6225D1;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl47_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl47$LinkButton1&#39;,&#39;104&#39;)" style="display:inline-block;background-color:#6B327C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl48_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl48$LinkButton1&#39;,&#39;5&#39;)" style="display:inline-block;background-color:#D7C59A;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl49_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl49$LinkButton1&#39;,&#39;1030&#39;)" style="display:inline-block;background-color:#FFCC99;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl50_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl50$LinkButton1&#39;,&#39;18&#39;)" style="display:inline-block;background-color:#CC8E69;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl51_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl51$LinkButton1&#39;,&#39;106&#39;)" style="display:inline-block;background-color:#DA8541;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl52_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl52$LinkButton1&#39;,&#39;38&#39;)" style="display:inline-block;background-color:#A05F35;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl53_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl53$LinkButton1&#39;,&#39;1014&#39;)" style="display:inline-block;background-color:#AA5500;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl54_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl54$LinkButton1&#39;,&#39;217&#39;)" style="display:inline-block;background-color:#7C5C46;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl55_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl55$LinkButton1&#39;,&#39;192&#39;)" style="display:inline-block;background-color:#694028;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl56_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl56$LinkButton1&#39;,&#39;1001&#39;)" style="display:inline-block;background-color:#F8F8F8;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl57_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl57$LinkButton1&#39;,&#39;1&#39;)" style="display:inline-block;background-color:#F2F3F3;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl58_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl58$LinkButton1&#39;,&#39;208&#39;)" style="display:inline-block;background-color:#E5E4DF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl59_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl59$LinkButton1&#39;,&#39;1002&#39;)" style="display:inline-block;background-color:#CDCDCD;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl60_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl60$LinkButton1&#39;,&#39;194&#39;)" style="display:inline-block;background-color:#A3A2A5;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl61_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl61$LinkButton1&#39;,&#39;199&#39;)" style="display:inline-block;background-color:#635F62;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl62_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl62$LinkButton1&#39;,&#39;26&#39;)" style="display:inline-block;background-color:#1B2A35;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserLeftArm_DataListColors_ctl63_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserLeftArm$DataListColors$ctl63$LinkButton1&#39;,&#39;1003&#39;)" style="display:inline-block;background-color:#111111;height:40px;width:40px;">

			</div>
    </td>
		</tr>
	</table>
                                </div>
                            </div>
                            <div id="PopupHead" class="modalPopup unifiedModal ColorPickerModal simplemodal-data">
                                <div style="height: 38px; padding-top: 2px;">Choose a Head Color</div>
                                <div class="simplemodal-close"><a class="ImageButton closeBtnCircle_20h" style="left: -36px;"></a></div>
                                <div class="unifiedModalContent ColorPickerContainer">
                                    <table id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors" cellspacing="0" border="0" style="border-width:0px;border-collapse:collapse;">
		<tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl00_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl00$LinkButton1&#39;,&#39;45&#39;)" style="display:inline-block;background-color:#B4D2E4;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl01_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl01$LinkButton1&#39;,&#39;1024&#39;)" style="display:inline-block;background-color:#AFDDFF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl02_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl02$LinkButton1&#39;,&#39;11&#39;)" style="display:inline-block;background-color:#80BBDC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl03_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl03$LinkButton1&#39;,&#39;102&#39;)" style="display:inline-block;background-color:#6E99CA;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl04_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl04$LinkButton1&#39;,&#39;23&#39;)" style="display:inline-block;background-color:#0D69AC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl05_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl05$LinkButton1&#39;,&#39;1010&#39;)" style="display:inline-block;background-color:#0000FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl06_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl06$LinkButton1&#39;,&#39;1012&#39;)" style="display:inline-block;background-color:#2154B9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl07_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl07$LinkButton1&#39;,&#39;1011&#39;)" style="display:inline-block;background-color:#002060;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl08_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl08$LinkButton1&#39;,&#39;1027&#39;)" style="display:inline-block;background-color:#9FF3E9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl09_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl09$LinkButton1&#39;,&#39;1018&#39;)" style="display:inline-block;background-color:#12EED4;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl10_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl10$LinkButton1&#39;,&#39;151&#39;)" style="display:inline-block;background-color:#789082;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl11_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl11$LinkButton1&#39;,&#39;1022&#39;)" style="display:inline-block;background-color:#7F8E64;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl12_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl12$LinkButton1&#39;,&#39;135&#39;)" style="display:inline-block;background-color:#74869D;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl13_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl13$LinkButton1&#39;,&#39;1019&#39;)" style="display:inline-block;background-color:#00FFFF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl14_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl14$LinkButton1&#39;,&#39;1013&#39;)" style="display:inline-block;background-color:#04AFEC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl15_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl15$LinkButton1&#39;,&#39;107&#39;)" style="display:inline-block;background-color:#008F9C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl16_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl16$LinkButton1&#39;,&#39;1028&#39;)" style="display:inline-block;background-color:#CCFFCC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl17_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl17$LinkButton1&#39;,&#39;29&#39;)" style="display:inline-block;background-color:#A1C48C;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl18_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl18$LinkButton1&#39;,&#39;119&#39;)" style="display:inline-block;background-color:#A4BD47;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl19_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl19$LinkButton1&#39;,&#39;37&#39;)" style="display:inline-block;background-color:#4B974B;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl20_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl20$LinkButton1&#39;,&#39;1021&#39;)" style="display:inline-block;background-color:#3A7D15;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl21_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl21$LinkButton1&#39;,&#39;1020&#39;)" style="display:inline-block;background-color:#00FF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl22_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl22$LinkButton1&#39;,&#39;28&#39;)" style="display:inline-block;background-color:#287F47;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl23_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl23$LinkButton1&#39;,&#39;141&#39;)" style="display:inline-block;background-color:#27462D;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl24_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl24$LinkButton1&#39;,&#39;1029&#39;)" style="display:inline-block;background-color:#FFFFCC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl25_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl25$LinkButton1&#39;,&#39;226&#39;)" style="display:inline-block;background-color:#FDEA8D;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl26_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl26$LinkButton1&#39;,&#39;1008&#39;)" style="display:inline-block;background-color:#C1BE42;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl27_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl27$LinkButton1&#39;,&#39;24&#39;)" style="display:inline-block;background-color:#F5CD30;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl28_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl28$LinkButton1&#39;,&#39;1017&#39;)" style="display:inline-block;background-color:#FFAF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl29_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl29$LinkButton1&#39;,&#39;1009&#39;)" style="display:inline-block;background-color:#FFFF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl30_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl30$LinkButton1&#39;,&#39;1005&#39;)" style="display:inline-block;background-color:#FFAF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl31_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl31$LinkButton1&#39;,&#39;105&#39;)" style="display:inline-block;background-color:#E29B40;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl32_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl32$LinkButton1&#39;,&#39;1025&#39;)" style="display:inline-block;background-color:#FFC9C9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl33_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl33$LinkButton1&#39;,&#39;125&#39;)" style="display:inline-block;background-color:#EAB892;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl34_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl34$LinkButton1&#39;,&#39;101&#39;)" style="display:inline-block;background-color:#DA867A;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl35_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl35$LinkButton1&#39;,&#39;1007&#39;)" style="display:inline-block;background-color:#A34B4B;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl36_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl36$LinkButton1&#39;,&#39;1016&#39;)" style="display:inline-block;background-color:#FF66CC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl37_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl37$LinkButton1&#39;,&#39;1032&#39;)" style="display:inline-block;background-color:#FF00BF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl38_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl38$LinkButton1&#39;,&#39;1004&#39;)" style="display:inline-block;background-color:#FF0000;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl39_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl39$LinkButton1&#39;,&#39;21&#39;)" style="display:inline-block;background-color:#C4281C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl40_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl40$LinkButton1&#39;,&#39;9&#39;)" style="display:inline-block;background-color:#E8BAC8;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl41_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl41$LinkButton1&#39;,&#39;1026&#39;)" style="display:inline-block;background-color:#B1A7FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl42_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl42$LinkButton1&#39;,&#39;1006&#39;)" style="display:inline-block;background-color:#B480FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl43_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl43$LinkButton1&#39;,&#39;153&#39;)" style="display:inline-block;background-color:#957977;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl44_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl44$LinkButton1&#39;,&#39;1023&#39;)" style="display:inline-block;background-color:#8C5B9F;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl45_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl45$LinkButton1&#39;,&#39;1015&#39;)" style="display:inline-block;background-color:#AA00AA;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl46_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl46$LinkButton1&#39;,&#39;1031&#39;)" style="display:inline-block;background-color:#6225D1;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl47_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl47$LinkButton1&#39;,&#39;104&#39;)" style="display:inline-block;background-color:#6B327C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl48_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl48$LinkButton1&#39;,&#39;5&#39;)" style="display:inline-block;background-color:#D7C59A;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl49_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl49$LinkButton1&#39;,&#39;1030&#39;)" style="display:inline-block;background-color:#FFCC99;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl50_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl50$LinkButton1&#39;,&#39;18&#39;)" style="display:inline-block;background-color:#CC8E69;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl51_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl51$LinkButton1&#39;,&#39;106&#39;)" style="display:inline-block;background-color:#DA8541;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl52_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl52$LinkButton1&#39;,&#39;38&#39;)" style="display:inline-block;background-color:#A05F35;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl53_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl53$LinkButton1&#39;,&#39;1014&#39;)" style="display:inline-block;background-color:#AA5500;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl54_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl54$LinkButton1&#39;,&#39;217&#39;)" style="display:inline-block;background-color:#7C5C46;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl55_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl55$LinkButton1&#39;,&#39;192&#39;)" style="display:inline-block;background-color:#694028;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl56_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl56$LinkButton1&#39;,&#39;1001&#39;)" style="display:inline-block;background-color:#F8F8F8;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl57_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl57$LinkButton1&#39;,&#39;1&#39;)" style="display:inline-block;background-color:#F2F3F3;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl58_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl58$LinkButton1&#39;,&#39;208&#39;)" style="display:inline-block;background-color:#E5E4DF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl59_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl59$LinkButton1&#39;,&#39;1002&#39;)" style="display:inline-block;background-color:#CDCDCD;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl60_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl60$LinkButton1&#39;,&#39;194&#39;)" style="display:inline-block;background-color:#A3A2A5;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl61_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl61$LinkButton1&#39;,&#39;199&#39;)" style="display:inline-block;background-color:#635F62;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl62_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl62$LinkButton1&#39;,&#39;26&#39;)" style="display:inline-block;background-color:#1B2A35;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserHead_DataListColors_ctl63_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserHead$DataListColors$ctl63$LinkButton1&#39;,&#39;1003&#39;)" style="display:inline-block;background-color:#111111;height:40px;width:40px;">

			</div>
    </td>
		</tr>
	</table>
                                </div>
                            </div>
                            <div id="PopupTorso" class="modalPopup unifiedModal ColorPickerModal simplemodal-data">
                                <div style="height: 38px; padding-top: 2px;">Choose a Torso Color</div>
                                <div class="simplemodal-close"><a class="ImageButton closeBtnCircle_20h" style="left: -36px;"></a></div>
                                <div class="unifiedModalContent ColorPickerContainer">
                                    <table id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors" cellspacing="0" border="0" style="border-width:0px;border-collapse:collapse;">
		<tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl00_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl00$LinkButton1&#39;,&#39;45&#39;)" style="display:inline-block;background-color:#B4D2E4;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl01_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl01$LinkButton1&#39;,&#39;1024&#39;)" style="display:inline-block;background-color:#AFDDFF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl02_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl02$LinkButton1&#39;,&#39;11&#39;)" style="display:inline-block;background-color:#80BBDC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl03_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl03$LinkButton1&#39;,&#39;102&#39;)" style="display:inline-block;background-color:#6E99CA;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl04_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl04$LinkButton1&#39;,&#39;23&#39;)" style="display:inline-block;background-color:#0D69AC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl05_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl05$LinkButton1&#39;,&#39;1010&#39;)" style="display:inline-block;background-color:#0000FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl06_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl06$LinkButton1&#39;,&#39;1012&#39;)" style="display:inline-block;background-color:#2154B9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl07_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl07$LinkButton1&#39;,&#39;1011&#39;)" style="display:inline-block;background-color:#002060;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl08_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl08$LinkButton1&#39;,&#39;1027&#39;)" style="display:inline-block;background-color:#9FF3E9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl09_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl09$LinkButton1&#39;,&#39;1018&#39;)" style="display:inline-block;background-color:#12EED4;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl10_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl10$LinkButton1&#39;,&#39;151&#39;)" style="display:inline-block;background-color:#789082;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl11_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl11$LinkButton1&#39;,&#39;1022&#39;)" style="display:inline-block;background-color:#7F8E64;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl12_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl12$LinkButton1&#39;,&#39;135&#39;)" style="display:inline-block;background-color:#74869D;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl13_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl13$LinkButton1&#39;,&#39;1019&#39;)" style="display:inline-block;background-color:#00FFFF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl14_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl14$LinkButton1&#39;,&#39;1013&#39;)" style="display:inline-block;background-color:#04AFEC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl15_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl15$LinkButton1&#39;,&#39;107&#39;)" style="display:inline-block;background-color:#008F9C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl16_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl16$LinkButton1&#39;,&#39;1028&#39;)" style="display:inline-block;background-color:#CCFFCC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl17_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl17$LinkButton1&#39;,&#39;29&#39;)" style="display:inline-block;background-color:#A1C48C;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl18_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl18$LinkButton1&#39;,&#39;119&#39;)" style="display:inline-block;background-color:#A4BD47;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl19_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl19$LinkButton1&#39;,&#39;37&#39;)" style="display:inline-block;background-color:#4B974B;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl20_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl20$LinkButton1&#39;,&#39;1021&#39;)" style="display:inline-block;background-color:#3A7D15;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl21_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl21$LinkButton1&#39;,&#39;1020&#39;)" style="display:inline-block;background-color:#00FF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl22_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl22$LinkButton1&#39;,&#39;28&#39;)" style="display:inline-block;background-color:#287F47;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl23_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl23$LinkButton1&#39;,&#39;141&#39;)" style="display:inline-block;background-color:#27462D;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl24_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl24$LinkButton1&#39;,&#39;1029&#39;)" style="display:inline-block;background-color:#FFFFCC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl25_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl25$LinkButton1&#39;,&#39;226&#39;)" style="display:inline-block;background-color:#FDEA8D;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl26_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl26$LinkButton1&#39;,&#39;1008&#39;)" style="display:inline-block;background-color:#C1BE42;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl27_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl27$LinkButton1&#39;,&#39;24&#39;)" style="display:inline-block;background-color:#F5CD30;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl28_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl28$LinkButton1&#39;,&#39;1017&#39;)" style="display:inline-block;background-color:#FFAF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl29_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl29$LinkButton1&#39;,&#39;1009&#39;)" style="display:inline-block;background-color:#FFFF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl30_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl30$LinkButton1&#39;,&#39;1005&#39;)" style="display:inline-block;background-color:#FFAF00;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl31_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl31$LinkButton1&#39;,&#39;105&#39;)" style="display:inline-block;background-color:#E29B40;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl32_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl32$LinkButton1&#39;,&#39;1025&#39;)" style="display:inline-block;background-color:#FFC9C9;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl33_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl33$LinkButton1&#39;,&#39;125&#39;)" style="display:inline-block;background-color:#EAB892;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl34_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl34$LinkButton1&#39;,&#39;101&#39;)" style="display:inline-block;background-color:#DA867A;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl35_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl35$LinkButton1&#39;,&#39;1007&#39;)" style="display:inline-block;background-color:#A34B4B;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl36_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl36$LinkButton1&#39;,&#39;1016&#39;)" style="display:inline-block;background-color:#FF66CC;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl37_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl37$LinkButton1&#39;,&#39;1032&#39;)" style="display:inline-block;background-color:#FF00BF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl38_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl38$LinkButton1&#39;,&#39;1004&#39;)" style="display:inline-block;background-color:#FF0000;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl39_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl39$LinkButton1&#39;,&#39;21&#39;)" style="display:inline-block;background-color:#C4281C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl40_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl40$LinkButton1&#39;,&#39;9&#39;)" style="display:inline-block;background-color:#E8BAC8;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl41_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl41$LinkButton1&#39;,&#39;1026&#39;)" style="display:inline-block;background-color:#B1A7FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl42_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl42$LinkButton1&#39;,&#39;1006&#39;)" style="display:inline-block;background-color:#B480FF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl43_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl43$LinkButton1&#39;,&#39;153&#39;)" style="display:inline-block;background-color:#957977;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl44_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl44$LinkButton1&#39;,&#39;1023&#39;)" style="display:inline-block;background-color:#8C5B9F;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl45_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl45$LinkButton1&#39;,&#39;1015&#39;)" style="display:inline-block;background-color:#AA00AA;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl46_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl46$LinkButton1&#39;,&#39;1031&#39;)" style="display:inline-block;background-color:#6225D1;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl47_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl47$LinkButton1&#39;,&#39;104&#39;)" style="display:inline-block;background-color:#6B327C;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl48_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl48$LinkButton1&#39;,&#39;5&#39;)" style="display:inline-block;background-color:#D7C59A;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl49_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl49$LinkButton1&#39;,&#39;1030&#39;)" style="display:inline-block;background-color:#FFCC99;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl50_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl50$LinkButton1&#39;,&#39;18&#39;)" style="display:inline-block;background-color:#CC8E69;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl51_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl51$LinkButton1&#39;,&#39;106&#39;)" style="display:inline-block;background-color:#DA8541;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl52_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl52$LinkButton1&#39;,&#39;38&#39;)" style="display:inline-block;background-color:#A05F35;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl53_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl53$LinkButton1&#39;,&#39;1014&#39;)" style="display:inline-block;background-color:#AA5500;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl54_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl54$LinkButton1&#39;,&#39;217&#39;)" style="display:inline-block;background-color:#7C5C46;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl55_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl55$LinkButton1&#39;,&#39;192&#39;)" style="display:inline-block;background-color:#694028;height:40px;width:40px;">

			</div>
    </td>
		</tr><tr>
			<td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl56_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl56$LinkButton1&#39;,&#39;1001&#39;)" style="display:inline-block;background-color:#F8F8F8;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl57_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl57$LinkButton1&#39;,&#39;1&#39;)" style="display:inline-block;background-color:#F2F3F3;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl58_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl58$LinkButton1&#39;,&#39;208&#39;)" style="display:inline-block;background-color:#E5E4DF;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl59_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl59$LinkButton1&#39;,&#39;1002&#39;)" style="display:inline-block;background-color:#CDCDCD;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl60_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl60$LinkButton1&#39;,&#39;194&#39;)" style="display:inline-block;background-color:#A3A2A5;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl61_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl61$LinkButton1&#39;,&#39;199&#39;)" style="display:inline-block;background-color:#635F62;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl62_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl62$LinkButton1&#39;,&#39;26&#39;)" style="display:inline-block;background-color:#1B2A35;height:40px;width:40px;">

			</div>
    </td><td>
        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_ColorChooserTorso_DataListColors_ctl63_LinkButton1" class="ColorPickerItem" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$ColorChooserTorso$DataListColors$ctl63$LinkButton1&#39;,&#39;1003&#39;)" style="display:inline-block;background-color:#111111;height:40px;width:40px;">

			</div>
    </td>
		</tr>
	</table>
                                </div>
                            </div>
                            <script type="text/javascript">
                                var colorPickerModalProperties = { overlayClose: true, escClose: true, opacity: 0, overlayCss: { backgroundColor: "#000" } };

                                RightLegOpen = function () {
                                    $("#PopupRightLeg").modal(colorPickerModalProperties);
                                };

                                LeftLegOpen = function () {
                                    $("#PopupLeftLeg").modal(colorPickerModalProperties);
                                };

                                RightArmOpen = function () {
                                    $("#PopupRightArm").modal(colorPickerModalProperties);
                                };

                                LeftArmOpen = function () {
                                    $("#PopupLeftArm").modal(colorPickerModalProperties);
                                };

                                HeadOpen = function () {
                                    $("#PopupHead").modal(colorPickerModalProperties);
                                };

                                TorsoOpen = function () {
                                    $("#PopupTorso").modal(colorPickerModalProperties);
                                };
                            </script>
                        
</div>
                </div>
            </div>
        </div>
        
        <div class="Column2f">
            
            <!--div>
                <a href="/catalog" class="btn btn-more btn-primary-sm">Get More</a>
				<a href="/catalog" class="btn-more btn-primary btn-small">Get More<span class="btn-text">Get More</span></a>
                <div class="small get-more-text">Explore the catalog to find more clothes!</div>
            </div-->
            
            <div class="tab-container">
                <div class="tab-active" data-id="tab_wardrobe">Wardrobe</div>
                
                <div data-id="tab-outfits">[Outfits]</div>
                
            </div>
            <div>
                
                <div id="tab_wardrobe" class="tab-active">
                    <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_UpdatePanelWardrobe">
	
                            <div class="CustomizeCharacterContainer">
                                <div class="AttireCategory" style="text-align: center">
                                    
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AttireCategoryRepeater_ctl00_AttireCategorySelector" class="AttireCategorySelector<?=assetTypeSorter(17)?>" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AttireCategoryRepeater$ctl00$AttireCategorySelector&#39;,&#39;17&#39;)">Heads</a>
                                        |
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AttireCategoryRepeater_ctl01_AttireCategorySelector" class="AttireCategorySelector<?=assetTypeSorter(18)?>" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AttireCategoryRepeater$ctl01$AttireCategorySelector&#39;,&#39;18&#39;)">Faces</a>
                                        |
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AttireCategoryRepeater_ctl02_AttireCategorySelector" class="AttireCategorySelector<?=assetTypeSorter(8)?>" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AttireCategoryRepeater$ctl02$AttireCategorySelector&#39;,&#39;8&#39;)">Hats</a>
                                        |
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AttireCategoryRepeater_ctl03_AttireCategorySelector" class="AttireCategorySelector<?=assetTypeSorter(2)?>" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AttireCategoryRepeater$ctl03$AttireCategorySelector&#39;,&#39;2&#39;)">T-Shirts</a>
                                        |
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AttireCategoryRepeater_ctl04_AttireCategorySelector" class="AttireCategorySelector<?=assetTypeSorter(11)?>" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AttireCategoryRepeater$ctl04$AttireCategorySelector&#39;,&#39;11&#39;)">Shirts</a>
                                        |
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AttireCategoryRepeater_ctl05_AttireCategorySelector" class="AttireCategorySelector<?=assetTypeSorter(12)?>" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AttireCategoryRepeater$ctl05$AttireCategorySelector&#39;,&#39;12&#39;)">Pants</a>
                                        |
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AttireCategoryRepeater_ctl06_AttireCategorySelector" class="AttireCategorySelector<?=assetTypeSorter(19)?>" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AttireCategoryRepeater$ctl06$AttireCategorySelector&#39;,&#39;19&#39;)">Gear</a>
                                        
                                    <br />
                                    
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_BodyPartCategoryRepeater_ctl00_BodyPartCategorySelector" class="AttireCategorySelector<?=assetTypeSorter(27)?>" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$BodyPartCategoryRepeater$ctl00$BodyPartCategorySelector&#39;,&#39;27&#39;)">Torsos</a>
                                        |
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_BodyPartCategoryRepeater_ctl01_BodyPartCategorySelector" class="AttireCategorySelector<?=assetTypeSorter(29)?>" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$BodyPartCategoryRepeater$ctl01$BodyPartCategorySelector&#39;,&#39;29&#39;)">L Arms</a>
                                        |
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_BodyPartCategoryRepeater_ctl02_BodyPartCategorySelector" class="AttireCategorySelector<?=assetTypeSorter(28)?>" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$BodyPartCategoryRepeater$ctl02$BodyPartCategorySelector&#39;,&#39;28&#39;)">R Arms</a>
                                        |
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_BodyPartCategoryRepeater_ctl03_BodyPartCategorySelector" class="AttireCategorySelector<?=assetTypeSorter(30)?>" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$BodyPartCategoryRepeater$ctl03$BodyPartCategorySelector&#39;,&#39;30&#39;)">L Legs</a>
                                        |
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_BodyPartCategoryRepeater_ctl04_BodyPartCategorySelector" class="AttireCategorySelector<?=assetTypeSorter(31)?>" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$BodyPartCategoryRepeater$ctl04$BodyPartCategorySelector&#39;,&#39;31&#39;)">R Legs</a>
                                        |
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_BodyPartCategoryRepeater_ctl05_BodyPartCategorySelector" class="AttireCategorySelector<?=assetTypeSorter(32)?>" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$BodyPartCategoryRepeater$ctl05$BodyPartCategorySelector&#39;,&#39;32&#39;)">Packages</a>
                                        
                                    <br />

                                    <!--select name="ctl00$ctl00$cphRoblox$cphMyRobloxContent$AssetTypeDropDownList" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AssetTypeDropDownList\&#39;,\&#39;\&#39;)&#39;, 0)" id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AssetTypeDropDownList" class="form-select">
		<option selected="selected" value="8">Hat</option>
		<option value="41">Hair</option>
		<option value="42">Face</option>
		<option value="43">Neck</option>
		<option value="44">Shoulder</option>
		<option value="45">Front</option>
		<option value="46">Back</option>
		<option value="47">Waist</option>

	</select-->
                                    
                                    
                                </div>
                                <?php
								$page = $pageNum ?? 1;
								$inv = $invAdj ?? $inv;
								if ($inv[0] !== null)
								{
									$list = '';
									$count = count($inv);
									$assets = 0;
									//big brain idea: append the following AFTER the list is compiled
									for($i = 0; $i < $count and $assets < 4; ++$i) {
									$assetId = $inv[$i];
									//$asset = json_decode(file_get_contents('http://' . $_SERVER['SERVER_NAME'] . '/AssetInfo?id='.$assetId.'&rbxAsset=1'),true);
									$asset = getMarketplaceInfo($assetId);
									if ($asset->AssetTypeId == $assetType and !in_array($assetId, $characterAppearance['allEquippedAssets']) and $asset !== false) { //TODO: hide or delete the item from the user's inventory?
									$list = $list . '
                                    <div class="Asset">
                                        <div class="AssetThumbnail">
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsListView_ctrl0_ctl00_AssetThumbnailHyperLink" title="click to wear" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AccoutrementsListView$ctrl0$ctl00$AssetThumbnailHyperLink&#39;,&#39;&#39;)" style="display:inline-block;height:110px;width:110px;cursor:pointer;">
												<div class="roblox-item-image image-small" data-item-id="'.$asset->AssetId.'" data-image-size="small" data-is-static alt="click to wear"></div>
											</a>
                                            <div style="position: absolute; right: -4px; text-align: center; top: 0;">
                                                <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsListView_ctrl0_ctl00_WearAccoutrementButton" title="click to wear" class="btn-small btn-neutral" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AccoutrementsListView$ctrl0$ctl00$WearAccoutrementButton&#39;,&#39;'.$assetId.'&#39;)">    
                                                    Wear
													<div class="btn-text">Wear</div>
                                                </a>

                                            </div>
                                        </div>
                                        <div class="AssetDetails">
                                            <div class="AssetName">
                                                <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsListView_ctrl0_ctl00_AssetNameHyperLink" title="click to view" class="notranslate" href="http://'.$_SERVER['SERVER_NAME'].'/Item.aspx?ID='.$asset->AssetId.'">'.$asset->Name.'</a>
                                            </div>
                                        </div>
                                    </div>
                                
										';
									$assets++;
									}
									}
									if ($assets > 0) { //if any assets have been added to the list, group them
									$list = '									<div class="TileGroup">
                                        ' . $list;
									$list = $list . '                                    </div>
									<!--Just pop in another TileGroup if need be-->';
									for($i = $i; $i < $count and $assets < 9; ++$i) {
									$assetId = $inv[$i];
									//$asset = json_decode(file_get_contents('http://' . $_SERVER['SERVER_NAME'] . '/AssetInfo?id='.$assetId.'&rbxAsset=1'),true);
									$asset = getMarketplaceInfo($assetId);
									if ($asset->AssetTypeId == $assetType and !in_array($assetId, $characterAppearance['allEquippedAssets']) and $asset !== false) { //TODO: hide or delete the item from the user's inventory?
									if ($assets < 8) {
									$list = $list . '
                                    <div class="Asset">
                                        <div class="AssetThumbnail">
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsListView_ctrl0_ctl00_AssetThumbnailHyperLink" title="click to wear" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AccoutrementsListView$ctrl0$ctl00$AssetThumbnailHyperLink&#39;,&#39;&#39;)" style="display:inline-block;height:110px;width:110px;cursor:pointer;">
												<div class="roblox-item-image image-small" data-item-id="'.$asset->AssetId.'" data-image-size="small" data-is-static alt="click to wear"></div>
											</a>
                                            <div style="position: absolute; right: -4px; text-align: center; top: 0;">
                                                <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsListView_ctrl0_ctl00_WearAccoutrementButton" title="click to wear" class="btn-small btn-neutral" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AccoutrementsListView$ctrl0$ctl00$WearAccoutrementButton&#39;,&#39;'.$assetId.'&#39;)">    
                                                    Wear
													<div class="btn-text">Wear</div>
                                                </a>

                                            </div>
                                        </div>
                                        <div class="AssetDetails">
                                            <div class="AssetName">
                                                <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsListView_ctrl0_ctl00_AssetNameHyperLink" title="click to view" class="notranslate" href="http://'.$_SERVER['SERVER_NAME'].'/Item.aspx?ID='.$asset->AssetId.'">'.$asset->Name.'</a>
                                            </div>
                                        </div>
                                    </div>
                                
										';
									}
									$assets++;
									}
									}
									}

									if ($assets > 0) {
									echo('<div class="AttireContent">'.$list.'</div>');
									}else {
										echo('
                                            <div class="AttireContent NoResults">
                                                You do not own any
                                            '.assetTypeToString($assetType).'s.
                                                 Why not shop for some in the <a href="http://'.$_SERVER['SERVER_NAME'].'/catalog/">Catalog</a>?
                                                
                                            </div>');
									}
								}
								else
								{
									echo('
                                            <div class="AttireContent NoResults">
                                                You do not own any
                                            '.assetTypeToString($assetType).'s.
                                                 Why not shop for some in the <a href="http://'.$_SERVER['SERVER_NAME'].'/catalog/">Catalog</a>?
                                                
                                            </div>');
								}
								?>
                                        
                                    <div class="FooterPager2">
	                                    <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_WardrobePrevBtn" class="pager previous <?php if ($page <= 1) {echo('disabled');} ?>" <?php if ($page > 1) {echo('href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$WardrobePrevBtn&#39;,&#39;'.($page-1).'|'.$assetType.'&#39;)"');} ?>></a>
	                                    <span class="page text">Page <?=$page?></span>
	                                    <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_WardrobeNextBtn" class="pager next <?php if ($assets <= (($page - 1) * 8) or $assets <= 8) {echo('disabled '.$assets);} ?>" <?php if ($assets > (($page - 1) * 8) and $assets > 8) {echo('href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$WardrobeNextBtn&#39;,&#39;'.($page+1).'|'.$assetType.'&#39;)"');} ?>></a>
                                    </div>
                                
                            </div>
                        
</div>
                </div>                

                
                
                <div id="tab-outfits">
                    <!--div class="validation-summary-valid" data-valmsg-summary="true"><ul><li style="display:none"></li>
</ul></div--><input name="__RequestVerificationToken" type="hidden" value="Jf_WDy5Vc57u_8tr1mCA_q-HXRFjg0GjBTZlzWbYtJqL9rvbPsfN4RwetqqGJh4x9yVbSkvoIYQn5C63twaaKX-blNc1" />
<div id="OutfitsTab" data-isiosapp="false" class="outfits-tab">


    <div class="outfits-banner">
        <div class="outfits-banner-left">
                                    <div id="outfits-error" class="outfits-error status-error"></div>
        </div>
        <div class="outfits-banner-right">
            <div id="CreateNewOutfitContainer">
                <a id="CreateNewOutfit" class="text-link ">
                    <span class="btn-control btn-control-large">Create New</span>
                </a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    //<sl:translate>
        if (typeof Roblox === "undefined") {
            Roblox = {};
        }
        if (typeof Roblox.Outfits === "undefined") {
            Roblox.Outfits = {};
        }
        Roblox.Outfits.Resources = {
            createTitle: "Create New Outfit",
            createText: "An outfit will be created from your avatar's current appearance.",
            createConfirm: "Create",
            createCancel: "Cancel",
            outfitNameTextBoxLabel: "Name: ",
            deleteTitle: "Delete Outfit",
            deleteText: "Are you sure you want to delete this outfit?",
	        deleteConfirm: "Delete",
            deleteCancel: "Cancel",
	        updateTitle: "Update Outfit",
	        updateText: "Do you want to update this outfit? This will overwrite the outfit with your avatar's current appearance.",
	        updateConfirm: "Update Outfit",
	        updateCancel: "Cancel",
	        renameTitle: "Rename Outfit",
	        renameText: "Choose a new name for your outfit.",
	        renameConfirm: "Rename",
            renameCancel: "Cancel"
            }
    //</sl:translate>
    </script>
    <div class="outfits-container">
            <div class="outfit-container notranslate">
                <img class="outfit-loading-image" title="" alt="" border="0" src="/images/Accounts/ProgressIndicator.gif"></img>
                <div class="outfit-hover">
                        <div class="outfit-dropdown">
                            <div class="dropdown">
                                <div class="button gear"></div>
                                <ul class="dropdown-list">
                                    <li>
                                        <a class="wear-outfit" data-target-useroutfit-id="53" data-view="Outfits" data-page-num="1" data-displayed-user-id="53">Wear</a>
                                    </li>
                                    <li>
                                        <a class="rename-outfit" data-target-useroutfit-id="53" data-view="Outfits" data-page-num="1" data-displayed-user-id="53">Rename</a>
                                    </li>
                                    <li>
                                        <a class="update-outfit" data-target-useroutfit-id="53" data-view="Outfits" data-page-num="1" data-displayed-user-id="53">Update</a>
                                    </li>
                                    <li>
                                        <a class="delete-outfit" data-target-useroutfit-id="53" data-view="Outfits" data-page-num="1" data-displayed-user-id="53">Delete</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    <div class="outfit-avatar" title="click to wear outfit" data-target-useroutfit-id="53" data-view="Outfits" data-page-num="1" data-displayed-user-id="53">
                        <!--a class="roblox-avatar-image" data-useroutfit-id="57518022" data-no-click="true" data-no-overlays="true" data-image-size="small"></a-->
                        <a class="roblox-avatar-image" data-user-id="53" data-no-click="true" data-no-overlays="true" data-image-size="small"></a>
                    </div>
                </div>
                <div class="outfit-name">
                    <span title="Default">Default</span>
                </div>
                <div class="outfit-created">
                    <span class="Detail">Created:</span>
                    <span class="Detail">12/18/2018</span>
                </div>
            </div>
    </div>
    <div class="outfits-pager">
    </div>
    <div id="ProcessingView" style="display:none">
	    <div class="ProcessingModalBody">
		    <p class="processing-indicator"><img src='https://images.rbxcdn.com/ec4e85b0c4396cf753a06fade0a8d8af.gif' alt="Processing..." /></p>
		    <p class="processing-text">Processing...</p>
	    </div>
    </div>


</div>
                </div>
                
                
            </div>
            <script type="text/javascript">
                function switchTabs(nextTabElem) {
                    var currentTab = $('.tab-container div.tab.active');
                    currentTab.removeClass('active');
                    $('#' + currentTab.data('id')).hide();
                    nextTabElem.addClass('active');
                    $('#' + nextTabElem.data('id')).show();
                }
                $('div.tab').bind('click', function () {
                    switchTabs($(this));
                });
            </script>

            <div class="divider-top" style="margin-top: 10px; padding-left: 20px; position: relative;"></div>
            <h2 style="margin-top: 20px;">
                <span>Currently Wearing</span>
            </h2>
            <div class="CurrentAttireContent">
			
                <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_UpdatePanelAccoutrements">
	
                        <div id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsPane" class="CustomizeCharacterContainer">
                            
                                    <div class="AccoutrementContent">
                                        
                                    <?php
									if ($characterAppearance['allEquippedAssets'][0] !== null)
									{
									$list = '';
									$count = count($characterAppearance['allEquippedAssets']);
									$assets = 0;
									$list = $list . '									<div class="TileGroup">
                                        ';
									for($i = 0; $i < $count and $assets < 4; ++$i) { //Number of items the user has equipped
									$assetId = $characterAppearance['allEquippedAssets'][$i];
									//$asset = json_decode(file_get_contents('http://' . $_SERVER['SERVER_NAME'] . '/AssetInfo?id='.$assetId.'&rbxAsset=1'),true);
									$asset = getMarketplaceInfo($assetId);
									//Don't try to format the roblox-item-image div. It prevents the ItemImage js from finding it.
									$list = $list . '
                                    <div class="Asset">
                                        <div class="AssetThumbnail">
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsListView_ctrl0_ctl00_AssetThumbnailHyperLink" title="click to remove" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AccoutrementsListView$ctrl0$ctl00$AssetThumbnailHyperLink&#39;,&#39;&#39;)" style="display:inline-block;height:110px;width:110px;cursor:pointer;">
												<div class="roblox-item-image image-small" data-item-id="'.$asset->AssetId.'" data-image-size="small" data-is-static alt="click to remove"></div>
											</a>
                                            <div style="position: absolute; right: -4px; text-align: center; top: 0;">
                                                <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsListView_ctrl0_ctl00_RemoveAccoutrementButton" title="click to remove" class="btn-small btn-neutral" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AccoutrementsListView$ctrl0$ctl00$RemoveAccoutrementButton&#39;,&#39;'.$assetId.'&#39;)">    
                                                    Remove
													<div class="btn-text">Remove</div>
                                                </a>

                                            </div>
                                        </div>
                                        <div class="AssetDetails">
                                            <div class="AssetName">
                                                <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsListView_ctrl0_ctl00_AssetNameHyperLink" title="click to view" class="notranslate" href="http://roblonium.com/Item.aspx?ID='.$asset->AssetId.'">'.$asset->Name.'</a>
                                            </div>
                                            <div class="AssetType">
                                                <span class="Label">Type:</span> <span class="Detail">
                                                    '.assetTypeToString($asset->AssetTypeId).'
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                
										';
									$assets++;
									}
									$list = $list . '                                    </div>
									<!--Just pop in another TileGroup if need be-->';
									if ($i < $count) {
									$list = $list . '									<div class="TileGroup">
                                        ';
									for($i = $assets; $i < $count and $assets < 8; ++$i) { //Number of items the user has equipped
									$assetId = $characterAppearance['allEquippedAssets'][$i];
									//$asset = json_decode(file_get_contents('http://' . $_SERVER['SERVER_NAME'] . '/AssetInfo?id='.$assetId.'&rbxAsset=1'),true);
									$asset = getMarketplaceInfo($assetId);
									//Don't try to format the roblox-item-image div. It prevents the ItemImage js from finding it.
									$list = $list . '
                                    <div class="Asset">
                                        <div class="AssetThumbnail">
                                            <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsListView_ctrl0_ctl00_AssetThumbnailHyperLink" title="click to remove" onclick="__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AccoutrementsListView$ctrl0$ctl00$AssetThumbnailHyperLink&#39;,&#39;&#39;)" style="display:inline-block;height:110px;width:110px;cursor:pointer;">
												<div class="roblox-item-image image-small" data-item-id="'.$asset->AssetId.'" data-image-size="small" data-is-static alt="click to remove"></div>
											</a>
                                            <div style="position: absolute; right: -4px; text-align: center; top: 0;">
                                                <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsListView_ctrl0_ctl00_RemoveAccoutrementButton" title="click to remove" class="btn-small btn-neutral" href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AccoutrementsListView$ctrl0$ctl00$RemoveAccoutrementButton&#39;,&#39;'.$assetId.'&#39;)">    
                                                    Remove
													<div class="btn-text">Remove</div>
                                                </a>

                                            </div>
                                        </div>
                                        <div class="AssetDetails">
                                            <div class="AssetName">
                                                <a id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsListView_ctrl0_ctl00_AssetNameHyperLink" title="click to view" class="notranslate" href="http://roblonium.com/Item.aspx?ID='.$asset->AssetId.'">'.$asset->Name.'</a>
                                            </div>
                                            <div class="AssetType">
                                                <span class="Label">Type:</span> <span class="Detail">
                                                    '.assetTypeToString($asset->AssetTypeId).'
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                
										';
									$assets++;
									}
									$list = $list . '                                    </div>
									<!--Just pop in another TileGroup if need be-->';
									}
									//echo('<h3>bruh moment in progress. please stand by.</h3>');
									echo($list);
									}
									else
									{
										echo('                                    <div class="NoResults">
                                        You are not wearing any items from your wardrobe.
                                    </div>');
									}
									?>
                                    </div>
                                
                            <div class="FooterPager">
							<?php
							if ($characterAppearance['allEquippedAssets'][8] !== null)
							{
							//RemoveAccoutrement$21070012
							$maxPage = ceil(count($characterAppearance['allEquippedAssets'])/8);
							$above = '<span id="ctl00_ctl00_cphRoblox_cphMyRobloxContent_AccoutrementsDataPager_Footer"><a disabled="disabled">First</a><a disabled="disabled">Previous</a>';
                            $between ='<span>1</span><a href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AccoutrementsDataPager_Footer$ctl01$ctl01&#39;,&#39;&#39;)">2</a>';
							$below = '<a href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AccoutrementsDataPager_Footer$ctl02$ctl00&#39;,&#39;&#39;)">Next</a><a href="javascript:__doPostBack(&#39;ctl00$ctl00$cphRoblox$cphMyRobloxContent$AccoutrementsDataPager_Footer$ctl02$ctl01&#39;,&#39;&#39;)">Last</a></span>';
							echo($above.$between.$below);
							}
							?>
							</div>
                        </div>
						<script type="text/javascript">
							//tada
							var prm = Sys.WebForms.PageRequestManager.getInstance();

							prm.add_endRequest(function() {
								Roblox.Widgets.ItemImage.populate();
							});
						</script>
                    
			</div>
            </div>
        </div>
        
        <br clear="all" />
    </div>

    
    

                    <div style="clear:both"></div>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Bottom.php";?>