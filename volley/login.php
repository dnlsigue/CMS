<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once 'config.php';

$response = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['schoolid']) && isset($_POST['password'])) {
        $school_id = $_POST['schoolid'];
        $password = $_POST['password'];

        // Prepare the statement to prevent SQL injection
        $stmt = $con->prepare("SELECT * FROM cms_users WHERE school_id = ? LIMIT 1");
        $stmt->bind_param("s", $school_id);

        try {
            if ($stmt->execute()) {
                $stmt->store_result();
                if ($stmt->num_rows > 0) {
                    $stmt->bind_result($id, $rfid, $db_school_id, $first_name, $last_name, $storedPassword, $role, $email, $phone, $rfid_verified); // Bind result columns

                    $stmt->fetch(); // Fetch the results

                    // Verify the entered password with the stored hashed password
                    if (password_verify($password, $storedPassword)) {
                        $response['success'] = true;
                        $response['message'] = "Login successful";
                        $response['role'] = $role;
                    } else {
                        $response['success'] = false;
                        $response['message'] = "Incorrect username or password";
                    }
                } else {
                    $response['success'] = false;
                    $response['message'] = "Invalid credentials";
                }
            } else {
                $response['success'] = false;
                $response['message'] = "Database query execution failed";
            }
        } catch (Exception $e) {
            $response['success'] = false;
            $response['message'] = "An error occurred: " . $e->getMessage();
        }
    } else {
        $response['success'] = false;
        $response['message'] = "Missing parameters";
    }
} else {
    $response['success'] = false;
    $response['message'] = "Invalid request";
}

header('Content-Type: application/json');
echo json_encode($response);

if ($con) {
    $con->close();
}
?>
