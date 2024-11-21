<?php
	//require_once $_SERVER['DOCUMENT_ROOT']."/Hexine/api/core_functions.php";
	header('content-type: text/plain');
	ob_start();
?>

game:SetMessage("fart")

<?php
	$script = ob_get_clean();
	openssl_sign($script, $signature, openssl_pkey_get_private("file://C:/signing/privatekey.pem"), OPENSSL_ALGO_SHA1);
	echo "--rbxsig%" . base64_encode($signature) . "%" . $script;