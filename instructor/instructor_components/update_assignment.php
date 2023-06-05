<?php
session_start();
require '../../Components/Database.php';

if (isset($_POST['id'], $_POST['name'], $_POST['description'], $_POST['start'], $_POST['due'], $_POST['allow'], $_POST['items'])) {
  $id = $_POST['id'];
  $name = $_POST['name'];
  $description = $_POST['description'];
  
  $start = $_POST['start'];
  $startConverted = date('Y-m-d H:i:s', strtotime($start));

  $due = $_POST['due'];
  $dueConverted = date('Y-m-d H:i:s', strtotime($due));


  $allow = $_POST['allow'];
  
  $items = $_POST['items'];

  $sql = "SELECT * FROM cms_instructors_topics_assignments WHERE instructors_topics_assignments_id=?";
  $stmt = $con->prepare($sql);
  $stmt->bind_param("i", $id);
  $stmt->execute();
  $res = $stmt->get_result();

  echo $startConverted;

  if ($res->num_rows > 0) {
    $stmt = $con->prepare("UPDATE cms_instructors_topics_assignments SET 
    assignment_name = ?, 
    assignment_description = ?, 
    assignment_submission_start = ?,
    assignment_submission_deadline = ?,
    assignment_allow_submission = ?,
    assignment_items = ?
    WHERE instructors_topics_assignments_id = ?");
    $stmt->bind_param("ssssiii", $name, $description, $startConverted, $dueConverted, $allow, $items, $id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
      echo 'Assignment updated successfully';
    } else {
      echo 'Failed to update assignment';
    }
  } else {
    echo 'Error updating data';
  }

  // Close the statement
  $stmt->close();
} else {
  echo 'Incomplete data';
}
?>