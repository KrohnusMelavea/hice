<?php

require_once("models/house_listings_item.php");
require_once("util/uuid_bytes_to_hex.php");

function generate_homes_item(house_listings_item $homes_item) {
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/homes_item.html");
 $uuid_hex = uuid_string_to_hex($homes_item->id);
 return sprintf(
  $template,
  $uuid_hex,
  $uuid_hex,
  $homes_item->address,
  $homes_item->description
 );
}

?>