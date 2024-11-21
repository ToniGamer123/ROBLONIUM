<?php
session_start();
require $_SERVER["DOCUMENT_ROOT"] . "/Hexine/" . 'api/private/database.php';

require $_SERVER["DOCUMENT_ROOT"] . "/Hexine/" . 'api/private/register.php';
require $_SERVER["DOCUMENT_ROOT"] . "/Hexine/" . 'api/form.php';

$login = new login;
$error = Array();
if (isset($_POST["username"])){
	$login->username = $_POST["username"];
	$login->password = $_POST["password"];
	$account = $login->attempt();
	$error = $account["error"];
	if (isset($account["player"])){
		$_SESSION['player'] = $account["player"]; 
		header("Location: /welcome.php");
		die();
	}
}
$player = new Player($_SESSION['player'] );
if ($player->id !== 0){
	header("Location: /welcome.php");
	die();
}

?>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
				<style>
form {
	margin:0;	
}
body {
	font-family: 'Source Sans Pro', sans-serif;
}
input[type=text], select, input[type=password],input[type=email] {
  width: 100%;
  padding: 5px 15px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 15px 25px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  	width: 50%

}
</style>
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>

	</head>
	<body>
		<b><?=$player->username?></b>
		<h1>Login</h1>
		
		<div>
		<form method="post"  action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
			Username:<br>
			<input type="text" name="username" maxlength="20" value="<?=$login->username?>">
			<?=$form->error($error,"username")?>
			<br>
			Password:<br>
			<input type="password" name="password" maxlength="30" value="<?=$login->password?>">
			<?=$form->error($error,"password")?>
			<br><br>
			<input type="submit" value="Submit">
		</form> 
		</div>
	</body>
</html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Sign In</title>
	    
<link onerror='Roblox.BundleDetector && Roblox.BundleDetector.reportBundleError(this)' rel='stylesheet' href='https://static.rbxcdn.com/css/page___fa4e8d37c4c6db5665124f9ff74ba0f4_m.css/fetch' />

	    <script onerror='Roblox.BundleDetector && Roblox.BundleDetector.reportBundleError(this)' data-monitor='true'  type='text/javascript' src='//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js'></script>
<script type='text/javascript'>window.jQuery || document.write("<script type='text/javascript' src='/js/jquery/jquery-1.11.1.js'><\/script>")</script>
<script onerror='Roblox.BundleDetector && Roblox.BundleDetector.reportBundleError(this)' data-monitor='true'  type='text/javascript' src='//ajax.aspnetcdn.com/ajax/jquery.migrate/jquery-migrate-1.2.1.min.js'></script>
<script type='text/javascript'>window.jQuery || document.write("<script type='text/javascript' src='/js/jquery/jquery-migrate-1.2.1.js'><\/script>")</script>
<script onerror='Roblox.BundleDetector && Roblox.BundleDetector.reportBundleError(this)' data-monitor='true'  type='text/javascript' src='//ajax.aspnetcdn.com/ajax/4.0/1/MicrosoftAjax.js'></script>
<script type='text/javascript'>window.Sys || document.write("<script type='text/javascript' src='/js/Microsoft/MicrosoftAjax.js'><\/script>")</script>

	    <script onerror='Roblox.BundleDetector && Roblox.BundleDetector.reportBundleError(this)' data-monitor='true' data-bundlename='ideloginpage' type='text/javascript' src='https://js.rbxcdn.com/dafedeb76d50f05659ea7853b8b31b39.js.gzip'></script>

    </head>
    <body id="loginBody">
        

<div>


<div id="TwoStepVerificationApiPaths"
     data-request-code-unauthenticated="https://api.roblox.com/twostepverification/request-unauthenticated"
     data-request-code="https://api.roblox.com/twostepverification/request"
     data-verify-code-unauthenticated="https://api.roblox.com/twostepverification/verify-unauthenticated"
     data-verify-code="https://api.roblox.com/twostepverification/verify">
</div>

<div class="GenericModal modalPopup unifiedModal smallModal" style="display:none;">
    <div class="Title"></div>
    <div class="GenericModalBody">
        <div>
            <div class="ImageContainer">
                <img class="GenericModalImage" alt="generic image"/>
            </div>
            <div class="Message"></div>
        </div>
        <div class="clear"></div>
        <div id="GenericModalButtonContainer" class="GenericModalButtonContainer">
            <a class="ImageButton btn-neutral btn-large roblox-ok">OK</a>
        </div>
    </div>
</div>
        <form action="welcome.php" method="POST" id="loginForm">
<div class="validation-summary-valid" data-valmsg-summary="true"><ul><li style="display:none"></li>
</ul></div>
            <div id="loginarea" class="" data-is-captcha-on="False">
                <div id="leftArea">
                    <div id="loginPanel">
                        <table id="logintable" class="login-table">
                            <tr id="username">
                                <td class="label"><label class="form-label" for="Username">Username:</label></td>
                                <td class="input-box"><input class="text-box text-box-medium" data-val-required="You must enter a username." id="Username" name="username" type="text" aria-required="true" aria-invalid="false" value="<?=$login->username?>"></td>
								<?=$form->error($error,"username")?>
                            </tr>
                            <tr id="password">
                                <td class="label"><label class="form-label" for="Password">Password:</label></td>
                                <td class="input-box"><input class="text-box text-box-medium" data-val-required="You must enter a password." id="Password" name="password" type="password" aria-required="true" aria-invalid="false" value="<?=$login->password?>"></td>
								<?=$form->error($error,"password")?>
                            </tr>
                        </table>
                        <div id="captchaPanel">
                        </div>
                        <div class="sign-in-section">
                            <div id="forgotPasswordPanel">
                                <a class="text-link" href="/login/forgot-password-or-username/" target="_blank">Forgot password or username?</a>
                            </div>
                            <div id="signInButtonPanel">
                                <a  roblox-js-onclick class="btn-medium btn-disabled-neutral" disabled type="submit" value="Submit">Sign In</a>
                            </div>
                            <div class="clearFloats">
                            </div>
                        </div>
                                <span id="fb-root">
                                </span>
                    </div>
                </div>
                <div id="rightArea" class="divider-left">
                    <div id="signUpPanel" class="FrontPageLoginBox">
                        <p class="text">Not a member?</p>
                        <h2 class="sign-up-title">Sign Up to Build &amp; Make Friends</h2>
<a  roblox-js-onsignup href="/Login/NewAge.aspx" target="_blank" class="btn-medium btn-primary">Sign up</a>                    </div>
                </div>
            </div>
            <input id="ReturnUrl" name="ReturnUrl" type="hidden" value="/index.html" />
        </form>

</div>



<script src="https://www.google.com/recaptcha/api.js" async defer></script>


<script type="text/javascript">
    var Roblox = Roblox || {};
    Roblox.Login = Roblox.Login || {};

    Roblox.Login.Resources = {
        errors: {
            unknown: {
                code: 0,
                message: "An error occurred while logging in, please try again."
            },
            usernamePasswordRequired: {
                code: 1,
                message: "You must enter a valid username, and password."
            },
            captchaRequired: {
                code: 2,
                message: "You must pass the robot test before logging in."
            },
            invalidCredentials: {
                code: 3,
                message: "Incorrect username or password. Please try again."
            }
        },
        
        loginPageUrl: "/newlogin",
        loginApiUrl: "https://api.roblox.com/v2/login",
        twoStepVerificationPageUrl: "/login/twostepverification"
    };
</script>
<script type="text/javascript">
    $(function () {

        Roblox.Login.service.init(decodeURIComponent("https%3a%2f%2fwww.roblox.com%2fhome") || window.location.href);
        Roblox.Login.form.init(false);
    });
</script>
    </body>
</html>
