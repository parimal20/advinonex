<?php
session_start();
require_once 'includes/db_connect.php';
require_once 'includes/send_mail.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    $otp   = trim($_POST['otp']);

    // Fetch OTP
    $stmt = $conn->prepare("SELECT otp_code, expires_at, verified FROM email_otps WHERE email=? ORDER BY id DESC LIMIT 1");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    $otpData = $result->fetch_assoc();

    if (!$otpData) {
        echo "No OTP found. Please register again.";
        exit;
    }

    if ($otpData['verified'] == 1) {
        echo "OTP already used.";
        exit;
    }

    if (strtotime($otpData['expires_at']) < time()) {
        echo "OTP expired. Please request a new one.";
        exit;
    }

    if ($otpData['otp_code'] !== $otp) {
        echo "Invalid OTP.";
        exit;
    }

    // Mark OTP as used
    $conn->query("UPDATE email_otps SET verified=1 WHERE email='$email'");

    // Verify user
    $conn->query("UPDATE users SET verified=1 WHERE email='$email'");

    // Send welcome email

    $subject = "Welcome to Advinonex!";
    $message = '
    <!DOCTYPE html>
    <html>
    <body style="font-family:Poppins, Arial; background:#f9f9f9; margin:0; padding:20px;">
        <table width="100%" cellpadding="0" cellspacing="0" style="max-width:600px; margin:auto; background:#fff; border-radius:8px; overflow:hidden;">
        <tr>
            <td align="center" style="background:#007bff; color:#fff; padding:20px;">
            <h2 style="margin:0;">Welcome to Advinonex</h2>
            </td>
        </tr>
        <tr>
            <td style="padding:30px; color:#333;">
            <p>Hello,</p>
            <p>Your email has been successfully verified!</p>
            <p>You can now log in and download the software from your account dashboard.</p>
            <div style="text-align:center; margin:25px 0;">
                <a href="https://advinonex.com/login.html" 
                style="background-color:#007bff; color:white; text-decoration:none; padding:12px 25px; border-radius:5px; font-weight:bold;">
                Go to Login
                </a>
            </div>
            <p style="color:#777;">Thank you for choosing <strong>Advinonex</strong>.</p>
            </td>
        </tr>
        <tr>
            <td align="center" style="background:#f1f1f1; color:#555; font-size:13px; padding:10px;">
            © ' . date("Y") . ' Advinonex. All rights reserved.
            </td>
        </tr>
        </table>
    </body>
    </html>';

    sendMail($email, $subject, $message);

    echo "Account verified successfully! You can now log in.";
}
?>
