<!-- Modal -->
<div class="modal fade" id="AssigninstructorModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <form method="post" class="bg-light border border-primary rounded p-5">

                <!-- ADD STUDENT MODAL -->
                <h1 class="text-center fw-bold mb-5">Assign Instructor</h1>

                <!-- INSTRUCTOR IS DROP DOWN -->
                <div class="input-group mb-5">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupinstructors">Instructor</label>
                    </div>
                    <select name="instructors" id="inputGroupinstructors" class="selectpicker form-control border border-dark" data-live-search="true" aria-label="Default select example" title="Select Instructor" required>
                        <?php

                        $instructors = $con->query("SELECT * FROM cms_instructors");

                        if ($instructors->num_rows > 0) {
                            while ($row = $instructors->fetch_assoc()) { ?>
                                <option value="<?php echo $row['school_id'] ?>" name="instructors">[<?php echo $row['school_id'] ?>] <?php echo $row['first_name'] ?> <?php echo $row['last_name'] ?></option>
                            <?php
                            }
                        } else { ?>
                            <option value="" name="instructors">no instructors records</option>
                        <?php
                        }
                        ?>
                    </select>
                </div>

                <!-- SECTION IS DROP DOWN -->
                <div class="input-group mb-5">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupsubject">Subject</label>
                    </div>
                    <select name="subjectcode" id="subjectcodes" class="selectpicker form-control border border-dark" data-live-search="true" aria-label="Default select example" title="Select Subject" required>
                        <?php

                        $subject = $con->query("SELECT * FROM cms_subjects ORDER BY subject_code");
                        if ($subject->num_rows > 0) {
                            while ($row = $subject->fetch_assoc()) { ?>
                                <option value='<?php echo $row['subject_code'] ?>/ <?php echo $row['subject'] ?>' name="subjectcode" id="selected">[<?php echo $row['subject_code'] ?>] <?php echo $row['subject'] ?></option>
                            <?php
                            }
                        } else { ?>
                            <option value="" name="subjectcode">no subject records</option>
                        <?php
                        }
                        ?>
                    </select>
                </div>


                <!-- SECTION IS DROP DOWN -->
                <div class="input-group mb-5">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupSection">Course & Section</label>
                    </div>
                    <select name="section" id="inputGroupSection" class="selectpicker form-control border border-dark" data-live-search="true" aria-label="Default select example" title="Select Section" required>
                        <?php

                        $sections = $con->query("SELECT * FROM cms_sections");
                        if ($sections->num_rows > 0) {
                            while ($row = $sections->fetch_assoc()) { ?>
                                <option value="<?php echo $row['course'] . "-" . $row['section'] ?>" name="section"><?php echo $row['course'] . "-" . $row['section'] ?></option>
                            <?php
                            }
                        } else { ?>
                            <option value="" name="section">no section records</option>
                        <?php
                        }
                        ?>
                    </select>
                </div>


                <div class="d-flex justify-content-around mt-4">
                    <input type="submit" class="btn btn-success btn-lg" name="AssignInstructorSubmit" value="Add"></input>
                    <input type="reset" class="btn btn-danger btn-lg" value="Clear"></input>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>

            </form>

        </div>
    </div>
</div>

<?php
require '../Components/Database.php';
if (isset($_POST['AssignInstructorSubmit'])) {

    $subjectCode = $_POST['subjectcode'];
    $subject = explode('/', $subjectCode);
    $subjectCode = $subject[0];
    $subjectName = $subject[1];
    $instructors = $_POST['instructors'];
    $section = $_POST['section'];
    $classCode = $subjectCode . "-" . randString(6);


    $sql = "SELECT * FROM cms_classrooms WHERE subject_code='$subjectCode' AND  school_id='$instructors' AND  sections='$section'";
    $res = $con->query($sql);
    $row = $res->fetch_assoc();
    if ($res->num_rows >= 1) { ?>
        <div class="alert alert-danger text-center mx-5" role="alert">User Already Exist!
            <button type="button" class="btn-close btn-close-white" data-dismiss="alert" aria-label="Close"></button>
        </div>
<?php
    } else {

        $sql = "INSERT INTO cms_classes(class_code, subject) VALUES ('$classCode', '$subjectName')";
        $con->query($sql);

        $sql = "SELECT * FROM `cms_classes` WHERE class_code='$classCode'";
        $res = $con->query($sql);

        if (mysqli_num_rows($res) == 1) {
            while ($row = mysqli_fetch_assoc($res)) {
                $class_id = $row['class_id'];
            }
            $sql = "INSERT INTO `cms_classrooms`(`class_id`, `subject_code`, `school_id`, `sections`, `status`) 
            VALUES ('$class_id', '$subjectCode', '$instructors', '$section', '1')";
            $con->query($sql);
        } else {
            die("You have an error!");
        }
    }
}


function randString($length)
{
    $char = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    $char = str_shuffle($char);
    for ($i = 0, $rand = '', $l = strlen($char) - 1; $i < $length; $i++) {
        $rand .= $char[mt_rand(0, $l)];
    }
    return $rand;
}
?>