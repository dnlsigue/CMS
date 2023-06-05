<?php
// Check if the RFID number and school ID were provided
if (!isset($_POST['rfid']) || !isset($_POST['school_id'])) {
    die('RFID number or school ID not provided');
}

// Sanitize the RFID number and school ID input
$rfid = htmlspecialchars($_POST['rfid']);
$school_id = htmlspecialchars($_POST['school_id']);

// Connect to the database
$con = mysqli_connect("localhost", "ytoovumw_bscs3a", "kaAGi]gz8H2*", "ytoovumw_bscs3a");

// Check if the RFID number already exists in the database
$query = "SELECT COUNT(*) as count FROM cms_users WHERE rfid = '$rfid'";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_assoc($result);
$count = $row['count'];

if ($count > 0) {
    // If the RFID already exists, show an alert message and stop the script execution
    echo "existed";
    exit();
} else {
    // If the RFID doesn't exist, update the RFID field in the cms_users table
    $query = "UPDATE cms_users SET rfid = '$rfid', rfid_verified = 1 WHERE school_id = '$school_id'";
    $result = mysqli_query($con, $query);

    if ($result) {
        echo "RFID number updated successfully";

    } else {
        echo "Error updating RFID number: " . mysqli_error($con);
    }
}

mysqli_close($con);
?>
