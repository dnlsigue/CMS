<?php
// Get user details from CMS_USERS table based on RFID
$rfid = $_POST['rfid'];
// Connect to database
$servername = "localhost";
$username = "ytoovumw_bscs3a";
$password = "kaAGi]gz8H2*";
$dbname = "ytoovumw_bscs3a";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Query to get user details
$sql = "SELECT school_id, first_name, last_name, email, phone FROM cms_users WHERE rfid = '$rfid'";
$result = $conn->query($sql);


if ($result) {
  if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $imageFormats = array('jpg', 'jpeg', 'png'); // Supported image formats

    // Check for the existence of the profile image file with supported extensions
    $imageSrc = '';
    foreach ($imageFormats as $format) {
      $imagePath = '../uploads/profile' . $row['school_id'] . '.' . $format;
      if (file_exists($imagePath)) {
        $imageSrc = $imagePath;
        break;
      }
    }

    echo "<table class='table table-striped table-bordered'>";
    echo "<tr><td colspan='2'><img src='" . $imageSrc . "' style='display: block; margin: 0 auto; max-width: 100%;' /></td></tr>";
    echo "<tr><td><strong>School ID:</strong></td><td>" . $row["school_id"] . "</td></tr>";
    echo "<tr><td><strong>Name:</strong></td><td>" . $row["first_name"] . " " . $row["last_name"] . "</td></tr>";
    echo "<tr><td><strong>Email:</strong></td><td>" . $row["email"] . "</td></tr>";
    echo "<tr><td><strong>Phone:</strong></td><td>" . $row["phone"] . "</td></tr>";
    echo "<tr><td><strong>Time:</strong></td><td>" . date('H:i:s') . "</td></tr>"; // Add this line
    echo "</table>";
  } else {
    echo "<div class='alert alert-danger' role='alert'>User not found!</div>";
  }
} else {
  echo "<div class='alert alert-danger' role='alert'>Error executing query: " . $conn->error . "</div>";
}

$conn->close();
