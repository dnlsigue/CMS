<?php

include('config.php'); 

error_reporting(E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

$detail = array();

if (isset($_POST['schoolid'])) {
    $id = $_POST['schoolid'];

    // Prepare the SQL query using a parameterized statement
    $sql = "SELECT first_name, last_name, school_id FROM cms_users WHERE school_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        if ($row = $result->fetch_assoc()) {
            $detail["name"] = ucwords($row['first_name'] . ' ' . $row['last_name']);
            $detail["schoolID"] = $row['school_id'];
            echo json_encode($detail);
        }
    } else {
        echo json_encode($detail); // Return an empty array if no matching user found
    }
}
?>
