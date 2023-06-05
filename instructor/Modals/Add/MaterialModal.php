<!-- Modal -->
<div class="modal fade" id="materialModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <form method="post" class="bg-light border border-primary rounded p-5" enctype="multipart/form-data">

        <!-- CREATE CLASS MODAL -->
        <h1 class="text-center fw-bold mb-5">Create Material</h1>

        <div class="input-group mb-4">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Material Name</label>
          </div>
          <input type="text" class="form-control" placeholder="Topic Name" aria-label="name" aria-describedby="basic-addon1" name="name" required>
        </div>
        <!-- TOPIC DESCRIPTION -->
        <textarea type="text" rows="4" class="form-control mb-4" placeholder="Description..." aria-label="description" aria-describedby="basic-addon1" name="description" required></textarea>
        <!-- FILE UPLOAD -->
        <input type="file" class="" name="file" id="file" required>
        <p><b>File type:</b> docx, pdf, jpg, png</p>
        <!-- BUTTON ACTIONS -->
        <div class="d-flex justify-content-around mt-4">
          <input type="submit" class="btn btn-success btn-lg" name="addMaterial" value="Add"></input>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>

      </form>

    </div>
  </div>
</div>

<?php

if (isset($_POST['addMaterial'])) {
  $name = $_POST['name'];
  $description = $_POST['description'];


  if(isset($_FILES['file'])){
    $uploadedFile = $_FILES['file'];

    // Define the target directory where the file will be uploaded
    $targetDirectory = "../uploads/instructor_materials/";

    // Generate a unique name for the file to avoid conflicts
    $fileName = 'material_' . uniqid() . '_' . $uploadedFile['name'];

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
        $sql = "INSERT INTO cms_instructors_topics_lesson_materials (instructors_topics_id, lessonMaterials_file_path, lessonMaterials_title, lessonMaterials_description) ". 
        "VALUES (?, ?, ?, ?)";

        $stmt = $con->prepare($sql);
        $stmt->bind_param("isss", $_GET['instructors_topics_id'], $targetPath, $name, $description);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
          // Material inserted successfully
          echo '';
        } else {
          // Failed to insert material
          echo 'Failed to insert material';
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