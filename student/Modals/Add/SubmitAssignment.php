<!-- Modal -->
<div class="modal fade" id="submitAssignment" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <form method="post" class="bg-light border border-primary rounded p-5" enctype="multipart/form-data">

        <!-- SUBMIT ASSIGNMENT MODAL -->
        <h1 class="text-center fw-bold mb-5">Submit Assignment</h1>

        <div class="mb-3">
          <label for="formFileMultiple" class="form-label">File upload (docx, pdf, jpg, png)</label>
          <input class="form-control" type="file" name="file" id="formFileMultiple" multiple>
        </div>

        <div class="d-flex justify-content-around mt-4">
          <input type="submit" class="btn btn-success btn-lg" name="submitAssignmentSubmit" value="Submit"></input>
          <input type="reset" class="btn btn-danger btn-lg" value="Clear"></input>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>

      </form>

    </div>
  </div>
</div>
<?php
require '../Components/Database.php';
if (isset($_POST['submitAssignmentSubmit'])) {
  if(isset($_FILES['file'])){
    $uploadedFile = $_FILES['file'];

    // Define the target directory where the file will be uploaded
    $targetDirectory = "../uploads/student_assignments/";

    // Generate a unique name for the file to avoid conflicts
    $fileName = 'assignment_' . uniqid() . '_' . $uploadedFile['name'];

    // Construct the target path
    $targetPath = $targetDirectory . $fileName;

    // Get the file extension
    $fileExtension = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));

    // Define the allowed file types
    $allowedExtensions = array('docx', 'pdf', 'jpg', 'jpeg', 'png');

    // Check if the file type is allowed
    if (in_array($fileExtension, $allowedExtensions)) {
      // Move the uploaded file to the target directory
      if (move_uploaded_file($uploadedFile['tmp_name'], $targetPath)) {
         // File upload successful

        // Insert the file path into the database using prepared statements
        $sql = "INSERT INTO cms_students_assignments_submission (instructors_topics_assignments_id, school_id, assignment_submitted_time, assignment_status, assignment_file_path_submission, assignment_score)";


        if ($stmt->affected_rows > 0) {
          // Assignment inserted successfully
          echo 'Assignment inserted successfully';
        } else {
          // Failed to insert assignment
          echo 'Failed to insert assignment';
        }

        $stmt->close();
      } else {
        // File upload failed
        return false;
      }
    } else {
      // Invalid file type
      return false;
    }

    
  }

}

?>