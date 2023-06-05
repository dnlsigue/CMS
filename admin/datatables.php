<?php
require('includes/Header.php');
?>

<div class="x--main-container">

    <div class="container pt-4">
        <div class="container-lg p-1 pt-2 bg-white border border-warning rounded">
            <div class="d-flex justify-content-center align-items-center mb-3 pt-2">
                <h3>Verify Users</h3>
            </div>

            <div class="container text-start pd-5" id="admin_wrapper">
                <?php
                // Retrieve the data from the users table
                $result = mysqli_query($con, "SELECT school_id, rfid, first_name, last_name, rfid_verified FROM cms_users");
                ?> <table id="users-table" class="table-bordered display responsive compact table table-striped text-center text-nowrap" width="100%">
                    <thead class="thead-dark">
                        <tr>
                            <th class="text-center">School ID</th>
                            <th class="text-center">RFID</th>
                            <th class="text-center">First Name</th>
                            <th class="text-center">Last Name</th>
                            <th class="text-center">RFID Verified</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = mysqli_fetch_array($result)) { ?>
                            <tr>
                                <td class="text-center"><?php echo $row['school_id']; ?></td>
                                <td class="text-center"><?php echo $row['rfid']; ?></td>
                                <td class="text-center"><?php echo $row['first_name']; ?></td>
                                <td class="text-center"><?php echo $row['last_name']; ?></td>
                                <td class="text-center">
                                    <?php if ($row['rfid_verified'] == 0) { ?>
                                        <button class="verify-btn btn btn-primary" data-id="<?php echo $row['school_id']; ?>">Verify</button>
                                    <?php } else { ?>
                                        <span class="badge badge-success">Verified</span>
                                        <button class="revoke-btn border-0 bg-transparent" data-id="<?php echo $row['school_id']; ?>"><i class="fas fa-trash-alt text-danger"></i></button>
                                    <?php } ?>
                                </td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
                <div class="modal" id="verify-modal">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body text-center">
                                <img src="https://img.freepik.com/premium-vector/tap-your-card-icon-nfc-terminal-confirms-contactless-payment-by-credit-card-vector-isolated-white-background-eps-10_399089-2245.jpg?w=2000" class="img-fluid mb-3">
                                <p>Tap RFID before <span id="countdown">3</span></p>
                                <p id="rfid-error" class="text-danger"></p>

                                <!-- // <input type="hidden" id="rfid-input" name="rfid-input"> -->
                                <!-- <textarea name="" id="rfid-input" cols="30" rows="10"></textarea> -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal" id="confirm-revoke-modal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Confirm Revoke Access</h5>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to revoke this user's RFID access?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancel-revoke-btn">Cancel</button>
                                <button type="button" class="btn btn-danger" id="revoke-btn">Revoke</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        var intervalId; // Variable to store the interval ID
        var previousValue = '';
        $('#users-table').DataTable({
            "order": [
                [0, "asc"]
            ], // Order by school ID column in ascending order
            autoWidth: true,
            lengthChange: false,
            pageLength: 10,
            responsive: true,
            "columnDefs": [{
                "targets": [1],
                "orderable": false
            }] // Disable sorting on the RFID column
        });

        // Show modal when "Verify" button is clicked
        $('.verify-btn').click(function() {
            var school_id = $(this).data('id'); //data-id="< ?php echo $row['school_id']; ?>"|
            $.ajax({
                url: './admin_script/change_UIDContainer.php',
                type: 'POST',
                data: {
                    value: '0'
                },
                success: function(response) {
                    $('#verify-modal').on('shown.bs.modal', function() {
                        var countdown = 5;
                        var countdownElement = $('#countdown');

                        (function countdownLoop() {
                            countdownElement.text(countdown--);
                            countdown >= 0 ? setTimeout(countdownLoop, 1000) : $('#verify-modal').modal('hide');
                        })();
                        intervalId = setInterval(function() {
                            // Place your code inside this interval function
                            $.ajax({
                                url: './admin_script/UIDContainer.php',
                                type: 'GET',
                                success: function(response) {
                                    var resultValue = response.trim(); // Trim leading and trailing empty spaces
                                    if (resultValue == 0) {

                                    } else {
                                        $.ajax({
                                            url: "./admin_script/DataChecker.php", // PHP script that handles the RFID check
                                            type: "POST",
                                            data: {
                                                rfid: resultValue
                                            }, // Data to be sent
                                            success: function(response) {
                                                if (response === "RFID already exists") {
                                                    // Additional code to keep the modal open
                                                    $('#rfid-error').text('RFID already exists!');
                                                    $('#verify-modal').modal({
                                                        backdrop: 'static',
                                                        keyboard: false
                                                    });
                                                    location.reload();
                                                } else {
                                                    if (resultValue !== previousValue) {
                                                        // Trigger the onchange event and display an alert
                                                        var event = new Event('change');
                                                        document.dispatchEvent(event);

                                                        $.ajax({
                                                            type: 'POST',
                                                            url: './admin_script/update_rfid.php',
                                                            data: {
                                                                school_id: school_id,
                                                                rfid: resultValue
                                                            },
                                                            success: function(data) {
                                                                if (data == 'existed') {
                                                                    $('#rfid-error').text('RFID already exists!');
                                                                    // Additional code to keep the modal open
                                                                    $('#verify-modal').modal({
                                                                        backdrop: 'static',
                                                                        keyboard: false
                                                                    });
                                                                } else {
                                                                    $('#rfid-error').removeClass('text-danger').addClass('text-success').text('RFID successfully updated!');
                                                                    setTimeout(function() {
                                                                        location.reload();
                                                                    }, 1500); // 1.5 second delay before reloading the page
                                                                }
                                                            }
                                                        });
                                                        previousValue = resultValue; // Update the previous value
                                                    }
                                                }
                                            }
                                        });
                                    }
                                }
                            });
                        }, 2500);
                    }).modal('show');

                }
            });

        });


        // Revoke button functionality
        $('.revoke-btn').click(function() {
            var school_id = $(this).data('id');
            $('#confirm-revoke-modal').modal('show');
            $('#revoke-btn').click(function() {
                // Update database to revoke RFID access
                $.ajax({
                    type: 'POST',
                    url: './admin_script/revoke_rfid.php',
                    data: {
                        school_id: school_id
                    },
                    success: function(data) {
                        location.reload(); // Reload the page
                    }
                });
            });
            $('#cancel-revoke-btn').click(function() {
                $('#confirm-revoke-modal').modal('hide'); // Hide the modal
            });
        });
        // Hide modal and clear interval when modal is closed
        $('#verify-modal').on('hidden.bs.modal', function() {
            clearInterval(intervalId);
        });
    });
</script>
<?php
require('includes/Footer.php');
?>