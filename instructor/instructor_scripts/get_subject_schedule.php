<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cms";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve the instructor's school_id from the session
$instructorId = $_GET['school_id'];

// Prepare the SQL query to retrieve the subject schedule data for the selected instructor
$sql = "SELECT subj.subject, c.sections, s.schedule_day, s.schedule_start, s.schedule_end
        FROM cms_schedule s
        INNER JOIN cms_classrooms c ON s.classroom_id = c.classroom_id
        INNER JOIN cms_subjects subj ON s.subject_code = subj.subject_code
        WHERE s.school_id = '$instructorId'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Create an array to store the subject schedule data
    $subjectSchedule = array();

    // Fetch each row from the result set
    while ($row = $result->fetch_assoc()) {
        // Add the subject schedule data to the array
        $subjectSchedule[] = array(
            'subject' => $row['subject'],
            'section' => $row['sections'],
            'schedule_day' => $row['schedule_day'],
            'schedule_start' => $row['schedule_start'],
            'schedule_end' => $row['schedule_end']
        );
    }

    // Convert the subject schedule array to JSON format
    $json_subjectSchedule = json_encode($subjectSchedule);

    // Return the JSON response
    header('Content-Type: application/json');
    echo $json_subjectSchedule;
} else {
    // No subject schedule found for the selected instructor
    echo json_encode(array());
}

$conn->close();
?>
    