<?php 
require $_SERVER["DOCUMENT_ROOT"] . "/global.php";
if(SESSION){ header("Location: /"); }

$page_config["CSSIncludes"] = 
[
    "css/Login.css",
    "css/LoginStatus.css",
    "css/FormView.css",
    "css/GridView.css"
];

$page_config["ScriptIncludes"] = 
[ 
    "jquery.validate.js",
    "jquery.validate.unobtrusive.js",
    "Login/Login.js",
    "GenericConfirmation.js"
];

$usernameErr = $passwordErr = false;
if($_SERVER['REQUEST_METHOD'] == 'POST')
{ 
  switch(false)
  {
    case isset($_POST['Username']): $usernameErr = "The Username field is required."; goto end; break;
    case isset($_POST['Password']): $passwordErr = "The Password field is required."; goto end; break;
  }

  $userInfo = getUserInfoFromName($_POST['Username']);
  if(!$userInfo){ $usernameErr = "User does not exist."; goto end; }

  $passwordQuery = $pdo->prepare("SELECT password FROM users WHERE id = :id");
  $passwordQuery->bindParam(":id", $userInfo->Id, PDO::PARAM_INT);
  $passwordQuery->execute();

  $passwordHash = $passwordQuery->fetch(PDO::FETCH_OBJ)->password;
  if(!password_verify($_POST['Password'], $passwordHash)){ $passwordErr = "Incorrect password."; goto end; }

  $ip = getIpAddress();

  $updateIp = $pdo->prepare("UPDATE users SET recentip = :ip WHERE id = :id");
  $updateIp->bindParam(":ip", $ip, PDO::PARAM_STR);
  $updateIp->bindParam(":id", $userInfo->Id, PDO::PARAM_INT);

  createSession($userInfo->Id);

  if(isset($_GET['ReturnUrl'])){ die(header("Location: ".$_GET['ReturnUrl'])); }
  die(header("Location: /My/Home.aspx"));
}
end:

require $_SERVER["DOCUMENT_ROOT"]."/puzzle/Top.php"; 
?> 
<!--[if IE 7]>
<style>        
  #signInButtonPanel a 
  {
  margin-right: 143px;
  }
</style>
<![endif]-->
<h1>Login to ROBLONIUM</h1>
<div>
  <form action="/newlogin<?php if(isset($_GET['ReturnUrl'])){ echo "?ReturnUrl=".htmlspecialchars($_GET['ReturnUrl']); } ?>" id="loginForm" method="post">
    <div id="loginarea" class="divider-bottom">
      <div id="leftArea">
        <div id="loginPanel">
          <table id="logintable">
            <tr id="username">
              <td><label class="form-label" for="Username">Username:</label></td>
              <td><input class="text-box text-box-medium" data-val="true" data-val-required="The Username field is required." id="Username" name="Username" type="text" value=""/></td>
              <?=$usernameErr?>
            </tr>
            <tr id="password">
              <td><label class="form-label" for="Password">Password:</label></td>
              <td><input class="text-box text-box-medium" data-val="true" data-val-required="The Password field is required." id="Password" name="Password" type="password"/></td>
              <?=$passwordErr?>
            </tr>
          </table>
          <div>
          </div>
          <div>
            <!--div id="forgotPasswordPanel">
              <a class="text-link" href="/web/20131102014148/https://www.roblox.com/Login/ResetPasswordRequest.aspx" target="_blank">Forgot your password?</a>
            </div-->
            <div id="signInButtonPanel">
              <a roblox-js-onclick class="btn-medium btn-neutral">Sign In</a>
              <a roblox-js-oncancel class="btn-medium btn-negative">Cancel</a>
            </div>
            <div class="clearFloats">
            </div>
          </div>
          <!--span id="fb-root">
            <div id="SplashPageConnect" class="fbSplashPageConnect">
              <a class="facebook-login" href="/web/20131102014148/https://www.roblox.com/Facebook/SignIn?returnTo=/My/Home.aspx" ref="form-facebook">
              <span class="left"></span>
              <span class="middle">Login with Facebook<span>Login with Facebook</span></span>
              <span class="right"></span>
              </a>       
            </div>
          </span-->
        </div>
      </div>
      <div id="rightArea" class="divider-left">
        <div id="signUpPanel" class="FrontPageLoginBox">
          <p class="text">Not a member?</p>
          <h2>Sign Up to Build &amp; Make Friends</h2>
          <p class="text">What is your birthday?</p>
          <select id="MonthSelect" class="form-select" name="Month">
            <option>Month</option>
          </select>
          <select id="DaySelect" class="form-select" name="Day">
            <option>Day</option>
          </select>
          <select id="YearSelect" class="form-select" name="Year">
            <option>Year</option>
          </select>
          <p class="footnote" id="disclaimer">Your birthday will not be given out to any third party!</p>
          <a roblox-js-onsignup class="btn-medium btn-primary">Sign Up</a>                    
        </div>
      </div>
    </div>
    <input id="ReturnUrl" name="ReturnUrl" type="hidden" value=""/>
  </form>
</div>
<script type="text/javascript">
  if (typeof Roblox === "undefined") {
      Roblox = {};
  }
  if (typeof Roblox.Login === "undefined") {
      Roblox.Login = {};
  }
  
  Roblox.Login.Resources = {
      //<sl:translate>
      january: "January"
  , february: "February"
  , march: "March"
  , april: "April"
  , may: "May"
  , june: "June"
  , july: "July"
  , august: "August"
  , september: "September"
  , october: "October"
  , november: "November"
  , december: "December"
      //</sl:translate>
  };
</script>
<!--div id="guestarea">
  <h2>You don't need an account to play ROBLOX</h2>
  <br/>
  <p class="text">You can start playing right now, in guest mode! <a href="/web/20131102014148/https://www.roblox.com/Games.aspx" class="btn-small btn-neutral" id="guestButton">Play as Guest</a></p>
</div-->
<script type="text/javascript">
  $(function() {{ RobloxEventManager.triggerEvent('rbx_evt_abtest', { experiment: 'MVCLoginPage', variation: 'MVCLoginPage'});}});
</script>
<div style="clear:both"></div>
<?php require $_SERVER["DOCUMENT_ROOT"]."/puzzle/Bottom.php"; ?> 