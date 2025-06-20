<?php

class chat_item {
 public string $id;
 public string $realtor_firstname;
 public string $realtor_lastname;

 public function __construct(
  string $id,
  string $realtor_firstname,
  string $realtor_lastname
 ) {
  $this->id = $id;
  $this->realtor_firstname = $realtor_firstname;
  $this->realtor_lastname = $realtor_lastname;
 }

 public static function from_associative_arrays(array $data) {
  $chat_items = [];
  foreach ($data as $entry) {
   $chat_items = new chat_item(
    $entry["vId"],
    $entry["sFirstName"],
    $entry["sLastname"]
   );
  }
  return $chat_items;
 }
}

?>