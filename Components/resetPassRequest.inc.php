<?php
include('Database.php');
ini_set('display_errors', 1);
if (isset($_POST['ResetPasswordRequest'])) {
    $selector = bin2hex(random_bytes(8));
    $token = random_bytes(32);

    $url = "www.ucc-csd-bscs.com/CMS/resetPassword.php?selector=" . $selector . "&validator=" . bin2hex($token);

    $expires = date("U") + 1800;
    // add checker db if there's no email existing in db users
    $userID = $_POST["schoolid"];
    $_SESSION['ResetID'] = $userID;
    $res = mysqli_query($con, "SELECT *  FROM cms_users where school_id = '$userID'");
    if (mysqli_num_rows($res) == 1) {
        while ($row = mysqli_fetch_assoc($res)) {
            $userEmail = $row['email'];
        }
        if ($userEmail == NULL) {
            die("email null");
        } else {
            $sql = "DELETE FROM cms_pwdReset WHERE pwdResetUserID=?";
            $stmt = mysqli_stmt_init($con);
            if (!mysqli_stmt_prepare($stmt, $sql)) {
                die("There Was An error 1");
            } else {
                mysqli_stmt_bind_param($stmt, "s", $userID);
                mysqli_stmt_execute($stmt);
            }
            $sql = "INSERT INTO cms_pwdReset(pwdResetUserID,pwdResetEmail,pwdResetSelector,pwdResetToken,pwdResetExpires) VALUES(?,?,?,?,?);";
            $stmt = mysqli_stmt_init($con);
            if (!mysqli_stmt_prepare($stmt, $sql)) {
                die("There Was An error 2");
            } else {

                $hashedToken = password_hash($token, PASSWORD_DEFAULT);
                mysqli_stmt_bind_param($stmt, "sssss", $userID, $userEmail, $selector, $hashedToken, $expires);
                mysqli_stmt_execute($stmt);
            }
            mysqli_stmt_close($stmt);
            mysqli_close($con);



            $mail->addAddress($userEmail); // Add a recipient
            $mail->isHTML(true);
            $mail->Subject = 'Reset Password for User: "' . $userID . '"';
            $message = '<p><b>The link to reset your password:</b></p>';
            $message .= '<p><a href ="' . $url . '">' . $url . '</a></p>';
            $mail->Body = $message;
            $mail->AltBody = '';
            $mail->send();
            save_mail($mail);
            $em   = explode("@", $userEmail);
            $name = implode('@', array_slice($em, 0, count($em) - 1));
            $len  = floor(strlen($name) / 2);
            $result = substr($name, 0, $len) . str_repeat('*', $len) . "@" . end($em);

            $_SESSION['result'] = $result;

            header("Location:login.php?reset=An Email was sent to <b>" . $_SESSION['result'] . "</b>");
        }
    } else {
        header("Location:login.php?error1=User <b>" . $_SESSION['ResetID'] . "</b> Does not exist");
    }
}
