<?php
include "database_config.php";

$con = mysqli_connect($db_host, $db_user, $db_password, $db_database);

//Test connection
if($con) {
  echo 'Damn it worked';
} else {
  //echo 'FUUUCK';
}

?>
