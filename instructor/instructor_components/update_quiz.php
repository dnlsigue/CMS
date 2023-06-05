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

  $sql = "SELECT * FROM cms_instructors_topics_quizzes WHERE instructors_topics_quizzes_id=?";
  $stmt = $con->prepare($sql);
  $stmt->bind_param("i", $id);
  $stmt->execute();
  $res = $stmt->get_result();

  echo $startConverted;

  if ($res->num_rows > 0) {
    $stmt = $con->prepare("UPDATE cms_instructors_topics_quizzes SET 
    quiz_name = ?, 
    quiz_description = ?, 
    quiz_submission_start = ?,
    quiz_submission_deadline = ?,
    quiz_allow_submission = ?,
    quiz_items = ?
    WHERE instructors_topics_quizzes_id = ?");
    $stmt->bind_param("ssssiii", $name, $description, $startConverted, $dueConverted, $allow, $items, $id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
      echo 'Quiz updated successfully';
    } else {
      echo 'Failed to update quiz';
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