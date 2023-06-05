<?php
require('includes/Header.php');
?>
<style>
    #attendanceTable td:not(:first-child) {
        text-align: center;
    }
</style>
<div class="x--main-container">

    <div class="container pt-4">
        <div class="container-lg p-1 bg-white rounded">
            <div class="container text-start pd-5" id="admin_wrapper">
                <div class="d-flex justify-content-between mb-3 pt-2">
                    <h3>Attendance Logs</h3>
                    <button class="btn btn-primary" id="reloadButton"><i class="fas fa-sync-alt"></i> Reload</button>
                </div>
                <table id="attendanceTable" class="table-bordered display responsive compact table table-striped text-center text-nowrap" width="100%">
                    <thead class="thead-dark">
                        <tr>
                            <th>Name</th>
                            <th class="text-center">School ID</th>
                            <th class="text-center">Time In</th>
                            <th class="text-center">Time Out</th>
                            <th class="text-center">Total Hours</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>

            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        var table = $('#attendanceTable').DataTable({
            ajax: {
                url: './admin_script/view_attendance_data.php',
                dataSrc: ''
            },
            columns: [{
                    data: 'first_name',
                    render: function(data, type, row) {
                        return data + ' ' + row.last_name;
                    }
                },
                {
                    data: 'school_id'
                },
                {
                    data: 'time_in'
                },
                {
                    data: 'time_out'
                },
                {
                    data: 'total_hours'
                }
            ],
            autoWidth: true,
            lengthChange: false,
            responsive: true,
            paging: true,
            lengthMenu: [10, 25, 50, 75, 100],
            pageLength: 10,
            language: {
                lengthMenu: 'Show _MENU_ entries',
                search: 'Search:',
                zeroRecords: 'No matching records found',
                info: 'Showing _START_ to _END_ of _TOTAL_ entries',
                infoEmpty: 'Showing 0 to 0 of 0 entries',
                infoFiltered: '(filtered from _MAX_ total entries)',
                paginate: {
                    first: '&laquo;',
                    previous: '&lsaquo;',
                    next: '&rsaquo;',
                    last: '&raquo;'
                }
            },
        });

        // Function to fetch updated data and reload the table
        function reloadData() {
            table.ajax.reload(null, false); // Reload the table without resetting the current paging
        }

        // Reload button click event handler
        $('#reloadButton').click(function() {
            reloadData();
        });

        // Fetch updated data every 10 seconds (10000 milliseconds)
        setInterval(reloadData, 5000);
    });
</script>
<?php
require('includes/Footer.php');
?>