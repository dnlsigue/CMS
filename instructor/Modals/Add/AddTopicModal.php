<!-- Modal -->
<div class="modal fade" id="topicModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <form method="post" class="bg-light border border-primary rounded p-5">

        <!-- TOPIC NAME -->
        <h1 class="text-center fw-bold mb-5">Add TOPIC</h1>

        <div class="input-group mb-4">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Topic Name</label>
          </div>
          <input type="text" class="form-control" placeholder="Topic Name" aria-label="topic_name" aria-describedby="basic-addon1" name="topic_name" required>
        </div>

        <!-- TERMS DROP DOWN -->
        <div class="input-group mb-5">
            <div class="input-group-prepend">
                <label class="input-group-text" for="inputGroupinstructors">Term</label>
            </div>
            <select name="term" id="inputGroupinstructors" class="selectpicker form-control border border-dark" data-live-search="true" aria-label="Default select example" title="Select Term" required>
                
              <option value="Prelim" name="term">Prelim</option>
              <option value="Midterm" name="term">Midterm</option>
              <option value="Finals" name="term">Finals</option>
            </select>
        </div>

        <!-- TOPIC DESCRIPTION -->
        
        <textarea type="text" rows="4" class="form-control" placeholder="Description..." aria-label="topic_name" aria-describedby="basic-addon1" name="topic_description" required></textarea>

        <div class="d-flex justify-content-around mt-4">
          <input type="submit" class="btn btn-success btn-lg" name="addingTopicSubmit" value="Add"></input>
          <input type="reset" class="btn btn-danger btn-lg" value="Clear"></input>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>

      </form>

    </div>
  </div>
</div>
<?php
require '../Components/Database.php';

if($_SERVER['REQUEST_METHOD'] === 'POST'){
  if (isset($_POST['addingTopicSubmit'])) {

    $topic_name = $_POST['topic_name'];
    $term = $_POST['term'];
    $topic_description = $_POST['topic_description'];
    $classroom_id = $_GET['classroom_id'];
  
    $sql = "SELECT * FROM cms_instructors_topics WHERE topic_name='$topic_name'";
    $res = $con->query($sql);
    $row = $res->fetch_assoc();
    if($res->num_rows > 0) {

    } else {

      $sql = "INSERT INTO cms_instructors_topics(classroom_id, topic_name, topic_description, term, status) VALUES ('$classroom_id', '$topic_name', '$topic_description', '$term', 1)";
      $con->query($sql);
    }
  }
}


?>