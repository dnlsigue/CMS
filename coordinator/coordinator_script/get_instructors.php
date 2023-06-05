<?php
// Connect to the database
$servername = "localhost";
$username = "ytoovumw_bscs3a";
$password = "kaAGi]gz8H2*";
$dbname = "ytoovumw_bscs3a";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Prepare the SQL query to retrieve the instructors

$sql = "SELECT s.school_id, u.first_name, u.last_name
FROM cms_schedule s
INNER JOIN cms_users u ON s.school_id = u.school_id
GROUP BY s.school_id, u.first_name, u.last_name";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Create an array to store the instructors
    $instructors = array();

    // Fetch each row from the result set
    while ($row = $result->fetch_assoc()) {
        // Add the instructor data to the array
        $instructors[] = array(
            'school_id' => $row['school_id'],
            'first_name' => $row['first_name'],
            'last_name' => $row['last_name']
        );
    }

    // Convert the instructors array to JSON format
    $json_instructors = json_encode($instructors);

    // Return the JSON response
    header('Content-Type: application/json');
    echo $json_instructors;
} else {
    // No instructors found
    echo "No instructors found";
}

$conn->close();
