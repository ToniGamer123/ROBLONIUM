<?php
$post = file_get_contents('php://input');
$data = file_get_contents($_SERVER["DOCUMENT_ROOT"]."../Analytics/Logs/Report.log") . "\n" . $post;
file_put_contents($_SERVER["DOCUMENT_ROOT"]."../Analytics/Logs/Report.log", $data);
?>