<?php

namespace common;

function is_guid($maybe_guid /* string */) /* bool */ {
 if (strlen($maybe_guid) != 36) {
  return false;
 }

 for ($index = 0; $index < 8; ++$index) /* Check first two words */ {
  $character = ord($maybe_guid[$index]);
  if (!is_numeric($character)) {
   return false;
  }
 }
 if ($maybe_guid[8] != '-') /* Check Separator */ {
  return false;
 }
 for ($index = 9; $index < 13; ++$index) /* Check third word */ {
  $character = ord($maybe_guid[$index]);
  if (!is_numeric($character)) {
   return false;
  }
 }
 if ($maybe_guid[13] != '-') /* Check Separator */ {
  return false;
 }
 for ($index = 14; $index < 18; ++$index) /* Check fourth word */ {
  $character = ord($maybe_guid[$index]);
  if (!is_numeric($character)) {
   return false;
  }
 }
 if ($maybe_guid[18] != '-') /* Check Separator */ {
  return false;
 }
 for ($index = 19; $index < 23; ++$index) /* Check fifth word */ {
  $character = ord($maybe_guid[$index]);
  if (!is_numeric($character)) {
   return false;
  }
 }
 if ($maybe_guid[23] != '-') /* Check Separator */ {
  return false;
 }
 for ($index = 24; $index < 32; ++$index) /* Check last three words */ {
  $character = ord($maybe_guid[$index]);
  if (!is_numeric($character)) {
   return false;
  }
 }

 return true;
}

?>