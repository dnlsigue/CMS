
<?php
  if(isset($_POST['submit'])){
    $school_id = $_POST['schoolID'];
    $first_name = $_POST['firstName'];
    $last_name = $_POST['lastName'];
    $password = $_POST['password'];
    $age = $_POST['age'];
    $address = $_POST['address'];
    $role = $_POST['role'];

    $options = [
      'cost' => 10,
    ];

    $hashedpassword = password_hash($password, PASSWORD_BCRYPT, $options);

    $sql = "INSERT INTO `cms_users`(`school_id`, `first_name`, `last_name`, `password`, `age`, `address`, `role`) 
    VALUES ('$school_id', '$first_name', '$last_name', '$hashedpassword', '$age', '$address', '$role')";
    $con->query($sql);

    $sql = "SELECT * FROM cms_users WHERE school_id='$school_id' AND first_name='$first_name'";
    $res = $con->query($sql);
    header("Refresh:0");
    if(mysqli_num_rows($res)>0){
      while($row = mysqli_fetch_assoc($res)){
        $school_id = $row['school_id'];
        $sql = "INSERT INTO `cms_profileimg`(`school_id`, `status`) VALUES ('$school_id','1')";
        $con->query($sql);
      }
      
    }else{
      echo "You have an error!";
    }
    
  }

  

?>