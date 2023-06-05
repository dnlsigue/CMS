<?php
require('includes/Header.php');
?>
<div class="x--main-container">
    <link rel="stylesheet" href="../main-css/dashboard.css">
    <div class="container py-5">
        <div class="bg-light rounded border border-warning">
            <div class="flex mx-4 mt-5">
                <div class="row text-center justify-content-around">
                    <div class="col mt-4">
                        <div class="card border border-warning">
                            <div class="card-header">Users <i class="fa-solid fa-circle-info text-primary" data-bs-toggle="tooltip" data-bs-placement="right" title="Users"></i></div>
                            <div class="row justify-content-center align-items-center">
                                <span class="col card-title"><i class="fa-solid fa-users text-warning fs-2 my-2"></i></span>
                                <p class="col card-text fs-1">
                                    <?php
                                    $queryUsers = "SELECT id FROM cms_users ORDER BY id";
                                    $query_runUsers = mysqli_query($con, $queryUsers);
                                    $countUsers = mysqli_num_rows($query_runUsers);
                                    echo $countUsers;
                                    ?>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col mt-4">
                        <div class="card border border-warning">
                            <div class="card-header">Students <i class="fa-solid fa-circle-info text-primary"></i></div>
                            <div class="row justify-content-center align-items-center">
                                <span class="col card-title"><i class="fa-solid fa-user text-warning fs-2 my-2"></i></span>
                                <p class="col card-text fs-1">
                                    <?php
                                    $queryStudents = "SELECT id FROM cms_students ORDER BY id";
                                    $query_runStudents = mysqli_query($con, $queryStudents);
                                    $countStudents = mysqli_num_rows($query_runStudents);
                                    echo $countStudents;
                                    ?>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col mt-4">
                        <div class="card border border-warning">
                            <div class="card-header">Instructors <i class="fa-solid fa-circle-info text-primary"></i></div>
                            <div class="row justify-content-center align-items-center">
                                <span class="col card-title"><i class="fa-solid fa-chalkboard-user text-warning fs-2 my-2"></i></span>
                                <p class="col card-text fs-1">
                                    <?php
                                    $queryInstuctors = "SELECT id FROM cms_instructors ORDER BY id";
                                    $query_runInstructors = mysqli_query($con, $queryInstuctors);
                                    $countInstructors = mysqli_num_rows($query_runInstructors);
                                    echo $countInstructors;
                                    ?>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col mt-4">
                        <div class="card border border-warning">
                            <div class="card-header">Coordinators <i class="fa-solid fa-circle-info text-primary"></i></div>
                            <div class="row justify-content-center align-items-center">
                                <span class="col card-title"><i class="fa-solid fa-user-gear text-warning fs-2 my-2"></i></span>
                                <p class="col card-text fs-1"> <?php
                                                                $querycoordinators = "SELECT id FROM cms_coordinators ORDER BY id";
                                                                $query_runcoordinators = mysqli_query($con, $querycoordinators);
                                                                $countcoordinators = mysqli_num_rows($query_runcoordinators);
                                                                echo $countcoordinators;
                                                                ?></p>
                            </div>
                        </div>
                    </div>

                    <div class="col mt-4">
                        <div class="card border border-warning">
                            <div class="card-header">Admins / Staffs <i class="fa-solid fa-circle-info text-primary"></i></div>
                            <div class="row justify-content-center align-items-center">
                                <span class="col card-title"><i class="fa-solid fa-user-tie text-warning fs-2 my-2"></i></span>
                                <p class="col card-text fs-1">
                                    <?php
                                    $queryAdmins = "SELECT id FROM cms_admins ORDER BY id";
                                    $query_runAdmins = mysqli_query($con, $queryAdmins);
                                    $countAdmins = mysqli_num_rows($query_runAdmins);
                                    echo $countAdmins;
                                    ?>
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>


            <div class="flex mx-4 mt-2">

                <div class="row">
                    <div class="col">
                        <div class="card border border-warning">
                            <div class="card-header text-center">

                                <input type="submit" class="btn btn-primary" name="studentsButton" value="Students" />
                                <input type="submit" class="btn btn-primary" name="instructorsButton" value="Instructors" />
                                <input type="submit" class="btn btn-primary" name="coordinatorsButton" value="Coordinators" />
                                <input type="submit" class="btn btn-primary" name="adminsstaffsButton" value="Admins / Staffs" />

                            </div>
                            <div class="row justify-content-center align-items-center m-3">

                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card border border-warning">
                            <div class="card-header text-center">
                                <span class="text-primary">NOTIFICATIONS <i class="fa-solid fa-bell text-warning"></i></span>
                            </div>
                            <div class="row justify-content-center align-items-center">
                                <br>
                                <br>
                                <br>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


<?php
require('includes/Footer.php');
?>