<?php

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

?>