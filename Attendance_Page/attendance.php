<!DOCTYPE html>
<html>

<head>
    <title>Attendance System</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>

<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-6 text-center">
                <img src="https://img.freepik.com/premium-vector/tap-your-card-icon-nfc-terminal-confirms-contactless-payment-by-credit-card-vector-isolated-white-background-eps-10_399089-2245.jpg?w=2000" class="img-fluid mt-5 mb-4">
                <h1>Tap your RFID card to take attendance</h1>
                <input type="hidden" id="rfid">
            </div>
        </div>
    </div>

    <!-- User details modal -->
    <div class="modal fade" id="user-details-modal" tabindex="-1" role="dialog" aria-labelledby="user-details-modal-label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content text-center">
                <div class="modal-header">
                    <h5 class="modal-title" id="user-details-modal-label">User Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="user-details-modal-body">
                    <!-- User details will be displayed here -->
                </div>
                <p class="text-success" id="status"></p>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            var previousValue = ''; // Variable to store the previous value
            var intervalID;

            function updateAttendance() {
                $.ajax({
                    url: 'UIDContainer.php',
                    type: 'GET',
                    success: function(response) {
                        var rfid = response.trim(); // Trim leading and trailing empty spaces

                        // Check if RFID is not equal to 0
                        if (rfid !== '0') {
                            // Trigger the onchange event
                                // Send AJAX request to update attendance and fetch user details
                                $.ajax({
                                    type: 'POST',
                                    url: 'rfid_attendance.php',
                                    data: {
                                        rfid: rfid
                                    },
                                    success: function(response) {
                                        // Display success message
                                        $('#status').text(response);
                                        // Fetch and display user details in modal
                                        $.ajax({
                                            type: 'POST',
                                            url: 'get_user_info.php',
                                            data: {
                                                rfid: rfid
                                            },
                                            success: function(response) {
                                                $('#user-details-modal-body').html(response);
                                                $('#user-details-modal').modal('show');

                                                // Close modal after 5 seconds
                                                setTimeout(function() {
                                                    $('#user-details-modal').modal('hide');
                                                }, 5000);
                                            },
                                            error: function(jqXHR, textStatus, errorThrown) {
                                                // Display error message
                                                $('#status').text('Error fetching user details!');
                                            }
                                        });

                                        setTimeout(function() {
                                            $('#status').text('');
                                            $('#rfid').val('');
                                        }, 5000); // Clear status and RFID input after 5 seconds

                                        // Reset UID to 0 in UIDContainer.php
                                        $.ajax({
                                            type: 'POST',
                                            url: 'reset_uid.php',
                                            success: function(response) {
                                                // Display success message
                                                console.log('UID reset to 0');
                                            },
                                            error: function(jqXHR, textStatus, errorThrown) {
                                                // Display error message
                                                console.log('Error resetting UID: ' + errorThrown);
                                            }
                                        });
                                    },
                                    error: function(jqXHR, textStatus, errorThrown) {
                                        // Display error message
                                        $('#status').text('Error updating attendance!');
                                        setTimeout(function() {
                                            $('#status').text('');
                                            $('#rfid').val('');
                                        }, 2000); // Clear status and RFID input after 2 seconds
                                    }
                                });

                                previousValue = rfid; // Update the previous value
    
                        }
                    },
                    complete: function() {
                        // Schedule the next update after the current request is completed
                        intervalID = setTimeout(updateAttendance, 3000);
                    }
                });
            }

            // Start the attendance update process
            updateAttendance();

            // Clear interval when the document is unloaded (optional)
            $(window).unload(function() {
                clearTimeout(intervalID);
            });
        });
    </script>


</body>

</html>