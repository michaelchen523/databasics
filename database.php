<?php

#USE YOUR OWN CREDENTIALS
$db_user = '4400admin';
$db_password = 'iambasic';
$db_host = 'localhost';
$db_database = 'cs4400';

$con =  mysqli_connect($db_host, $db_user, $db_password, $db_database);

//Test connection
if ($con->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
