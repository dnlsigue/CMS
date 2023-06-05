<?php   
if(isset($_POST['uploadProfile'])) {
    $file = $_FILES['file'];

    $fileName = $_FILES['file']['name'];
    $filetmpName = $_FILES['file']['tmp_name'];
    $fileSize = $_FILES['file']['size'];
    $fileError = $_FILES['file']['error'];
    $fileType = $_FILES['file']['type'];

    $email = $_POST['email'];
    $phone = $_POST['phone'];

    $fileExt = explode('.',$fileName);
    $fileActualExt = strtolower(end($fileExt));
    
    $allowed = array('jpg','jpeg','png','gif');
    
    $res = $con->query( "UPDATE cms_users SET email='$email', phone='$phone' WHERE school_id='$school_id';");
         
    $_SESSION['email'] = $email;
    $_SESSION['phone'] = $phone;
    if(in_array($fileActualExt, $allowed)){
        if($fileError === 0){
            if ($fileSize < 512000 *5 ) {
                $res = $con->query("SELECT status FROM cms_profileimg WHERE school_id='$school_id'");
                $row = $res->fetch_assoc();
                $status = $row['status'];
                if($status == 0){
                    $filename = "../uploads/profile".$school_id."*";
                    $fileinfo = glob($filename);
                    $fileext = explode(".", $fileinfo[0]);
                    $fileactualext = $fileext[3];

                    $file = "../uploads/profile".$school_id.".".$fileactualext;

                    if(unlink($file)){
                        // WAS IMG DELETED
                    } else {
                        // WAS NOT DELETED
                    }

                    $sql = "UPDATE cms_profileimg SET status=1 WHERE school_id='$school_id';";
                    mysqli_query($con, $sql);
                } 
                //Upload new file
                $fileNameNew = "profile".$school_id.".".$fileActualExt;
                $fileDestination = '../uploads/'."$fileNameNew";
                move_uploaded_file($filetmpName,$fileDestination);
                $sql = "UPDATE cms_profileimg SET status=0 WHERE school_id='$school_id';";
                $res = $con->query($sql);
                if($role == 'admin'){
                    header("Location:../admin/Profile.php");
                }
                elseif($role == 'student'){
                    header("Location:../student/Profile.php");
                }
                elseif($role == 'instructor'){
                    header("Location:../instructor/Profile.php");
                }
                

            }else {
                header("Location:../admin/profile.php?error= File Size Exceeded");
            }
        }else{
           header("Location:../admin/profile.php?error= Error Uploading File!");
        }
    } else {

    }
}
