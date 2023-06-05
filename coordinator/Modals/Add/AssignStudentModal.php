<!-- Modal -->
<div class="modal fade" id="AssignStudentModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <form method="post" class="bg-light border border-primary rounded p-5">

                <!-- Assign STUDENT MODAL -->
                <h1 class="text-center fw-bold mb-5">Assign Student</h1>

                <div class="input-group mb-5">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupstudents">Students</label>
                    </div>
                    <select name="students[]" id="inputGroupstudents" class="selectpicker form-control border border-dark" data-live-search="true" multiple aria-label="Default select example" title="Select Student" required>
                        <?php

                        $students = $con->query("SELECT * FROM cms_students");

                        if ($students->num_rows > 0) {
                            while ($row = $students->fetch_assoc()) { ?>
                                <option value="<?php echo $row['school_id'] ?>" name="students">[<?php echo $row['school_id'] ?>] <?php echo $row['first_name'] ?> <?php echo $row['last_name'] ?></option>
                            <?php
                            }
                        } else { ?>
                            <option value="" name="students">no Student records</option>
                        <?php
                        }
                        ?>
                    </select>
                </div>
                <div class="input-group mb-5">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupSection">Course & Section</label>
                    </div>
                    <select name="section" id="inputGroupSection" class="custom-select" required>
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
                    <input type="submit" class="btn btn-success btn-lg" name="assignStudentSubmit" value="Add"></input>
                    <input type="reset" class="btn btn-danger btn-lg" value="Clear"></input>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>

            </form>

        </div>
    </div>
</div>

<?php
require '../Components/Database.php';
if (isset($_POST['assignStudentSubmit'])) {

    $studentid = $_POST['students'];
    $section = $_POST['section'];


    foreach ($studentid as $studentlist) {
        $sql = "SELECT * FROM cms_sectionList WHERE school_id ='$studentlist'";
        $res = $con->query($sql);
        $row = $res->fetch_assoc();

        if ($res->num_rows > 0) {
        } else {
         //   $sql = "INSERT INTO `cms_sectionList`(`sections`,`school_id`) SELECT section,school_id FROM cms_students WHERE school_id='$studentlist';";
         $res = $con->query( "UPDATE cms_students SET assigned = 'YES' WHERE school_id='$studentlist'");
         $sql = "INSERT INTO `cms_sectionList`(`sections`, `school_id`) VALUES ('$section','$studentlist')";
         $con->query($sql);
        }
    }
}

?>