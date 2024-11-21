<?php
header('Content-Type: text/plain; X-Robots-Tag: noindex');
echo($_SERVER['HTTP_X_FORWARDED_FOR']);
?>