<?php
require('includes/Header.php');

if (!isset($_GET['classroom_id']) && !isset($_GET['topic_name']) && !isset($_GET['instructors_topics_id'])) {
  echo '<script>window.location.href = "./myClass.php";</script>';
} else {
}
?>

<div class="x--main-container">

  <div class="container bg-white pt-5">

    <?php

    $sql = "SELECT * FROM cms_instructors_topics WHERE classroom_id='" . $_GET['classroom_id'] . "' AND topic_name='" . $_GET['topic_name'] . "' AND instructors_topics_id='" . $_GET['instructors_topics_id'] . "'";
    $res = $con->query($sql);
    if (mysqli_num_rows($res) > 0) {
      while ($row = $res->fetch_assoc()) {
    ?>
        <h3 class="text-center"><?php echo $row['topic_name']; ?></h3>
        <h5 class="text-center">(<?php echo $row['term']; ?>)</h5>
        <hr class="hr" />
        <p>Description: <?php echo $row['topic_description']; ?></p>
    <?php
      }
    } else {
      echo '<script>window.location.href = "./myClass.php";</script>';
    }

    ?>
    <hr class="hr" />

    <div class="d-flex align-items-start">
      <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
        <button class="nav-link active" id="v-pills-material-tab" data-bs-toggle="pill" data-bs-target="#v-pills-material" type="button" role="tab" aria-controls="v-pills-material" aria-selected="true">Material</button>
        <button class="nav-link" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">Assignment</button>
        <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">Quiz</button>
        <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">Activity</button>
        <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">Exam</button>
      </div>
      <div class="tab-content w-100" id="v-pills-tabContent">

        <!-- MATERIALS CONTENT -->
        <div class="tab-pane fade show active bg-white" id="v-pills-material" role="tabpanel" aria-labelledby="v-pills-material-tab">
          <h5 class="text-secondary">Material</h5>
        </div>

        <!-- ASSIGNMENTS CONTENT -->
        <div class="tab-pane fade bg-white" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
          <h5 class="text-secondary">Assignments</h5>
          <div class="list-group d-flex" style="height: 500px; overflow-y: scroll; overflow-x: hidden;">
            <?php
            $sql = "SELECT * FROM cms_instructors_topics_assignments WHERE instructors_topics_id='" . $_GET['instructors_topics_id'] . "'";
            $res = $con->query($sql);
            function formatDateTime($date)
            {
              $timestamp = strtotime($date);
              return date("M, d, Y - h:i A", $timestamp);
            }
            if (mysqli_num_rows($res) > 0) {
              while ($row = $res->fetch_assoc()) {
                $assignment_id = $row['instructors_topics_assignments_id'];
                $assignment_topics_id = $row['instructors_topics_id'];
                $assignment_name = $row['assignment_name'];
                $assignment_description = $row['assignment_description'];
                $assignment_start = $row['assignment_submission_start'];
                $assignment_deadline = $row['assignment_submission_deadline'];
                $assignment_allow_submission = $row['assignment_allow_submission'];
                $assignment_items = $row['assignment_items'];
            ?>

                <!-- LIST OF ASSIGNMENTS -->
                <a href="viewItem.php?<?php echo 'assignment_id='.$assignment_id.'&instructor_topics_id='.$assignment_topics_id.'&assignment_name='.$assignment_name; ?>" class="list-group-item list-group-item-action active mb-2" aria-current="true">
                  <div class="d-flex justify-content-between">
                    <h5 class="mb-1"><?php echo $row['assignment_name'] ?></h5>
                    <p>Total: <span class="bg-primary text-white p-1 border rounded"><?php echo $row['assignment_items'] ?></span></p>
                  </div>
                  <p class="mb-1">Description: <?php echo $row['assignment_description'] ?></p>
                  <small class="bg-success text-white p-1 border rounded">Start: <?php echo formatDateTime($row['assignment_submission_start']) ?></small>
                  <small class="bg-danger text-white p-1 border rounded">Due: <?php echo formatDateTime($row['assignment_submission_deadline']) ?></small>
                </a>

              <?php
              }
            } else {
              ?>
              <p class="text-center text-primary">No assignment yet</p>
            <?php
            }
            ?>
          </div>
        </div>

        <!-- QUIZZES CONTENT -->
        <div class="tab-pane fade bg-white" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
          <h5 class="text-secondary">Quizzes</h5>
        </div>

        <!-- ACTIVITIES CONTENT -->
        <div class="tab-pane fade bg-white" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
          <h5 class="text-secondary">Activities</h5>
        </div>

        <!-- EXAMS CONTENT -->
        <div class="tab-pane fade bg-white" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
          <h5 class="text-secondary">Exams</h5>
        </div>
      </div>
    </div>



  </div>
</div>

<?php
require('includes/Footer.php');
?>