<!-- Modal -->
<div class="modal fade" id="editQuizModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <form method="post" class="bg-light border border-primary rounded p-5">

        <!-- CREATE CLASS MODAL -->
        <h1 class="text-center fw-bold">Edit Quiz</h1>
        <h4 class="text-center mb-5" id="quizNameLabel"></h4>

        <input type="hidden" name="quizId" id="quizId">
        <div class="input-group mb-4">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Quiz Name</label>
          </div>
          <input type="text" class="form-control" name="quizName" id="quizName" placeholder="Quiz Name">
        </div>

        <textarea class="form-control mb-4" name="quizDescription" id="quizDescription" rows="3" placeholder="Quiz Description"></textarea>
        
        <div class="input-group">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Start</label>
          </div>
          <input type="datetime-local" class="form-control" name="quizStart" id="quizStart">
        </div>

        <div class="input-group">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Due</label>
          </div>
          <input type="datetime-local" class="form-control" name="quizDeadline" id="quizDeadline">
        </div>

        <!-- ALLOW LATE SUBMISSION -->
        <?php 
        $valueFromDatabase = 0;
        $checkedAttribute = ($valueFromDatabase == 1) ? 'checked' : '';
        ?>
        <div class="form-group form-check  mb-4">
          <input type="checkbox" class="form-check-input" id="quizAllowSubmission" name="quizAllowSubmission"  <?php echo $checkedAttribute; ?>>
          <label class="form-check-label" for="exampleCheck1">Allow late submission</label>
        </div>

        <div class="input-group">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Items</label>
          </div>
          <input type="number" min="1" max="100" class="form-control" name="quizItems" id="quizItems" require>
        </div>

        <div class="d-flex justify-content-around mt-4">
          <input type="submit" class="btn btn-success btn-lg" id="updateButton" name="editQuiz" value="Update"></input>
          <input type="submit" class="btn btn-danger btn-lg" id="deleteButton" name="deleteQuiz" value="Delete"></input>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>

      </form>

    </div>
  </div>
</div>

<script>
$(document).ready(function() {
  $('#editQuizModal').on('show.bs.modal', function(event) {
    var button = $(event.relatedTarget);
    var quizId = button.data('quiz-id');
    var quizName = button.data('quiz-name');
    var quizDescription = button.data('quiz-description');
    var quizStart = button.data('quiz-start');
    var quizDeadline = button.data('quiz-deadline');
    var quizAllowSubmission = button.data('quiz-submission');
    var quizItems = button.data('quiz-items');

    // Populate the form fields with the quiz data
    $('#editQuizModal').find('#quizId').val(quizId);
    $('#editQuizModal').find('#quizName').val(quizName);
    $('#editQuizModal').find('#quizDescription').val(quizDescription);
    $('#editQuizModal').find('#quizStart').val(quizStart);
    $('#editQuizModal').find('#quizDeadline').val(quizDeadline);
    document.getElementById("quizAllowSubmission").checked = quizAllowSubmission;
    $('#editQuizModal').find('#quizItems').val(quizItems);

    // Assign to the Labels
    $('#editQuizModal').find('#quizNameLabel').text(quizName);
  });

  // Click event handler for the update button
  $('#editQuizModal').on('click', '#updateButton', function() {
    // Capture the values inside the click event handler
    var updatedQuizId = $('#quizId').val();
    var updatedQuizName = $('#quizName').val();
    var updatedQuizDescription = $('#quizDescription').val();
    var updatedQuizStart = $('#quizStart').val();
    var updatedQuizDeadline = $('#quizDeadline').val();
    var updatedQuizAllowSubmission = $('#quizAllowSubmission').is(':checked') ? 1 : 0;
    var updatedQuizItems = $('#quizItems').val();

    $.ajax({
      type: 'POST',
      url: './instructor_components/update_quiz.php',
      data: {
        id: updatedQuizId,
        name: updatedQuizName,
        description: updatedQuizDescription,
        start: updatedQuizStart,
        due: updatedQuizDeadline,
        allow: updatedQuizAllowSubmission,
        items: updatedQuizItems
      },
      success: function(data) {
        console.log(data);
      }
    });
  });
});
</script>