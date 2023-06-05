<?php
ini_set('display_errors', 1);
if (isset($_POST["ResetPasswordSubmit"])) {
    $selector = $_POST['selector'];
    $validator = $_POST['validator'];
    $password = $_POST['password'];
    $passwordRetype = $_POST['password-retype'];

    if (empty($password) || empty($passwordRetype)) {
        echo "asfdsafsaf";
        echo "<script>window.location.href = 'http://www.ucc-csd-bscs.com/CMS/resetPassword.php?selector=" . $selector . "&validator=" . $validator . "&newpwd=empty';</script>";
        //   header("Location:resetPassword.php?selector=".$selector ."&validator=".$validator."&newpwd=empty");
        die();
    } else if ($password != $passwordRetype) {
        echo "<script>window.location.href = 'http://www.ucc-csd-bscs.com/CMS/resetPassword.php?selector=" . $selector . "&validator=" . $validator . "&newpwd=PassMistmatch';</script>";
        //  header("Location:resetPassword.php?selector=".$selector ."&validator=".$validator."&newpwd=PassMistmatch");
        die();
    }
    $currentDate = date("U");

    $sql = "SELECT * FROM cms_pwdReset WHERE pwdResetSelector =? AND pwdResetExpires >= ?";
    $stmt = mysqli_stmt_init($con);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        die("There Was An error");
    } else {
        mysqli_stmt_bind_param($stmt, "ss", $selector, $currentDate);
        mysqli_stmt_execute($stmt);

        mysqli_stmt_store_result($stmt);
        if (mysqli_stmt_num_rows($stmt) == 0) {
            exit();
        } else {
            mysqli_stmt_bind_result($stmt, $pwdResetID, $pwdResetUserID, $pwdResetSelector, $pwdResetToken, $pwdResetExpires);
            mysqli_stmt_fetch($stmt);
            $tokenBin = hex2bin($validator);
            $tokenCheck = password_verify($tokenBin, $pwdResetToken);
            if ($tokenCheck === false) {
                echo '<script>alert("Token error! Please request another password reset")</script>';
                echo "<script>window.location.href = 'http://www.ucc-csd-bscs.com/CMS/login.php'";
                exit();
            } else if ($tokenCheck === true) {

                $tokenSchoolID = $pwdResetUserID;

                $sql = "SELECT * FROM cms_users WHERE school_id=?;";
                $stmt = mysqli_stmt_init($con);
                if (!mysqli_stmt_prepare($stmt, $sql)) {
                    die("There Was An error");
                } else {
                    mysqli_stmt_bind_param($stmt, 's', $tokenSchoolID);
                    mysqli_stmt_execute($stmt);

                    mysqli_stmt_store_result($stmt);
                    if (mysqli_stmt_num_rows($stmt) == 0) {
                        die("There Was An error");
                    } else {
                        mysqli_stmt_bind_result($stmt, $id, $firstname, $lastname, $email, $username, $hashedPassword, $usertype, $school_id, $department_id, $registered_date);
                        mysqli_stmt_fetch($stmt);
                        $sql = "UPDATE cms_users SET password=? WHERE school_id=?";
                        $stmt = mysqli_stmt_init($con);
                        if (!mysqli_stmt_prepare($stmt, $sql)) {
                            die("There Was An error");
                        } else {
                            $options = [
                                'cost' => 10,
                            ];
                            $newhashedPassword = password_hash($password, PASSWORD_BCRYPT, $options);
                            mysqli_stmt_bind_param($stmt, 'ss', $newhashedPassword, $tokenSchoolID);
                            mysqli_stmt_execute($stmt);

                            $sql = "DELETE FROM cms_pwdReset WHERE pwdResetUserID=?";
                            $stmt = mysqli_stmt_init($con);
                            if (!mysqli_stmt_prepare($stmt, $sql)) {
                                header("Location:../login.php");
                                die("There Was An error");
                            } else {
                                mysqli_stmt_bind_param($stmt, "s", $tokenSchoolID);
                                mysqli_stmt_execute($stmt);
                                header("Location:login.php?newpwd=Password Updated");
                                die();
                            }
                        }
                    }
                }
            }
        }
    }
}
