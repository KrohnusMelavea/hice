<?php

require_once("util/connect_to_localhost.php");
require_once("util/uuid_bytes_to_hex.php");
require_once("functions/login.php");

function validateInput() {
 $valid = true;
 if (!isset($_POST["username"])) {
  error_log("[API-PARAMS]({$_SERVER["REMOTE_ADDR"]}): Call to \"login\" missing parameter \"username\"");
  $valid = false;
 }
 if (!isset($_POST["password"])) {
  error_log("[API-PARAMS]({$_SERVER["REMOTE_ADDR"]}): Call to \"login\" missing parameter \"password\"");
  $valid = false;
 }
 return $valid;
}

session_start();

if (!isset($_SESSION["id"]) && validateInput()) {
 $email = $_POST["username"];
 $password = $_POST["password"];
 $ip = ip2long($_SERVER["REMOTE_ADDR"]);
 $connection = connect_to_localhost();
 if (!$connection) {
  header("HTTP/1.1 500 Internal Server Error");
 } else {
  $session_id = login($connection, $email, $password, $ip);
  $connection->close();
  if ($session_id == hex2bin('00000000000000000000000000000000')) {
   error_log("[AUTH]({$_SERVER["REMOTE_ADDR"]}): Invalid Username / Password");
   header("Location: /login");
  } else {
   $_SESSION["id"] = $session_id;
   header("Location: /account");
  }
 }
}

?>