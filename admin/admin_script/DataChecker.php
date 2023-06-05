<?php
// Check if the RFID number was provided
if (!isset($_POST['rfid'])) {
    die('RFID number not provided');
}

// Sanitize the RFID number input
$rfid = htmlspecialchars($_POST['rfid']);

// Connect to the database
$con = mysqli_connect("localhost", "ytoovumw_bscs3a", "kaAGi]gz8H2*", "ytoovumw_bscs3a");

// Check if the RFID number already exists in the database
$query = "SELECT COUNT(*) as count FROM cms_users WHERE rfid = '$rfid'";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_assoc($result);
$count = $row['count'];

if ($count > 0) {
    // If the RFID already exists, show an alert message
    echo "RFID already exists";
    $UIDresult = '0';
	$Write = $UIDresult;

	// Read the existing contents of the file
	$contents = file('UIDContainer.php');

	// Replace the first line with the $Write content
	$contents[0] = $Write . PHP_EOL;

	// Write the modified contents back to the file
	file_put_contents('UIDContainer.php', implode('', $contents));
} else {
    // If the RFID doesn't exist, continue with the script execution
    echo "RFID is available";
}

mysqli_close($con);
?>
