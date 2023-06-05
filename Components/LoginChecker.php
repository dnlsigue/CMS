<?php

  if (isset($_POST['submitLogin'])) {
    $school_id = $_POST['schoolID'];
    $password = $_POST['password'];

    $res = $con->query("SELECT password FROM cms_users WHERE school_id='$school_id'");
    $row = $res->fetch_assoc();
    $DBhashedPassword = $row['password'] ?? null;

    if (password_verify($password, $DBhashedPassword)) {
      // login success!
      $res = $con->query("SELECT * FROM cms_users WHERE school_id='$school_id'");
      $row = $res->fetch_assoc();
      $_SESSION['user'] = 1;
      $_SESSION['school_id'] = $row['school_id'];
      $_SESSION['first_name'] = $row['first_name'];
      $_SESSION['last_name'] = $row['last_name'];
      $_SESSION['role'] = $row['role'];
      $_SESSION['email'] = $row['email'];
      $_SESSION['phone'] = $row['phone'];
      

      if($row['role']=='admin'){
        header('location:./admin/dashboard.php'); 
      }
      else if($row['role']=='student'){
        header('location:./student/dashboard.php');
      }
      else if($row['role']=='instructor'){
        header('location:./instructor/dashboard.php');
      }
      else if($row['role']=='coordinator'){
        header('location:./coordinator/dashboard.php');
      }
      else {
        header('location:login.php');
      }
      
    } 
    else {
         header('location:login.php?error= Incorrect Username or Password');
    }
    


  }
  ?>