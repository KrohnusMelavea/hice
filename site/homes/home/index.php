<?php

require_once("{$_SERVER['DOCUMENT_ROOT']}/common/invoke.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/is_guid.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/models/detailed_house_listing.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/execute_templated_query.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/generators/generate_body.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/generators/generate_page.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/generators/generate_header.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/generators/generate_navigation.php");

function format_home_landing_page($landing_page_raw /* string */, $detailed_house_listing /* detailed_house_listing */): string {
 return sprintf($landing_page_raw, $detailed_house_listing->image_id, $detailed_house_listing->address);
}

$home_landing_page_raw = file_get_contents("index.html");
$title = "";
$home_landing_page_body = "";
if (isset($_GET["id"])) /* Client Passed a Home ID */ {
 if (common\is_guid($_GET["id"])) /* Client's Home ID is Valid */ {
  $result = common\execute_templated_query("get_detailed_house_listing_by_id", $_GET["id"]);
  $detailed_house_listing = common\invoke(function() use ($result) {
   if ($result->status != 0) {
    return new common\models\detailed_house_listing("Failed to Retrieve House Listing Information", null);
   }
   if (sizeof($result->data) == 0) {
    return new common\models\detailed_house_listing("No Such House Listing Available", null);
   }
   return common\models\detailed_house_listing::from_associative_singular_array($result->data);
  });
  file_put_contents("php://stdout", '\n' . $detailed_house_listing->image_id . '\n');
  $home_landing_page_body = format_home_landing_page($home_landing_page_raw, $detailed_house_listing);
 } else /* Client's Home ID is Invalid */ {
  $title = "Invalid Home ID";
  $home_landing_page_body = format_home_landing_page($home_landing_page_raw, $title);
 }
} else /* Client didn't pass Home ID */ {
  $title = "No Home ID";
  $home_landing_page_body = format_home_landing_page($home_landing_page_raw, $title);
}

echo common\generators\generate_page(
 common\generators\generate_header($title, [], ""), 
 common\generators\generate_body(
  common\generators\generate_navigation(), 
  $home_landing_page_body
 )
);

?>