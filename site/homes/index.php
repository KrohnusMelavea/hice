<?php

require_once("{$_SERVER['DOCUMENT_ROOT']}/common/invoke.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/is_guid.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/execute_templated_query.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/generators/generate_page.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/generators/generate_header.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/generators/generate_body.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/generators/generate_navigation.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/generators/generate_house_listing_item.php");

$HOUSE_LISTINGS_PAGE_RAW = file_get_contents("index.html");

$result = common\execute_templated_query("get_house_listings_by_page_number", 0, 2);
$home_listings_compiled = common\invoke(function() use ($result) {
 if ($result->status != 0) {
  return "Failure: {$result->status}";
 } else {
  $house_listing_items = common\models\detailed_house_listing_item::from_associative_array($result->data);
  $home_listings_compiled = "";
  foreach ($house_listing_items as $house_listing_item) {
   $home_listings_compiled = 
    $home_listings_compiled . 
    common\generators\generate_house_listing_item($house_listing_item) . 
    "\n";
  }
  return $home_listings_compiled;
 }
});
$home_listings_page = sprintf($HOUSE_LISTINGS_PAGE_RAW, $home_listings_compiled);

echo common\generators\generate_page(
 common\generators\generate_header("Homes", [], ""), 
 common\generators\generate_body(
  common\generators\generate_navigation(), 
  $home_listings_page
 )
);

?>