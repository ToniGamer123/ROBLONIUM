

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"><head>
<title>
	ROBLONIUM Login
</title>
<link rel="stylesheet" href="/roblonium.css"/>
<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
<script type="text/javascript">window.jQuery || document.write("<script type='text/javascript' src='/js/jquery/jquery-1.7.2.min.js'><\/script>")</script>
<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/4.0/1/MicrosoftAjax.js"></script>
<script type="text/javascript">window.Sys || document.write("<script type='text/javascript' src='/js/Microsoft/MicrosoftAjax.js'><\/script>")</script>

<script type="text/javascript" src="https://s3.amazonaws.com/js.roblox.com/2e475c35437312e8f6f1b424be676f37.js"></script>
</head>
<body style="background: #E1E1E1;" data-parent-url="/" data-captchaon="false" data-clientipaddress="<?=$_SERVER['SERVER_NAME']?>" data-redirecttohttp="true" roblox-js-usercheckcontrollerenabled="True">
 <div id="NotLoggedInPanel">
	<form name="FacebookLoginForm" method="post" action="/Login/iFrameLogin.aspx?loginRedirect=True&amp;parentUrl=http%3a%2f%2fwww.roblox.com%2findex.html" id="FacebookLoginForm">
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
                <div class="UserNameDiv">
                    <label class="LoginFormLabel" for="UserName">Username</label>
                    <br/><input name="UserName" type="text" id="UserName" class="LoginFormInput" name="UserName"/>
                </div>
                <div class="PasswordDiv">
                    <label class="LoginFormLabel" for="Password">Password</label>
					<a href="ResetPasswordRequest.aspx" target="_top" class="ResetPassword">Forgot password?</a>
                    <br/><input name="Password" type="password" id="Password" class="LoginFormInput" style="width:152px;"/>
                </div>
				<div style="clear:both"></div>
                <div id="iFrameCaptchaControl">
                    
                </div>
				<div id="ErrorMessage" style="color:Red"></div>
                <div class="LoginFormFieldSet">
					<span style="font: normal 12px arial;color: black;position: absolute;top: 50%;margin-top: -8px;">
						Not a member?
						<a href="NewAge.aspx" style="font: bold 12px Arial;color: #095FB5;" target="_top">Sign up!</a>
					</span>
					<span id="LoginButtonActive"><a id="LoginButton" tabindex="4" class="iFrameBlueLogin"></a></span>
					<span id="LoggingInStatus" style="display: none; font: bold 12px arial; position: absolute; right: 8px;margin-top: -11px;top: 50%;">
						<img src="https://s3.amazonaws.com/images.roblox.com/6ec6fa292c1dcdb130dcf316ac050719.gif" style="margin-right: 5px;width: 20px;height: 20px;" alt=""/>
						<span style="top: -5px;position: absolute;position: relative;">Logging in...</span>
					</span>
                </div>
            </div>
        </div>
	<script type="text/javascript">		
		$(function () {			
			Roblox.iFrameLogin.init();
		});
	</script>
</body>
</html>