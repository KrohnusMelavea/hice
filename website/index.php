<?php

require_once("generators/generate_header.php");
require_once("generators/generate_navigation.php");
require_once("generators/generate_body.php");
require_once("generators/generate_page.php");

function generate_index() {
 $index_template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/index.html");
 return sprintf($index_template, "hello world");
}

echo generate_page(
 generate_header("Hice"),
 generate_body(generate_navigation(), generate_index())
);

?>