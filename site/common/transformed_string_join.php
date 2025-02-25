<?php

namespace common;

function transformed_string_join($strings /* array<any> */, $transformer /* any -> string */, $separator /* string */) /* string */ {
 if (sizeof($strings) == 0) {
  return "";
 }

 $joined = $transformer($strings[0]);
 for ($i = 1; $i < sizeof($strings); ++$i) {
  $transformed = $transformer($strings[$i]);
  $joined = "$joined$separator$transformed";
 }
 return $joined;
}

?>