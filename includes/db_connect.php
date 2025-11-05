<?php
date_default_timezone_set('Asia/Kolkata');
$host = "localhost";
$user = "root";
$pass = "";
$db   = "advinonex";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}
?>
