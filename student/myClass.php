<?php
  require('includes/Header.php');    

  $sql = "SELECT * FROM cms_sectionlist WHERE school_id='$school_id'";
  $res = $con->query($sql);
  if(mysqli_num_rows($res) > 0){
    $_SESSION['section'] = $res->fetch_assoc()['sections'];
    
  }
?>

<div class="x--main-container">

  <div class="container bg-white">
    
    <div class="pb-5">
      <h1 class="text-center">My Classes</h1>
      <div class="container ">
      <div class="row bg-light d-flex pb-3 shadow-sm rounded">
        <?php 
          $sql = "SELECT cms_classrooms.classroom_id, cms_classrooms.subject_code, cms_classrooms.sections, cms_classes.class_code, cms_classes.subject, cms_classrooms.created_at FROM `cms_classrooms` INNER JOIN cms_classes ON cms_classrooms.class_id=cms_classes.class_id WHERE cms_classrooms.sections='". $_SESSION['section']. "'";
          
          $res = $con->query($sql);
          while($row = $res->fetch_assoc()){
            ?>
            
            <!-- loop happening here... -->
            <div class="col pt-3">
              <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="https://imageio.forbes.com/specials-images/imageserve/5d7a6f9ec0e1890008d139b9/classroom/960x0.jpg?format=jpg&width=960" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text"><?php echo $row['sections'] . " - [" . $row['subject_code'] . "] " . $row['subject'] ?></p>
                  <!-- this view course hindi pa nagagawa -->
                  <a href="viewCourse.php?subject_code=<?php echo $row['subject_code']. "&section=".$row['sections']. "&classroom_id=".$row['classroom_id'] ?>" class="btn btn-primary">View Class</a>
                </div>
              </div>
            </div>

          <?php
          }
        ?>
      </div>
      </div>
      
      
    </div>

  </div>
</div>

<?php
require('includes/Footer.php');
?>