<?php

require_once("generators/generate_header.php");
require_once("generators/generate_navigation.php");
require_once("generators/generate_body.php");
require_once("generators/generate_page.php");
require_once("functions/validate_and_extend_session.php");
require_once("util/connect_to_localhost.php");

function generate_index() {
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/register/index.html");
 return sprintf(
  $template
 );
}

session_start();

if (isset($_SESSION["id"])) {
 $connection = connect_to_localhost();
 if (!$connection) {
  header("HTTP/1.1 500 Internal Server Error");
 }
 $result = validate_and_extend_session($connection, $_SESSION["id"]);
 $connection->close();
 if ($result == 0) {
  header("Location; /account");
 } else {
  unset($_SESSION["id"]);
 }
}

echo generate_page(
 generate_header(
  "Hice",
  [
   "/styles/navigation.css",
   "style.css"
  ],
  [
   "/scripts/does_password_meet_policy.js",
   "/scripts/is_lowercase_character.js",
   "/scripts/is_numeric_character.js",
   "/scripts/is_uppercase_character.js",
   "/scripts/is_special_character.js",
   "/scripts/ORDINAL_CHARACTER.js",
   "/scripts/validate_registration.js",
   "/scripts/navigation.js"
  ]
 ),
 generate_body(
  generate_navigation(), 
  generate_index()
 )
);

?>