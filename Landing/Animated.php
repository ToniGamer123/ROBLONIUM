<?php  
require $_SERVER['DOCUMENT_ROOT'].'/global.php';
if(SESSION){ header("Location: /My/Home.aspx"); }
$page_config["EnableSimpleContainer"] = true;
$page_config["EnableBanner"] = false;
$page_config["CSSIncludes"] = [
	
	"CSS/Pages/Accounts/AnimatedSignup.css",
	"CSS/Pages/Landing/Animated.css",
	"CSS/Pages/LandingSignUp.css"
];
$page_config["ScriptIncludes"] = 
[ 
    "Landing/Animated.js",
    "Landing/AnimatedLoginFormValidator.js",
    "Landing/AnimatedSignupFormValidator.js",
    "Landing/Animation.js"
];
require $_SERVER['DOCUMENT_ROOT'].'/puzzle/Top.php';
?>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script type="text/javascript">
    Roblox = Roblox || {};

    Roblox.Resources = Roblox.Resources || {};

    Roblox.Resources.AnimatedSignupFormValidator = {
        //<sl:translate>
        doesntMatch: "Doesn't match",
        requiredField: "Required",
        tooLong: "Too long",
        tooShort: "Too short",
        maxValid: "Too many accounts use this email",
        needsFourLetters: "Needs 4 letters",
        needsTwoNumbers: "Needs 2 numbers",
        noSpaces: "No spaces allowed",
        weakKey: "Weak key combination.",
        invalidName: "Can't be your character name",
        alreadyTaken: "Already taken",
        cantBeUsed: "Can't be used",
        invalidBirthday: "Invalid birthday",
        loginFieldsRequired: "Username and Password are required.",
        loginFieldsIncorrect: "Your username or password is incorrect."
        //</sl:translate>
    };
</script>
<style type="text/css">
    body {
        background: url("http://images.rbxcdn.com/437004fbc01bf6a613547a40aabde10a.jpg") repeat-x;
        padding-top: 35px;
    }
    #Container {
        background: url("http://images.rbxcdn.com/161d0d393d74c103e5f50eef988b7217.png") repeat-x;
    }
</style>
<div id="Experimental" class="ShadowedStandardBox" data-is-animated="True">
    <div class="Content">
        <div id="animatedHeader">
            <div id="headerLogo" style="width:246px;"><img src="https://cdn.discordapp.com/attachments/579328176556343316/740253622922903563/FullGreenWithDash.png" alt="logo" height="47" /></div>
            <div id="headerTextTop">Join millions of builders</div>
            <div id="headerTextBottom">and explore their creations</div>
        </div>
        <div id="animatedBodyWrapper">
            <div id="animatedBody">
                <div class="VideoContainer">
                    <!--object class="videoURL">
                        <param name="movie" value="//www.youtube.com/v/LHdA7Yc-8Rg?fs=1&amp;rel=0&amp;controls=0&amp;showinfo=0&amp;autoplay=1"/>
                        <param name="allowFullScreen" value="true" />
                        <param name="allowscriptaccess" value="always" />
                        <param name="wmode" value="transparent" />
                        <embed wmode="transparent" src="//www.youtube.com/v/LHdA7Yc-8Rg?fs=1&amp;rel=0&amp;controls=0&amp;showinfo=0&amp;autoplay=1" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" allownetworking="internal" width="380" height="250"></embed>
                    </object-->
					<iframe id="ytplayer" type="text/html" width="380" height="250"
					  src="https://www.youtube.com/embed/LHdA7Yc-8Rg?fs=1&rel=0&controls=0&showinfo=0&autoplay=1&origin=http://example.com"
					  frameborder="0">
					</iframe>
                    <div class="slogan-container">
                        <div id="slogan">What will you build?</div>
                    </div>
                </div>
                <div id="animated-wrapper" data-first-visit="True">
                    <div class="sign-up-row">
                        <div class="sign-up-inner-row">
                            <span id="animated-tab-signup" class="animated-tab">Sign up</span>
                            <span class="animated-tab">|</span>
                            <span id="animated-tab-login" class="animated-tab">Login</span>
                        </div>
                    </div>
                    <div id="animated-login" style="display: none;">
                        <form method="post" id="login-form" action="/newlogin"> <!-- /newlogin -->
                            <div class="sign-up-row">
                                <div class="sign-up-inner-row">
                                    <span id="login-error" class="required-text error" style="display: none;"></span>
                                </div>
                            </div>
                            <div class="sign-up-row">
                                <div>
                                    <input type="text" id="loginUsername" name="Username" class="text-box text-box-large" tabindex="1" placeholder="Username" />
                                </div>
                            </div>
                            <div class="sign-up-row">
                                <div>
                                    <input type="password" id="loginPassword" name="Password" class="text-box text-box-large" tabindex="2" placeholder="Password" />
                                </div>
                            </div>
                            <div>
                                <a  onclick="return Roblox.AnimatedLoginFormValidator.validateLoginForm();" tabindex="3" class="btn-large btn-primary" id="login-button">Login</a>
                            </div>
                        </form>
                        <br />
                        <div id="login-footer" class="sign-up-row">
                            <div class="sign-up-inner-row">
                                <a href="/Login/ResetPasswordRequest.aspx">Forgot your username/password?</a>
                            </div>
                            <div>
                                Don't have an account? <a href="#" onclick="$('#animated-tab-signup').click();"> Sign up</a>
                            </div>
                        </div>
                    </div>
                    <div id="animated-signup" style="display: none;">
                        <form method="post" id="signup-form" action="/hexine/register">
                            <div class="sign-up-row">
                                <div class="sign-up-inner-row">
                                    <span id="birthdayGood" class="good-text" style="display: none;">OK</span> <span
                                                                                                                   id="birthdayError" class="required-text error" style="display: none;"></span>
                                    <span id="birthdayText">Birthday</span>
                                </div>
                                <div>
                                    <select id="lstMonths" name="lstMonths" onchange="Roblox.AnimatedSignupFormValidator.checkBirthday()" tabindex="1"><option selected="selected" value="0">Month</option>
<option value="1">January</option>
<option value="2">February</option>
<option value="3">March</option>
<option value="4">April</option>
<option value="5">May</option>
<option value="6">June</option>
<option value="7">July</option>
<option value="8">August</option>
<option value="9">September</option>
<option value="10">October</option>
<option value="11">November</option>
<option value="12">December</option>
</select>
                                    <select id="lstDays" name="lstDays" onchange="Roblox.AnimatedSignupFormValidator.checkBirthday()" tabindex="2"><option selected="selected" value="0">Day</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
</select>
                                    <select id="lstYears" name="lstYears" onchange="Roblox.AnimatedSignupFormValidator.checkBirthday(false)" tabindex="3"><option selected="selected" value="0">Year</option>
<option value="2012">2012</option>
<option value="2011">2011</option>
<option value="2010">2010</option>
<option value="2009">2009</option>
<option value="2008">2008</option>
<option value="2007">2007</option>
<option value="2006">2006</option>
<option value="2005">2005</option>
<option value="2004">2004</option>
<option value="2003">2003</option>
<option value="2002">2002</option>
<option value="2001">2001</option>
<option value="2000">2000</option>
<option value="1999">1999</option>
<option value="1998">1998</option>
<option value="1997">1997</option>
<option value="1996">1996</option>
<option value="1995">1995</option>
<option value="1994">1994</option>
<option value="1993">1993</option>
<option value="1992">1992</option>
<option value="1991">1991</option>
<option value="1990">1990</option>
<option value="1989">1989</option>
<option value="1988">1988</option>
<option value="1987">1987</option>
<option value="1986">1986</option>
<option value="1985">1985</option>
<option value="1984">1984</option>
<option value="1983">1983</option>
<option value="1982">1982</option>
<option value="1981">1981</option>
<option value="1980">1980</option>
<option value="1979">1979</option>
<option value="1978">1978</option>
<option value="1977">1977</option>
<option value="1976">1976</option>
<option value="1975">1975</option>
<option value="1974">1974</option>
<option value="1973">1973</option>
<option value="1972">1972</option>
<option value="1971">1971</option>
<option value="1970">1970</option>
<option value="1969">1969</option>
<option value="1968">1968</option>
<option value="1967">1967</option>
<option value="1966">1966</option>
<option value="1965">1965</option>
<option value="1964">1964</option>
<option value="1963">1963</option>
<option value="1962">1962</option>
<option value="1961">1961</option>
<option value="1960">1960</option>
<option value="1959">1959</option>
<option value="1958">1958</option>
<option value="1957">1957</option>
<option value="1956">1956</option>
<option value="1955">1955</option>
<option value="1954">1954</option>
<option value="1953">1953</option>
<option value="1952">1952</option>
<option value="1951">1951</option>
<option value="1950">1950</option>
<option value="1949">1949</option>
<option value="1948">1948</option>
<option value="1947">1947</option>
<option value="1946">1946</option>
<option value="1945">1945</option>
<option value="1944">1944</option>
<option value="1943">1943</option>
<option value="1942">1942</option>
<option value="1941">1941</option>
<option value="1940">1940</option>
<option value="1939">1939</option>
<option value="1938">1938</option>
<option value="1937">1937</option>
<option value="1936">1936</option>
<option value="1935">1935</option>
<option value="1934">1934</option>
<option value="1933">1933</option>
<option value="1932">1932</option>
<option value="1931">1931</option>
<option value="1930">1930</option>
<option value="1929">1929</option>
<option value="1928">1928</option>
<option value="1927">1927</option>
<option value="1926">1926</option>
<option value="1925">1925</option>
<option value="1924">1924</option>
<option value="1923">1923</option>
<option value="1922">1922</option>
<option value="1921">1921</option>
<option value="1920">1920</option>
<option value="1919">1919</option>
<option value="1918">1918</option>
<option value="1917">1917</option>
<option value="1916">1916</option>
<option value="1915">1915</option>
<option value="1914">1914</option>
<option value="1913">1913</option>
</select>
                                </div>
                                <div>
                                    <span class="sign-up-description">
                                        Enter your birthday for a personalized experience.<br />
                                        It will not be given to any third party.
                                    </span>
                                </div>
                            </div>
                            <div class="sign-up-row">
                                <div class="sign-up-inner-row">
                                    <span id="genderGood" class="good-text" style="display: none;">OK</span>
                                    <span id="genderError" class="required-text error" style="display: none;"></span>
                                    <span id="genderText">Gender</span>
                                </div>
                                <div>
                                    <input id="MaleBtn" name="gender" onclick="Roblox.AnimatedSignupFormValidator.checkGender();" tabindex="4" type="radio" value="Male" />
                                    <label for="MaleBtn">Male</label>
                                    <input id="FemaleBtn" name="gender" onclick="Roblox.AnimatedSignupFormValidator.checkGender();" tabindex="5" type="radio" value="Female" />
                                    <label for="FemaleBtn">Female</label>
                                </div>
                            </div>
                            <div class="sign-up-row">
                                <div class="sign-up-inner-row">
                                    <span id="usernameGood" class="good-text" style="display: none;">OK</span>
                                    <span id="usernameError" class="required-text error" style="display: none;"></span>
                                    <span id="usernameText">Username</span>
                                </div>
                                <div>
                                    <input type="text" id="username" name="username" value="" class="text-box text-box-large" tabindex="6" onblur="Roblox.AnimatedSignupFormValidator.checkUsername()" />
                                </div>
                                <div>
                                    <span class="sign-up-description">3-20 alphanumeric characters, no spaces</span>
                                </div>
                            </div>
                            <div class="sign-up-row">
                                <div class="sign-up-inner-row">
                                    <span id="emailConfirmGood" class="good-text" style="display: none;">OK</span>
                                    <span id="emailConfirmError" class="required-text error" style="display: none;"></span>
                                    <span id="emailConfirmText">E-Mail</span>
                                </div>
                                <div>
                                    <input name="email" value="" id="username" class="text-box text-box-large" tabindex="7" type="text"/>
                                </div>
                            </div>
                            <div class="sign-up-row">
                                <div class="sign-up-inner-row">
                                    <span id="passwordGood" class="good-text" style="display: none;">OK</span>
                                    <span id="passwordError" class="required-text error" style="display: none;"></span>
                                    <span id="passwordText">Password</span>
                                </div>
                                <div>
                                    <input name="password" value="" id="password" class="text-box text-box-large" tabindex="8" type="password" onkeyup="Roblox.AnimatedSignupFormValidator.checkPassword();" />
                                </div>
                                <div>
                                    <span class="sign-up-description">6-20 characters, minimum of 4 letters & 2 numbers</span>
                                </div>
                            </div>
                            <div class="sign-up-row">
                                <div class="sign-up-inner-row">
                                    <span id="passwordConfirmGood" class="good-text" style="display: none;">OK</span>
                                    <span id="passwordConfirmError" class="required-text error" style="display: none;"></span>
                                    <span id="passwordConfirmText">Confirm Password</span>
                                </div>
                                <div>
                                    <input name="passwordConfirm" value="" id="passwordConfirm" class="text-box text-box-large" tabindex="9" type="password" onkeyup="Roblox.AnimatedSignupFormValidator.checkPasswordConfirm();" />
                                </div>
                            </div>
                            <div class="sign-up-row">
                                <div class="sign-up-inner-row">
                                    <span id="reCaptchaConfirmGood" class="good-text" style="display: none;">OK</span>
                                    <span id="reCaptchaConfirmError" class="required-text error" style="display: none;"></span>
                                    <span id="reCaptchaConfirmText">ReCAPTCHA</span>
                                </div>
                                <div>
                                    <div class="g-recaptcha" data-sitekey="6Lc2YbMZAAAAAENm5tKCkYbgzRA3uPK9Fd4PKntT"></div>
                                </div>
                            </div>
                            <div>
                                <a  onclick="return Roblox.AnimatedSignupFormValidator.validateForm();" tabindex="10" class="btn-large btn-primary roblox-signup" id="SignUpButton">Sign Up</a>
                            </div>
                        </form>
                    </div>
                    <script type="text/javascript"> 
                        if (typeof Roblox === "undefined") {
                            Roblox = {};
                        }

                        $(".roblox-signup").click(function() {
                            if(Roblox.AnimatedSignupFormValidator.validateForm())
                            {
                                $('#signup-form').submit();
                            }
                        });
        
                        $("#lstMonths").val();
                        $("#lstDays").val();
                        $("#lstYears").val();
        
;
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
 <div ID="AdWordConversionTracker" runat="server">
   <!-- Google Code for General Remarketing Remarketing List --> 
   <script type="text/javascript">
       var google_conversion_id = 1065449093;
       var google_conversion_language = "en";
       var google_conversion_format = "3";
       var google_conversion_color = "666666";
       var google_conversion_label = "A-sJCLfZnQIQhe2F_AM";
       var google_conversion_value = 0; 
    </script> 
    <script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js"> </script> 
    <noscript> 
        <div style="display:inline;"> <img height="1" width="1" style="border-style:none;display:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1065449093/?label=A-sJCLfZnQIQhe2F_AM&amp;guid=ON&amp;script=0"/> </div> 
    </noscript>
</div>
            </div>

    <div class="Footer Experimental">
        <div class="FooterContent">
            <p class="FooterParagraph">
                    <a href="http://blog.roblox.com" ref="landingsignup-blog">Blog</a> &nbsp;|&nbsp; <a href="/Info/Privacy.aspx" ref="landingsignup-privacy">Privacy Policy</a> &nbsp;|&nbsp; <a href="/Parents.aspx" ref="landingsignup-parents">Parents</a> &nbsp;|&nbsp; <a href="/Help/Builderman.aspx" ref="landingsignup-help">Help</a>    
            </p>
            <div class="FooterLegaleseContainer">
                <p class="Legalese">
    ROBLOX, "Online Building Toy", characters, logos, names, and all related indicia are trademarks of <a href="http://corp.roblox.com/" ref="footer-smallabout" class="roblox-interstitial">ROBLOX Corporation</a>, ©2013. Patents pending.
    ROBLOX is not sponsored, authorized or endorsed by any producer of plastic building bricks, including The LEGO Group, MEGA Brands, and K'Nex, and no resemblance to the products of these companies is intended. Use of this site signifies your acceptance of the <a href="/info/terms-of-service" ref="footer-terms">Terms and Conditions</a>.
</p>
            </div>
        </div>
    </div>
        </div> 
        

<script type="text/javascript">
$(function(){
    function trackReturns() {
	    function dayDiff(d1, d2) {
		    return Math.floor((d1-d2)/86400000);
	    }

	    var cookieName = 'RBXReturn';
	    var cookieOptions = {expires:9001};
        var cookie = $.getJSONCookie(cookieName);

	    if (typeof cookie.ts === "undefined" || isNaN(new Date(cookie.ts))) {
	        $.setJSONCookie(cookieName, { ts: new Date().toDateString() }, cookieOptions);
		    return;
	    }

	    var daysSinceFirstVisit = dayDiff(new Date(), new Date(cookie.ts));
	    if (daysSinceFirstVisit == 1 && typeof cookie.odr === "undefined") {
		    RobloxEventManager.triggerEvent('rbx_evt_odr', {});
		    cookie.odr = 1;
	    }
	    if (daysSinceFirstVisit >= 1 && daysSinceFirstVisit <= 7 && typeof cookie.sdr === "undefined") {
		    RobloxEventManager.triggerEvent('rbx_evt_sdr', {});
		    cookie.sdr = 1;
	    }
	
	    $.setJSONCookie(cookieName, cookie, cookieOptions);
    }

    
        RobloxListener.restUrl = window.location.protocol + "//" + "roblox.com/Game/EventTracker.ashx";
        RobloxListener.init();
    
    
        GoogleListener.init();
    
    
    
    
        RobloxEventManager.initialize(true);
        RobloxEventManager.triggerEvent('rbx_evt_pageview');
        trackReturns();
    
    
    
        RobloxEventManager._idleInterval = 450000;
        RobloxEventManager.registerCookieStoreEvent('rbx_evt_initial_install_start');
        RobloxEventManager.registerCookieStoreEvent('rbx_evt_ftp');
        RobloxEventManager.registerCookieStoreEvent('rbx_evt_initial_install_success');
        RobloxEventManager.registerCookieStoreEvent('rbx_evt_fmp');
        RobloxEventManager.startMonitor();
    

});

</script>


        
        <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
        <script type="text/javascript">
            _uacct = "UA-486632-1";
            _udn = "roblox.com";
            _uccn = "rbx_campaign";
            _ucmd = "rbx_medium";
            _ucsr = "rbx_source";
            urchinTracker();
            __utmSetVar('Visitor/Anonymous');
        </script>

        <script type="text/javascript">
    $(function () {
        Roblox.JSErrorTracker.initialize({'internalEventListenerPixelEnabled': true});
    });
</script>
        
<script type='text/javascript' src='http://js.rbxcdn.com/bc33dcc66abb64fa33b8b05d5c816b95.js'></script>

        
<script type='text/javascript' src='http://js.rbxcdn.com/cf0a4de6bea8841d61e18caecdc6a32d.js'></script>

            <img src="https://secure.adnxs.com/seg?add=550800&t=2" width="1" height="1" style="display:none;"/>

        <script type="text/javascript">
            $(function () {
                $('.tooltip').tipsy();
                $('.tooltip-top').tipsy({ gravity: 's' });
                $('.tooltip-right').tipsy({ gravity: 'w' });
                $('.tooltip-left').tipsy({ gravity: 'e' });
                $('.tooltip-bottom').tipsy({ gravity: 'n' });
            });
        </script>
    </body>
</html>