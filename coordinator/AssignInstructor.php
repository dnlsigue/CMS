<?php
require('includes/Header.php');
?>

<div class="x--main-container">
  <?php
  require './Modals/Add/AssignInstructorModal.php'; 
  ?>

  <!-- modal imports -->
  <div class="container pt-4">
    <div class="container-lg p-1 bg-white rounded">
      <div class="container text-end pd-5">
        <button type="button" class="btn btn-success  mb-3 mt-2 fs-6" data-toggle="modal" data-target="#AssigninstructorModal">
          <i class="fa-solid fa-plus"></i> Assign Instructor
        </button>
      </div>
      <div class="container text-start pd-5" id="Assigninstructor_wrapper">
        <table id="AssigninstructorView" class="table-bordered display responsive compact table table-striped text-center" width="100%">
          <thead>
            <tr>
              <th class="text-center">Class ID</th>
              <th class="text-center">Section ID</th>
              <th class="text-center">Subject Code</th>
              <th class="text-center">Sections</th>
              <th class="text-center">Teacher ID</th>
              <th class="text-center">status</th>
              <th class="text-center">Time Created</th>
              <th class="text-center">Actions</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>

<script>
  $(document).ready(function() {
    var table = $('#AssigninstructorView').DataTable({
      dom: 'Bfrtip',
      autoWidth: true,
      lengthChange: false,
      pageLength: 10,
      responsive: true,
      columnDefs: [
            { width: '20%', targets: 0 }
        ],
        fixedColumns: true,
      buttons: [{
          extend: 'pdf',
          exportOptions: {
            columns: ':visible'
          }
        },
        {
          extend: 'excel',
          exportOptions: {
            columns: ':visible'
          }
        },
        'colvis'
      ],
      columnDefs: [{
        "targets": [1,5],
        "className": "dt-center",
        "visible": false
      }],
      "processing": true,
      "ajax": "./coordinator_script/assignedInstructor_data.php",
      "columns": [
        {
          data: 'classroom_id'
        },
        {
          data: 'class_id'
        },
        {
          data: 'subject_code'
        },
        {
          data: 'sections'
        },
        {
          data: 'school_id'
        },
        {
          data: 'status'
        },
        {
          data: 'created_at'
        },
        {
          "data": "class_id",
          render: function(data, type, row) {
            return '<div class="d-grid gap-2 d-sm-block justify-content-sm-center"><a href="coordinator_components/action.php?role=AssignedinstructorDelete&action=delete&id1=' + data + '" class="text-white text-decoration-none"><button type="submit" class="btn btn-sm btn-outline-danger mx-1 ">Delete<i class="fa fa-trash h5" aria-hidden="true"></i></button></a></div>'
          }
        }
      ]

    });
    table.buttons().container()
      .appendTo('#Assigninstructor_wrapper .col-md-6:eq(0)');

  });
</script>
<?php
require('includes/Footer.php');
?>