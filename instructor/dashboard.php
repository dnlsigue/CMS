<?php
    require('includes/Header.php');
?>

<div class="x--main-container">
    <div class="flex mx-4 mt-5">
        <div class="row text-center justify-content-around">
            
            <div class="col mt-2">
                <div class="card border border-warning">
                    <div class="card-header text-center">
                        <span class="text-primary">NOTIFICATIONS <i class="fa-solid fa-bell text-warning"></i></span>
                    </div>
                    <div class="row justify-content-center align-items-center">
                        <?php echo print_r($_SESSION); ?>
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
<!-- kay sigue -->
<!-- <div class="about-us-section bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-lg-6 mb-4 mb-lg-0">
                        <div class="img-head">
                            <img src="../img/AndrielGabriel.jpg" height=300 alt="">
                        </div>
                    </div>
                    <div class="col-12 col-lg-6">
                        <h2 class="text-head">DASHBOARD</h2>
                        <div class="break-small mb-2"></div>
                        <p class="text-para">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Adipisci voluptates hic facilis libero. Esse praesentium recusandae animi adipisci, mollitia aliquid a ipsam reprehenderit totam fuga repudiandae perspiciatis accusantium nihil earum!
                        </p>
                        
                        <div class="row">

                            <div class="col-12 col-md-4 mb-2 mb-md-0">
                                <div class="box">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <h4 class="mb-0">TOTAL USERS</h4>
                                    <p class="mb-0">999</p>
                                </div>
                            </div>

                            <div class="col-12 col-md-4 mb-2 mb-md-0">
                                <div class="box">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <h4 class="mb-0">TOTAL STUDENTS</h4>
                                    <p class="mb-0">999</p>
                                </div>
                            </div>

                            <div class="col-12 col-md-4 mb-2 mb-md-0">
                                <div class="box">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <h4 class="mb-0">TOTAL INSTRUCTORS</h4>
                                    <p class="mb-0">999</p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

</div> -->

<?php
require('includes/Footer.php');
?>