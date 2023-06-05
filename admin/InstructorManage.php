<?php
require('includes/Header.php');
?>

<div class="x--main-container">
  <?php
  require './Modals/Add/AddInstructorModal.php'; // Add Student Modal Pop-up
  // require('../Components/usermanager.php');
  ?>

  <!-- modal imports -->
  <div class="container pt-4">
    <div class="container-lg p-1 bg-white rounded">
      <div class="container text-end pd-5">
        <button type="button" class="btn btn-success  mb-3 mt-2 fs-6" data-toggle="modal" data-target="#instructorModal">
          <i class="fa-solid fa-plus"></i> Add Instructor
        </button>
      </div>
      <div class="container text-start pd-5" id="instructor_wrapper">
        <table id="instructorView" class=" table-bordered display responsive compact table table-striped text-center text-nowrap" width="100%  ">
          <thead>
            <tr>
              <th class="text-center">ID</th>
              <th class="text-center">SCHOOL ID</th>
              <th class="text-center">NAME</th>
              <th class="text-center">ACTION</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>

<script>
  $(document).ready(function() {
    var table = $('#instructorView ').DataTable({
      dom: 'Bfrtip',
      autoWidth: true,
      lengthChange: false,
      pageLength: 10,
      responsive: true,
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
        targets: '_all',
        visible: true
      }],
      "processing": true,
      "ajax": "./admin_script/instructor_data.php",
      "columns": [{
          data: 'id'
        },
        {
          data: 'school_id'
        },
        {
          data: 'first_name',
          data: 'last_name'
        },
        {
          "data": "school_id",
          render: function(data, type, row) {
            return '<div class="d-grid gap-2 d-sm-block justify-content-sm-center"><a  href="admin_components/action.php?role=instructor&action=edit&id=' + data + '"><button type="submit" class="btn btn-outline-primary mx-1">Edit<i class="fa-solid fa-pen-to-square h5"></i></button></a><a href="admin_components/action.php?role=instructor&action=delete&id=' + data + '" class="text-white text-decoration-none"><button type="submit" class="btn btn-outline-danger mx-1 ">Delete<i class="fa fa-trash h5" aria-hidden="true"></i></button></a></div>'
          }
        }
      ],
      columnDefs: [{
        "targets": [2],
        "render": function(data, type, row) {
          return row.first_name + '  ' + row.last_name;
        },
      }]


    });
    table.buttons().container()
      .appendTo('#instructor_wrapper .col-md-6:eq(0)');

  });
</script>
<?php
require('includes/Footer.php');
?>