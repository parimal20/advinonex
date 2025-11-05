<?php
session_start();
require_once 'includes/db_connect.php';

if (!isset($_SESSION['user_id'])) {
    http_response_code(403);
    exit("Unauthorized");
}

$user_id    = $_SESSION['user_id'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$file_name  = "AdvinoProtoSuite_Setup.exe";
$download_time = date('Y-m-d H:i:s');
$ip_address = $_SERVER['REMOTE_ADDR'];

// Use free GeoIP API
$geoData = @file_get_contents("https://ipapi.co/{$ip_address}/json/");
$geo = $geoData ? json_decode($geoData, true) : [];

// Extract details safely
$country = $geo['country_name'] ?? 'Unknown';
$region  = $geo['region'] ?? '';
$city    = $geo['city'] ?? '';
$location = trim("$city, $region, $country", ', ');

// Example: save to DB
$stmt = $conn->prepare("INSERT INTO download_logs (user_id, ip_address, user_agent, file_name, location, download_time) VALUES (?, ?, ?, ?, ?, NOW())");
$stmt->bind_param("issss", $user_id, $ip_address, $user_agent, $file_name, $location);
$stmt->execute();

echo "logged";
