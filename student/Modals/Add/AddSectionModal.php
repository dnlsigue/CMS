<!-- Modal -->
<div class="modal fade" id="sectionModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <form method="post" class="bg-light border border-primary rounded p-5">

        <!-- ADD Subject MODAL -->
        <h1 class="text-center fw-bold mb-5">Add Section</h1>

        <div class="input-group mb-4">
          <span class="input-group-text" id="basic-addon1">Course</span>
          <input type="text" class="form-control" placeholder="Course" aria-label="course" aria-describedby="basic-addon1"  name="course"  onkeypress="return onlyNumberKey(event)" required>
        </div>

        <div class="input-group mb-4">
          <span class="input-group-text" id="basic-addon1">Section</span>
          <input type="text" class="form-control" placeholder="Section" aria-label="section" aria-describedby="basic-addon1" name="section" required>
        </div>

        <div class="d-flex justify-content-around mt-4">
          <input type="submit" class="btn btn-success btn-lg" name="addingSectionSubmit" value="Add"></input>
          <input type="reset" class="btn btn-danger btn-lg" value="Clear"></input>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>

      </form>

    </div>
  </div>
</div>

<?php
require '../Components/Database.php';
if (isset($_POST['addingSectionSubmit'])) {

  $course = $_POST['course'];
  $section = $_POST['section'];

  $checkSectionCode = mysqli_query($con, "SELECT *  FROM cms_sections where section = '$section'");
  if (mysqli_num_rows($checkSectionCode)) { ?>
     <div class="alert alert-danger text-center mx-5" role="alert">section Already Exist!
    <button type="button" class="btn-close btn-close-white" data-dismiss="alert" aria-label="Close"></button>
    </div>
<?php
    $checkSectionCode = null;
  } else {
    $res = $con->query("INSERT INTO `cms_sections`(`course`, `section`) VALUES ('$course','$section')");
  }
}

?>