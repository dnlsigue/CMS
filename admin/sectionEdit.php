<?php
require('includes/Header.php');

$id = isset($_GET['id']) ? $_GET['id'] : null;
$course = isset($_GET['course']) ? $_GET['course'] : null;
$section = isset($_GET['section']) ? $_GET['section'] : null;

if (!$id || !$course || !$section)
  echo '<script>window.location.href="sectionManage.php"</script>';

?>
<div class="x--main-container">
  <!-- Modal -->
  <div class="container pt-5">
    <div class="modal-container-fluid d-flex justify-content-center">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

          <form method="post" class="bg-light border border-primary rounded p-5 ">

            <!-- ADD STUDENT MODAL -->
            <h1 class="text-center fw-bold mb-5">Edit Section</h1>

            <div class="input-group mb-4">
              <span class="input-group-text">Course</span>
              <input value="<?php echo $course ?>" type="text" aria-label="course" placeholder="COURSE" class="form-control" name="course" required>
            </div>

            <div class="input-group mb-4">
              <span class="input-group-text">Section</span>
              <input value="<?php echo $section ?>" type="text" aria-label="section" placeholder="Section" class="form-control" name="section" onkeypress="return onlyNumberKey(event)" required>

            </div>

            <div class="d-flex justify-content-around mt-4">
              <input type="submit" name="submitEdit" class="btn btn-success btn-lg" value="Save"></input>
              <a href="sectionManage.php"><input type="button" class="btn btn-danger btn-lg" value="Close"></input></a>
            </div>

          </form>
          <?php
          if (isset($_POST['submitEdit'])) {
            $course = $_POST['course'];
            $section = $_POST['section'];

            $res = $con->query(
              "UPDATE cms_sections SET 
              course='$course', 
              section='$section'
              WHERE id='$id'"
            );
            echo '<script>window.location.href="sectionManage.php"</script>';
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