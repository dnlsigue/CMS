  <!-- Modal -->
  <div class="modal fade" id="studentModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">

        <form method="post" action="./instructor_components/create_class.php" class="bg-light border border-primary rounded p-5">

          <!-- CREATE CLASS MODAL -->
          <h1 class="text-center fw-bold mb-5">Create Assignment</h1>

          <!-- SECTION IS DROP DOWN -->
          <div class="input-group mb-5">
            <div class="input-group-prepend">
              <label class="input-group-text" for="inputGroupSection">Course & Section</label>
            </div>
            <select name="section" id="inputGroupSection" class="custom-select">
              <?php

              $sections = $con->query("SELECT * FROM cms_sections");
              if ($sections->num_rows > 0) {
                while ($row = $sections->fetch_assoc()) { ?>
                  <option value="<?php echo $row['course'] . "-" . $row['section'] ?>" name="section"><?php echo $row['course'] . "-" . $row['section'] ?></option>
                <?php
                }
              } else { ?>
                <option value="" name="section">no section records</option>
              <?php
              }
              ?>
            </select>
          </div>

          <!-- SECTION IS DROP DOWN -->
          <div class="input-group mb-5">
            <div class="input-group-prepend">
              <label class="input-group-text" for="inputGroupSection">Subject</label>
            </div>
            <select name="subjectcode" id="subjectcodes" class="custom-select">
              <?php

              $sections = $con->query("SELECT * FROM cms_subjects ORDER BY subject_code");
              if ($sections->num_rows > 0) {
                while ($row = $sections->fetch_assoc()) { ?>
                  <option value="<?php echo $row['subject_code']?>" name="subjectcode" id="selected"><?php echo $row['subject_code'] ?></option>
                <?php
                }
              } else { ?>
                <option value="" name="section">no section records</option>
              <?php
              }
              ?>
            </select>
          </div>
          <label for="subjectcodes">SUBJECT: <span id="display">CALCULUS I</span></label>

          <div class="d-flex justify-content-around mt-4">
            <input type="submit" class="btn btn-success btn-lg" name="classSubmit" value="Add"></input>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>

        </form>

      </div>
    </div>
  </div>