<?php
require './includes/Header.php';
?>


<div class="x--main-container">
  <div class="container pt-4 ">
    <div class="container-lg p-2 bg-white rounded d-flex flex-column">
      <div class="">
        <h4 class="text-center">Add class here</h4>
        <form action="addclass.php" method="post" class="form-inline p-3">
          <input type="text" name="subjectcode" id="subjectcode" class="form-control form-control-lg rounded-0" placeholder="Subject code" autocomplete="off" required>
        </form>
        <div class="" style="position: relative;margin-top:-16px;margin-left:16px;margin-right:16px;">
          <div class="list-group" id="show-list">
            <!-- dynamic item is from search.php -->
          </div>
        </div>
      </div>

    </div>

  </div>
</div>

<?php
require './includes/Footer.php';
?>