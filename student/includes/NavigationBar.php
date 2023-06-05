<body>
    <!--wrapper start-->
    <div class="x--wrapper">
            <!--header menu start-->
            <div class="x--header">

                <div class="x--header-menu">
                <div class="x--title"> <a href="dashboard.php"><span id="orange" class="text-orange">UCC </span>Classroom</div></a> 
                    <div class="x--sidebar-btn">
                        <i class="fas fa-bars"></i>
                    </div>
                    <ul>
                        <li><a href="profile.php" class="bg-transparent"><?php
                        $sqlImg = "SELECT * FROM cms_profileimg WHERE school_id='$school_id'";
                        $resultImg = $con->query($sqlImg);
                        while ($rowImg = mysqli_fetch_assoc($resultImg)) {
                            if ($rowImg['status'] == 0) {
                                $filename = "../uploads/profile" . $school_id . "*";
                                $fileinfo = glob($filename);
                                $fileext = explode(".", $fileinfo[0]);
                                $fileactualext = $fileext[3];
                                echo "<img class='img-thumbnail img-fluid rounded-circle mx-auto' style='background-color: #0000;
                                border: 1px solid #ffffff; width: 100%; height: 100%; object-fit: cover;' src='../uploads/profile"  . $school_id . ".$fileactualext?" . mt_rand() . "'>";
                            } else {
                                echo "<img class='img-thumbnail img-fluid rounded-circle mx-auto' style='background-color: #0000;
                                border: 1px solid #ffffff; width: 100%; height: 100%; object-fit: cover;' src='../uploads/profiledefault.jpg'>";
                            }
                        } //autofit
                        ?></a></li>
                    </ul>
                </div>
            </div>
            <!--header menu end-->
            <!--sidebar start-->

            <div class="x--sidebar">

                <div class="x--sidebar-menu">

                    <center class=x--profile>

                        <?php   
                        $sqlImg = "SELECT * FROM cms_profileimg WHERE school_id='$school_id'";
                        $resultImg = $con->query($sqlImg);
                        while ($rowImg = mysqli_fetch_assoc($resultImg)) {
                            if ($rowImg['status'] == 0) {
                                $filename = "../uploads/profile" . $school_id . "*";
                                $fileinfo = glob($filename);
                                $fileext = explode(".", $fileinfo[0]);
                                $fileactualext = $fileext[3];
                                echo "<img src='../uploads/profile" . $school_id . ".$fileactualext?" . mt_rand() . "'>";
                            } else {
                                echo "<img src='../uploads/profiledefault.jpg'>";
                            }
                        }
                        ?>
                        <p class="text-primary bg-warning"><?php echo $school_id; ?></p>
                        <p><?php echo $first_name . " " . $last_name; ?></p>
                    </center>

                    <li class="x--item">
                        <a href="dashboard.php" class="x--menu-btn">
                            <i class="fas fa-desktop"></i><span>Dashboard</span>
                        </a>
                    </li>
                    <li class="x--item" id="profile">
                        <a href="#profile" class="x--menu-btn">
                            <i class="fas fa-user-circle"></i><span>My Classrooms&nbsp;&nbsp;&nbsp;<i class="fa-sharp fa-solid fa-caret-down"></i></span>
                        </a>
                        <div class="x--sub-menu">
                            <a href="myClass.php"><i class="fa-solid fa-user-gear"></i><span>My Class</span></a>
                            <a href="instructorManage.php"><i class="fa-solid fa-user-gear"></i><span>Archive Class</span></a>
                        </div>
                    </li>
                 
                    <li class="x--item">
                        <a href="ViewSchedule.php" class="x--menu-btn">
                            <i class="fas fa-calendar"></i><span>View Schedule</span>
                        </a>
                    </li>
                    <li class="x--item">
                        <a href="aboutUs.php" class="x--menu-btn">
                            <i class="fas fa-desktop"></i><span>About Us</span>
                        </a>
                    </li>
                    <li class="x--item">
                    <?php

                    if (empty($email) || empty($phone)) {
                        $toggle = 'visible';
                    ?>
                        <a href="Profile.php" class="x--menu-btn">
                        <?php
                    } else {
                        $toggle = 'hidden';
                        ?>
                            <a href="../Components/logout.php" class="x--menu-btn">
                            <?php
                        } ?>
                            <i class="fas fa-power-off"></i><span>Logout</span>
                            </a>
                </li>
                </div>
            </div>
            <!--sidebar end-->
            <!--main container start-->

