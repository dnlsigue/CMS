<?php

// Define your database credentials
$dbHost = "localhost";
$dbUsername = "ytoovumw_bscs3a";
$dbPassword = "kaAGi]gz8H2*";
$dbName = "ytoovumw_bscs3a";

// Create a connection to the database
$con = mysqli_connect($dbHost, $dbUsername, $dbPassword, $dbName);

// Check if the connection was successful
if (!$con) {
    die("Failed to connect to the database: " . mysqli_connect_error());
}

// Fetch the subject schedule data based on the provided school_id
if (isset($_GET['school_id'])) {
    $schoolId = $_GET['school_id'];

    $query = "SELECT * FROM subject_schedule WHERE school_id = '$schoolId'";
    $result = mysqli_query($con, $query);

    if ($result) {
        $response = array();

        while ($row = mysqli_fetch_assoc($result)) {
            $response[] = $row;
        }

        header('Content-Type: application/json');
        echo json_encode($response);
    } else {
        echo "Failed to fetch subject schedule data";
    }
} else {
    echo "Missing parameters";
}

// Close the database connection
mysqli_close($con);
?>
