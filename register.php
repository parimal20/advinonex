<?php
session_start();
require_once 'includes/db_connect.php';
require_once 'includes/send_mail.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $first_name   = trim($_POST['first_name']);
    $last_name    = trim($_POST['last_name']);
    $organization = trim($_POST['organization']);
    $email        = trim($_POST['email']);
    $country      = trim($_POST['country']);
    $password     = password_hash($_POST['password'], PASSWORD_DEFAULT);

    // Check if user already exists
    $stmt = $conn->prepare("SELECT id, verified FROM users WHERE email=?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if ($user && $user['verified'] == 1) {
        echo "Email already registered. Please log in.";
        exit;
    }

    if (!$user) {
        // New user
        $stmt = $conn->prepare("INSERT INTO users (first_name, last_name, organization, email, password, country) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssss", $first_name, $last_name, $organization, $email, $password, $country);
        $stmt->execute();
    }

    // Generate OTP
    $otp = rand(100000, 999999);
    $expires_at = date("Y-m-d H:i:s", strtotime("+10 minutes"));

    // Store OTP
    $conn->query("DELETE FROM email_otps WHERE email='$email'"); // clean old OTPs
    $stmt = $conn->prepare("INSERT INTO email_otps (email, otp_code, expires_at) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $email, $otp, $expires_at);
    $stmt->execute();

    // Send OTP via email
    $subject = "[Advinonex] OTP - Verify Your Email Address";
    $message = '
    <!DOCTYPE html>
    <html>
    <body style="font-family:Poppins, Arial; background:#f9f9f9; margin:0; padding:20px;">
        <table width="100%" cellpadding="0" cellspacing="0" style="max-width:600px; margin:auto; background:#fff; border-radius:8px; overflow:hidden;">
        <tr>
            <td align="center" style="background:#365CCE; color:#fff; padding:20px;">
            <h2 style="margin:0; letter-spacing:2px;">Verify Your Email</h2>
            </td>
        </tr>
        <tr>
            <td style="padding:30px; color:#333;">
            <p>Thank you for signing up with <strong>Advinonex</strong>.</p>
            <p>Please use the following One-Time Password (OTP) to verify your account:</p>
            <h1 style="letter-spacing:8px; text-align:center; color:#365CCE;">' . $otp . '</h1>
            <p>This OTP is valid for 10 minutes.</p>
            <p>If you did not request this, please ignore this email.</p>
            <br>
            <p style="color:#777;">Regards,<br><strong>Advinonex Team</strong></p>
            </td>
        </tr>
        </table>
    </body>
    </html>';

    if (sendMail($email, $subject, $message)) {
        echo "OTP sent successfully to your email.";
    } else {
        echo "Failed to send OTP. Please try again.";
    }
}
?>
