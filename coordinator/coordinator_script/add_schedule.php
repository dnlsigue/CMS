<?php
// Connect to database
$servername = "localhost";
$username = "ytoovumw_bscs3a";
$password = "kaAGi]gz8H2*";
$dbname = "ytoovumw_bscs3a";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data
$classroom_id = $_POST['classroom_id'];
$day = $_POST['day'];
$start = $_POST['start'];
$end = $_POST['end'];

// Insert data into table only if the combination of school_id and subject_code doesn't already exist
$sql = "INSERT INTO cms_schedule (school_id, subject_code, classroom_id, schedule_day, schedule_start, schedule_end)
        SELECT
            (SELECT school_id FROM cms_classrooms WHERE classroom_id = '$classroom_id'),
            (SELECT subject_code FROM cms_classrooms WHERE classroom_id = '$classroom_id'),
            '$classroom_id',
            '$day',
            '$start',
            '$end'
        FROM dual
        WHERE NOT EXISTS (
            SELECT 1
            FROM cms_schedule
            WHERE school_id = (SELECT school_id FROM cms_classrooms WHERE classroom_id = '$classroom_id')
            AND subject_code = (SELECT subject_code FROM cms_classrooms WHERE classroom_id = '$classroom_id')
            AND classroom_id = '$classroom_id'
        )";

if ($conn->query($sql) === TRUE) {
    if ($conn->affected_rows > 0) {
        echo "Schedule added successfully";
    } else {
        echo "Schedule already exists for the selected school and subject.";
    }
} else {
    if ($conn->errno == 1062) {
        echo "Duplicate entry. Schedule already exists.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
