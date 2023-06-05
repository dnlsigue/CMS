<?php
require('includes/Header.php');
?>

<div class="x--main-container">

  <!-- modal imports -->
  <div class="container pt-4">
    <div class="container-lg p-1 bg-white rounded">
      <div class="container text-end pd-5">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
          Add schedule
        </button>
      </div>
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Add Schedule</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form id="add-schedule-form">
                <div class="form-group">
                  <label for="classroom">Select Classroom:</label>
                  <select class="form-control" id="classroom" name="classroom" required>
                    <option value="">-- Select --</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="day">Select Day:</label>
                  <select class="form-control" id="day" name="day" required>
                    <option value="">-- Select --</option>
                    <option value="Monday">Monday</option>
                    <option value="Tuesday">Tuesday</option>
                    <option value="Wednesday">Wednesday</option>
                    <option value="Thursday">Thursday</option>
                    <option value="Friday">Friday</option>
                    <option value="Saturday">Saturday</option>
                    <option value="Sunday">Sunday</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="start">Start Time:</label>
                  <input type="time" class="form-control" id="start" name="start" required>
                </div>
                <div class="form-group">
                  <label for="end">End Time:</label>
                  <input type="time" class="form-control" id="end" name="end" required>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" id="submit-form">Submit</button>
            </div>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label for="instructorSelect">Select Instructor:</label>
        <select class="form-control" id="instructorSelect">
          <option value="">Select an instructor</option>
        </select>
        <button id="viewButton" class="btn btn-primary">View</button>
        <div class="container">
          <h2>Subject Schedule</h2>
          <div id="subjectSchedule"></div>
          <div id="pagination"></div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
    <script>
      $(document).ready(function() {
        var instructorSelect = $('#instructorSelect');
        var viewButton = $('#viewButton');
        var subjectScheduleDiv = $('#subjectSchedule');
        var paginationDiv = $('#pagination');

        // Fetch the instructor data
        $.ajax({
          url: './coordinator_script/get_instructors.php',
          type: 'GET',
          dataType: 'json',
          success: function(response) {
            $.each(response, function(index, instructor) {
              instructorSelect.append($('<option></option>').val(instructor.school_id).text(instructor.first_name + ' ' + instructor.last_name));
            });
          },
          error: function() {
            console.log('Error occurred while fetching instructors');
          }
        });

        // Event listener for the button click event
        viewButton.on('click', function() {
          var selectedValue = instructorSelect.val();
          console.log('Selected value: ' + selectedValue);

          // Fetch the subject schedule data for the selected instructor
          fetchSubjectSchedule(selectedValue);
        });

        // Function to fetch and display the subject schedule data
        function fetchSubjectSchedule(selectedValue) {
          // Clear previous schedule data and pagination
          subjectScheduleDiv.empty();
          paginationDiv.empty();

          // Fetch the subject schedule data for the selected instructor
          $.ajax({
            url: './coordinator_script/get_subject_schedule.php',
            type: 'GET',
            dataType: 'json',
            data: {
              instructorId: selectedValue
            },
            success: function(response) {
              console.log('Response:', response);

              // Display the subject schedule data on the webpage
              if (response.length > 0) {
                var scheduleTable = $('<table class="table"></table>');
                var tableHeader = $('<thead><tr><th>Subject</th><th>Section</th><th>Day</th><th>Start Time</th><th>End Time</th></tr></thead>');
                var tableBody = $('<tbody></tbody>');

                $.each(response, function(index, schedule) {
                  var tableRow = $('<tr></tr>');
                  tableRow.append($('<td></td>').text(schedule.subject));
                  tableRow.append($('<td></td>').text(schedule.section));
                  tableRow.append($('<td></td>').text(schedule.schedule_day));

                  // Format the start time to 12-hour with AM/PM
                  var startTime = formatTime(schedule.schedule_start);
                  tableRow.append($('<td></td>').text(startTime));

                  // Format the end time to 12-hour with AM/PM
                  var endTime = formatTime(schedule.schedule_end);
                  tableRow.append($('<td></td>').text(endTime));

                  tableBody.append(tableRow);
                });

                scheduleTable.append(tableHeader);
                scheduleTable.append(tableBody);

                subjectScheduleDiv.append(scheduleTable);

                // Initialize pagination
                var pageSize = 5; // Number of items per page
                var pageCount = Math.ceil(response.length / pageSize);
                renderPagination(pageCount, pageSize, response);

                alert('Subject schedule successfully fetched.');
              } else {
                alert('No subject schedule found for the selected instructor.');
              }
            },
            error: function() {
              console.log('Error occurred while fetching subject schedule');
            }
          });
        }

        // Function to format time to 12-hour with AM/PM
        function formatTime(time) {
          var timeParts = time.split(':');
          var hours = parseInt(timeParts[0]);
          var minutes = parseInt(timeParts[1]);
          var period = hours >= 12 ? 'PM' : 'AM';

          hours = hours % 12 || 12; // Convert to 12-hour format
          var formattedTime = hours + ':' + (minutes < 10 ? '0' : '') + minutes + ' ' + period;

          return formattedTime;
        }

        // Function to render pagination
        function renderPagination(pageCount, pageSize, data) {
          var pagination = $('<ul class="pagination"></ul>');

          for (var i = 1; i <= pageCount; i++) {
            var listItem = $('<li class="page-item"><a class="page-link" href="#">' + i + '</a></li>');

            listItem.on('click', function() {
              var pageNumber = parseInt($(this).text());

              // Calculate start and end index of the current page
              var startIndex = (pageNumber - 1) * pageSize;
              var endIndex = startIndex + pageSize;

              // Get the items for the current page
              var currentPageData = data.slice(startIndex, endIndex);

              // Clear previous table body data
              tableBody.empty();

              // Render table rows for the current page
              $.each(currentPageData, function(index, schedule) {
                var tableRow = $('<tr></tr>');
                tableRow.append($('<td></td>').text(schedule.subject));
                tableRow.append($('<td></td>').text(schedule.section));
                tableRow.append($('<td></td>').text(schedule.schedule_day));

                // Format the start time to 12-hour with AM/PM
                var startTime = formatTime(schedule.schedule_start);
                tableRow.append($('<td></td>').text(startTime));

                // Format the end time to 12-hour with AM/PM
                var endTime = formatTime(schedule.schedule_end);
                tableRow.append($('<td></td>').text(endTime));

                tableBody.append(tableRow);
              });

              // Update pagination active state
              pagination.find('.active').removeClass('active');
              $(this).addClass('active');
            });

            pagination.append(listItem);
          }

          paginationDiv.append(pagination);
        }
        // Populate classroom dropdown
        $.ajax({
          url: './coordinator_script/get_classrooms.php',
          dataType: 'json',
          success: function(data) {
            $.each(data, function(index, classroom) {
              $('#classroom').append($('<option>').text(classroom.school_name + ' - ' + classroom.subject + ' (' + classroom.sections + ')').attr('value', classroom.classroom_id));

            });
          }
        });
        // Handle form submission
        $('#submit-form').click(function() {
          var classroom_id = $('#classroom').val();
          var day = $('#day').val();
          var start = $('#start').val();
          var end = $('#end').val();

          // Check if all required fields are filled
          if (classroom_id && day && start && end) {
            // Send data to PHP script
            $.ajax({
              url: './coordinator_script/add_schedule.php',
              type: 'POST',
              data: {
                classroom_id: classroom_id,
                day: day,
                start: start,
                end: end
              },
              success: function(response) {
                alert(response);
                // Hide modal and clear form
                $('#exampleModal').modal('hide');
                $('#add-schedule-form')[0].reset();
              }
            });
          } else {
            alert('Please fill in all required fields.');
          }
        });

      });
    </script>
    <?php
    require('includes/Footer.php');
    ?>