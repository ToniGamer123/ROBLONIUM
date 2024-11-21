<?php
if(!isset($form))
{

	class form {
		//add captcha
		public function error($code,$error){
			if (isset($code) && isset($code[$error]) && $code[$error] !== false){
				echo "<br><font color=\"red\">$code[$error]</font>";
			}
		}
	
	}
	$form = new form;
}
?> 