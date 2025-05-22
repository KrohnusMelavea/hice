<?php

require_once("util/connect_to_localhost.php");
require_once("functions/register.php");

function validateInput() {
 $valid = true;
 if (!isset($_POST["firstname"])) {
  error_log("[API-PARAMS] Call to \"register\" missing parameter \"firstname\"");
  $valid = false;
 }
 if (!isset($_POST["lastname"])) {
  error_log("[API-PARAMS] Call to \"register\" missing parameter \"lastname\"");
  $valid = false;
 }
 if (!isset($_POST["username"])) {
  error_log("[API-PARAMS] Call to \"register\" missing parameter \"username\"");
  $valid = false;
 }
 if (!isset($_POST["password"])) {
  error_log("[API-PARAMS] Call to \"register\" missing parameter \"password\"");
  $valid = false;
 }
 return $valid;
}

session_start();

if (!isset($_SESSION["id"]) && validateInput()) {
 $firstname = $_POST["firstname"];
 $lastname = $_POST["lastname"];
 $username = $_POST["username"];
 $password = $_POST["password"];
 $ip = ip2long($_SERVER["REMOTE_ADDR"]);
 $connection = connect_to_localhost();
 if (!$connection) {
  header("HTTP/1.1 500 Internal Server Error");
 } else {
  $session_id = register(
   $connection, 
   $firstname, 
   $lastname, 
   $username, 
   $password,
   $ip
  );
  $connection->close();
  if ($session_id != null) {
   header("Location: /account");
   $_SESSION["id"] = $session_id;
  }
 }
} else {
 header("Location: /register");
}

?>