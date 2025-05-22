<?php

require_once("models/house_listings_item.php");
require_once("util/uuid_bytes_to_hex.php");

function generate_house_listings_item(house_listings_item $house_listings_item) {
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/house_listings_item.html");
 $uuid_hex = uuid_string_to_hex($house_listings_item->id);
 return sprintf(
  $template,
  $uuid_hex,
  $uuid_hex,
  $house_listings_item->address,
  $house_listings_item->description
 );
}

?>