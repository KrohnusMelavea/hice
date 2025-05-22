<?php

require_once("generators/generate_header.php");
require_once("generators/generate_navigation.php");
require_once("generators/generate_body.php");
require_once("generators/generate_page.php");

function generate_index() {
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/login/index.html");
 return sprintf(
  $template
 );
}

echo generate_page(
 generate_header(
  "Hice",
  [
   "/styles/navigation.css",
   "style.css"
  ],
  [
   "/scripts/navigation.js"
  ]
 ),
 generate_body(
  generate_navigation(), 
  generate_index()
 )
);

?>