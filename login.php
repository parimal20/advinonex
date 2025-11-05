<?php
session_start();
require_once 'includes/db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT id, first_name, last_name, password, verified, status FROM users WHERE email=?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();
    
    if (!$user) {
        echo "Invalid email or password.";
        exit;
    }

    if ($user['status'] != 'active') {
        echo "Account is disabled by admin.";
        exit;
    }

    if ($user['verified'] != 1) {
        echo "Please verify your email before logging in.";
        exit;
    }

    if (!password_verify($password, $user['password'])) {
        echo "Invalid email or password.";
        exit;
    }

    // Login successful
    $_SESSION['user_id'] = $user['id'];
    $_SESSION['email'] = $email;
    $_SESSION['name'] = ucfirst($user['first_name']). ' '.ucfirst($user['last_name']);
    echo "success";
}
?>
