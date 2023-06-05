<!-- Modal -->
<div class="modal fade" id="EditMaterialModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <form method="post" class="bg-light border border-primary rounded p-5">

        <!-- CREATE CLASS MODAL -->
        <h1 class="text-center fw-bold">Edit Material</h1>
        <h4 class="text-center mb-5" id="materialNameLabel"></h4>

        <input type="hidden" name="amaterialId" id="materialId">
        <div class="input-group mb-4">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupinstructors">Material Name</label>
          </div>
          <input type="text" class="form-control" name="materialName" id="materialName" placeholder="Material Name">
        </div>

        <textarea class="form-control mb-4" name="materialDescription" id="materialDescription" rows="3" placeholder="Material Description"></textarea>

        <div class="d-flex justify-content-around mt-4">
          <input type="submit" class="btn btn-success btn-lg" id="updateButton" name="editMaterial" value="Update"></input>
          <input type="submit" class="btn btn-danger btn-lg" id="deleteButton" name="deleteMaterial" value="Delete"></input>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>

      </form>

    </div>
  </div>
</div>

<script>
$(document).ready(function() {
  $('#EditMaterialModal').on('show.bs.modal', function(event) {
    var button = $(event.relatedTarget);
    var materialId = button.data('material-id');
    var materialName = button.data('material-name');
    var materialDescription = button.data('material-description');

    // Populate the form fields with the material data
    $('#EditMaterialModal').find('#materialId').val(materialId);
    $('#EditMaterialModal').find('#materialName').val(materialName);
    $('#EditMaterialModal').find('#materialDescription').val(materialDescription);
    // Assign to the Labels
    $('#EditMaterialModal').find('#materialNameLabel').text(materialName);

    // Click event handler for the update button
    $('#updateButton').click(function() {
      // Capture the values inside the click event handler
      var updatedMaterialId = materialId;
      var updatedMaterialName = $('#materialName').val();
      var updatedMaterialDescription = $('#materialDescription').val();

      $.ajax({
        type: 'POST',
        url: './instructor_components/update_material.php',
        data: {
          id: updatedMaterialId,
          name: updatedMaterialName,
          description: updatedMaterialDescription
        },
        success: function(data) {
          console.log(data);
        }
      });
    });

    // Click event handler for the delete button
    $('#deleteButton').click(function() {
      // Capture the value inside the click event handler
      var updatedMaterialId = materialId;

      $.ajax({
        type: 'POST',
        url: './instructor_components/delete_material.php',
        data: {
          id: updatedMaterialId
        },
        success: function(data) {
          console.log(data);
        }
      });
    });
  });
});
</script>
