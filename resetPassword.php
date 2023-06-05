<?php
include('Components/Database.php');
include('Components/resetPassword.inc.php');
include('Components/Bootstrap.php');
$selector = $_GET["selector"];
$validator = $_GET["validator"];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body style="height: 100%">
<div class="h-100 d-flex align-items-center justify-content-center">
    <div class="card shadow-sm">
        <div class="card-body">
            <div class="mb-4 d-inline flex">
                <p class="mb-2"><span>Password Reset</span><span class="float-end"><a href="http://www.ucc-csd-bscs.com/CMS/login.php">Back to Login</a></span></p>
            </div>
            <?php
                            if (isset($_GET['newpwd'])) { 
                            if ($_GET['newpwd'] == "empty") {
                        ?>

                                <div class="alert alert-danger d-flex align-items-center" role="alert">
                                <p class="m-2"> <b>Password  </b>is empty, Please input password then please try again!</p>
                                </div>
                        <?php } 
                        }?>

                        <?php
                             if (isset($_GET['newpwd'])) { 
                            if ($_GET['newpwd'] == "PassMistmatch") {
                        ?>
                                <div class="alert alert-danger " role="alert">
                                    <p class="m-2"> <b>Password  </b>does not match please try again!</p>
                                </div>
                        <?php } 
                        }?>

            <?php
            if (empty($selector) || empty($selector)) {
                echo "Could not validate  Request";
            } else {
                if (ctype_xdigit($selector) !== false  && ctype_xdigit($validator) !== false) {
            ?>

                    <form method="POST">
                        <div class="mb-4">

                            <input type="hidden" name="selector" value="<?php echo $selector; ?>">
                            <input type="hidden" name="validator" value="<?php echo $validator; ?>">
                            <label for="password" class="form-label">New Password:</label>
                            <input type="password" id="password" class="form-control" name="password" placeholder="Enter New password">

                            <label for="password" class="form-label pt-2">Retype New Password:</label>
                            <input type="password" id="password" class="form-control" name="password-retype" placeholder="Retype New password">
                        </div>
                        <div class="mb-3 d-grid">
                            <button type="submit" name="ResetPasswordSubmit" class="btn btn-primary">
                                Reset Password
                            </button>
                        </div>
                    </form>
            <?php
                }
            }

            ?>
        </div>
    </div>
</div>
    
</body>
</html>
