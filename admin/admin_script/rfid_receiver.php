<?php
// Get the RFID UID result and type from the query parameters
$UIDresult = $_GET['UIDresult'];
$type = $_GET['type'];

// Perform any required processing based on the type
if ($type === 'verifier') {
	$Write = $UIDresult;
    
	// Read the existing contents of the file
	$contents = file('UIDContainer.php');

	// Replace the first line with the $Write content
	$contents[0] = $Write . PHP_EOL;

	// Write the modified contents back to the file
	file_put_contents('UIDContainer.php', implode('', $contents));
	
	// Send response back to Arduino
	echo "Response sent to Arduino.";
    if ($success) {
        echo "Verifier success";
    } else {
        echo "Verifier failure";
    }
} else {
    // Invalid or missing type parameter
    echo "Invalid request";
}
?>