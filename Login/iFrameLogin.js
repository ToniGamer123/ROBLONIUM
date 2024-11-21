;// bundle: iframelogin___274dae7b4390e607f63999621b6f432c_m
;// files: jquery.ba-postmessage.min.js, iFrameLogin.js

;// jquery.ba-postmessage.min.js
/*
 * jQuery postMessage - v0.5 - 9/11/2009
 * http://benalman.com/projects/jquery-postmessage-plugin/
 * 
 * Copyright (c) 2009 "Cowboy" Ben Alman
 * Dual licensed under the MIT and GPL licenses.
 * http://benalman.com/about/license/
 */
(function($){var g,d,j=1,a,b=this,f=!1,h="postMessage",e="addEventListener",c,i=b[h]&&!$.browser.opera;$[h]=function(k,l,m){if(!l){return}k=typeof k==="string"?k:$.param(k);m=m||parent;if(i){m[h](k,l.replace(/([^:]+:\/\/[^\/]+).*/,"$1"))}else{if(l){m.location=l.replace(/#.*$/,"")+"#"+(+new Date)+(j++)+"&"+k}}};$.receiveMessage=c=function(l,m,k){if(i){if(l){a&&c();a=function(n){if((typeof m==="string"&&n.origin!==m)||($.isFunction(m)&&m(n.origin)===f)){return f}l(n)}}if(b[e]){b[l?e:"removeEventListener"]("message",a,f)}else{b[l?"attachEvent":"detachEvent"]("onmessage",a)}}else{g&&clearInterval(g);g=null;if(l){k=typeof m==="number"?m:typeof k==="number"?k:100;g=setInterval(function(){var o=document.location.hash,n=/^#?\d+&/;if(o!==d&&n.test(o)){d=o;l({data:o.replace(n,"")})}},k)}}}})(jQuery);

; // iFrameLogin.js
typeof Roblox == "undefined" && (Roblox = {}), Roblox.iFrameLogin = new function() {
    function n() {
        var h = $(document.body).data("clientipaddress"),
            s = $(document.body).data("redirecttohttp"),
            t = $(document.body).data("captchaon"),
            u = !1,
            i = !0,
            r = function(n) {
                var t = $(document.body).data("parent-url");
                $.postMessage("resize," + n, t, parent)
            };
        t ? r("265px") : r("128px");
        var f = function(n) {
                n ? ($("#LoginButton").hide(), $("#LoggingInStatus").show()) : ($("#LoginButton").show(), $("#LoggingInStatus").hide())
            },
            c = function() {
                var r = !1,
                    i = [$("#Password"), $("#UserName")];
                return t && i.push($("#recaptcha_response_field")), jQuery.each(i, function() {
                    var t = $(this);
                    t.val() == "" ? (n(t, !0), r = !0) : n(t, !1)
                }), r
            },
            n = function(n, t) {
                u = !1, f(!1), t ? n.css({
                    "background-color": "#FDD"
                }) : n.css({
                    "background-color": "white"
                })
            },
            e = function() {
                var a;
                if (c()) return !1;
                if (i) return n($("#UserName"), !0), !1;
                u = !0, f(!0);
                var v = $("#Password").val(),
                    o = $("#UserName").val(),
                    l = "",
                    e = "";
                if (t && (l = $("#recaptcha_challenge_field").val(), e = $("#recaptcha_response_field").val(), l == "" || e == "")) return n($("#recaptcha_response_field"), !0), !1;
                t && $("#Captcha_upBadCaptcha").text(""), a = onError = function(i) {
                    if (i.IsValid)
                        if (s) window.location = "/LoginRedirect.aspx";
                        else {
                            var h = window.top.location.href;
                            h.indexOf("#") != -1 && (h = window.top.location.href.split("#")[0]), h += h.indexOf("?") == -1 ? "?nl=true" : "&nl=true", window.top.location = h
                        }
                    else return i.Message.indexOf("CaptchaChanged") != -1 ? (o != "" && window.location.href.indexOf("username") == -1 ? window.location.href = window.location.href + "&username=" + o : window.location.reload(), !1) : (i.Message.indexOf("Incorrect credentials") != -1 ? n($("#Password"), !0) : i.Message.indexOf("Error Occurred") != -1 ? (r("145px"), $("#ErrorMessage").text(i.Message)) : (r("280px"), n($("#Password"), !1), $("#Captcha_upBadCaptcha").show(), $("#Captcha_upBadCaptcha").css("color", "red"), i.Message == "incorrect-captcha-sol" ? $("#Captcha_upBadCaptcha").text("Invalid Captcha entry") : $("#Captcha_upBadCaptcha").text(i.Message)), t && Recaptcha.reload("t"), $("#Password").val(""), $("#Password").focus(), u = !1, f(!1), !1)
                }, Roblox.Website.Services.Secure.LoginService.ValidateLogin(o, v, t, l, e, h, a, onError)
            },
            o = function() {
                var t = $("#UserName").val(),
                    u, r;
                t = t.replace(/ /g, ""), $("#UserName").val(t), u = $("body").attr("roblox-js-usercheckcontrollerenabled") == "True", r = onError = function(t) {
                    u ? (n($("#UserName"), !t.success), i = !t.success) : (n($("#UserName"), !t), i = !t)
                }, t != "" && (u ? $.ajax({
                    type: "GET",
                    url: "/UserCheck/doesusernameexist?username=" + t,
                    success: onError,
                    error: onError
                }) : Roblox.Website.Services.UserCheck.DoesUserNameExist(t, r, onError, this))
            };
        $("#LoginButton").click(function() {
            e()
        }), $("#UserName").blur(function() {
            o()
        }), $(document).keydown(function(n) {
            if (n.which == 13 && !u) return e(), !1
        }), $(function() {
            var n = 1;
            $("input,select").each(function() {
                if (this.type != "hidden") {
                    var t = $(this);
                    t.attr("tabindex", n), n++
                }
            })
        }), $(function() {
            $("#UserName").val() != "" || $("#UserName").val() != undefined, i = !1
        }), $(function() {
            $("#CaptchaContainer").css({
                "margin-left": "0",
                "margin-top": "8px",
                width: "none"
            })
        })
    }
    return {
        init: n
    }
};
