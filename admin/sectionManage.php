<?php
  require('includes/Header.php');
?>

  <div class="x--main-container">

    <!-- modal imports -->
    <?php 
    // require('../Components/usermanager.php');
      require './Modals/Add/AddSectionModal.php';// Add Section Modal Pop-up
    ?>
 <div class="container pt-4">
    <div class="container-lg p-1 bg-white rounded">
      <div class="container text-end pd-5">
        <button type="button" class="btn btn-success  mb-3 mt-2 fs-6" data-toggle="modal" data-target="#sectionModal">
          <i class="fa-solid fa-plus"></i> Add Section
        </button>
      </div>
      <div class="container text-start pd-5" id="section_wrapper">
        <table id="sectionView" class=" table-bordered display responsive compact table table-striped text-center text-nowrap" width="100%  ">
          <thead>   
            <tr>
              <th class="text-center">ID</th>
              <th class="text-center">COURSE</th>
              <th class="text-center">SECTION</th>
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
    var table = $('#sectionView').DataTable({
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
      "ajax": "./admin_script/section_data.php",
      "columns": [{
          data:'id'
        },
        {
          data:'course'
        },
        {
          data: 'section'
        },
        {
          "data":"id",
          render: function(data, type, row) {
            return '<div class="d-grid gap-2 d-sm-block justify-content-sm-center"><a href="admin_components/action.php?role=section&action=edit&id1=' + data + '"><button type="submit" class="btn btn-outline-primary mx-1">Edit<i class="fa-solid fa-pen-to-square h5"></i></button></a><a href="admin_components/action.php?role=section&action=delete&id1=' + data + '" class="text-white text-decoration-none"><button type="submit" class="btn btn-outline-danger mx-1 ">Delete<i class="fa fa-trash h5" aria-hidden="true"></i></button></a></div>'
          }
        }
      ]
    });
    table.buttons().container()
      .appendTo('#section_wrapper .col-md-6:eq(0)');

  });
</script>
<?php
require('includes/Footer.php');
?>


