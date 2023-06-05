<?php
// Define database connection details
$host = 'localhost';
$user = 'ytoovumw_bscs3a';
$password = 'kaAGi]gz8H2*';
$database = 'ytoovumw_bscs3a';

// Create database connection
$conn = mysqli_connect($host, $user, $password, $database);

// Check if the connection was successful
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Get the user type from the query string parameter 'type'
$user_type = $_POST['type'];

// Define the SQL query based on the user type
switch ($user_type) {
    case 'users':
        $sql = "SELECT first_name, last_name, role FROM cms_users";
        break;
    case 'admins':
        $sql = "SELECT school_id, first_name, last_name FROM cms_admins";
        break;
    case 'students':
        $sql = "SELECT cms_students.school_id, cms_students.first_name, cms_students.last_name, cms_sectionList.sections FROM cms_students JOIN cms_sectionList ON cms_students.school_id=cms_sectionList.school_id";
        break;
    case 'coordinators':
        $sql = "SELECT school_id, first_name, last_name FROM cms_coordinators";
        break;
    case 'instructors':
        $sql = "SELECT school_id, first_name, last_name FROM cms_instructors";
        break;
    default:
        die("Invalid user type");
}

// Execute the SQL query and retrieve the data
$result = mysqli_query($conn, $sql);

// Create an array to store the user data
$user_data = array();

// Iterate over the rows in the result set and add them to the user data array
while ($row = mysqli_fetch_assoc($result)) {
    array_push($user_data, $row);
}

// Convert the user data array to a JSON string and send it to the client
header('Content-Type: application/json');
echo json_encode($user_data);

// Close the database connection
mysqli_close($conn);
?>
