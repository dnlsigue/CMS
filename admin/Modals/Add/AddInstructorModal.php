<!-- Modal -->
<div class="modal fade" id="instructorModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <form method="post" class="bg-light border border-primary rounded p-5">

                <!-- ADD STUDENT MODAL -->
                <h1 class="text-center fw-bold mb-5">Add Instructor</h1>

                <div class="input-group mb-4">
                    <span class="input-group-text" id="basic-addon1"><i class="fa fa-id-badge" aria-hidden="true"></i></span>
                    <input type="text" class="form-control" placeholder="School ID" aria-label="SchoolID" aria-describedby="basic-addon1" name="schoolID" required>
                </div>

                <div class="input-group mb-4">
                    <span class="input-group-text">First Name</span>
                    <input type="text" aria-label="Firstname" placeholder="First Name" class="form-control" name="firstName" required>

                </div>
                <div class="input-group mb-5">
                    <span class="input-group-text">Last Name</span>
                    <input type="text" aria-label="Lastname" placeholder="Last Name" class="form-control" name="lastName" required>
                </div>

                <div class="d-flex justify-content-around mt-4">
                    <input type="submit" class="btn btn-success btn-lg" name="addingInstructorSubmit" value="Add"></input>
                    <input type="reset" class="btn btn-danger btn-lg" value="Clear"></input>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>

            </form>

        </div>
    </div>
</div>

<?php
require '../Components/Database.php';
if (isset($_POST['addingInstructorSubmit'])) {

    $Instructorschool_id = $_POST['schoolID'];
    $fname = $_POST['firstName'];
    $lname = $_POST['lastName'];
    $password = $_POST['schoolID'];

    $options = [
        'cost' => 10,
    ];
    $hashedpassword = password_hash($password, PASSWORD_BCRYPT, $options);


    $checkSchoolID = mysqli_query($con, "SELECT *  FROM cms_users where school_id = '$Instructorschool_id' ");
    if (mysqli_num_rows($checkSchoolID)) { ?>
        <div class="alert alert-danger text-center mx-5" role="alert">User Already Exist!
            <button type="button" class="btn-close btn-close-white" data-dismiss="alert" aria-label="Close"></button>
        </div>
<?php
        $checkSchoolID = null;
    } else {
        $res = $con->query("INSERT INTO `cms_instructors`(`school_id`, `first_name`, `last_name`, `status`) 
  VALUES ('$Instructorschool_id','$fname','$lname', 1)");

        $sql = "INSERT INTO `cms_users`(`school_id`, `first_name`, `last_name`, `password`, `role`) 
VALUES ('$Instructorschool_id', '$fname', '$lname', '$hashedpassword', 'instructor')";
        $con->query($sql);

        $sql = "SELECT * FROM cms_users WHERE school_id='$Instructorschool_id' AND first_name='$fname'";
        $res = $con->query($sql);

        if (mysqli_num_rows($res) > 0) {
            while ($row = mysqli_fetch_assoc($res)) {
                $Instructorschool_id = $row['school_id'];
                $sql2 = "INSERT INTO `cms_profileimg`(`school_id`, `status`) VALUES ('$Instructorschool_id','1')";
                $con->query($sql2);
            }
        } else {
            echo "You have an error!";
        }
    }
}

?>