<?php

class user {
 public string $firstname;
 public string $lastname;
 public string $email;
 public string $type;

 public function __construct(
  string $firstname,
  string $lastname,
  string $email,
  string $type
 ) {
  $this->firstname = $firstname;
  $this->lastname = $lastname;
  $this->email = $email;
  $this->type = $type;
 }

 public static function from_associative_array(array $data) {
  return new user(
   $data["sFirstName"],
   $data["sLastName"],
   $data["sEmail"],
   $data["cType"]
  );
 }
}

?>