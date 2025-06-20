<?php

require_once("generators/generate_header.php");
require_once("generators/generate_navigation.php");
require_once("generators/generate_body.php");
require_once("generators/generate_page.php");
require_once("generators/generate_house_listing.php");
require_once("functions/validate_and_extend_session.php");
require_once("util/connect_to_localhost.php");
require_once("stored_procedures/get_property_listing_by_id.php");


function generate_index() {
 $connection = connect_to_localhost();
 if (!$connection) {
  header("HTTP/1.1 500 Internal Server Error");
 }
 $house_listing = get_property_listing_by_id($connection, $_GET["id"]);
 $connection->close();

 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/house/index.html");
 return sprintf(
  $template,
  generate_house_listing($house_listing)
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
 }
}

if (!isset($_GET["id"])) {
 echo "<img src='/images/house.png' style='height:100%'/>";
} else {
 echo generate_page(
  generate_header(
   "Hice",
   [
    "/styles/navigation.css",
    "/styles/house_listing.css"
   ],
   [
    "script.js",
    "/scripts/navigation.js"
   ]
  ),
  generate_body(
   generate_navigation(), 
   generate_index()
  )
 );
}


?>