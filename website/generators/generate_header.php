<?php

require_once("generate_styles.php");
require_once("generate_scripts.php");

function generate_header(string $title, $styles = [], $scripts = []) {
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/header.html");
 return sprintf(
  $template, 
  $title,
  generate_styles($styles),
  generate_scripts($scripts)
);
}

?>