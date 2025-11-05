<?php
session_start();
require_once 'includes/db_connect.php';

// If user not logged in, redirect to login page
if (!isset($_SESSION['user_id'])) {
    header("Location: login.html");
    exit();
}

// Check if user active and verified
$user_id = $_SESSION['user_id'];
$stmt = $conn->prepare("SELECT verified, status FROM users WHERE id=?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$user = $stmt->get_result()->fetch_assoc();

if (!$user || $user['verified'] != 1 || $user['status'] != 'active') {
    echo "<h3>Your account is inactive or not verified. Please contact support.</h3>";
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>User Dashboard | ADVINONEX</title>
	<!-- Favicon Icon -->
	<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">
  <!-- Bootstrap & Fonts -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
  <link href="css/custom.css" rel="stylesheet">

  <style>
    body { font-family: 'Poppins', sans-serif; background-color:#f5f8fa; }
    .navbar { background-color: #028ecf; }
    .navbar-brand { color: white; font-weight: 600; }
    .navbar-brand:hover { color: #fff; }
    .profile-dropdown { position: relative; }
    .profile-menu {
      display: none;
      position: absolute;
      right: 0;
      top: 45px;
      background: white;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      border-radius: 6px;
      overflow: hidden;
      min-width: 200px;
      z-index: 1000;
    }
    .profile-menu.active { display: block; }
    .profile-menu a {
      display: block;
      padding: 10px 15px;
      color: #333;
      text-decoration: none;
      font-size: 14px;
    }
    .profile-menu a:hover { background: #f0f0f0; }
    .software-card {
      background: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      transition: transform 0.2s ease;
    }
    .software-card:hover { transform: translateY(-3px); }
    .download-btn {
      background-color:#028ecf;
      color:white;
      border:none;
      padding:8px 20px;
      border-radius:5px;
      font-weight:500;
    }
    .download-btn:hover { background:white; border:1px solid #028ecf; color:#028ecf; }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg pb-2">
  <div class="container-fluid px-4">
					<a class="navbar-brand" href="index.html">
						<img src="images/advinonexlogowithbg.webp" alt="Logo">
					</a>
    <div class="ms-auto profile-dropdown">
      <i class="bi bi-person-circle profile-icon text-white fs-3" style="cursor:pointer;"></i>
      <div class="profile-menu">
        <div class="px-3 py-2 border-bottom text-center">
          <strong><?= htmlspecialchars($_SESSION['name']); ?></strong><br>
          <small><?= htmlspecialchars($_SESSION['email']); ?></small>
        </div>
        <!-- <a href="profile.php"><i class="bi bi-person"></i> My Profile</a> -->
        <a href="logout.php"><i class="bi bi-box-arrow-right"></i> Logout</a>
      </div>
    </div>
  </div>
</nav>

<!-- Page Content -->
<div class="page-contact-us py-5">
  <div class="container">
    <h2 class="text-center mb-5" style="color:#028ecf; font-weight:600;">Welcome, <?= htmlspecialchars($_SESSION['name']); ?> 👋</h2>

    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="software-card p-4 text-center">
          <img src="images/advinoprotosuite.png" class="img-fluid mb-3" style="max-height:180px;" alt="AdvinoProtoSuite">
          <h5 class="fw-bold mb-2">AdvinoProtoSuite</h5>
          <p class="text-muted mb-3">
            Industrial protocol simulation and validation suite supporting Modbus, DNP3, IEC 104, and IEC 61850.
          </p>
          <button class="download-btn" id="downloadBtn">
            <i class="bi bi-download me-2"></i>Download Software
          </button>
        </div>
        <div class="progress mt-3" style="height: 8px; display:none;">
          <div class="progress-bar" role="progressbar" style="width: 0%;"></div>
        </div>

        <!-- Toast (bottom-right corner) -->
        <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 9999">
          <div id="toastMsg" class="toast align-items-center text-white border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
              <div id="toastBody" class="toast-body"></div>
              <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<div id="footer"></div>

<!-- Scripts -->
<script src="js/jquery-3.7.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

<script>
  // Profile dropdown toggle
  const profileIcon = document.querySelector('.profile-icon');
  const profileMenu = document.querySelector('.profile-menu');
  profileIcon.addEventListener('click', () => profileMenu.classList.toggle('active'));
  document.addEventListener('click', (e) => {
    if (!profileIcon.contains(e.target) && !profileMenu.contains(e.target)) {
      profileMenu.classList.remove('active');
    }
  });

// Toast utility
function showToast(message, type = 'success') {
  const toastEl = $('#toastMsg');
  const toastBody = $('#toastBody');
  toastEl.removeClass('bg-success bg-danger bg-warning');
  if (type === 'success') toastEl.addClass('bg-success');
  else if (type === 'error') toastEl.addClass('bg-danger');
  else toastEl.addClass('bg-warning');
  toastBody.html(message);
  const toast = new bootstrap.Toast(toastEl[0]);
  toast.show();
}

// Download button handler (clean version)
$('#downloadBtn').on('click', function () {
  const btn = $(this);
  // btn.prop('disabled', true)
  //    .html('<span class="spinner-border spinner-border-sm me-2"></span>Processing...');

  // Step 1: Log download
  $.post('log_download.php', {}, function (response) {
    if (response.trim() === 'logged') {
      // Step 2: Trigger actual file download (hidden iframe, safe for browsers)
      $('<iframe>', { src: 'download.php', style: 'display:none;' }).appendTo('body');
      showToast("Your download has started successfully!", "success");

      // Step 3: Reset button
      setTimeout(() => {
        btn.html('<i class="bi bi-check-circle me-2"></i>Download Again')
           .removeClass('btn-danger')
           .addClass('btn-success')
           .prop('disabled', false);
      }, 1500);
    } else {
      showToast("Unable to start download. Please try again.", "error");
      btn.html('<i class="bi bi-x-circle me-2"></i>Retry Download')
         .removeClass('btn-success')
         .addClass('btn-danger')
         .prop('disabled', false);
    }
  }).fail(() => {
    showToast("Server error. Please try again later.", "error");
    btn.html('<i class="bi bi-x-circle me-2"></i>Retry Download')
       .removeClass('btn-success')
       .addClass('btn-danger')
       .prop('disabled', false);
  });
});


</script>
</body>
</html>
