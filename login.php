<?php
session_start();
include('Components/Database.php');
include('Components/LoginChecker.php');
require('Components/PHPMailerConfig.php');
require('Components/resetPassRequest.inc.php');
//Gabriel
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <?php include('Components/Bootstrap.php'); ?>
    <link rel="icon" href="ucc.png">
    <title id="title">LOGIN</title>
</head>

<body>
    <div class="center">
        <div class="card">
            <h1 class="h1 rounded-top">
                <div class="login">
                    <span class="letter"></span>
                    <span class="letter">L</span>
                    <span class="letter">O</span>
                    <span class="letter">G</span>
                    <span class="letter">I</span>
                    <span class="letter">N</span>
                    <span class="letter"></span>
                </div>
            </h1>
            <?php
            if (isset($_GET['newpwd'])) {
                if ($_GET['newpwd'] == "Password Updated") {
            ?>

                    <div class="alert alert-success" role="alert">

                        <?= $_GET['newpwd'] ?>
                    </div>
            <?php }
            } ?>
            <form method="post" id="formid">
                <div class="text-center">
                    <?php
                    if (isset($_GET['error'])) { ?>

                        <div class="alert alert-danger" role="alert">

                            <?= $_GET['error'] ?>
                        </div>
                    <?php } ?>
                    <?php
                    if (isset($_GET['reset'])) {
                        if ($_GET['reset'] == "An Email was sent to <b>" . $_SESSION['result'] . "</b>") {
                    ?>

                            <div class="alert alert-success" role="alert">

                                <?= $_GET['reset'] ?>
                            </div>
                    <?php }
                    } ?>
                    <?php
                    if (isset($_GET['error1'])) {
                        if ($_GET['error1'] == "User <b>" . $_SESSION['ResetID'] . "</b> Does not exist") {
                    ?>

                            <div class="alert alert-danger" role="alert">

                                <?= $_GET['error1'] ?>
                            </div>
                    <?php }
                    } ?>
                </div>
                <div class="txt_field">
                    <input type="text" name="schoolID" autocomplete="off" required>
                    <span></span>
                    <label class="h1">School ID</label>
                </div>
                <div class="txt_field">
                    <input type="password" name="password" autocomplete="off" required>
                    <span></span>
                    <label class="h1">Password</label>
                </div>
                <div class="pt-4">
                    <input type="submit" value="LOGIN" name="submitLogin" onclick="delaySubmit(event)">
                </div>
                <div class="pt-2 d-flex justify-content-center">
                    <a href="" class="pass" data-bs-toggle="modal" data-bs-target="#forgotPassword" style="text-decoration: none; pointer-events: none;">Reset Password</a>
                </div>
            </form>
            <div class="signup_link font-weight-light text-center text-nowrap pr-4 blockquote-footer"><i>Contact:</i>
                <a href="https://mail.google.com/mail/?view=cm&to=cms-support@ucc-csd-bscs.com&bcc=cms-support@ucc-csd-bscs.com">cms-support@ucc-csd-bscs.com</a>
            </div>
        </div>
<script>
       function changeLoginText() {
    const letters = document.querySelectorAll('.letter');
    letters[0].textContent = 'W';
    letters[1].textContent = 'E';
    letters[2].textContent = 'L';
    letters[3].textContent = 'C';
    letters[4].textContent = 'O';
    letters[5].textContent = 'M';
    letters[6].textContent = 'E';
  }

  function delaySubmit(event) {
    changeLoginText(); // call the changeLoginText function before the delay
    setTimeout(function() {
      document.getElementById("formid").submit();
    }, 5000); // Delay of 5 seconds (5000 milliseconds)
  }
</script>
        <div class="modal fade" id="forgotPassword" tabindex="-1" role="dialog" aria-labelledby="forgotPassword" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content text-center" style="border-radius: 10px; box-shadow: 0px 0px 15px #2691d9b7;">    
                    <div class="modal-header justify-content-center">
                        <h5 class="modal-title" id="forgotPassword">Forgot Password ?</h5>
                    </div>
                    <div class="modal-body">
                        <div class="container d-flex justify-content-center">
                            <div class="card shadow-sm">
                                <div class="card-body">
                                    <div class="mb-4">
                                        <p class="mb-2">Enter your registered School ID to reset the password
                                        </p>
                                    </div>
                                    <form method="POST">
                                        <div class="mb-3">
                                            <label for="username" class="form-label">School ID:</label>
                                            <input type="username" id="schoolid" class="form-control" name="schoolid" placeholder="20201138-M" required>
                                        </div>
                                        <div class="mb-3 d-grid">
                                            <button type="submit" name="ResetPasswordRequest" class="btn btn-primary">
                                                Reset Password
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script>
        var myModal = document.getElementById('forgotPassword')
        var myInput = document.getElementById('myInput')

        myModal.addEventListener('shown.bs.modal', function() {
            myInput.focus()
        })
    </script>
</body>

</html>