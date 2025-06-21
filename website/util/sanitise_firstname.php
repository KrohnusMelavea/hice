<?php

function sanitise_firstname(string $firstname) {
 $firstname = trim($firstname);
 if (strlen($firstname) == 0) {
  return null;
 } else {
  return $firstname;
 }
}

?>