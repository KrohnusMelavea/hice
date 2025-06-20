<?php

require_once("models/house_listing.php");
require_once("util/uuid_bytes_to_hex.php");

function generate_home(house_listing $house_listing) {
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/home.html");
 return sprintf(
  $template,
  $house_listing->address,
  $house_listing->surface_area,
  $house_listing->bedroom_count,
  $house_listing->bathroom_count,
  $house_listing->floor_count,
  $house_listing->price,
  $house_listing->description
 );
}

?>