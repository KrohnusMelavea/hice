<?php

require_once("generators/generate_header.php");
require_once("generators/generate_navigation.php");
require_once("generators/generate_body.php");
require_once("generators/generate_page.php");
require_once("util/connect_to_localhost.php");
require_once("util/user_type_enum_to_string.php");
require_once("functions/validate_and_extend_session.php");
require_once("stored_procedures/get_user_by_session_id.php");

function generate_index() {
 $connection = connect_to_localhost();
 if (!$connection) {
  header("HTTP/1.1 500 Internal Server Error");
 }
 $session_validation = validate_and_extend_session($connection, $_SESSION["id"]);
 if ($session_validation == 2) {
  $session_id = bin2hex($_SESSION["id"]);
  error_log("[SESSION]({$_SERVER["REMOTE_ADDR"]}): Session ($session_id) Expired");
  unset($_SESSION["id"]);
  header("Location: /login");
 }
 else if ($session_validation == 1) {
  $session_id = bin2hex($_SESSION["id"]);
  error_log("[SESSION]({$_SERVER["REMOTE_ADDR"]}): Session ($session_id) Does not Exist");
  unset($_SESSION["id"]);
  header("Location: /login");
 }
 else {
  $user = get_user_by_session_id($connection, bin2hex($_SESSION["id"]));
  // if ($user == null) {
  //  unset($_SESSION["id"]);
  // }
  $connection->close();
  $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/account/index.html");
  return sprintf(
   $template,
   $user->firstname,
   $user->lastname,
   $user->email,
   user_type_enum_to_string($user->type)
  );
 }
}

session_start();

if (!isset($_SESSION["id"])) {
 header("Location: /login");
} else {
 echo generate_page(
  generate_header(
   "Hice",
   [
    "/styles/navigation.css",
    "style.css"
   ],
   [
    "/scripts/navigation.js",
    "script.js"
   ]
  ),
  generate_body(
   generate_navigation(), 
   generate_index()
  )
 );
}

?>