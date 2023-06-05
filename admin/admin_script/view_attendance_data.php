<?php
// Establish a database connection
$host = 'localhost';
$dbname = 'ytoovumw_bscs3a';
$username = 'ytoovumw_bscs3a';
$password = 'kaAGi]gz8H2*';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

// Fetch the attendance data
$query = "SELECT cms_users.first_name, cms_users.last_name, cms_attendance_logs.school_id, cms_attendance_logs.time_in, cms_attendance_logs.time_out, cms_attendance_logs.total_hours FROM cms_attendance_logs JOIN cms_users ON cms_attendance_logs.school_id = cms_users.school_id";
$stmt = $pdo->query($query);
$attendanceData = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Return the data as JSON
header('Content-Type: application/json');
echo json_encode($attendanceData);
?>