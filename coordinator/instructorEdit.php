<?php
require('includes/Header.php');

$id = isset($_GET['id']) ? $_GET['id'] : null;
$school_id1 = isset($_GET['school_id']) ? $_GET['school_id'] : null;
$first_name1 = isset($_GET['first_name']) ? $_GET['first_name'] : null;
$last_name1 = isset($_GET['last_name']) ? $_GET['last_name'] : null;


if (!$id || !$school_id1 || !$first_name1 || !$last_name1)
  echo '<script>alert("Invalid Parameter"); window.location.href="instructorManage.php"</script>';

?>
<div class="x--main-container">
  <!-- Modal -->
  <div class="container pt-5">
    <div class="modal-container-fluid d-flex justify-content-center">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

          <form method="post" class="bg-light border border-primary rounded p-5">
            <!-- ADD STUDENT MODAL -->
            <h1 class="text-center fw-bold mb-5">Edit Instructor</h1>

            <div class="input-group mb-4">
              <span class="input-group-text" id="basic-addon1"><i class="fa fa-id-badge" aria-hidden="true"></i></span>
              <input value="<?php echo $school_id1 ?>" type="text" class="form-control" placeholder="School ID" aria-label="SchoolID" aria-describedby="basic-addon1" name="school_id" required>
            </div>

            <div class="input-group mb-4">
              <span class="input-group-text">First Name</span>
              <input value="<?php echo $first_name1 ?>" type="text" aria-label="Firstname" placeholder="First Name" class="form-control" name="first_name" required>

            </div>
            <div class="input-group mb-5">
              <span class="input-group-text">Last Name</span>
              <input value="<?php echo $last_name1 ?>" type="text" aria-label="Lastname" placeholder="Last Name" class="form-control" name="last_name" required>

            </div>


            <div class="d-flex justify-content-around mt-4">
              <input type="submit" name="submitEdit" class="btn btn-success btn-lg" value="Save"></input>
              <a href="InstructorManage.php"><input type="button" class="btn btn-danger btn-lg" value="Close"></input></a>
            </div>

          </form>
          <?php
          if (isset($_POST['submitEdit'])) {
            $school_id2 = $_POST['school_id'];
            $first_name = $_POST['first_name'];
            $last_name = $_POST['last_name'];

            $res = $con->query(
              "UPDATE cms_profileimg SET 
              school_id='$school_id2'
              WHERE school_id='$school_id1'"
            );

            $res = $con->query(
              "UPDATE cms_users SET 
              school_id='$school_id2', 
              first_name='$first_name', 
              last_name='$last_name'
              WHERE school_id='$school_id1'"
            );

            $res = $con->query(
              "UPDATE cms_instructors SET 
              school_id='$school_id2', 
              first_name='$first_name', 
              last_name='$last_name'
              WHERE id='$id'"
            );
            echo '<script>window.location.href="InstructorManage.php"</script>';
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