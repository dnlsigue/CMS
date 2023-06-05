           <!--main container end-->
           </div>
           <!--end of main wrapperd-->
           <script type="text/javascript">
               $(document).ready(function() {
                   $('#subjectcodes').on('change', function() {
                       $.ajax({
                           type: "POST",
                           url: "./coordinator_components/subjecthandle.php",
                           data: "subjectcode=" + $(this).find('option:selected').text(),
                           success: function(data) {
                               $("#display").html(data);
                               console.log(data);
                           }
                       });
                   })

                   $(".x--sidebar-btn").click(function() {
                       $(".x--wrapper").toggleClass("x--collapse");
                   });
               });
           </script>
           </body>

           </html>