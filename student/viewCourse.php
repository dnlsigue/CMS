<?php
  require('includes/Header.php');
  if(!isset($_GET['subject_code']) && !isset($_GET['section']) && !isset($_GET['classroom_id'])){
    echo '<script>window.location.href = "./myClass.php";</script>';
  }
?>
<div class="x--main-container">
  <div class="container bg-white">
    <hr class="hr"/>

    <div class="row">
    
      <?php 
        $sql = "SELECT * FROM cms_instructors_topics WHERE classroom_id='".$_GET['classroom_id']."'";
          
        $res = $con->query($sql);
        if(mysqli_num_rows($res) > 0){
          
        
          while($row = $res->fetch_assoc()){
          ?>

          <div class="col pt-3">
            <div class="card" style="width: 18rem;">
              <img class="card-img-top" src="https://imageio.forbes.com/specials-images/imageserve/5d7a6f9ec0e1890008d139b9/classroom/960x0.jpg?format=jpg&width=960" alt="Card image cap">
              <div class="card-body">
                <p class="card-text"><?php echo $row['topic_name'] . " (" . $row['term'] . ")"?></p>
                <!-- this view course hindi pa nagagawa -->
                <a href="viewTopic.php?classroom_id=<?php echo $row['classroom_id']. "&topic_name=".$row['topic_name']. "&instructors_topics_id=".$row['instructors_topics_id']; ?>" class="btn btn-primary">View Topic</a>
              </div>
            </div>
          </div>
          <?php
        }
        } else {
          ?>
          <div class="text-center vh-100 p-4">
            <h1 class="mt-2">No Topic</h1>
            <a class="" href="./myClass.php">go back</a>
            <div class="mt-4 mb-1 dropdown-divider"></div>
          </div>
          <?php
        }
      ?>
    </div>

  </div>
</div>
<?php
require('includes/Footer.php');
?>