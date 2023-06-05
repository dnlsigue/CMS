<?php
// Replace the database credentials with your own
$host = 'localhost';
$username = 'ytoovumw_bscs3a';
$password = 'kaAGi]gz8H2*';
$database = 'ytoovumw_bscs3a';

// Create a new mysqli object and connect to the database
$conn = new mysqli($host, $username, $password, $database);

// Check for connection errors
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve the counts of users, students, instructors, coordinators, and admins from the database
$sql = "SELECT 
            COUNT(*) AS total_users, 
            SUM(CASE WHEN role = 'student' THEN 1 ELSE 0 END) AS total_students,
            SUM(CASE WHEN role = 'instructor' THEN 1 ELSE 0 END) AS total_instructors,
            SUM(CASE WHEN role = 'coordinator' THEN 1 ELSE 0 END) AS total_coordinators,
            SUM(CASE WHEN role = 'admin' THEN 1 ELSE 0 END) AS total_admins
        FROM cms_users";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Fetch the results as an associative array
    $row = $result->fetch_assoc();

    // Convert the array to a JSON-encoded string
    $json_data = json_encode($row);

    // Return the JSON-encoded string
    echo $json_data;
} else {
    // Return an error message if no results were found
    echo "No results found";
}

// Close the database connection
$conn->close();
?>
