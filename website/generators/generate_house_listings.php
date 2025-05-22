<?php

require_once("generate_house_listings_item.php");

function generate_house_listings(array $house_listings_items) {
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/house_listings.html");
 if (count($house_listings_items) == 0) {
  return sprintf(
   $template,
   ""
  );
 }
 $generated_house_listing_items = generate_house_listings_item($house_listings_items[0]);
 for ($i = 1; $i < count($house_listings_items); ++$i) {
  $generated_house_listing_items = 
   $generated_house_listing_items . 
   "\n" . 
   generate_house_listings_item($house_listings_items[$i]);
 }
 return sprintf(
  $template,
  $generated_house_listing_items
 );
}

?>