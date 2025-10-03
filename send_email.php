<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php'; // Adjust path if not using Composer

// Return JSON response
header('Content-Type: application/json');

// Initialize response array
$response = ['success' => false, 'message' => ''];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get form data and sanitize inputs
    $firstName = htmlspecialchars(trim($_POST['fname'] ?? ''), ENT_QUOTES, 'UTF-8');
    $lastName = htmlspecialchars(trim($_POST['lname'] ?? ''), ENT_QUOTES, 'UTF-8');
    $email = filter_var(trim($_POST['email'] ?? ''), FILTER_SANITIZE_EMAIL);
    $phone = htmlspecialchars(trim($_POST['phone'] ?? ''), ENT_QUOTES, 'UTF-8');
    $message = htmlspecialchars(trim($_POST['message'] ?? ''), ENT_QUOTES, 'UTF-8');
    $gender = htmlspecialchars(trim($_POST['gender'] ?? ''), ENT_QUOTES, 'UTF-8'); // Honeypot field
    $name = $firstName . ' ' . $lastName;

    // Validate inputs
    if (empty($firstName) || empty($lastName) || empty($email) || empty($phone) || empty($message)) {
        $response['message'] = 'All fields are required.';
        echo json_encode($response);
        exit;
    }
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $response['message'] = 'Invalid email format.';
        echo json_encode($response);
        exit;
    }

    // Check honeypot field
    if (!empty($gender)) {
        // Bot detected
        $response['success'] = true;
        $response['message'] = 'Thank you! Your message has been sent.';
        echo json_encode($response);
        exit;
    }

    // PHPMailer setup
    $mail = new PHPMailer(true);
    try {
        // SMTP settings (example for Gmail)
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com'; // Your SMTP host
        $mail->SMTPAuth = true;
        $mail->Username = 'your-email@gmail.com'; // Your SMTP username
        $mail->Password = 'your-app-password'; // Gmail App Password (not regular password)
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        // Email details
        $mail->setFrom($email, $name);
        $mail->addAddress('info@advinonex.com');
        $mail->Subject = "New Contact Form Submission from $name";
        $mail->Body = "Name: $name\nEmail: $email\nPhone: $phone\nMessage:\n$message";

        // Send email
        $mail->send();
        $response['success'] = true;
        $response['message'] = 'Thank you! Your message has been sent.';
    } catch (Exception $e) {
        error_log("PHPMailer error: {$mail->ErrorInfo}");
        $response['success'] = true; // Show success to avoid alerting bots
        $response['message'] = 'Thank you! Your message has been sent.';
    }

    echo json_encode($response);
} else {
    $response['message'] = 'Invalid request method.';
    echo json_encode($response);
}
?>