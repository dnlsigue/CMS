<?php
  session_start();
  include '../../Components/Database.php';
  if($_SERVER['REQUEST_METHOD'] == 'POST' && !empty( $_POST['subjectcode']) ){
    $subjectSelected = $_POST['subjectcode'];
    $sql = "SELECT subject FROM cms_subjects WHERE subject_code='$subjectSelected'";
    $res = $con->query($sql);
    $row = $res->fetch_assoc();
    echo $row['subject'];
  } else {
    echo 'is not allowed!';
  }

?>