<?php

class house_listings_item {
 public string $id;
 public string $address;
 public int $price;
 public ?string $description;

 public function __construct(string $id, string $address, string $price, ?string $description) {
  $this->id = $id;
  $this->address = $address;
  $this->price = $price;
  $this->description = $description;
 }

 public static function from_associative_array(array $data) {
  $house_listings = array();
  foreach ($data as $entry) {
   $house_listings[] = new house_listings_item(
    $entry["vId"],
    $entry["sAddress"],
    $entry["uPriceCents"],
    $entry["sDescription"]
   );
  }
  return $house_listings;
 }
};

?>