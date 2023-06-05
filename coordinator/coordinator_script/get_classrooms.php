<?php
$servername = "localhost";
$username = "ytoovumw_bscs3a";
$password = "kaAGi]gz8H2*";
$dbname = "ytoovumw_bscs3a";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to fetch data from cms_classrooms table and join with cms_subjects table
$sql = "SELECT CONCAT(u.first_name, ' ', u.last_name) AS school_name, s.subject, c.sections, c.classroom_id
FROM cms_classrooms c
INNER JOIN cms_users u ON c.school_id = u.school_id
INNER JOIN cms_subjects s ON c.subject_code = s.subject_code
ORDER BY school_name";

$result = $conn->query($sql);

$data = array();

if ($result->num_rows > 0) {
    // Loop through the result set
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

// Close database connection
$conn->close();

// Return data as JSON response
header('Content-Type: application/json');
echo json_encode($data);
?>
