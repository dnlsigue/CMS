<?php
session_start();
require '../../Components/Database.php';

if (isset($_POST['id'], $_POST['name'], $_POST['description'])) {
  $id = $_POST['id'];
  $name = $_POST['name'];
  $description = $_POST['description'];

  $sql = "SELECT * FROM cms_instructors_topics_lesson_materials WHERE instructors_topics_lessonMaterials_id=?";
  $stmt = $con->prepare($sql);
  $stmt->bind_param("i", $id);
  $stmt->execute();
  $res = $stmt->get_result();

  if ($res->num_rows > 0) {
    $stmt = $con->prepare("UPDATE cms_instructors_topics_lesson_materials SET 
    lessonMaterials_title = ?, 
    lessonMaterials_description = ? 
    WHERE instructors_topics_lessonMaterials_id  = ?");
    $stmt->bind_param("ssi", $name, $description, $id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
      echo 'Material updated successfully';
    } else {
      echo 'Failed to update Material';
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