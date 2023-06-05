<?php

// Check if the school ID was provided
if (!isset($_POST['school_id'])) {
    die('School ID not provided');
}

// Sanitize the school ID input
$school_id = htmlspecialchars($_POST['school_id']);

// Connect to the database
$con = mysqli_connect("localhost", "ytoovumw_bscs3a", "kaAGi]gz8H2*", "ytoovumw_bscs3a");

// Revoke the RFID number and set the RFID verified flag to 0 in the cms_users table
$query = "UPDATE cms_users SET rfid = NULL, rfid_verified = 0 WHERE school_id = '$school_id'";
$result = mysqli_query($con, $query);

// Delete records from cms_attendance_logs table based on school ID
$deleteQuery = "DELETE FROM cms_attendance_logs WHERE school_id = '$school_id'";
$deleteResult = mysqli_query($con, $deleteQuery);

if ($result && $deleteResult) {
    echo "RFID number revoked successfully and attendance logs deleted";
} else {
    echo "Error revoking RFID number or deleting attendance logs: " . mysqli_error($con);
}

mysqli_close($con);
?>
