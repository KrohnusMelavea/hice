<?php

function sanitise_lastname(string $lastname) {
 $lastname = trim($lastname);
 if (strlen($lastname) == 0) {
  return null;
 } else {
  return $lastname;
 }
}

?>