<div class="modal fade" id="editProfile" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Edit Profile</h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <div class="modal-body pb-3">

                <form method="post" class="bg-light border border-primary rounded px-5" enctype="multipart/form-data">
                    <!-- ADD STUDENT MODAL -->
                    <h1 class="text-center pt-3 fw-bold fst-italic">Edit Profile</h1>

                    <div class="input-group mb-5 px-1">
                        <span class="input-group-text">Email</span>
                        <input value="<?php echo $email ?>" type="email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$" aria-label="Firstname" placeholder="Email Address" class="form-control" name="email" required>

                    </div>
                    <div class="input-group mb-5 px-1">
                        <span class="input-group-text">Contact Number</span>
                        <input value="<?php echo $phone ?>" type="text" aria-label="Contact Number" pattern="^0(9)\d{9}$" maxlength="11" title="Must start with 09 and must be a number!" placeholder="Contact Number" onkeypress="return onlyNumberKey(event)" class="form-control" name="phone" required>
                    </div>
                    <!-- SECTION IS DROP DOWN -->
                    <div class="input-group mb-3">
                    <label for="formFile" class="form-label px-2"><span class="input-group-text"> Profile Picture</span></label>
                    <input class="form-control form-control-sm" id="formFileSm" type="file" name="file" value="#black">
                    </div>

                    <div class="d-flex justify-content-center py-2 mb-4">
                        <input type="submit" name="uploadProfile" class="btn btn-primary btn-lg mx-2" value="Edit"></input>
                        <a href="Profile.php"><input type="button" class="btn btn-danger btn-lg mx-2" value="Close"></input></a>
                    </div>

                </form>
                <form method="post">

                </form>

            </div>
        </div>
    </div>
</div>