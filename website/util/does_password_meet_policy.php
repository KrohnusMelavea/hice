<?php

require_once("is_special_character.php");
require_once("is_lowercase_character.php");
require_once("is_uppercase_character.php");
require_once("is_numeric_character.php");

function does_password_meet_policy(string $password) {
 error_log("CURRENTLY TESTING PASSWORD: $password");

 $password_length = strlen($password);

 if ($password_length < 16 || $password_length > 255) {
  return false;
 }
 error_log("IM STILL HERE BTW");

 $index = 0;
 $contains_special_character = false;
 $contains_lowercase_character = false;
 $contains_uppercase_character = false;
 $contains_numeric_character = false;
 while (true) {
  $ordinal_character = ord($password[$index]);

  if (is_special_character($ordinal_character)) {
   
   $contains_special_character = true;
  } else if (is_lowercase_character($ordinal_character)) {
   $contains_lowercase_character = true;
  } else if (is_uppercase_character($ordinal_character)) {
   $contains_uppercase_character = true;
  } else if (is_numeric_character($ordinal_character)) {
   $contains_numeric_character = true;
  }

  ++$index;
  if ($contains_special_character && $contains_lowercase_character && $contains_uppercase_character && $contains_numeric_character) {
   return true;
  }
  if ($index == $password_length) {
   return false;
  }
 }
}

?>