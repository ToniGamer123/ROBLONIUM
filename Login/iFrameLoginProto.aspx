<?php

require '../Hexine/api/private/database.php';

require '../Hexine/api/private/register.php';
require '../Hexine/api/form.php';

$login = new login;
$error = Array();
if (isset($_POST["username"])){
	$login->username = $_POST["username"];
	$login->password = $_POST["password"];
	$account = $login->attempt();
	$error = $account["error"];
	if (isset($account["player"])){
		$_SESSION['player'] = $account["player"]; 
		header("Location: index.html");
		die();
	}
}

$player = new Player($_SESSION['player'] );
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<title>
	ROBLONIUM Login
</title>
<?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/ScriptGlobals.php";?>
<script type="text/javascript" src="/js/iFrameLogin.js"></script>
<link rel="stylesheet" href="/robloxold.css"/>
</head>
<body style="background: #E1E1E1;" data-parent-url="/" data-captchaon="false" data-clientipaddress="<?=$_SERVER['SERVER_NAME']?>" data-redirecttohttp="true" roblox-js-usercheckcontrollerenabled="True">
 <div id="NotLoggedInPanel">
	<form name="aspnetForm" method="post" action="/Login/iFrameLogin.aspx?loginRedirect=True" id="aspnetForm">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMjA5OTM1NzI4OQ9kFgICAQ9kFgICARAWAh4GYWN0aW9uBV8vTG9naW4vaUZyYW1lTG9naW4uYXNweD9sb2dpblJlZGlyZWN0PVRydWUmcGFyZW50VXJsPWh0dHAlM2ElMmYlMmZ3d3cucm9ibG94LmNvbSUyZkRlZmF1bHQuYXNweGRkZOjOuPhJ8EIeHi/W+IoCC7LB7Q84"/>
</div>


<script src="/ScriptResource.axd?d=RgjPP8L_EePZNK3Fwy7aE27Vbbn9J24pujHaZHTAgaIgwmk41Rm6mBPdMeHbJEAMG0PoWGVcT6QLEU1_-XdpLJQDIQ2QAw_mYBztYWtpfscbAyI2IFf3VNF25p8fgKIENhsX8egJxbN8Tnf0rXTdKejGZyGp5mMcVCUwAX2NbaxEesFAPW6Zm_8FU6B0Y7JOZjqoPEoXehmdei29uH4F_TEhfyBicdwFFMfLuXjzrKfkT3pRegeIXsFAM14TOm_ZjQ-6cekngFhoxybxVTrjB3mEFP7LjgcILzhgV-fzU2TWz5Yk0" type="text/javascript"></script>
<script src="/Services/Secure/LoginService.asmx/js" type="text/javascript"></script>
<div>

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWAwLP/rbOCAKvruq2CALSxeCRD60enTXHuR8M6E2gwt+dRtrBbVyq"/>
</div>
        
        <div id="LoginForm">
            <div class="newLogin" id="newLoginContainer">  
				<form method="post"  action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
				<div class="UserNameDiv">
					<label class="LoginFormLabel" for="UserName">Username</label>
					<br>
					<input type="text" name="username" maxlength="20" value="<?=$login->username?>" name="UserName" id="UserName" class="LoginFormInput" tabindex="1" style="background-color: white;">
					<?=$form->error($error,"username")?>
				</div>
				<div class="PasswordDiv">
					<label class="LoginFormLabel" for="Password">Password</label>
					<a href="ResetPasswordRequest.aspx" target="_top" class="ResetPassword">Forgot password?</a>
					<br>
					<input type="password" name="password" maxlength="30" value="<?=$login->password?>" id="Password" class="LoginFormInput" style="width:152px;" tabindex="2">
					<?=$form->error($error,"password")?>
				</div>
				<div style="clear:both"></div>
                <div id="iFrameCaptchaControl">
                    
				</form>
                </div>
				<div id="ErrorMessage" style="color:Red"></div>
                <div class="LoginFormFieldSet">
					<span style="font: normal 12px arial;color: black;position: absolute;top: 50%;margin-top: -8px;">
						Not a member?
						<a href="NewAge.aspx" style="font: bold 12px Arial;color: #095FB5;" target="_top">Sign up!</a>
					</span>
					<span type="submit" id="LoginButtonActive">
						<a type="submit" id="LoginButton" tabindex="4" class="iFrameBlueLogin" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;LoginButton&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))"></a>
					</span>
					<span id="LoggingInStatus" style="display: none; font: bold 12px arial; position: absolute; right: 8px;margin-top: -11px;top: 50%;">
						<img src="https://s3.amazonaws.com/images.roblox.com/6ec6fa292c1dcdb130dcf316ac050719.gif" style="margin-right: 5px;width: 20px;height: 20px;" alt=""/>
						<span style="top: -5px;position: absolute;position: relative;">Logging in...</span>
					</span>
                </div>
            </div>
        </div>
    </form>
  </div>
	<script type="text/javascript">		
		$(function () {			
			Roblox.iFrameLogin.init();
		});
	</script>
</body>
</html>