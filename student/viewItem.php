<?php
require('includes/Header.php');

if (!isset($_GET['assignment_id']) && !isset($_GET['instructor_topics_id']) && !isset($_GET['assignment_name'])) {
  echo '<script>window.location.href = "./myClass.php";</script>';
} else {
}
?>

<div class="x--main-container">

  <div class="container bg-white pt-5">

    <?php

    // SUBMIT ASSIGNMENT MODAL
    require './Modals/Add/SubmitAssignment.php';

    $sql = "SELECT * FROM cms_instructors_topics_assignments WHERE instructors_topics_assignments_id='" . $_GET['assignment_id'] . "' AND assignment_name='" . $_GET['assignment_name'] . "' AND instructors_topics_id='" . $_GET['instructor_topics_id'] . "'";
    $res = $con->query($sql);
    if (mysqli_num_rows($res) > 0) {
      while ($row = $res->fetch_assoc()) {
    ?>
      <h3 class="text-center"><?php echo $row['assignment_name']; ?></h3>

      <hr class="hr" />

      <p class="lead">Description: <?php echo $row['assignment_description']; ?></p>

      <hr class="hr" />

      <p class="lead">
        <b>Instruction:</b>
        <a target="_blank" href="<?php echo $row['assignment_file_path']; ?>">
          <?php
            $path = $row['assignment_file_path']; 
            $filename = basename($path);
            echo $filename; 
          ?>
        </a>
      </p>

      <p class="lead"><b class="text-success">Start</b>: <?php 

        $dateTime = new DateTime($row['assignment_submission_start']); 
        // Format the DateTime object as required
        $formattedDateTime = $dateTime->format('F d, Y - g:i A');
        echo $formattedDateTime;
      ?>
      </p>

      <p class="lead"><b class="text-danger">Deadline</b>: <?php 

        $dateTime = new DateTime($row['assignment_submission_deadline']); 
        // Format the DateTime object as required
        $formattedDateTime = $dateTime->format('F d, Y - g:i A');
        echo $formattedDateTime;
      ?>
      </p>

      <?php

        $res = $con->query("SELECT * FROM cms_students_assignments_submission WHERE instructors_topics_assignments_id='".$_GET['assignment_id']."' AND school_id='".$_SESSION['school_id']."'");
        if(mysqli_num_rows($res) > 0){
          ?>
          <button type="button" class="btn btn-success fs-6 mt-3">
            <i class="fa-solid fa-plus"></i> Already Submitted
          </button>
          <?php
        } else { ?>
          <button type="button" class="btn btn-success fs-6 mt-3" data-toggle="modal" data-target="#submitAssignment">
            <i class="fa-solid fa-plus"></i> Prepare answer
          </button>
        <?php
        }
      ?>
      
        
    <?php
      }
    } else {
      echo '<script>window.location.href = "./myClass.php";</script>';
    }

    ?>
    <hr class="hr" />

  </div>
</div>

<?php
require('includes/Footer.php');
?>