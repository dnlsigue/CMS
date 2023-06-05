<?php
	$UIDresult = $_GET["UIDresult"];
	$Write = $UIDresult;

	// Read the existing contents of the file
	$contents = file('UIDContainer.php');

	// Replace the first line with the $Write content
	$contents[0] = $Write . PHP_EOL;

	// Write the modified contents back to the file
	file_put_contents('UIDContainer.php', implode('', $contents));
	
	// Send response back to Arduino
	echo "Response sent to Arduino.". $UIDresult;
?>