<?php

function sanitise_username(string $username) {
 $username = trim($username);
 $is_username_valid = filter_var($username, FILTER_VALIDATE_EMAIL);
 if ($is_username_valid) {
  return $username;
 } else {
  return null;
 }
}

?>