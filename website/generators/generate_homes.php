<?php

require_once("generate_homes_item.php");

function generate_homes(array $homes_items) {
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/homes.html");
 if (count($homes_items) == 0) {
  return sprintf(
   $template,
   ""
  );
 }
 $generated_home_items = generate_homes_item($homes_items[0]);
 for ($i = 1; $i < count($homes_items); ++$i) {
  $generated_home_items = 
   $generated_home_items . 
   "\n" . 
   generate_homes_item($homes_items[$i]);
 }
 return sprintf(
  $template,
  $generated_home_items
 );
}

?>