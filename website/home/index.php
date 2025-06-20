<?php

require_once("generators/generate_header.php");
require_once("generators/generate_navigation.php");
require_once("generators/generate_body.php");
require_once("generators/generate_page.php");
require_once("generators/generate_home.php");
require_once("util/connect_to_localhost.php");
require_once("stored_procedures/get_property_listing_by_id_if_session_user_owned.php");

function generate_index() {
 $connection = connect_to_localhost();
 if (!$connection) {
  header("HTTP/1.1 500 Internal Server Error");
 }
 $home = get_property_listing_by_id_if_session_user_owned($connection, $_GET["id"]);
 $connection->close();

 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/home/index.html");
 return sprintf(
  $template,
  $home == null ?
  "Either Session User does not Own Property, or Property Listing Never Existed: " . $_GET["id"] :
  generate_home($home)
 );
}

session_start();

if (!isset($_GET["id"])) {
 echo "<img src='/images/house.png' style='height:100%'/>";
} else {
 echo generate_page(
  generate_header(
   "Hice",
   [
    "/styles/navigation.css",
    "/styles/home.css"
   ],
   [
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