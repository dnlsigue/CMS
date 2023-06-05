<?php
date_default_timezone_set('Asia/Manila');
// Connect to database
$servername = "localhost";
$username = "ytoovumw_bscs3a";
$password = "kaAGi]gz8H2*";
$dbname = "ytoovumw_bscs3a";


$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get RFID from POST data
$rfid = $_POST['rfid'];

// Check if user exists in database
$sql = "SELECT * FROM cms_users WHERE rfid = '$rfid'";
$result = $conn->query($sql);
if ($result->num_rows == 1) {
    // User exists, check if there is a cooldown period
    $row = $result->fetch_assoc();
    $school_id = $row['school_id'];
    $sql = "SELECT * FROM cms_attendance_logs WHERE school_id = '$school_id' AND DATE(time_in) = CURDATE() AND time_out IS NULL";   
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $last_tap_time = strtotime($row['last_tap_time']);
        $current_time = time();
        $time_in = $row['time_in'];
        $cooldown = 300; // cooldown period in seconds

        // Check if cooldown period has elapsed
        if (($current_time - $last_tap_time) < $cooldown) {
            $remaining_time = $cooldown - ($current_time - $last_tap_time);
            echo "Please wait for " . $remaining_time . " seconds before tapping again.";
            exit();
        } 
    }
    // Check if user already timed in
    $sql = "SELECT * FROM cms_attendance_logs WHERE school_id = '$school_id' AND DATE(time_in) = CURDATE()";
    $result = $conn->query($sql);
    if ($result->num_rows == 0) {
        // User hasn't timed in, insert new attendance log
        $sql = "INSERT INTO cms_attendance_logs (school_id, time_in) VALUES ('$school_id', NOW())";
        if ($conn->query($sql) === TRUE) {
            echo "Attendance taken!";
        } else {
            echo "Error updating attendance: " . $conn->error;
        }
    } else {
        // User already timed in, update time out and calculate total hours
        $row = $result->fetch_assoc();
        $attendance_id = $row['id'];
        $time_in = $row['time_in'];
        $time_out = $row['time_out'];
        $total_hours_from_db = $row['total_hours'];
        $total_hours = 0;
        
        if ($time_out == NULL) {
            // Time out not set, update time out and calculate total hours
            $time_out = date('Y-m-d H:i:s');
            $total_hours += round((strtotime($time_out) - strtotime($time_in)) / 3600, 2);
            $total_hours += $total_hours_from_db;
            $sql = "UPDATE cms_attendance_logs SET time_out = '$time_out', total_hours = '$total_hours' WHERE id = '$attendance_id'";
            if ($conn->query($sql) === TRUE) {
                echo "Attendance updated!";
            } else {
                echo "Error updating attendance: " . $conn->error;
            }
        } else {
            // Time out set, clear time in and time out and update time in
            $sql = "UPDATE cms_attendance_logs SET time_in = NOW(), time_out = NULL WHERE id = '$attendance_id'";
            if ($conn->query($sql) === TRUE) {
                echo "Attendance taken!";
            } else {
                echo "Error updating attendance: " . $conn->error;
            }
        }
    }    

    // update new tap time for user into attendance logs
    $sql = "UPDATE cms_attendance_logs SET last_tap_time = NOW() WHERE school_id = '$school_id'";
    $conn->query($sql);
} else {
}

// Close database connection
$conn->close();
?>
