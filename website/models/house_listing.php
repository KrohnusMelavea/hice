<?php

class house_listing {
 public string $id;
 public string $address;
 public ?string $description;
 public int $surface_area;
 public int $bedroom_count;
 public int $bathroom_count;
 public int $floor_count;
 public int $price;

 public function __construct(
  string $id,
  string $address,
  ?string $description,
  int $surface_area,
  int $bedroom_count,
  int $bathroom_count,
  int $floor_count,
  int $price
 ) {
  $this->id = $id;
  $this->address = $address;
  $this->description = $description;
  $this->surface_area = $surface_area;
  $this->bedroom_count = $bedroom_count;
  $this->bathroom_count = $bathroom_count;
  $this->floor_count = $floor_count;
  $this->price = $price;
 }

 public static function from_associative_array(array $data) {
  return new house_listing(
   $data["vId"],
   $data["sAddress"],
   $data["sDescription"],
   $data["uSurfaceAreaM2"],
   $data["uBedroomCount"],
   $data["uBathroomCount"],
   $data["uFloorCount"],
   $data["uPriceCents"]
  );
 }
}

?>