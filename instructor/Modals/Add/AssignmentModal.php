<!-- Modal -->
<div class="modal fade" id="assignmentModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <form method="post" class="bg-light border border-primary rounded p-5" enctype="multipart/form-data">

        <!-- CREATE CLASS MODAL -->
        <h1 class="text-center fw-bold mb-5">Create Assignment</h1>

        <div class="input-group mb-4">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Assignment Name</label>
          </div>
          <input type="text" class="form-control" placeholder="Topic Name" aria-label="name" aria-describedby="basic-addon1" name="name" required>
        </div>

        <!-- TOPIC DESCRIPTION -->
        <textarea type="text" rows="4" class="form-control mb-4" placeholder="Description..." aria-label="description" aria-describedby="basic-addon1" name="description" required></textarea>

        <!-- START -->
        <div class="input-group">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Start</label>
          </div>
          <input type="datetime-local" class="form-control" name="startDateTime" id="startDateTime" required>
        </div>


        <!-- DEADLINE (DUE) -->
        <div class="input-group">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Due</label>
          </div>
          <input type="datetime-local" class="form-control" name="dueDateTime" id="dueDateTime" required>
        </div>

        <!-- ALLOW LATE SUBMISSION -->
        <div class="form-group form-check  mb-4">
          <input type="checkbox" class="form-check-input" checked name="allowLate" id="allowLate">
          <label class="form-check-label" for="exampleCheck1">Allow late submission</label>
        </div>
        <!-- FILE UPLOAD -->
        <input type="file" class="" name="file" id="file" required>
        <p><b>File type:</b> docx, pdf, jpg, png</p>

        <!-- BUTTON ACTIONS -->
        <div class="d-flex justify-content-around mt-4">
          <input type="submit" class="btn btn-success btn-lg" name="addAssignment" value="Add"></input>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>

      </form>

    </div>
  </div>
</div>

<?php

if (isset($_POST['addAssignment'])) {
  $name = $_POST['name'];
  $description = $_POST['description'];
  $start = $_POST['startDateTime'];
  $due = $_POST['dueDateTime'];
  $allow = $_POST['allowLate'];

  $startConverted = date('Y-m-d H:i:s', strtotime($start));
  $dueConverted = date('Y-m-d H:i:s', strtotime($due));

  if(isset($_FILES['file'])){
    $uploadedFile = $_FILES['file'];

    // Define the target directory where the file will be uploaded
    $targetDirectory = "../uploads/instructor_assignments/";

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
        $sql = "INSERT INTO cms_instructors_topics_assignments (instructors_topics_id, assignment_submission_start, assignment_submission_deadline, assignment_file_path, assignment_name, assignment_description, assignment_allow_submission, assignment_items) ". 
        "VALUES (?, ?, ?, ?, ?, ?, ?, 100)";

        $stmt = $con->prepare($sql);
        $stmt->bind_param("isssssi", $_GET['instructors_topics_id'], $startConverted, $dueConverted, $targetPath, $name, $description, $allow);
        $stmt->execute();

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