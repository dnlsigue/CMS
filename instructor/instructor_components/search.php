<?php
  include '../../Components/Database.php';

  if($con->connect_error) die("Failed to connect!" . $con->connect_error);

  if(isset($_POST['query'])){
    $searchQuery = $_POST['query'];

    $result = $con->query("SELECT subject_code FROM cms_subjects WHERE subject_code LIKE '%$searchQuery%'");

    if($result->num_rows > 0) {
      
      while($row=$result->fetch_assoc()){
        echo '<a href="#" class="list-group-item list-group-item-action">'. $row['subject_code'] .'</a>';
      }

    } else {
      // no records from database
      echo "<p class='list-group-item border-1'>No Records</p>";
    }

  }

?>