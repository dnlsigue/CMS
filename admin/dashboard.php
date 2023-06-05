<?php
require('includes/Header.php');
?>


<link rel="stylesheet" href="../main-css/dashboard.css">


<div class="x--main-container">
    <div class="py-1">
        <div class="flex mx-4 mt-5 bg-light rounded border border-secondary">
            <div class="row justify-content-center">
                <div class="col-sm-6 col-md-4 col-lg-2 mx-auto">
                    <div class="card text-center">
                        <div class="card-body border border-primary">
                            <h5 class="card-title">Users</h5>
                            <p class="card-text text-truncate">Count: <span id="user-count"></span></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-2 mx-auto">
                    <div class="card text-center">
                        <div class="card-body border border-success">
                            <h5 class="card-title">Students</h5>
                            <p class="card-text text-truncate">Count: <span id="student-count"></span></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-2 mx-auto">
                    <div class="card text-center">
                        <div class="card-body border border-info">
                            <h5 class="card-title">Instructors</h5>
                            <p class="card-text text-truncate">Count: <span id="instructor-count"></span></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-2 mx-auto">
                    <div class="card text-center">
                        <div class="card-body border border-danger">
                            <h5 class="card-title">Coordinator</h5>
                            <p class="card-text text-truncate">Count: <span id="coordinator-count"></span></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-2 mx-auto">
                    <div class="card text-center">
                        <div class="card-body border border-warning">
                            <h5 class="card-title">Admins</h5>
                            <p class="card-text text-truncate">Count: <span id="admin-count"></span></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="pl-4 col-md-6">
                    <label for="user-type">Select user type:</label>
                    <select class="form-control" id="user-type">
                        <option value="users">Users</option>
                        <option value="admins">Admins</option>
                        <option value="students">Students</option>
                        <option value="coordinators">Coordinators</option>
                        <option value="instructors">Instructors</option>
                    </select>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-bordered text-center" id="user-table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col" class="col-3">First Name</th>
                                    <th scope="col" class="col-3">Last Name</th>
                                    <th scope="col" class="col-3"></th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="User Table Pagination">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>

        </div>
    </div>
</div>


<script>
    $(document).ready(function() {
        $.getJSON("./admin_script/get_user_count.php", function(data) {
            console.log(data);
            $("#user-count").text(data.total_users);
            $("#student-count").text(data.total_students);
            $("#instructor-count").text(data.total_instructors);
            $("#coordinator-count").text(data.total_coordinators);
            $("#admin-count").text(data.total_admins);
        });
    });

    $(document).ready(function() {
        // Set the number of users to display per page
        var usersPerPage = 10;

        // Load user data when the page is ready
        loadUserData();

        // Load user data when the user type dropdown changes
        $("#user-type").change(function() {
            loadUserData();
        });

        function loadUserData() {
            // Get the selected user type
            var user_type = $("#user-type").val();

            // Send a GET request to the PHP script to retrieve the user data
            $.ajax({
                url: "./admin_script/get_user_data.php",
                method: "POST",
                data: {
                    type: user_type
                },
                dataType: "json",
                success: function(data) {
                    // Clear the table body
                    $("#user-table tbody").empty();

                    if (user_type === "users") {
                        $("#user-table th:nth-child(3)").text("Role");
                    } else if (user_type === "admins" || user_type === "coordinators" || user_type === "instructors") {
                        $("#user-table th:nth-child(3)").text("School ID");
                    } else if (user_type === "students") {
                        $("#user-table th:nth-child(3)").text("Sections");
                    }

                    // Determine the number of pages needed based on the number of users and the usersPerPage value
                    var numPages = Math.ceil(data.length / usersPerPage);

                    // Create the pagination links
                    var paginationHTML = "";
                    for (var i = 1; i <= numPages; i++) {
                        paginationHTML += "<li class='page-item'><a class='page-link' href='#'>" + i + "</a></li>";
                    }
                    $(".pagination").html(paginationHTML);

                    // Set up click handlers for the pagination links
                    $(".page-link").click(function() {
                        var page = $(this).text();

                        // Calculate the start and end indexes of the users to display based on the current page and the usersPerPage value
                        var startIndex = (page - 1) * usersPerPage;
                        var endIndex = startIndex + usersPerPage;

                        // Clear the table body
                        $("#user-table tbody").empty();

                        // Iterate over the user data and add it to the table
                        for (var j = startIndex; j < endIndex && j < data.length; j++) {
                            var user = data[j];

                            var row = "<tr><td>" + user.first_name + "</td><td>" + user.last_name + "</td><td>";

                            if (user_type === "users") {
                                row += user.role;
                            } else if (user_type === "admins") {
                                row += user.school_id;
                            } else if (user_type === "students") {
                                row += user.sections;
                            } else if (user_type === "coordinators") {
                                row += user.school_id;
                            } else if (user_type === "instructors") {
                                row += user.school_id;
                            }

                            row += "</td></tr>";

                            $("#user-table tbody").append(row);
                        }

                        // Update the active pagination link
                        $(".pagination li").removeClass("active");
                        $(this).parent().addClass("active");
                    });

                    // Click the first pagination link to display the initial set of users
                    $(".pagination li:first-child a").click();
                }
            });
        }
    });
</script>

</div>


<?php
require('includes/Footer.php');
?>