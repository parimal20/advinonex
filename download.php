<?php
session_start();
echo realpath($_SERVER['DOCUMENT_ROOT']);

$file_path = realpath($_SERVER['DOCUMENT_ROOT'] . '/software/AdvinoProtoSuite_Setup_v1.0.0.zip');
if (!file_exists($file_path)) {
    http_response_code(404);
    exit("File not found");
}

header('Content-Description: File Transfer');
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment; filename="' . basename($file_path) . '"');
header('Content-Length: ' . filesize($file_path));
flush();
readfile($file_path);
exit;
?>
