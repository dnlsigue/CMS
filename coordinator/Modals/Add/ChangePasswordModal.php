   <!-- change pass -->
   <div class="modal fade" id="changepassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
       <div class="modal-dialog modal-dialog-centered" role="document">
           <div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title" id="exampleModalLongTitle">Edit Profile</h5>
                   <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                   </button>
               </div>
               <div class="modal-body pb-4">
                   <form method="post" class="bg-light border border-primary rounded px-5">
                       <!-- ADD STUDENT MODAL -->
                       <h1 class="text-center pt-3 fw-bold fst-italic">Edit Profile</h1>

                       <div class="input-group mb-5 px-1">
                           <span class="input-group-text">Old Password</span>
                           <input value="" type="password" maxlength="12" aria-label="Password" placeholder="Old Password" class="form-control" name="oldPassword" required>

                       </div>
                       <div class="input-group mb-5 px-1">
                           <span class="input-group-text">New Password</span>
                           <input value="" type="password" maxlength="12" aria-label="Password" placeholder="New Password" class="form-control" name="newPassword" required>

                       </div>
                       <div class="input-group mb-5 px-1">
                           <span class="input-group-text">Retype New Password</span>
                           <input value="" type="Password" maxlength="12" aria-label="Password" placeholder="Re-type Password" class="form-control" name="password" required>
                       </div>
                       <!-- SECTION IS DROP DOWN -->


                       <div class="d-flex justify-content-center py-2 mb-4">
                           <input type="submit" name="changePassword" class="btn btn-primary btn-lg mx-2" value="Change"></input>
                           <a href="profile.php"><input type="button" class="btn btn-danger btn-lg mx-2" value="Close"></input></a>
                       </div>

                   </form>
               </div>
           </div>
       </div>
   </div>
   <?php
    require '../Components/Database.php';
    if (isset($_POST['changePassword'])) {

        $oldPassword = $_POST['oldPassword'];
        $newPassword = $_POST['newPassword'];
        $password = $_POST['password'];
        $options = [
            'cost' => 10,
        ];
        $hashedpassword = password_hash($password, PASSWORD_BCRYPT, $options);

        if ($newPassword == $password) {
            $res = $con->query("SELECT password FROM cms_users WHERE school_id='$school_id'");
            $row = $res->fetch_assoc();
            $DBhashedPassword = $row['password'] ?? null;


            if (password_verify($oldPassword, $DBhashedPassword)) {
                $res3 = $con->query("UPDATE cms_users SET password='$hashedpassword' WHERE school_id='$school_id'");
    ?>
               <div class="alert alert-Successs text-center mx-5" role="alert">Password Updated!
               </div>
               
           <?php
            } else {
            ?>
               <div class="alert alert-danger text-center mx-5" role="alert">Old Password Incorrect!
               </div>
           <?php
            }
        } else {
            ?>
           <div class="alert alert-danger text-center mx-5" role="alert">New Password Mismatch!
           </div>
   <?php
        }
    }

    ?>