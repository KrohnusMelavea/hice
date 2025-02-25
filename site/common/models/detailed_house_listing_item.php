<?php

namespace common\models;

class detailed_house_listing_item {
 public $id /* guid */;
 public $image_id /* guid */;
 public $address /* string */;

 function __construct($id /* guid */, $image_id /* guid */, $address /* string */) {
  $this->id = $id;
  $this->image_id = $image_id;
  $this->address = $address;
 }

 static function from_associative_array($data): array /* detailed_house_listing_item... */ {
  $detailed_house_listing_items = [];
  foreach ($data as $entry) {
   $detailed_house_listing_items[] = new detailed_house_listing_item(
    $entry["vHouseListingID"],
    $entry["vHouseListingImageID"],
    $entry["sHouseAddress"]
   );
  }
  return $detailed_house_listing_items;
  }
}

?>