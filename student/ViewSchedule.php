<?php
require('includes/Header.php');
?>
<div class="x--main-container">
  <div class="container bg-white pt-2">
    <div class="container">
      <h2>Subject Schedule</h2>
      <div id="subjectSchedule"></div>
    </div>
    <script>
      $(document).ready(function() {
        // Fetch the subject schedule data for the instructor based on their school_id in the session
        fetchSubjectSchedule();

        // Function to fetch and display the subject schedule data
        function fetchSubjectSchedule() {
          // Clear previous schedule data
          $('#subjectSchedule').empty();

          // Fetch the subject schedule data for the instructor
          $.ajax({
            url: './student_scripts/get_subject_schedule.php',
            type: 'GET',
            dataType: 'json',
            data: {
              school_id: <?php echo json_encode($school_id); ?>
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
                  tableRow.append($('<td></td>').text(formatTime(schedule.schedule_start)));
                  tableRow.append($('<td></td>').text(formatTime(schedule.schedule_end)));

                  tableBody.append(tableRow);
                });

                scheduleTable.append(tableHeader);
                scheduleTable.append(tableBody);

                $('#subjectSchedule').append(scheduleTable);
                alert('Subject schedule successfully fetched.');
              } else {
                alert('No subject schedule found for the instructor.');
              }
            },
            error: function() {
              console.log('Error occurred while fetching subject schedule');
            }
          });
        }

        // Function to format the time in 12-hour format
        function formatTime(time) {
          var parts = time.split(':');
          var hour = parseInt(parts[0]);
          var minutes = parts[1];

          var period = hour >= 12 ? 'PM' : 'AM';
          hour = hour % 12 || 12;

          return hour + ':' + minutes + ' ' + period;
        }
      });
    </script>
  </div>
</div>

<?php
require('includes/Footer.php');
?>