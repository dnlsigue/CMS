           
           <!--main container end-->
            </div>
            <!--end of main wrapper-->
            <script type="text/javascript">
                $(document).ready(function() {

                    $(".x--sidebar-btn").click(function() {
                        $(".x--wrapper").toggleClass("x--collapse");
                    });

                    function handleEdit(button) {
                        $(this).data('edit-id');
                        console.log($('#btnEdit').data('edit-id'));
                    }

                        var table = $('#studentView').DataTable();

                });




                function onlyNumberKey(evt) {

                    // Only ASCII character in that range allowed
                    var ASCIICode = (evt.which) ? evt.which : evt.keyCode
                    if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
                        return false;
                    return true;
                }
                const toggleBtn = document.querySelector('toggleShow');
                const showDiv = document.querySelector('.alertShow');

                toggleBtn.addEventListener('click', () => {
                    if (showDiv.style.display === 'none') {
                        showDiv.stle.display = 'block';
                    } else {
                        showDiv.style.display = 'none';
                    }
                });
            </script>
            </body>

            </html>