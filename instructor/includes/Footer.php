            <!--main container end-->
            </div> <!--end of main wrapper-->
<script type="text/javascript">
    $(document).ready(function() {
        
        $(".x--sidebar-btn").click(function() {
            $(".x--wrapper").toggleClass("x--collapse");
        });

        $("#subjectcode").keyup(function(){
            var searchText = $(this).val();
            console.log("test")
            if(searchText != ''){
                $.ajax({
                    url: './instructor_components/search.php',
                    method: 'post',
                    data: {query:searchText},
                    success: function(response){
                        $("#show-list").html(response);
                    }
                });
            } else {
                $("#show-list").html("");
            }
        });
        // Set searched text in input field on click of search button
        $(document).on("click", "a", function () {
            $("#subjectcode").val($(this).text());
            $("#show-list").html("");
        });

        $('#subjectcodes').on('change', function(){
            $.ajax({
            type: "POST",
            url: "./instructor_components/subjecthandle.php",
            data: "subjectcode="+$(this).find('option:selected').text(),
            success: function(data){
                $("#display").html(data);
            }
            });
        })
    });
    $('.my-select').selectpicker();
   
</script>
</body>
</html>