<!doctype html>
<html lang="en">
	<head>
	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
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
<title>Studio Landing - ROBLONIUM </title>
<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
<link href="/roblonium.css?excludeTheme=true" rel="stylesheet" type="text/css">

	</head>
	<body style="background: steelblue url('/images/Develop.png') !important; background-size: 100% 100% !important;">
		<center style="box-shadow: inset 0px 0px 20px 2px;" class="center">
		<img src="../images/RobloniumAdminLogo.png" alt="" style="width: 11.46in;image-rendering: pixelated;">
		<br/>
		<br/>
		<text id = "loadtext" class ="loading_text" style="margin-top: 48px; text-align: center; font-size: 0.5in; font-family: helvetica; color: rgba(255, 255, 255, 1); letter-spacing: -1px; text-shadow: 0px 0px 3px black; overflow: hidden; white-space: nowrap;">Welcome to the studio!</text>
		<br/>
		<br/>
		<div class="StandardBoxHeader" style="width: 620px; background: url(/images/cssspecific/rbx2/tab_black_33h_t1.png) no-repeat left top; border-radius: 0px;"><span style="background: url(/images/cssspecific/rbx2/tab_black_33h_t2.png) no-repeat right top; overflow: hidden;">Recent Files</span></div>
<div class="StandardBox" style="width: 620px; border-radius: 0px;">
<?php
$end = "";
$query  = explode('&', $_SERVER['QUERY_STRING']);
$params = array();

foreach( $query as $param )
{
  // prevent notice on explode() if $param has no '='
  if (strpos($param, '=') == false) $param += '=';

  list($name, $value) = explode('=', $param, 2);
  $params[urldecode($name)][] = urldecode($value);
  if (urldecode($name) == "filename") {
  $end = ($end.urldecode($value).'<span class="btn-text">'.urldecode($value).'</span></a><br><br>');
  }else {
  if (urldecode($name) == "filepath") {
	  //for legacy support
	 //while(strpos('%20', $value)){
		 $value = str_replace('%20', '+', urldecode(urldecode($value)));
	 //}
  $end = ($end.'<a roblox-js-onclick="" class="btn-medium btn-neutral" style="text-align: left; width:95%;" href="file:///'.$value.'">');
  }
  }
}
echo($end);
?>
		</div>
		</center>
		<script type="text/javascript">

			$(window).resize(function(){

				$('.center').css({
					width: ($(window).width()),
					height: ($(window).height())
				});
	
				});

				// To initially run the function:
				$(window).resize();
		</script
	</body>
</html>