<?php

require_once("generators/generate_chat_item.php");

function generate_chat_list(array $chat_items) {
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/chat_list.html");
 if (count($chat_items) == 0) {
  return sprintf(
   $template,
   ""
  );
 }
 $generated_chat_items = $chat_items[0];
 for ($i = 1; $i < count($chat_items); ++$i) {
  $generated_chat_items = 
   $generated_chat_items . 
   '\n' .
   generate_chat_item($chat_items[$i]);
 }
 return sprintf(
  $template,
  $generated_chat_items
 );
}

?>