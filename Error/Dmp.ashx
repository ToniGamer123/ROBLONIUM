<?php
$data = file_get_contents($_SERVER["DOCUMENT_ROOT"]."../Analytics/Logs/Dmp.log") . "\n" . $_GET["filename"];
file_put_contents($_SERVER["DOCUMENT_ROOT"]."../Analytics/Logs/Dmp.log", $data);
echo '{"success":true}';
?>