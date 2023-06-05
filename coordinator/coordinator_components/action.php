<?php
  include '../../Components/Database.php';
  $role = isset($_GET['role']) ? $_GET['role'] : null;
  $action = isset($_GET['action']) ? $_GET['action'] : null;
  $schoolid = isset($_GET['id']) ? $_GET['id'] : null;
  $classID = isset($_GET['id1']) ? $_GET['id1'] : null;

  if($role == 'student'){
    switch($action){
      case 'edit':
        $res = $con->query("SELECT * FROM cms_students WHERE school_id='$schoolid'");
        $row = $res->fetch_assoc();
        if($row){
          header(
            "location: ../studentEdit.php?id=".$row['id'].
            "&school_id=".$row['school_id'].
            "&first_name=".$row['first_name'].
            "&last_name=".$row['last_name']
          );
        }
        break;
      case 'delete':
        $res = $con->query("DELETE FROM `cms_students` WHERE school_id='$schoolid'");
        $res = $con->query("DELETE FROM `cms_sectionList` WHERE school_id='$schoolid'");
        $res = $con->query("DELETE FROM `cms_users` WHERE school_id='$schoolid'");
        $res = $con->query("DELETE FROM `cms_profileimg` WHERE school_id='$schoolid'");
        $res = $con->query("DELETE FROM `cms_attendance_logs` WHERE school_id='$schoolid'");
        if($res) header("refresh:0.3; ../studentManage.php");
        else {
          mysqli_error($con);
          header("refresh:2; ../studentManage.php");
        }
        break;
    }
  }
  else if($role == 'instructor'){
    switch($action){
      case 'edit':
        $res = $con->query("SELECT * FROM cms_instructors WHERE school_id='$schoolid'");
        $row = $res->fetch_assoc();
        if($row){
          header(
            "location: ../instructorEdit.php?id=".$row['id'].
            "&school_id=".$row['school_id'].
            "&first_name=".$row['first_name'].
            "&last_name=".$row['last_name']
          );
        }
        break;
      case 'delete':
        $res = $con->query("DELETE FROM `cms_instructors` WHERE school_id='$schoolid'");
        $res = $con->query("DELETE FROM `cms_users` WHERE school_id='$schoolid'");
        $res = $con->query("DELETE FROM `cms_attendance_logs` WHERE school_id='$schoolid'");
        $sql = "SELECT class_id FROM cms_classrooms WHERE school_id ='$schoolid'";
        $res = $con->query($sql);
        if (mysqli_num_rows($res)) {
            while ($row = mysqli_fetch_assoc($res)) {
                $class_id = $row['class_id'];
            }
             $res = $con->query("DELETE FROM `cms_classes` WHERE class_id='$class_id'");
             $res = $con->query("DELETE FROM `cms_classrooms` WHERE school_id='$schoolid'");
             $res = $con->query("DELETE FROM `cms_profileimg` WHERE school_id='$schoolid'");
             if($res) header("refresh:0.3; ../InstructorManage.php");
             else {
               mysqli_error($con);
               header("refresh:2; ../InstructorManage.php");
             }
        } else {
          $res = $con->query("DELETE FROM `cms_classrooms` WHERE school_id='$schoolid'");
          $res = $con->query("DELETE FROM `cms_profileimg` WHERE school_id='$schoolid'");
          if($res) header("refresh:0.3; ../InstructorManage.php");
          else {
            mysqli_error($con);
            header("refresh:2; ../InstructorManage.php");
          }
        }
        break;
    }
  }
  else if($role == 'AssignedinstructorDelete'){
    switch($action){
      case 'delete':
        $res = $con->query("DELETE FROM `cms_classes` WHERE class_id ='$classID'");
        $res = $con->query("DELETE FROM `cms_classrooms` WHERE class_id='$classID'");
        if($res) header("refresh:0.3; ../AssignInstructor.php");
        else {
          mysqli_error($con);
          header("refresh:2; ../AssignInstructor.php");
        }
        break;
    }
  }
  else if($role == 'AssignedstudentDelete'){
    switch($action){
      case 'delete':
        $res = $con->query( "UPDATE cms_students SET assigned='NO' WHERE school_id='$schoolid'");
        $res = $con->query("DELETE FROM `cms_sectionList` WHERE school_id ='$schoolid'");
        if($res) header("refresh:0.3; ../AssignStudent.php");
        else {
          mysqli_error($con);
          header("refresh:2; ../AssignStudent.php");
        }
        break;
    }
  }
?>