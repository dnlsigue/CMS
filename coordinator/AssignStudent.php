<?php
require('includes/Header.php');
?>

<div class="x--main-container">
  <?php
  require './Modals/Add/AssignStudentModal.php'; 
  ?>

  <!-- modal imports -->
  <div class="container pt-4">
    <div class="container-lg p-1 bg-white rounded">
      <div class="container text-end pd-5">
        <button type="button" class="btn btn-success  mb-3 mt-2 fs-6" data-toggle="modal" data-target="#AssignStudentModal">
          <i class="fa-solid fa-plus"></i> Assign Student   
        </button>
      </div>
      <div class="container text-start pd-5" id="AssignStudent_wrapper">
        <table id="AssignStudentView" class="table-bordered display responsive compact table table-striped text-center" width="100%">
          <thead>
            <tr>
            <th class="text-center">ID</th>
              <th class="text-center">Section (ID)</th>
              <th class="text-center">Student ID</th>
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
    var table = $('#AssignStudentView').DataTable({
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
        targets: '_all',
        visible: true
      }],
      "processing": true,
      "ajax": "./coordinator_script/assignedStudent_data.php",
      "columns": [
        {
          data: 'id'
        },
        {
          data: 'sections'
        },
        {
          data: 'school_id'
        },
        {
          "data": "school_id",
          render: function(data, type, row) {
            return '<div class="d-grid gap-2 d-sm-block justify-content-sm-center"><a href="coordinator_components/action.php?role=AssignedstudentDelete&action=delete&id=' + data + '" class="text-white text-decoration-none"><button type="submit" class="btn btn-sm btn-outline-danger mx-1 ">Delete<i class="fa fa-trash h5" aria-hidden="true"></i></button></a></div>'
          }
        }
      ]
    //   columnDefs: [{
    //     "targets": [2],
    //     "render": function(data, type, row) {
    //       return row.first_name + '  ' + row.last_name;
    //     },
    //   }]


    });
    table.buttons().container()
      .appendTo('#AssignStudent_wrapper .col-md-6:eq(0)');

  });
</script>
<?php
require('includes/Footer.php');
?>