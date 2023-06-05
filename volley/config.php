<?php
// Define your database credentials
$dbHost = "localhost";
$dbUsername = "ytoovumw_bscs3a";
$dbPassword = "kaAGi]gz8H2*";
$dbName = "ytoovumw_bscs3a";

// Create a connection to the database
$con = mysqli_connect($dbHost, $dbUsername, $dbPassword, $dbName);

// Check if the connection was successful2
if (!$con) {
    die("Failed to connect to the database: " . mysqli_connect_error());
}
?>
