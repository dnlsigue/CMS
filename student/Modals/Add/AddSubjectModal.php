<!-- Modal -->
<div class="modal fade" id="subjectModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <form method="post" class="bg-light border border-primary rounded p-5">

        <!-- ADD Subject MODAL -->
        <h1 class="text-center fw-bold mb-5">Add Subject</h1>

        <div class="input-group mb-4">
          <span class="input-group-text">Subject Code</span>
          <input type="text" class="form-control" placeholder="Subject Code" aria-label="Subject Code" aria-describedby="basic-addon1" name="subjectCode" required>
          </div>

        <div class="input-group mb-4">
        <span class="input-group-text">Subject</span>
          <input type="text" class="form-control" placeholder="Subject Name" aria-label="Subject Name" aria-describedby="basic-addon1" name="subject" required>
          </div>

          <div class="input-group mb-5">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupSection">Course</label>
          </div>
          <select name="course" id="inputGroupSection" class="custom-select">
            <?php

            $sections = $con->query("SELECT * FROM cms_sections");
            if ($sections->num_rows > 0) {
              while ($row = $sections->fetch_assoc()) { ?>
                <option value="<?php echo $row['course']?>" name="course"><?php echo $row['course']?></option>
              <?php
              }
            } else { ?>
              <option value="" name="course">no section records</option>
            <?php
            }
            ?>
          </select>
        </div>

        <div class="d-flex justify-content-around mt-4">
          <input type="submit" class="btn btn-success btn-lg" name="addingSubjectSubmit" value="Add"></input>
          <input type="reset" class="btn btn-danger btn-lg" value="Clear"></input>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>

      </form>

    </div>
  </div>
</div>

<?php
require '../Components/Database.php';
if (isset($_POST['addingSubjectSubmit'])) {

  $subject = $_POST['subject'];
  $subjectCode = $_POST['subjectCode'];
  $course = $_POST['course'];

  $checkSubjectCode = mysqli_query($con, "SELECT *  FROM cms_subjects where subject_code = '$subjectCode'");
  if (mysqli_num_rows($checkSubjectCode)) { ?>
     <div class="alert alert-danger text-center mx-5" role="alert">Subject Code Already Exist!
    <button type="button" class="btn-close btn-close-white" data-dismiss="alert" aria-label="Close"></button>
    </div>
<?php
    $checkSubjectCode = null;
  } else {
    $res = $con->query("INSERT INTO `cms_subjects`(`subject`, `subject_code`,`course`) VALUES ('$subject','$subjectCode','$course')");
  }
}

?>