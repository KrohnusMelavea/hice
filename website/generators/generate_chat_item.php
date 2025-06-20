<?php

require_once("models/chat_item.php");

function generate_chat_item(chat_item $chat_item) {
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/chat_item.html");
 return sprintf(
  $template,
  $chat_item->id,
  $chat_item->realtor_firstname . ' ' . $chat_item->realtor_lastname
 );
}

?>