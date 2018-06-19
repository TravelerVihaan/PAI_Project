<?php
include_once 'logic/User.php';
session_start();

$user = new User();
$user->userLogout();
 ?>
