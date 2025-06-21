<?php

require_once("util/connect_to_localhost.php");
require_once("util/does_password_meet_policy.php");
require_once("util/sanitise_firstname.php");
require_once("util/sanitise_lastname.php");
require_once("util/sanitise_username.php");
require_once("functions/register.php"); 

function validate_input() {
 $valid = true;
 if (!isset($_POST["firstname"]) || gettype($_POST["firstname"]) != "string" || strlen($_POST["firstname"]) == 0) {
  error_log("[API-PARAMS] Call to \"register\" missing parameter \"firstname\"");
  $valid = false;
 }
 if (!isset($_POST["lastname"]) || gettype($_POST["lastname"]) != "string" || strlen($_POST["lastname"]) == 0) {
  error_log("[API-PARAMS] Call to \"register\" missing parameter \"lastname\"");
  $valid = false;
 }
 if (!isset($_POST["username"]) || gettype($_POST["username"]) != "string" || strlen($_POST["username"]) == 0) {
  error_log("[API-PARAMS] Call to \"register\" missing parameter \"username\"");
  $valid = false;
 }
 if (!isset($_POST["password"]) || gettype($_POST["password"]) != "string" || !does_password_meet_policy($_POST["password"])) {
  error_log("[API-PARAMS] Call to \"register\" missing parameter \"password\"");
  $valid = false;
 }
 return $valid;
}

session_start();

if (!isset($_SESSION["id"]) && validate_input()) {
 $firstname = sanitise_firstname($_POST["firstname"]);
 $lastname = sanitise_lastname($_POST["lastname"]);
 $username = sanitise_username($_POST["username"]);
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