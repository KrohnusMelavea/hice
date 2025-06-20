<?php

require_once("generators/generate_header.php");
require_once("generators/generate_navigation.php");
require_once("generators/generate_body.php");
require_once("generators/generate_page.php");
require_once("generators/generate_homes.php");
require_once("functions/validate_and_extend_session.php");
require_once("util/connect_to_localhost.php");
require_once("stored_procedures/get_property_listings_by_session_id.php");

function generate_index() {
 $connection = connect_to_localhost();
 if (!$connection) {
  header("HTTP/1.1 500 Internal Server Error");
 }
 $house_listings = get_property_listings_by_session_id($connection);
 $connection->close();

 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/homes/index.html");
 return sprintf(
  $template, 
  generate_homes($house_listings)
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
 if ($result != 0) {
  unset($_SESSION["id"]);
  header("Location: /login");
 }
} else {
 header("Location: /login");
}

echo generate_page(
 generate_header(
  "Hice",
  [
   "/styles/navigation.css",
   "/styles/homes_item.css"
  ],
  [
   "/scripts/navigation.js",
   "/scripts/homes_item.js"
  ]
 ),
 generate_body(
  generate_navigation(), 
  generate_index()
 )
);

?>