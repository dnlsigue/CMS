<?php
  $con = mysqli_connect("localhost","ytoovumw_bscs3a","kaAGi]gz8H2*", "ytoovumw_bscs3a");

  if(mysqli_connect_errno()){
    throw new Error("Php mysql connection err: ".mysqli_connect_error());
  } 

// fetch records
$sql = "SELECT * FROM `cms_classrooms`";
$result = mysqli_query($con, $sql);

while($row = mysqli_fetch_assoc($result)) {
    $array[] = $row;
}
if($result->num_rows > 0){

  $dataset = array(
    "echo" => 1,
    "totalrecords" => count($array),
    "totaldisplayrecords" => count($array),
    "data" => $array
);
}
else{
  $dataset = array( 
    "echo" => 0,
    "totalrecords" => 0,
    "totaldisplayrecords" => 0,
    "data" => 0);

}
echo json_encode($dataset);
?>