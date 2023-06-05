<!-- Modal -->
<div class="modal fade" id="editAssignmentModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <form method="post" class="bg-light border border-primary rounded p-5">

        <!-- CREATE CLASS MODAL -->
        <h1 class="text-center fw-bold">Edit Assignment</h1>
        <h4 class="text-center mb-5" id="assignmentNameLabel"></h4>

        <input type="hidden" name="assignmentId" id="assignmentId">
        <div class="input-group mb-4">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Assignment Name</label>
          </div>
          <input type="text" class="form-control" name="assignmentName" id="assignmentName" placeholder="Assignment Name">
        </div>

        <textarea class="form-control mb-4" name="assignmentDescription" id="assignmentDescription" rows="3" placeholder="Assignment Description"></textarea>
        
        <div class="input-group">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Start</label>
          </div>
          <input type="datetime-local" class="form-control" name="assignmentStart" id="assignmentStart">
        </div>

        <div class="input-group">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Due</label>
          </div>
          <input type="datetime-local" class="form-control" name="assignmentDeadline" id="assignmentDeadline">
        </div>

        <!-- ALLOW LATE SUBMISSION -->
        <?php 
        $valueFromDatabase = 0;
        $checkedAttribute = ($valueFromDatabase == 1) ? 'checked' : '';
        ?>
        <div class="form-group form-check  mb-4">
          <input type="checkbox" class="form-check-input" id="assignmentAllowSubmission" name="assignmentAllowSubmission"  <?php echo $checkedAttribute; ?>>
          <label class="form-check-label" for="exampleCheck1">Allow late submission</label>
        </div>

        <div class="input-group">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Items</label>
          </div>
          <input type="number" min="1" max="100" class="form-control" name="assignmentItems" id="assignmentItems" require>
        </div>

        <div class="d-flex justify-content-around mt-4">
          <input type="submit" class="btn btn-success btn-lg" id="updateButton" name="editAssignment" value="Update"></input>
          <input type="submit" class="btn btn-danger btn-lg" id="deleteButton" name="deleteAssignment" value="Delete"></input>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>

      </form>

    </div>
  </div>
</div>

<script>
$(document).ready(function() {
  $('#editAssignmentModal').on('show.bs.modal', function(event) {
    var button = $(event.relatedTarget);
    var assignmentId = button.data('assignment-id');
    var assignmentName = button.data('assignment-name');
    var assignmentDescription = button.data('assignment-description');
    var assignmentStart = button.data('assignment-start');
    var assignmentDeadline = button.data('assignment-deadline');
    var assignmentAllowSubmission = button.data('assignment-submission');
    var assignmentItems = button.data('assignment-items');

    // Populate the form fields with the assignment data
    $('#editAssignmentModal').find('#assignmentId').val(assignmentId);
    $('#editAssignmentModal').find('#assignmentName').val(assignmentName);
    $('#editAssignmentModal').find('#assignmentDescription').val(assignmentDescription);
    $('#editAssignmentModal').find('#assignmentStart').val(assignmentStart);
    $('#editAssignmentModal').find('#assignmentDeadline').val(assignmentDeadline);
    document.getElementById("assignmentAllowSubmission").checked = assignmentAllowSubmission;
    $('#editAssignmentModal').find('#assignmentItems').val(assignmentItems);

    // Assign to the Labels
    $('#editAssignmentModal').find('#assignmentNameLabel').text(assignmentName);
  });

  // Click event handler for the update button
  $('#editAssignmentModal').on('click', '#updateButton', function() {
    // Capture the values inside the click event handler
    var updatedAssignmentId = $('#assignmentId').val();
    var updatedAssignmentName = $('#assignmentName').val();
    var updatedAssignmentDescription = $('#assignmentDescription').val();
    var updatedAssignmentStart = $('#assignmentStart').val();
    var updatedAssignmentDeadline = $('#assignmentDeadline').val();
    var updatedAssignmentAllowSubmission = $('#assignmentAllowSubmission').is(':checked') ? 1 : 0;
    var updatedAssignmentItems = $('#assignmentItems').val();

    $.ajax({
      type: 'POST',
      url: './instructor_components/update_assignment.php',
      data: {
        id: updatedAssignmentId,
        name: updatedAssignmentName,
        description: updatedAssignmentDescription,
        start: updatedAssignmentStart,
        due: updatedAssignmentDeadline,
        allow: updatedAssignmentAllowSubmission,
        items: updatedAssignmentItems
      },
      success: function(data) {
        console.log(data);
      }
    });
  });
});
</script>