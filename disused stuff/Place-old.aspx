<?php 
  require_once $_SERVER['DOCUMENT_ROOT']."/Hexine/api/core_functions.php";
  if(!isset($_GET['ID'])){ die(header("Location: /Games.aspx")); }
  if(!filter_var($_GET['ID'], FILTER_VALIDATE_INT)){ die(header("Location: /RobloniumDefaultErrorPage.aspx?code=400")); }
  
  $placeinfo = getMarketplaceInfo($_GET['ID']);

  if(!$placeinfo){ die(header("Location: /RobloniumDefaultErrorPage.aspx?code=404")); }
  if($placeinfo->AssetTypeId != 9){ die(header("Location: /Item.aspx?ID=".$_GET['ID'])); }

  $ThumbnailUrl = "/Game/Tools/ThumbnailAsset.ashx?aid=".$placeinfo->AssetId."&fmt=png&wd=420&ht=420";
  $CreatorInfo = getUserInfoFromUid($placeinfo->CreatorId);
  $Creator = $CreatorInfo->Name;
  $CreatorJoined = formatDate($CreatorInfo->Joined);  
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,requiresActiveX=true"/>
  <title>
    <?=$placeinfo->Name?> - ROBLONIUM
  </title>
  <link rel="stylesheet" href="/CSS/Pages/VotingPanel.css"/>
  <link rel="stylesheet" href="/CSS/Base/CSS/AdFormatClasses.css"/>
  <link rel="stylesheet" href="/CSS/Pages/GamePage.css"/>
  <link rel="stylesheet" href="/roblonium1.css"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="/favicon.ico"/>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta http-equiv="Content-Language" content="en-us"/>
  <meta name="author" content="ROBLONIUM"/>
  <meta id="ctl00_metadescription" name="description" content="<?=$placeinfo->Name?> - ROBLONIUM: <?=$placeinfo->Description?>"/>
  <meta id="ctl00_metakeywords" name="keywords" content="Roblonium, Revival"/>
  <!--script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-11419793-1']);
    _gaq.push(['_setCampSourceKey', 'rbx_source']);
    _gaq.push(['_setCampMediumKey', 'rbx_medium']);
    _gaq.push(['_setCampContentKey', 'rbx_campaign']);
    
    
    _gaq.push(['b._setAccount', 'UA-486632-1']);
    _gaq.push(['b._setCampSourceKey', 'rbx_source']);
    _gaq.push(['b._setCampMediumKey', 'rbx_medium']);
    _gaq.push(['b._setCampContentKey', 'rbx_campaign']);
    _gaq.push(['c._setAccount', 'UA-26810151-2']);
    
    (function() {
    	var ga = document.createElement('script');
    	ga.type = 'text/javascript';
    	ga.async = true;
    	ga.src = ('https:' == document.location.protocol ? 'https://ssl/' : 'http://www') + '.google-analytics.com/ga.js';
    	var s = document.getElementsByTagName('script')[0];
    	s.parentNode.insertBefore(ga, s);
    })();
    
    </script-->
  <?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/ScriptGlobals.php";?>
  <link href="/WebResource.axd?d=detUpxO_GqYx9fTEWntD6sXSmZPuDUQMGOHsP1WfiW_SuVtqIaxqq4_Itf-rz62w9ZLHwfCzUT2tuyKHZl74pSWFn_6Dw_CSTWVhmCz2a7hVlL72doCwqHuE6XIDTa8xUifI6ugB65PHDoqKVup2l8E3gJ01&amp;t=634898947834544599" type="text/css" rel="stylesheet"/>
  <meta property="og:title" content="<?=$placeinfo->Name?>, a Free Game by <?=$Creator?> - ROBLONIUM (updated <?=$placeinfo->Updated?>)"/>
  <meta property="og:type" content="Game"/>
  <meta property="og:url" content="/Place?id=<?=$placeinfo->AssetId?>"/>
  <meta property="og:site_name" content="ROBLONIUM"/>
  <meta property="fb:app_id" content="190191627665278"/>
  <meta property="og:description" content=": <?=$placeinfo->Description?>"/>
  <meta property="og:image" content="/images/roblox_R_logo_44x.png"/>
  </head>
  <body>
    <!--script type="text/javascript">Roblox.XsrfToken.setToken('');</script-->
    <script type="text/javascript">
      if (top.location != self.location) {
          top.location = self.location.href;
      }
    </script>
    <style type="text/css">
    </style>
    <form name="aspnetForm" method="post" action="/Place?id=<?=$placeinfo->AssetId?>" id="aspnetForm">
    <div>
      <input type="hidden" name="ctl00_cphRoblox_TabbedInfo_ClientState" id="ctl00_cphRoblox_TabbedInfo_ClientState" value="{&quot;ActiveTabIndex&quot;:0,&quot;TabState&quot;:[true,true,true,true]}"/>
      <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTAxMTg2Njk4MQ9kFgJmD2QWAgIBEBYCHgZhY3Rpb24FPi9XaGVuLXRoZS1CYWxsemVzLUNvbWUtVjEtMjktRklYRUQtT1JJR0lOQUwtcGxhY2U/aWQ9MTEzMzU3NjAyZBYKAgMPDxYCHgdWaXNpYmxlaGQWAmYPZBYIAgEPEA8WAh4LXyFEYXRhQm91bmRnZGQWAGQCAg8QDxYCHwJnZGQWAWZkAgMPEA8WAh8CZ2RkFgFmZAIEDxAPFgIfAmdkZBYBZmQCBA8PFgIfAWhkZAILDw8WAh8BaGRkAg4PZBYuAgEPFQENbmV3LWdhbWUtcGFnZWQCAw9kFihmDxUBLFdoZW4gdGhlIEJhbGx6ZXMgQ29tZSBWMS4yOSBGSVhFRCAoT1JJR0lOQUwpZAIBDxYCHwFoFgYCBQ8WAh8BaGQCCQ8WAh8BaGQCCw8WAh8BaGQCAg9kFggCAQ8VAQM1MDBkAgIPFQIDMjgwAzUwMGQCAw8PZBYCHg1BbHRlcm5hdGVUZXh0BSxXaGVuIHRoZSBCYWxsemVzIENvbWUgVjEuMjkgRklYRUQgKE9SSUdJTkFMKRYEAgEPDxYQHgZIZWlnaHQbAAAAAACAcUABAAAAHgVXaWR0aBsAAAAAAEB/QAEAAAAeCENzc0NsYXNzBQwgbm90cmFuc2xhdGUeCklzVXJsRmluYWxnHghJbWFnZVVybAU3aHR0cDovL3Q0YWsucm9ibG94LmNvbS9kZWIzMTVjYmI3YTEyYjA1ZDQ4YTgxOTMyN2Q4MmQyOR4LQ29tbWFuZE5hbWVlHg9Db21tYW5kQXJndW1lbnRkHgRfIVNCAoIDZGQCAg8WBB4GaGVpZ2h0BQMyODAeBXdpZHRoBQM1MDBkAgQPFgQeC18hSXRlbUNvdW50AgIfAWcWBAIBD2QWBmYPFQIaU2VsZWN0ZWRZb3VUdWJlR2FsbGVyeUljb24GNDYxMjY5ZAIBDw8WBB8KBQY0NjEyNjkfAWhkZAIDD2QWBAIBDw8WEB8EGwAAAAAAgFFAAQAAAB8FGwAAAAAAAF5AAQAAAB8GBQwgbm90cmFuc2xhdGUfB2cfCAU3aHR0cDovL3Q0YWsucm9ibG94LmNvbS9kZWIzMTVjYmI3YTEyYjA1ZDQ4YTgxOTMyN2Q4MmQyOR8JZR8KZB8LAoIDZGQCAg8WBB8MBQI3MB8NBQMxMjBkAgIPZBYGZg8VAgAGNDYxMjQwZAIBDw8WBB8KBQY0NjEyNDAfAWhkZAIDD2QWBAIBDw8WEB8EGwAAAAAAgFFAAQAAAB8FGwAAAAAAAF5AAQAAAB8GBQwgbm90cmFuc2xhdGUfB2cfCAU3aHR0cDovL3Q3YWsucm9ibG94LmNvbS9lMGEwODM3NWJiZDA2NDkxOGM3MDI4N2Q3MzE1OWZjMh8JZR8KZB8LAoIDZGQCAg8WBB8MBQI3MB8NBQMxMjBkAgMPFgIfAWhkAgUPFQEKbG9nZ2VkLW91dGQCBg8WBh4FY2xhc3MFGUFkZFJlbW92ZUZhdm9yaXRlIHRvb2x0aXAeDm9yaWdpbmFsLXRpdGxlBRBBZGQgdG8gRmF2b3JpdGVzHwFoZAIIDxUCkAZFWFAgQU5EIFBMQVkgQU5ZV0FZIEZJWEVEIEZJTkFMTFkhICA6RCAgQSBuZXcgc3BlY2llcyBoYXMgYmVlbiBkaXNjb3ZlcmVkLi4uICBUaGV5IGFyZSBiaWdnZXIgYW5kIHN0cm9uZ2VyIHRoYW4gdXMuLi4gIEZpZ2h0IHRoZW0gYW5kIHVwZ3JhZGUgeW91ciB3ZWFwb25zLCBzcGVlZCwgYW5kIGhlYWx0aCB0byBiZSBhYmxlIHRvIGRlZmVhdCB0aGVtIGVhc2llciENCg0KVXBkYXRlczoNCkVYUEVSSUVOQ0UgQU5EIFBMQVkgQU5ZV0FZIEZJTkFMTFkgRklYRUQhICA6RA0KRml4ZWQgRmxvYXRpbmcgSXNsYW5kcw0KQm9zcyBub3cgZWFzaWVyIHRvIGRlZmVhdC4gIChGb3IgYmVnaW5uZXJzLikNCkV4cGFuZGVkIGxvYmJ5IGFuZCBzcGVjdGF0aW5nIGFyZWEuDQpJRiBZT1UgQVJFIFdPTkRFUklORyBXSEVSRSBDUkVFUEVSIEJBTExaRVMgV0VOVCwgSSBBQ0NJREVOVExZIFJFTEVBU0VEIFRIRU0uICBUSEVZIEFSRSBOT1QgVkVSWSBTVEFCTEUgU08gSSBORUVERUQgVE8gUkVNT1ZFIFRIRU0hDQoNCklmIHlvdSBhcmUgb24gYSBzZXJ2ZXIgd2hlcmUgYmFsbHplcyBhcmUgbm90IG1vdmluZywgaXQgd2FzIGhhY2tlZC4gIFJlcG9ydCBhbGwgaGFja2VycyB0byBtZSBhbmQgUm9ibG94Lg0KDQpJZiB5b3UgYnV5IGEgZ2FtZSBwYXNzLCBpdCBtYXkgdGFrZSB1cCB0byBhIGRheSB0byBnaXZlIHlvdSBpdC4gIElmIHlvdSBidXkgb25lIGluLWdhbWUsIGl0IHdpbGwgZ2l2ZSB5b3UgaXQgdW50aWwgeW91IHJlam9pbi4gIFRoaXMgaXMgUm9ibG94J3MgcHJvYmxlbSBhbmQgbm90IG1pbmUhkAZFWFAgQU5EIFBMQVkgQU5ZV0FZIEZJWEVEIEZJTkFMTFkhICA6RCAgQSBuZXcgc3BlY2llcyBoYXMgYmVlbiBkaXNjb3ZlcmVkLi4uICBUaGV5IGFyZSBiaWdnZXIgYW5kIHN0cm9uZ2VyIHRoYW4gdXMuLi4gIEZpZ2h0IHRoZW0gYW5kIHVwZ3JhZGUgeW91ciB3ZWFwb25zLCBzcGVlZCwgYW5kIGhlYWx0aCB0byBiZSBhYmxlIHRvIGRlZmVhdCB0aGVtIGVhc2llciENCg0KVXBkYXRlczoNCkVYUEVSSUVOQ0UgQU5EIFBMQVkgQU5ZV0FZIEZJTkFMTFkgRklYRUQhICA6RA0KRml4ZWQgRmxvYXRpbmcgSXNsYW5kcw0KQm9zcyBub3cgZWFzaWVyIHRvIGRlZmVhdC4gIChGb3IgYmVnaW5uZXJzLikNCkV4cGFuZGVkIGxvYmJ5IGFuZCBzcGVjdGF0aW5nIGFyZWEuDQpJRiBZT1UgQVJFIFdPTkRFUklORyBXSEVSRSBDUkVFUEVSIEJBTExaRVMgV0VOVCwgSSBBQ0NJREVOVExZIFJFTEVBU0VEIFRIRU0uICBUSEVZIEFSRSBOT1QgVkVSWSBTVEFCTEUgU08gSSBORUVERUQgVE8gUkVNT1ZFIFRIRU0hDQoNCklmIHlvdSBhcmUgb24gYSBzZXJ2ZXIgd2hlcmUgYmFsbHplcyBhcmUgbm90IG1vdmluZywgaXQgd2FzIGhhY2tlZC4gIFJlcG9ydCBhbGwgaGFja2VycyB0byBtZSBhbmQgUm9ibG94Lg0KDQpJZiB5b3UgYnV5IGEgZ2FtZSBwYXNzLCBpdCBtYXkgdGFrZSB1cCB0byBhIGRheSB0byBnaXZlIHlvdSBpdC4gIElmIHlvdSBidXkgb25lIGlu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FgICAQ8PFgIfAWhkFgJmDxUCEVBlcnNvbmFsVHJhbnNwb3J0ElBlcnNvbmFsIFRyYW5zcG9ydGQCEw9kFgJmDw8WAh8BaGQWAgIBDw8WAh8BaGRkAhQPZBYEAgEPFgIfGQWQBkVYUCBBTkQgUExBWSBBTllXQVkgRklYRUQgRklOQUxMWSEgIDpEICBBIG5ldyBzcGVjaWVzIGhhcyBiZWVuIGRpc2NvdmVyZWQuLi4gIFRoZXkgYXJlIGJpZ2dlciBhbmQgc3Ryb25nZXIgdGhhbiB1cy4uLiAgRmlnaHQgdGhlbSBhbmQgdXBncmFkZSB5b3VyIHdlYXBvbnMsIHNwZWVkLCBhbmQgaGVhbHRoIHRvIGJlIGFibGUgdG8gZGVmZWF0IHRoZW0gZWFzaWVyIQ0KDQpVcGRhdGVzOg0KRVhQRVJJRU5DRSBBTkQgUExBWSBBTllXQVkgRklOQUxMWSBGSVhFRCEgIDpEDQpGaXhlZCBGbG9hdGluZyBJc2xhbmRzDQpCb3NzIG5vdyBlYXNpZXIgdG8gZGVmZWF0LiAgKEZvciBiZWdpbm5lcnMuKQ0KRXhwYW5kZWQgbG9iYnkgYW5kIHNwZWN0YXRpbmcgYXJlYS4NCklGIFlPVSBBUkUgV09OREVSSU5HIFdIRVJFIENSRUVQRVIgQkFMTFpFUyBXRU5ULCBJIEFDQ0lERU5UTFkgUkVMRUFTRUQgVEhFTS4gIFRIRVkgQVJFIE5PVCBWRVJZIFNUQUJMRSBTTyBJIE5FRURFRCBUTyBSRU1PVkUgVEhFTSENCg0KSWYgeW91IGFyZSBvbiBhIHNlcnZlciB3aGVyZSBiYWxsemVzIGFyZSBub3QgbW92aW5nLCBpdCB3YXMgaGFja2VkLiAgUmVwb3J0IGFsbCBoYWNrZXJzIHRvIG1lIGFuZCBSb2Jsb3guDQoNCklmIHlvdSBidXkgYSBnYW1lIHBhc3MsIGl0IG1heSB0YWtlIHVwIHRvIGEgZGF5IHRvIGdpdmUgeW91IGl0LiAgSWYgeW91IGJ1eSBvbmUgaW4tZ2FtZSwgaXQgd2lsbCBnaXZlIHlvdSBpdCB1bnRpbCB5b3UgcmVqb2luLiAgVGhpcyBpcyBSb2Jsb3gncyBwcm9ibGVtIGFuZCBub3QgbWluZSFkAgMPFgIfGQWQBkVYUCBBTkQgUExBWSBBTllXQVkgRklYRUQgRklOQUxMWSEgIDpEICBBIG5ldyBzcGVjaWVzIGhhcyBiZWVuIGRpc2NvdmVyZWQuLi4gIFRoZXkgYXJlIGJpZ2dlciBhbmQgc3Ryb25nZXIgdGhhbiB1cy4uLiAgRmlnaHQgdGhlbSBhbmQgdXBncmFkZSB5b3VyIHdlYXBvbnMsIHNwZWVkLCBhbmQgaGVhbHRoIHRvIGJlIGFibGUgdG8gZGVmZWF0IHRoZW0gZWFzaWVyIQ0KDQpVcGRhdGVzOg0KRVhQRVJJRU5DRSBBTkQgUExBWSBBTllXQVkgRklOQUxMWSBGSVhFRCEgIDpEDQpGaXhlZCBGbG9hdGluZyBJc2xhbmRzDQpCb3NzIG5vdyBlYXNpZXIgdG8gZGVmZWF0LiAgKEZvciBiZWdpbm5lcnMuKQ0KRXhwYW5kZWQgbG9iYnkgYW5kIHNwZWN0YXRpbmcgYXJlYS4NCklGIFlPVSBBUkUgV09OREVSSU5HIFdIRVJFIENSRUVQRVIgQkFMTFpFUyBXRU5ULCBJIEFDQ0lERU5UTFkgUkVMRUFTRUQgVEhFTS4gIFRIRVkgQVJFIE5PVCBWRVJZIFNUQUJMRSBTTyBJIE5FRURFRCBUTyBSRU1PVkUgVEhFTSENCg0KSWYgeW91IGFyZSBvbiBhIHNlcnZlciB3aGVyZSBiYWxsemVzIGFyZSBub3QgbW92aW5nLCBpdCB3YXMgaGFja2VkLiAgUmVwb3J0IGFsbCBoYWNrZXJzIHRvIG1lIGFuZCBSb2Jsb3guDQoNCklmIHlvdSBidXkgYSBnYW1lIHBhc3MsIGl0IG1heSB0YWtlIHVwIHRvIGEgZGF5IHRvIGdpdmUgeW91IGl0LiAgSWYgeW91IGJ1eSBvbmUgaW4tZ2FtZSwgaXQgd2lsbCBnaXZlIHlvdSBpdCB1bnRpbCB5b3UgcmVqb2luLiAgVGhpcyBpcyBSb2Jsb3gncyBwcm9ibGVtIGFuZCBub3QgbWluZSFkAhcPDxYIHwYFEUFkZFJlbW92ZUZhdm9yaXRlHxkFEEFkZCB0byBGYXZvcml0ZXMfCwICHwFoFgIeBVN0eWxlZWQCGA8WAh8BaGQCGg8VAQlpbnZpc2libGVkAhwPFQEWcmVkZXNpZ24gdGFiLWNvbnRhaW5lcmQCHQ9kFgQCAg9kFgICAQ9kFgRmDw8WAh8BaGQWAmYPZBYCZg9kFgYCAQ8WAh8BaGQCAw8WAh8OAgkWEmYPZBYCAgcPDxYEHwoFCDQzOTkzODEzHwFoZGQCAQ9kFgICBw8PFgQfCgUINDQ1MjE4NzYfAWhkZAICD2QWAgIHDw8WBB8KBQgzODc0MDM5OB8BaGRkAgMPZBYCAgcPDxYEHwoFCDM5MTAwNDk0HwFoZGQCBA9kFgICBw8PFgQfCgUIMzg2MDE4NjYfAWhkZAIFD2QWAgIHDw8WBB8KBQgzODg2MTMxMB8BaGRkAgYPZBYCAgcPDxYEHwoFCDIwNDExMzY0HwFoZGQCBw9kFgICBw8PFgQfCgUIMTkyOTYzOTIfAWhkZAIID2QWAgIHDw8WBB8KBQg0MjQ4NzkxOB8BaGRkAgcPDxYCHwFoZGQCAQ9kFgJmD2QWAmYPZBYCAgMPZBYIAgEPD2QPEBYBZhYBFgIeDlBhcmFtZXRlclZhbHVlBQkxMTMzNTc2MDIWAQIEZGQCAw8UKwACDxYEHwJnHw4CA2RkFgJmD2QWBgIBD2QWAgIBD2QWEGYPFQEAZAIBDxYCHxkFEzkgb2YgMTAgcGxheWVycyBtYXhkAgMPDxYEHwgFF34vaW1hZ2VzL0dhbWVzL3Nsb3cucG5nHwFoZGQCBQ8WBB8ZBQlTbG93IGdhbWUfAWhkAgcPDxYGHxsFXH4vQWRtaS9HYW1lcy9HYW1lTW9uaXRvci5hc3B4P21hY2hpbmU9OTYuMTI3LjE5MC41MCZqb2I9MjUwMWExYmQtMTVjNi00MDI2LTg5ZDctNGEyYWYzNDhiODg2HxkFDjk3IG1zIDI5LjIgRlBTHwFoZGQCCQ8PFgIeDU9uQ2xpZW50Q2xpY2sFzgVSb2Jsb3hMYXVuY2guX0dvb2dsZUFuYWx5dGljc0NhbGxiYWNrID0gZnVuY3Rpb24oKSB7IHZhciBpc0luc2lkZVJvYmxveElERSA9ICd3ZWJzaXRlJzsgaWYgKFJvYmxveCAmJiBSb2Jsb3guQ2xpZW50ICYmIFJvYmxveC5DbGllbnQuaXNJREUgJiYgUm9ibG94LkNsaWVudC5pc0lERSgpKSB7IGlzSW5zaWRlUm9ibG94SURFID0gJ1N0dWRpbyc7IH07R29vZ2xlQW5hbHl0aWNzRXZlbnRzLkZpcmVFdmVudChbJ1BsYXkgTG9jYXRpb24nLCAnR3Vlc3QnLCBpc0luc2lkZVJvYmxveElERV0pO0dvb2dsZUFuYWx5dGljc0V2ZW50cy5GaXJlRXZlbnQoWydQbGF5JywgJ0d1ZXN0JywgJyddKTskKGZ1bmN0aW9uKCl7IFJvYmxveEV2ZW50TWFuYWdlci50cmlnZ2VyRXZlbnQoJ3JieF9ldnRfcGxheV9ndWVzdCcsIHthZ2U6J1Vua25vd24nLGdlbmRlcjonVW5rbm93bid9KTt9KTsgfTsgIGlmIChSb2Jsb3guQ2xpZW50LldhaXRGb3JSb2Jsb3goZnVuY3Rpb24oKSB7IHdpbmRvdy5sb2NhdGlvbiA9ICcvTG9naW4vRGVmYXVsdC5hc3B4P1JldHVyblVybD1odHRwJTNhJTJmJTJmd3d3LnJvYmxveC5jb20lMmZQbGFjZUl0ZW0uYXNweCUzZnNlb25hbWUlM2RXaGVuLXRoZS1CYWxsemVzLUNvbWUtVjEtMjktRklYRUQtT1JJR0lOQUwlMjZpZCUzZDExMzM1NzYwMicgfSkpIHsgdHJ5VG9Eb3dubG9hZCgpOyBsb2dTdGF0aXN0aWNzKCdwbGF5bXAnKTsgfSByZXR1cm4gZmFsc2U7ZGQCCw8PFgQfCgUkMjUwMWExYmQtMTVjNi00MDI2LTg5ZDctNGEyYWYzNDhiODg2HwFoZGQCDQ8WAh8OAglkAgIPZBYCAgEPZBYQZg8VAQBkAgEPFgIfGQUTOSBvZiAxMCBwbGF5ZXJzIG1heGQCAw8PFgQfCAUXfi9pbWFnZXMvR2FtZXMvc2xvdy5wbmcfAWhkZAIFDxYEHxkFCVNsb3cgZ2FtZR8BaGQCBw8PFgYfGwVdfi9BZG1pL0dhbWVzL0dhbWVNb25pdG9yLmFzcHg/bWFjaGluZT0xODQuMTU0LjExNS4zNCZqb2I9MmI1ZTVkMGUtM2ZmMy00MDk1LWE1OTUtZTU4YjlkZjU5MGRkHxkFDzE0MSBtcyAyOS4wIEZQUx8BaGRkAgkPDxYCHx4FzgVSb2Jsb3hMYXVuY2guX0dvb2dsZUFuYWx5dGljc0NhbGxiYWNrID0gZnVuY3Rpb24oKSB7IHZhciBpc0luc2lkZVJvYmxveElERSA9ICd3ZWJzaXRlJzsgaWYgKFJvYmxveCAmJiBSb2Jsb3guQ2xpZW50ICYmIFJvYmxveC5DbGllbnQuaXNJREUgJiYgUm9ibG94LkNsaWVudC5pc0lERSgpKSB7IGlzSW5zaWRlUm9ibG94SURFID0gJ1N0dWRpbyc7IH07R29vZ2xlQW5hbHl0aWNzRXZlbnRzLkZpcmVFdmVudChbJ1BsYXkgTG9jYXRpb24nLCAnR3Vlc3QnLCBpc0luc2lkZVJvYmxveElERV0pO0dvb2dsZUFuYWx5dGljc0V2ZW50cy5GaXJlRXZlbnQoWydQbGF5JywgJ0d1ZXN0JywgJyddKTskKGZ1bmN0aW9uKCl7IFJvYmxveEV2ZW50TWFuYWdlci50cmlnZ2VyRXZlbnQoJ3JieF9ldnRfcGxheV9ndWVzdCcsIHthZ2U6J1Vua25vd24nLGdlbmRlcjonVW5rbm93bid9KTt9KTsgfTsgIGlmIChSb2Jsb3guQ2xpZW50LldhaXRGb3JSb2Jsb3goZnVuY3Rpb24oKSB7IHdpbmRvdy5sb2NhdGlvbiA9ICcvTG9naW4vRGVmYXVsdC5hc3B4P1JldHVyblVybD1odHRwJTNhJTJmJTJmd3d3LnJvYmxveC5jb20lMmZQbGFjZUl0ZW0uYXNweCUzZnNlb25hbWUlM2RXaGVuLXRoZS1CYWxsemVzLUNvbWUtVjEtMjktRklYRUQtT1JJR0lOQUwlMjZpZCUzZDExMzM1NzYwMicgfSkpIHsgdHJ5VG9Eb3dubG9hZCgpOyBsb2dTdGF0aXN0aWNzKCdwbGF5bXAnKTsgfSByZXR1cm4gZmFsc2U7ZGQCCw8PFgQfCgUkMmI1ZTVkMGUtM2ZmMy00MDk1LWE1OTUtZTU4YjlkZjU5MGRkHwFoZGQCDQ8WAh8OAglkAgMPZBYCAgEPZBYQZg8VAQBkAgEPFgIfGQUTNCBvZiAxMCBwbGF5ZXJzIG1heGQCAw8PFgQfCAUXfi9pbWFnZXMvR2FtZXMvc2xvdy5wbmcfAWhkZAIFDxYEHxkFCVNsb3cgZ2FtZR8BaGQCBw8PFgYfGwVdfi9BZG1pL0dhbWVzL0dhbWVNb25pdG9yLmFzcHg/bWFjaGluZT0xOTIuOTYuMjAwLjIxOCZqb2I9N2NlYjAyNmQtMGY4MS00NDMwLWJjYjYtY2VkYjRiMzU4NmY5HxkFDzQyNSBtcyAyOS4zIEZQUx8BaGRkAgkPDxYCHx4FzgVSb2Jsb3hMYXVuY2guX0dvb2dsZUFuYWx5dGljc0NhbGxiYWNrID0gZnVuY3Rpb24oKSB7IHZhciBpc0luc2lkZVJvYmxveElERSA9ICd3ZWJzaXRlJzsgaWYgKFJvYmxveCAmJiBSb2Jsb3guQ2xpZW50ICYmIFJvYmxveC5DbGllbnQuaXNJREUgJiYgUm9ibG94LkNsaWVudC5pc0lERSgpKSB7IGlzSW5zaWRlUm9ibG94SURFID0gJ1N0dWRpbyc7IH07R29vZ2xlQW5hbHl0aWNzRXZlbnRzLkZpcmVFdmVudChbJ1BsYXkgTG9jYXRpb24nLCAnR3Vlc3QnLCBpc0luc2lkZVJvYmxveElERV0pO0dvb2dsZUFuYWx5dGljc0V2ZW50cy5GaXJlRXZlbnQoWydQbGF5JywgJ0d1ZXN0JywgJyddKTskKGZ1bmN0aW9uKCl7IFJvYmxveEV2ZW50TWFuYWdlci50cmlnZ2VyRXZlbnQoJ3JieF9ldnRfcGxheV9ndWVzdCcsIHthZ2U6J1Vua25vd24nLGdlbmRlcjonVW5rbm93bid9KTt9KTsgfTsgIGlmIChSb2Jsb3guQ2xpZW50LldhaXRGb3JSb2Jsb3goZnVuY3Rpb24oKSB7IHdpbmRvdy5sb2NhdGlvbiA9ICcvTG9naW4vRGVmYXVsdC5hc3B4P1JldHVyblVybD1odHRwJTNhJTJmJTJmd3d3LnJvYmxveC5jb20lMmZQbGFjZUl0ZW0uYXNweCUzZnNlb25hbWUlM2RXaGVuLXRoZS1CYWxsemVzLUNvbWUtVjEtMjktRklYRUQtT1JJR0lOQUwlMjZpZCUzZDExMzM1NzYwMicgfSkpIHsgdHJ5VG9Eb3dubG9hZCgpOyBsb2dTdGF0aXN0aWNzKCdwbGF5bXAnKTsgfSByZXR1cm4gZmFsc2U7ZGQCCw8PFgQfCgUkN2NlYjAyNmQtMGY4MS00NDMwLWJjYjYtY2VkYjRiMzU4NmY5HwFoZGQCDQ8WAh8OAgRkAgUPFCsAAmQQFgAWABYAZAIHDw8WAh8BaGRkAgMPZBYCAgEPZBYCAgEPZBYCZg9kFgJmDxYCHwFoZAIRDw8WAh8BaGRkGAsFI2N0bDAwJExlZnRHdXR0ZXJBZCRBc3luY0FkTXVsdGlWaWV3Dw9kAgNkBRpjdGwwMCRjcGhSb2Jsb3gkVGFiYmVkSW5mbw8PZGZkBR5fX0NvbnRyb2xzUmVxdWlyZVBvc3RCYWNrS2V5X18WAQUaY3RsMDAkY3BoUm9ibG94JFRhYmJlZEluZm8FRWN0bDAwJGNwaFJvYmxveCROZXdHYW1lUGFnZUNvbnRyb2wkVmlzaXRCdXR0b25zJFZpc2l0QnV0dG9uc011bHRpVmlldw8PZAIBZAVJY3RsMDAkY3BoUm9ibG94JFRhYmJlZEluZm8kR2FtZXNUYWIkUnVubmluZ0dhbWVzTGlzdCRSdW5uaW5nR2FtZXNMaXN0Vmlldw8UKwAOZGRkZGRkZBQrAANkZGQCA2RkZGYCBWQFUWN0bDAwJGNwaFJvYmxveCRUYWJiZWRJbmZvJEdhbWVzVGFiJFJ1bm5pbmdHYW1lc0xpc3QkUnVubmluZ0dhbWVzRGF0YVBhZ2VyX0Zvb3Rlcg8UKwAEZGQCBQIDZAUkY3RsMDAkUmlnaHRHdXR0ZXJBZCRBc3luY0FkTXVsdGlWaWV3Dw9kAgNkBS5jdGwwMCRjcGhCYW5uZXJBZCRQbGFjZUJhbm5lciRBc3luY0FkTXVsdGlWaWV3Dw9kAgNkBTJjdGwwMCRjcGhSb2Jsb3gkYWRzV2lkZVNreXNjcmFwZXIkQXN5bmNBZE11bHRpVmlldw8PZAIDZAUjY3RsMDAkcmJ4R29vZ2xlQW5hbHl0aWNzJE11bHRpVmlldzEPD2RmZAUyY3RsMDAkY3BoUm9ibG94JFZpc2l0QnV0dG9ucyRWaXNpdEJ1dHRvbnNNdWx0aVZpZXcPD2QCAWQcekwzZH2xBbeLPVOBwUAlcs36gg=="/>
    </div>
    <script src="http://www.<?=$_SERVER['SERVER_NAME']?>/ScriptResource.axd?d=uu3NuY8tASU8dBRkjhfe1v_8nRacZ4AW9I9-jGjXpXJqzSy0ET20WN7Ti8O3SyGDOWaYux5FPeVQu6mRRXo2whXy9PZz1C1LegXDLhPB5P_Z8wWDN0kRO9bp8oDJG4K9dFbIr_8zv8wHYBpO_4mbq4MGZZRdFr5T37bO8J4nWpZDvjIP7u8Sclar74WUtwHy5K-YRFffgbb2asgvKZFgFNJKVMK309MIovoiaz7Ss0RyREaNVEQFrKZH7ChvYdMTzWdb98PR_gEqhQsJBTMHCp35fhxVRcdOIjJke-IE5CzV3JTkyp9QpwHHBW1uX4KPOkpme0L9hXwWHgkzwVn18W40chqmNJ6KlmJRQJeXe7n9GTtr8SMLztzdOXrfECTwL5Y2cvtwGDZc1T32eMsETaTZDDiOIDGve4kw7o2X2IdgVtsin3cFRrcTj0QLCfp2MboXzQ2" type="text/javascript"></script>
      <script src="http://www.<?=$_SERVER['SERVER_NAME']?>/ScriptResource.axd?d=JkEcy6d9pF2PvrqLRvw49Xmzfjy-4ELXl4a6Jd0_gualmrwL0tHbSPm46BUQJzfIxYpCVefeio2oeT2Wp5QF3U-j2sKYkRyzycKS32vj9z7wKK63s14Xi5Dm6w46TY6LFJIOot398Ug8dGl1mNqWO6Up51btRxfVvlBoMlx9k7nYEfPl1DWISE1o4CtWrDGDF3f48F0jcWZv05KJo7W17J86aj_2xbsNldEb3npF5H3pOfczwBFZF-MszbHJpHYsbBvROy2kmtcGQpUkZtxa6uK9BPnf9IctwUgThtiCe5L7MimIsobVFJh_obAH_f3b9l2_D9HzkzRZu8x3_NWoUqGuVHMUqWPVlYqx89Pwe1Eu2thFllw1sHqnwh_RI4RKIyNCDSbHmMA-RLacai64OsCm-5c1" type="text/javascript"></script>
    <script src="/js/swfobject/swfobject.js" type="text/javascript"></script>
    <script src="/js/YouTube/RobloxYouTube.js?v=3" type="text/javascript"></script>
    <script src="http://www.<?=$_SERVER['SERVER_NAME']?>/ScriptResource.axd?d=PBzfkB4aQ6pvvwiYOzgOszbWMMN8XWRTvilwF5j9KvkB38_Ys9-3zGiI5xcPsZXHAh-Ng_etg-KmXwuQ5syRutZ89bH3Vg7lXJQbyFiPFUPzcSijoBgSJlzU5VRYxyA8n-doLkT3bMrawK1JOI0UcoaAhvpMsZ-z0yuw7LDEUEv5oHOc9F349iN1EntkCJJUdOHsJg2&amp;t=ffffffffa0e50f90" type="text/javascript"></script>
    <!--script type="text/javascript">
      var play_<?=$placeinfo->AssetId?> = 0;
             function redirectPlaceLauncherToLogin() {
                 location.href = "/login/default.aspx?ReturnUrl=" + encodeURIComponent("/index.html");
             }
             function redirectPlaceLauncherToRegister() {
                 location.href = "/login/NewAge.aspx?ReturnUrl=" + encodeURIComponent("/index.html");
             }
             function fireEventAction(action) {
                 RobloxEventManager.triggerEvent('rbx_evt_popup_action', { action: action });
             }
      $(function() {
         $('.VisitButtonPlay').click(function() {
             play_<?=$placeinfo->AssetId?> = $(this).attr('<?=$placeinfo->AssetId?>');
             Roblox.CharacterSelect.<?=$placeinfo->AssetId?> = play_<?=$placeinfo->AssetId?>;
             Roblox.CharacterSelect.show();
         });
         $('.FeaturedGameButton').click(function() {});
         Roblox.CharacterSelect.robloxLaunchFunction = function(genderTypeID) {
             if (genderTypeID == 3) {
                 var isInsideRobloxIDE = 'website';
                 if (Roblox && Roblox.Client && Roblox.Client.isIDE && Roblox.Client.isIDE()) {
                     isInsideRobloxIDE = 'Studio';
                 };
                 GoogleAnalyticsEvents.FireEvent(['Play Location', 'Guest', isInsideRobloxIDE]);
                 GoogleAnalyticsEvents.FireEvent(['Play', 'Guest', '', 0]);
                 $(function() {
                     RobloxEventManager.triggerEvent('rbx_evt_play_guest', {
                         age: 'Unknown',
                         gender: 'Female'
                     });
                 });
             } else {
                 var isInsideRobloxIDE = 'website';
                 if (Roblox && Roblox.Client && Roblox.Client.isIDE && Roblox.Client.isIDE()) {
                     isInsideRobloxIDE = 'Studio';
                 };
                 GoogleAnalyticsEvents.FireEvent(['Play Location', 'Guest', isInsideRobloxIDE]);
                 GoogleAnalyticsEvents.FireEvent(['Play', 'Guest', '', 1]);
                 $(function() {
                     RobloxEventManager.triggerEvent('rbx_evt_play_guest', {
                         age: 'Unknown',
                         gender: 'Male'
                     });
                 });
             }
             play_<?=$placeinfo->AssetId?> = (typeof $(this).attr('<?=$placeinfo->AssetId?>') === 'undefined') ? play_<?=$placeinfo->AssetId?> : $(this).attr('<?=$placeinfo->AssetId?>');
             if (Roblox.Client.WaitForRoblox(function() {
                     RobloxLaunch.RequestGame('PlaceLauncherStatusPanel', play_<?=$placeinfo->AssetId?>, genderTypeID);
                 })) {}
             return false;
         };
      });;
      </script-->

    <!--script type="text/javascript">
      //<![CDATA[
      if (window.chrome && window.location.hash == '#chromeInstall') {
          window.location.hash = '';
          var continuation = '(' + $.cookie('chromeInstall') + ')';
          $.cookie('chromeInstall', null);
          RobloxLaunch._GoogleAnalyticsCallback = function() {
              GoogleAnalyticsEvents.FireEvent(['Play', 'User', 'Over13', 1]);
              $(function() {
                  RobloxEventManager.triggerEvent('rbx_evt_play_user', {
                      age: 'Over13',
                      gender: 'Male'
                  });
              });
          };
          Roblox.Client.ResumeTimer(eval(continuation));
      }
      $(function() {
          RobloxEventManager.triggerEvent('rbx_evt_abtest', {
              experiment: 'InstallInstructions',
              variation: 'BGroup'
          });
      });
      if (typeof __utmSetVar !== 'undefined') {
          __utmSetVar('');
      }
      if (typeof __utmSetVar !== 'undefined') {
          __utmSetVar('Roblox_User_Top_728x90');
      }
      Roblox.Controls.Image.ErrorUrl = "<?=$_SERVER['SERVER_NAME']?>/Analytics/BadHtmlImage.ashx";
      $(function() {
          $('.VisitButtonPlay').click(function() {
              RobloxLaunch._GoogleAnalyticsCallback = function() {
                  GoogleAnalyticsEvents.FireEvent(['Play', 'User', 'Over13', 1]);
                  $(function() {
                      RobloxEventManager.triggerEvent('rbx_evt_play_user', {
                          age: 'Over13',
                          gender: 'Male'
                      });
                  });
              };
              play_placeId = (typeof $(this).attr('placeId') === 'undefined') ? play_placeId : $(this).attr('placeId');
              if (typeof window.external !== 'undefined' && window.external.IsRobloxABApp) {
                  RobloxABLaunch.RequestGame('PlaceLauncherStatusPanel', play_placeId );
                  return false;
              } else if (Roblox.Client.WaitForRoblox(function() { //hits here
                      RobloxLaunch.RequestGame('PlaceLauncherStatusPanel', play_placeId );
                  })) {}
              return false;
          });
          $('.FeaturedGameButton').click(function() {
              $(function() {
                  RobloxEventManager.triggerEvent('rbx_evt_generic', {
                      type: 'PlayGameGuestClick'
                  });
              });
              $(function() {
                  RobloxEventManager.triggerEvent('rbx_evt_generic', {
                      type: 'FeaturedGameButtonClick'
                  });
              });
          });
          $('.VisitButtonPersonalServer').click(function() {
              RobloxLaunch._GoogleAnalyticsCallback = function() {
                  GoogleAnalyticsEvents.FireEvent(['Play', 'User', 'Over13', 1]);
                  $(function() {
                      RobloxEventManager.triggerEvent('rbx_evt_play_user', {
                          age: 'Over13',
                          gender: 'Male'
                      });
                  });
              };
              play_placeId = (typeof $(this).attr('placeId') === 'undefined') ? play_placeId : $(this).attr('placeId');
              if (typeof window.external !== 'undefined' && window.external.IsRobloxABApp) {
                  RobloxABLaunch.RequestGroupBuildGame('PlaceLauncherStatusPanel', play_placeId );
                  return false;
              } else if (Roblox.Client.WaitForRoblox(function() {
                      RobloxLaunch.RequestGroupBuildGame('PlaceLauncherStatusPanel', play_placeId )
                  })) {}
              return false;
          });
          $('.VisitButtonSoloPlay').click(function() {
              RobloxLaunch._GoogleAnalyticsCallback = function() {
                  GoogleAnalyticsEvents.FireEvent(['PlaySolo', 'User', 'Over13', 1]);
              };
              play_placeId = (typeof $(this).attr('placeId') === 'undefined') ? play_placeId : $(this).attr('placeId');
              if (Roblox.Client.WaitForRoblox(function() {
                      Roblox.VideoPreRoll.showVideoPreRoll = false;
                      RobloxLaunch.StartGame('<?=$_SERVER['SERVER_NAME']?>/Game/visit.ashx?placeId=' + play_placeId , 'visit.ashx', '<?=$_SERVER['SERVER_NAME']?>/Login/Negotiate.ashx', 'FETCH', true)
                  })) {}
              return false;
          });
          $('.VisitButtonBuild').click(function() {
              RobloxLaunch._GoogleAnalyticsCallback = function() {
                  GoogleAnalyticsEvents.FireEvent(['Build', 'User', 'Over13', 1]);
              };
              play_placeId = (typeof $(this).attr('placeId') === 'undefined') ? play_placeId : $(this).attr('placeId');
              if (Roblox.Client.WaitForRoblox(function() {
                      Roblox.VideoPreRoll.showVideoPreRoll = false;
                      RobloxLaunch.StartGame('<?=$_SERVER['SERVER_NAME']?>/Game/visit.ashx?placeId=' + play_placeId , 'visit.ashx', '<?=$_SERVER['SERVER_NAME']?>/Login/Negotiate.ashx', 'FETCH', true)
                  })) {}
              return false;
          });
          $('.VisitButtonEdit').click(function() {
              RobloxLaunch._GoogleAnalyticsCallback = function() {
                  GoogleAnalyticsEvents.FireEvent(['Edit', 'User', 'Over13', 1]);
              };
              play_placeId = (typeof $(this).attr('placeId') === 'undefined') ? play_placeId : $(this).attr('placeId');
              if (Roblox.Client.WaitForRoblox(function() {
                      RobloxLaunch.StartGame('<?=$_SERVER['SERVER_NAME']?>/Game/edit.ashx?placeId=' + play_placeId , 'edit.ashx', '<?=$_SERVER['SERVER_NAME']?>/Login/Negotiate.ashx', 'FETCH', true)
                  })) {}
              return false;
          });
      });
      if (typeof __utmSetVar !== 'undefined') {
          __utmSetVar('Roblox_User_Middle_300x250');
      }
      var Page_ValidationActive = false;
      if (typeof(ValidatorOnLoad) == "function") {
          ValidatorOnLoad();
      }
      
      function ValidatorOnSubmit() {
          if (Page_ValidationActive) {
              return ValidatorCommonOnSubmit();
          } else {
              return true;
          }
      };
      (function() {
          var fn = function() {
              Roblox.Client._installSuccess = function() {
                  urchinTracker('InstallSuccess');
              };
              Sys.Application.remove_load(fn);
          };
          Sys.Application.add_load(fn);
      })();;
      (function() {
          var fn = function() {
              RobloxLaunch._LaunchGamePage = "/Install/Download.aspx";
              Sys.Application.remove_load(fn);
          };
          Sys.Application.add_load(fn);
      })();
      document.getElementById('ctl00_cphRoblox_rbxUserAssetsPane_CreateSetPanel1_CustomValidatorSetNameProfanity').dispose = function() {
          Array.remove(Page_Validators, document.getElementById('ctl00_cphRoblox_rbxUserAssetsPane_CreateSetPanel1_CustomValidatorSetNameProfanity'));
      }
      //]]>
    </script-->
    <script>
      //rewriting the placelauncher javascript because a
      function Visit(placeId)
      {
        showBCOnlyModal("PlaceLauncherStatusPanel");
        window.location = "roblonium-player:1+launchmode:play+placelauncherurl:"+encodeURIComponent("https://sitetest1.roblonium.com/Game/RobloniumPlaceLauncher.ashx?request=RequestGame&placeId="+placeId);
        setTimeout(function(){
          $(".simplemodal-close").click()
          showBCOnlyModal("InstallationInstructions");
          window.location = "http://setup.roblonium.com/HexineLauncher.exe";
        }, 5000);
      }

      $(document).ready(function(){ 
        $('.VisitButtonPlay').click(function(){
          Visit($('.VisitButtonPlay').attr('placeid'));
        });
      });
    </script>
    <div id="fb-root">
    </div>
    <div id="MasterContainer">
      <script type="text/javascript">Roblox.FixedUI.gutterAdsEnabled=false;</script>
      <?php include $_SERVER["DOCUMENT_ROOT"] . '/Banner' ;?>
      <div id="BodyWrapper">
        <div id="RepositionBody">
          <div id="Body" style="width:970px;">
            <div id="ItemContainer" class="PlaceItemContainer new-game-page">
              <script type="text/javascript">
                Roblox.Resources = {};
                Roblox.Resources.PlaceProductPromotion = {
                    //<sl:translate>
                    anErrorOccurred: 'An error occurred, please try again.'
                    , youhaveAdded: "You have added "
                    , toYourGame: " to your game, "
                    , youhaveRemoved: "You have removed "
                    , fromYourGame: " from your game, "
                    , ok: "OK"
                    , success: "Success!"
                    , error: "Error"
                    , sorryWeCouldnt: "Sorry, we couldn't remove the item from your game. Please try again."
                 , notForSale: "This item is not for sale."
                 , rent: "Rent"
                    //<sl:translate>
                };
              </script>
              <div id="JoinRoblox" class="Ads_WideSkyscraper" style="float:left; height:350px; width:160px; border: 1px solid #888; text-align:center; margin: 0 8px 10px 0;">
                <div style="padding:20px 7px;">
                  <div style="font:normal 18px Arial, Helvetica, Sans-Serif; color:#666">Join ROBLONIUM</div>
                  <hr class="PlaceItemHR"/>
                  <div style="text-align:left; font-size:13px;">
                    <div style="font-weight:bold;margin-top:15px;">By joining ROBLONIUM, you can:</div>
                    <ul style="padding-left:15px;line-height:1.5em;">
                      <li>Make friends</li>
                      <li>Change your character</li>
                      <li>Make your own game</li>
                      <li>Use gear items</li>
                    </ul>
                  </div>
                  <div style="margin-top:65px; text-align:center">
                    <a href="/login/NewAge.aspx">
                      <div class="SignupButtonBlue"></div>
                    </a>
                  </div>
                </div>
              </div>
              <script type="text/javascript">
                $(function () { $("#JoinRoblox").height($("#Item").height()); });
              </script>
              <div id="Item" class="place-item redesign body">
                <div class="item-header">
                  <h1 class="notranslate"><?=$placeinfo->Name?></h1>
                </div>
                <div class="left-column">
                  <div class="item-media">
                    <style type="text/css">
                      .youTubeVideoOverlay 
                      {
                      position:absolute;
                      top:0px;
                      left:0px;
                      width: 120px;
                      height: 70px;
                      z-index:5;
                      cursor: pointer;
                      background: white;
                      opacity: 0.0;
                      filter: alpha(opacity=0.0);
                      }
                      .SelectedYouTubeGalleryIcon
                      {
                      top: -3px; 
                      margin: 2px !important;  /** !important makes sure we override the margin in divSmallGalleryItem **/ 
                      border: 3px solid black; /** If you change this border size, you need to change the margin, as well as the top value **/
                      }
                      .RemoveYouTubeGalleryImage
                      {
                      cursor: pointer; 
                      position: absolute; 
                      top: -10px; 
                      right: -10px; 
                      z-index: 6; /** Make sure this is higher than z-index of youTubeVideoOverlay **/
                      }
                      .divSmallGalleryItem
                      {
                      height: 70px; 
                      width: 120px; 
                      float: left;
                      position:relative;
                      margin: 5px;
                      }
                      #divSmallGalleryItemBox
                      {
                      width: 500px; 
                      height:100px;
                      position:relative;
                      overflow-x: auto; 
                      overflow-y: hidden;
                      }
                      #divSmallGalleryScrollContainer
                      {
                      margin: 0px auto; 
                      margin-top: 5px; 
                      margin-bottom: 5px; /** Allows for scroll bar **/
                      display: inline-block; 
                      width: 260px;
                      *display:inline;
                      *zoom:1;
                      }
                      .smallGalleryThumbItem
                      {
                      float: left; 
                      }
                    </style>
                    <div style="margin: 0px auto; width: 500px">
                      <div id="ItemThumbnail" style="height:280px; width: 500px">
                        <div id="bigGalleryThumbItem" style="position: absolute;">
                          <a id="ctl00_cphRoblox_NewGamePageControl_RichMediaThumbDisplay_rbxGalleryAssetThumbnail_rbxAssetImage" class=" notranslate" title="<?=$placeinfo->Name?>_Image" class=" notranslate" onclick="__doPostBack('ctl00$cphRoblox$NewGamePageControl$RichMediaThumbDisplay$rbxGalleryAssetThumbnail$rbxAssetImage','')" style="display:inline-block;height:280px;width:500px;cursor:pointer;"><img src="<?=$ThumbnailUrl?>" height="280" width="500" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="<?=$placeinfo->Name?>_Image" class=" notranslate"/></a>
                        </div>
                      </div>
                      <div id="divSmallGalleryItemBox">
                        <div id="divSmallGalleryScrollContainer">
                          <div class="divSmallGalleryItem SelectedYouTubeGalleryIcon" placemediaitemid="1">
                            <div class="smallGalleryThumbItem">
                              <a id="ctl00_cphRoblox_NewGamePageControl_RichMediaThumbDisplay_ItemMediaGallery_ctl01_ctl01_rbxAssetImage" class=" notranslate" title="<?=$placeinfo->Name?>_Image" class=" notranslate" onclick="__doPostBack('ctl00$cphRoblox$NewGamePageControl$RichMediaThumbDisplay$ItemMediaGallery$ctl01$ctl01$rbxAssetImage','')" style="display:inline-block;height:70px;width:120px;cursor:pointer;"><img src="<?=$ThumbnailUrl?>" height="70" width="120" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="<?=$placeinfo->Name?>_Image" class=" notranslate"/></a>
                            </div>
                            <div class="youTubeVideoOverlay"></div>
                          </div>
                          <!--div class="divSmallGalleryItem " placemediaitemid="2">
                            <div class="smallGalleryThumbItem">
                                
                            
                            <a id="ctl00_cphRoblox_NewGamePageControl_RichMediaThumbDisplay_ItemMediaGallery_ctl02_ctl01_rbxAssetImage" class=" notranslate" title="<?=$placeinfo->Name?>_Image" class=" notranslate" onclick="__doPostBack('ctl00$cphRoblox$NewGamePageControl$RichMediaThumbDisplay$ItemMediaGallery$ctl02$ctl01$rbxAssetImage','')" style="display:inline-block;height:70px;width:120px;cursor:pointer;"><img src="<?=$ThumbnailUrl?>" height="70" width="120" border="0" onerror="return Roblox.Controls.Image.OnError(this)" alt="<?=$placeinfo->Name?>_Image" class=" notranslate"/></a>
                            
                            
                            
                            
                            </div>
                            <div class="youTubeVideoOverlay"></div>
                            </div-->
                        </div>
                        <script type="text/javascript">
                          if(typeof Roblox === "undefined"){
                              Roblox = {};
                          }
                          if(typeof Roblox.FileUploadUnsupported === "undefined"){
                              Roblox.FileUploadUnsupported = {};
                          }
                          Roblox.FileUploadUnsupported.Resources = {
                              //<sl:translate>
                              notSupported: " This device does not support file upload."
                              //</sl:translate>
                          };
                          if (typeof Roblox.CreateSetPanel === "undefined") {
                              Roblox.CreateSetPanel = {};
                          }
                          Roblox.CreateSetPanel.Resources = {
                              //<sl:translate>
                              youMaySelect: "You may select a maximum of ",
                              elementsInList: " elements from this list!"
                              //</sl:translate>
                          };
                          
                          var autotransition = true;
                          var muted = true;
                          
                          function autotransitionNext() {
                              if (!autotransition)
                                  return;
                          
                              var next = $('.SelectedYouTubeGalleryIcon').next();
                              if (next.length > 0)
                                  transitionGallery(next);
                          }
                          function transitionGallery(divSmallGalleryItem) {
                              var thisItem = $(divSmallGalleryItem).find('.smallGalleryThumbItem');
                              var youTubeVideoItem = thisItem.find('.divYouTubeVideoPlayer');
                              if (youTubeVideoItem.length != 0) {
                                  thisItem = $(youTubeVideoItem.children()[0].cloneNode(true)); //jQuery has an issue with IE9 and .clone() for objects - $(youTubeVideoItem.children()[0]).clone();
                                  if (thisItem.is("object") || thisItem.is("iframe")) {
                                      thisItem.height('280');
                                      thisItem.attr('Height', '280px'); // Iframes need height and width?
                                      thisItem.width('500');
                                      thisItem.attr('Width', '500px');
                          
                                      var video = RobloxYouTubeVideoManager.GetVideo(thisItem.attr('id'));
                                      video.Muted = muted;
                                      video.Autoplay = true;
                                  }
                          
                                  $('.PlaceThumbOverlay').fadeOut('slow');
                              }
                              else {
                                  var assetImageChild = thisItem.find('img')[0]; // Asset Image
                                  thisItem = $(assetImageChild).clone();
                                  thisItem.height('280');
                                  thisItem.width('500');
                                  
                                  setTimeout(function() { autotransitionNext(); }, 5000);
                          
                                  $('.PlaceThumbOverlay').fadeIn('slow');
                              }
                          
                              // Clear our any existing transitions incase they're going fast through them.
                              $('#divTransitionLargeGalleryItem').remove();
                          
                              $('#ItemThumbnail').append("<div id='divTransitionLargeGalleryItem' style='display: none; position: absolute;'>");
                              $('#divTransitionLargeGalleryItem').append(thisItem);
                              $('#divTransitionLargeGalleryItem').fadeIn('slow', function () { });
                              $('#bigGalleryThumbItem').fadeOut('slow', function () { $('#divTransitionLargeGalleryItem').attr('id', 'bigGalleryThumbItem'); $(this).remove(); });
                              $('.divSmallGalleryItem').removeClass('SelectedYouTubeGalleryIcon');
                              $(divSmallGalleryItem).addClass('SelectedYouTubeGalleryIcon');
                          }
                          $('.youTubeVideoOverlay').click(function () {
                              // When they click on a small gallery image, we need to put it in the big gallery spot
                              autotransition = false;
                              muted = false;
                              transitionGallery($(this).parent());
                          });
                          
                          $(function() {
                              if (false) {
                                  $('.PlaceThumbOverlay').hide();
                              }
                              else {
                                  setTimeout(function () { autotransitionNext(); }, 5000);
                              }
                          });
                          
                        </script>
                      </div>
                    </div>
                  </div>
                  <div class="actions logged-out">
                    <div class="favorite">
                    </div>
                    <div class="voting">
                      <div class="voting-panel body" asset-id="<?=$placeinfo->AssetId?>" total-up-votes="0" total-down-votes="0" data-vote-modal="">
                        <div class="loading"></div>
                        <div class="vote-summary">
                          <div class="voting-details">
                            <div class="total-upvotes divider-right">
                              <div class="tiny-thumbs-up"></div>
                              <span>Thumbs up: 0</span>
                            </div>
                            <div class="total-downvotes">
                              <span>Thumbs down: 0</span><span class="tiny-thumbs-down"></span>
                            </div>
                            <div class="clear"></div>
                          </div>
                          <div class="visual-container">
                            <div class="background votes"></div>
                            <div class="percent"></div>
                            <div class="clear"></div>
                          </div>
                        </div>
                        <div class="clear"></div>
                      </div>
                      <script>
                        $(function () {
                            Roblox.Voting.Initialize();
                        
                            Roblox.Voting.Resources = {
                                //<sl:translate>
                                emailVerifiedTitle: "Verify Your Email",
                                emailVerifiedMessage: "You must verify your email before you can vote. You can verify your email on the <a href='/My/Account.aspx?confirmemail=1'>Account</a> page.",
                                playGameTitle: "Play Game",
                                playGameMessage:"You must play the game before you can vote on it.",
                                accept: "Verify",
                                decline: "Cancel"
                                //<sl:translate>
                            };
                        });
                      </script>
                    </div>
                    <div class="clear"></div>
                    <span class="ReportAbuse">
                      <div id="ctl00_cphRoblox_NewGamePageControl_AbuseReportButton_AbuseReportPanel" class="ReportAbuse">
                        <span class="AbuseIcon"><a id="ctl00_cphRoblox_NewGamePageControl_AbuseReportButton_ReportAbuseIconHyperLink" href="AbuseReport/Asset.aspx?ID=113357602&amp;RedirectUrl=http%3a%2f%2fwww.<?=$_SERVER['SERVER_NAME']?>%2fPlaceItem.aspx%3fseoname%3dWhen-the-Ballzes-Come-V1-29-FIXED-ORIGINAL%26id%3d113357602"><img src="/images/abuse.PNG?v=2" alt="Report Abuse" style="border-width:0px;"/></a></span>
                        <span class="AbuseButton"><a id="ctl00_cphRoblox_NewGamePageControl_AbuseReportButton_ReportAbuseTextHyperLink" href="AbuseReport/Asset.aspx?ID=113357602&amp;RedirectUrl=http%3a%2f%2fwww.<?=$_SERVER['SERVER_NAME']?>%2fPlaceItem.aspx%3fseoname%3dWhen-the-Ballzes-Come-V1-29-FIXED-ORIGINAL%26id%3d113357602">Report Abuse</a></span>
                      </div>
                    </span>
                  </div>
                  <div class="description notranslate">
                    <div id="DescriptionText" class="invisible"><?=$placeinfo->Description?></div>
                    <pre id="PlaceDescription" class="body"><?=$placeinfo->Description?></pre>
                  </div>
                  <div class="facebook-like">
                  </div>
                </div>
                <div class="right-column">
                  <div class="builder divider-bottom">
                    <a id="ctl00_cphRoblox_AvatarImage" class="builder-image" href="/User.aspx?ID=<?=$placeinfo->CreatorId?>" style="display:inline-block;height:70px;width: 65px;cursor:pointer;" original-title="<?=$Creator?>">
                      <div class="builder-image roblox-avatar-image image-medium" onerror="return Roblox.Controls.Image.OnError(this)" alt="<?=$Creator?>" data-image-size="custom" border="0" data-image-size-y="70" data-image-size-x="70" data-user-id="<?=$placeinfo->CreatorId?>"></div>
                    </a>
                    <div class="builder-name"><span class="form-label">Builder: </span><span class="notranslate"><a href="/User.aspx?ID=<?=$placeinfo->CreatorId?>" class="tooltip" original-title="<?=$Creator?>"><?=$Creator?></a></span></div>
                    <div class="builder-joined"><span class="stat-label">Joined: </span><span class="stat"><?=$CreatorJoined?></span></div>
                    <div class="clear"></div>
                  </div>
                  <div class="buttons">
                    <div id="VisitButtonContainer">
                      <div class="VisitButtonsLeft Centered">
                        <div id="ctl00_cphRoblox_NewGamePageControl_VisitButtons_MultiplayerVisitButton" class="VisitButton VisitButtonPlay" placeId="<?=$placeinfo->AssetId?>">
                          <a class="btn-medium btn-primary">Play<span class="btn-text">Play</span></a>
                        </div>
                      </div>
                      <script type="text/javascript">
                        var play_<?=$placeinfo->AssetId?> = <?=$placeinfo->AssetId?>;
                        function redirectPlaceLauncherToLogin() {
                            location.href = "/login/default.aspx?ReturnUrl=" + encodeURIComponent("/PlaceItem.aspx?seoname=When-the-Ballzes-Come-V1-29-FIXED-ORIGINAL&id=113357602");
                        }
                        function redirectPlaceLauncherToRegister() {
                            location.href = "/login/NewAge.aspx?ReturnUrl=" + encodeURIComponent("/PlaceItem.aspx?seoname=When-the-Ballzes-Come-V1-29-FIXED-ORIGINAL&id=113357602");
                        }
                        function fireEventAction(action) {
                            RobloxEventManager.triggerEvent('rbx_evt_popup_action', { action: action });
                        }
                        $(function() {
                            if (Roblox.Client.isIDE()) {
                                $('.VisitButtonEdit').show();
                            }
                        });
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
                  <div class="details ">
                    <div class="statistics">
                      <div><span class="stat-label">Created: </span><span class="stat"><?=formatDate($placeinfo->Created)?></span></div>
                      <div><span class="stat-label">Updated: </span><span class="stat"><?=formatDate($placeinfo->Updated)?></span></div>
                      <div><span class="stat-label">Favorited: </span><span class="stat"><?=@$placeinfo->Favorited //implement favorites :( ?></span></div>
                      <div><span class="stat-label">Visited: </span><span class="stat"><!--?=$placeinfo->PlaysCount?--></span></div>
                      <div>
                      </div>
                    </div>
                    <div class="genres">
                      <span class="stat-label">Genres: </span><span class="stat"><a href="http://sitetest1.roblonium.com/all-games">All</a></span>
                    </div>
                    <div id="ctl00_cphRoblox_NewGamePageControl_Div1" class="allowed-gear">
                      <div class="stat-label">Allowed Gear Types: </div>
                      <div>
                        <div class="category-icon no-gear tooltip" original-title="No Gear Allowed"></div>
                        <div class="clear"></div>
                      </div>
                    </div>
                    <div class="configure divider-top invisible">
                      <div class="form-label">Options</div>
                      <div><a href="/My/Item.aspx?id=<?=$placeinfo->AssetId?>">Configure this Place</a></div>
                      <div><a href="/My/NewUserAd.aspx?targetID=<?=$placeinfo->AssetId?>">Advertise this Place</a></div>
                      <div><a href="/My/NewBadge.aspx?targetID=<?=$placeinfo->AssetId?>">Create a Badge for this Place</a></div>
                      <div><a href="/My/ContentBuilder.aspx?ContentType=34&amp;<?=$placeinfo->AssetId?>=<?=$placeinfo->AssetId?>">Create a Game Pass</a></div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </div>
              </div>
              <script>
                $(function () {
                    Roblox.Widgets.AvatarImage.load($('.builder-image .roblox-avatar-image'));
                
                    var text = $("#DescriptionText").text(),
                                            maxChars = 800,
                                            placeDesc = $("#PlaceDescription");
                
                    //<sl:translate>
                    var SeeMoreText = "See More";
                    var SeeLessText = "See Less";
                    //</sl:translate>
                
                    function descShowMore() {
                        placeDesc.html(text + '<div><a class="DescriptionSeeMore">'+SeeLessText+'</a></div>');
                        $(".DescriptionSeeMore").click(descShowLess);
                    };
                    function descShowLess() {
                        placeDesc.html(text.slice(0, maxChars) + '... ' + '<a class="DescriptionSeeMore">' + SeeMoreText + '</a>');
                        $(".DescriptionSeeMore").click(descShowMore);
                    };
                    if (text.length > maxChars) {
                        descShowLess();
                    }
                
                    $('.builder-name a').text(fitStringToWidthSafe($('.builder-name a').text(), 130));
                    
                
                });
              </script>
              <div class="clear"></div>
              <div>
                <div>
                  <?php include $_SERVER["DOCUMENT_ROOT"] . '/puzzle/ItemPurchaseAjaxContainer.php';?>
                  <div style="margin-top: 10px;width:720px;padding-top:10px;" class="invisible">
                  </div>
                  <div class="clear"></div>
                </div>
              </div>
              <div style="clear:both"></div>
            </div>
          </div>
        </div>
      </div>
      <?php include $_SERVER["DOCUMENT_ROOT"] . "/Footer";?>
    </div>
    <?php include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Post-Footer.php";?>
  </body>
</html>