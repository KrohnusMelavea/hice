<?php

require_once("{$_SERVER['DOCUMENT_ROOT']}/common/generators/generate_page.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/generators/generate_header.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/generators/generate_body.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/generators/generate_navigation.php");

$LANDING_PAGE_RAW = file_get_contents("index.html");
echo common\generators\generate_page(
 common\generators\generate_header("Homes", [], ""), 
 common\generators\generate_body(
  common\generators\generate_navigation(), 
  $LANDING_PAGE_RAW
 )
);

?>