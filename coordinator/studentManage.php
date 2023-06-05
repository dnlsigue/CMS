<?php
require('includes/Header.php');
?>

<div class="x--main-container">
  <style>
  
  </style>

  <!-- modal imports -->
  <?php
  require './Modals/Add/AddStudentModal.php'; // Add Student Modal Pop-up
//   require('../Components/usermanager.php');
  ?>
  <div class="container pt-4">
    <div class="container-lg p-1 bg-white rounded">
      <div class="container text-end pd-5">
        <button type="button" class="btn btn-success  mb-3 mt-2 fs-6" data-toggle="modal" data-target="#studentModal">
          <i class="fa-solid fa-plus"></i> Add Student
        </button>
      </div>
      <div class="container text-start pd-5" id="student_wrapper">
        <table id="studentView" class="table-bordered display responsive compact table table-striped text-center" width="100%  ">
          <thead>
            <tr>
              <th class="text-center">ID</th>
              <th class="text-center">SCHOOL ID</th>
              <th class="text-center">NAME</th>
              <th class="text-center">ASSIGNED</th>
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
    var table = $('#studentView ').DataTable({
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
      "ajax": "./coordinator_script/student_data.php",
      "columns": [{
          data:'id'
        },
        {
          data:'school_id'
        },
        {
          data:'first_name', data:'last_name'
        },
        {
          data: 'assigned'
        },
        {
          "data":"school_id",
          render: function(data, type, row) {
            return '<center><a href="coordinator_components/action.php?role=student&action=edit&id=' + data + '"><button type="submit" class="btn btn-primary mx-1">Edit<i class="fa-solid fa-pen-to-square h5"></i></button></a><a href="coordinator_components/action.php?role=student&action=delete&id=' + data + '" class="text-white text-decoration-none"><button type="submit" class="btn btn-danger mx-1 ">Delete<i class="fa fa-trash h5" aria-hidden="true"></i></button></a></center>'
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
      .appendTo('#student_wrapper .col-md-6:eq(0)');

  });
</script>
<?php
require('includes/Footer.php');
?>