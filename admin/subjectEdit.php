<?php
require('includes/Header.php');

$id = isset($_GET['id']) ? $_GET['id'] : null;
$subject = isset($_GET['subject']) ? $_GET['subject'] : null;
$subject_code = isset($_GET['subject_code']) ? $_GET['subject_code'] : null;
$course = isset($_GET['course']) ? $_GET['course'] : null;

if (!$id || !$subject || !$subject_code || !$course)
  echo '<script>window.location.href="subjectManage.php"</script>';

?>
<div class="x--main-container">
  <!-- Modal -->
  <div class="container pt-5">
    <div class="modal-container-fluid d-flex justify-content-center">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

          <form method="post" class="bg-light border border-primary rounded p-5 ">
            <!-- ADD STUDENT MODAL -->
            <h1 class="text-center fw-bold mb-5">Edit Subject</h1>
  
            <div class="input-group mb-4">
              <span class="input-group-text">Subject Code</span>
              <input value="<?php echo $subject_code ?>" type="text" aria-label="subject_code" placeholder="Subject code" class="form-control" name="subject_code" required>
            </div>

            <div class="input-group mb-4">
              <span class="input-group-text">Subject</span>
              <input value="<?php echo $subject ?>" type="text" class="form-control" placeholder="Subject Name" aria-label="Subject" aria-describedby="basic-addon1" name="subject" required>
            </div>


              <!-- SECTION IS DROP DOWN -->
              <div class="input-group mb-5">

                <div class="input-group-prepend">
                  <label class="input-group-text" for="inputGroupSection">Course</label>
                </div>
                <select name="course" id="inputGroupSection" class="custom-select">
                  <?php
                  $course = $con->query("SELECT * FROM cms_sections");
                  if ($course->num_rows > 0) {
                    while ($row = $course->fetch_assoc()) { ?>
                      <option value="<?php echo $row['course'] ?>" name="course"><?php echo $row['course'] ?></option>
                    <?php
                    }
                  } else { ?>
                    <option value="" name="section">no course records</option>
                  <?php
                  }
                  ?>
                </select>
              </div>


              <div class="d-flex justify-content-around mt-4">
                <input type="submit" name="submitEdit" class="btn btn-success btn-lg" value="Save"></input>
                <a href="subjectManage.php"><input type="button" class="btn btn-danger btn-lg" value="Close"></input></a>
              </div>

          </form>
          <?php
          if (isset($_POST['submitEdit'])) {
            $subject = $_POST['subject'];
            $subject_code = $_POST['subject_code'];
            $course = $_POST['course'];

            $res = $con->query(
              "UPDATE cms_subjects SET 
              subject='$subject', 
              subject_code='$subject_code', 
              course='$course'
              WHERE id='$id'"
            );
            echo '<script>window.location.href="subjectManage.php"</script>';
          }
          ?>
        </div>
      </div>
    </div>
  </div>
</div>

<?php
require('includes/Footer.php');
?>