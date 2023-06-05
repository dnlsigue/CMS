<?php
require('includes/Header.php');
?>
<div class="x--main-container">

  <?php
  require './Modals/Add/AddSubjectModal.php'; 
  require('../Components/usermanager.php');
  ?>
  <div class="container pt-4">
    <div class="container-lg p-1 bg-white rounded">
      <div class="container text-end pd-5">
        <button type="button" class="btn btn-success  mb-3 mt-2 fs-6" data-toggle="modal" data-target="#subjectModal">
          <i class="fa-solid fa-plus"></i> Add Subject
        </button>
      </div>
      <div class="container text-start pd-5" id="subject_wrapper">
        <table id="subjectView" class="table-bordered display responsive compact table table-striped text-center text-nowrap" width="100%">
          <thead>
            <tr>
              <th class="text-center">ID</th>
              <th class="text-center">Subject</th>
              <th class="text-center">Subject Code</th>
              <th class="text-center">Course</th>
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
    var table = $('#subjectView').DataTable({
      dom: 'Bfrtip',
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
      "ajax": "./admin_script/subject_data.php",
      "columns": [{
          data: 'id'
        },
        {
          data: 'subject'
        },
        {
          data: 'subject_code'
        },
        {
          data: 'course'
        },
        {
          "data": "id",
          render: function(data, type, row) {
            return '<div class="d-grid gap-2 d-sm-block justify-content-sm-center"><a href="admin_components/action.php?role=instructor&action=edit&id=' + data + '"><button type="submit" class="btn btn-outline-primary mx-1">Edit<i class="fa-solid fa-pen-to-square h5"></i></button></a><a href="admin_components/action.php?role=instructor&action=delete&id=' + data + '" class="text-white text-decoration-none"><button type="submit" class="btn btn-outline-danger mx-1 ">Delete<i class="fa fa-trash h5" aria-hidden="true"></i></button></a></div>'
          }
        }
      ]
    });
    table.buttons().container()
      .appendTo('#subject_wrapper .col-md-6:eq(0)');

  });
</script>
<?php
require('includes/Footer.php');
?>