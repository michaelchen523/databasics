<?php
include "database_config.php";

#USE YOUR OWN CREDENTIALS
$db_user = '4400admin';
$db_password = 'iambasic';
$db_host = 'localhost';
$db_database = 'cs4400';

$con =  new mysqli($db_host, $db_user, $db_password);

//Test connection
if ($con->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

?>
