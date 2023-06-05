<?php
session_start();
require '../../Components/Database.php';

if (isset($_POST['id'])){
  $id = $_POST['id'];
  $sql = "DELETE FROM cms_instructors_topics_assignments WHERE instructors_topics_assignments_id='$id'";
  $res = $con->query($sql);
}