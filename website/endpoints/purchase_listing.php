<?php

require_once("util/connect_to_localhost.php");
require_once("functions/purchase_listing.php");
require_once("functions/validate_and_extend_session.php");

session_start();

$session_id = $_SESSION["id"];
if (isset($session_id)) {
 $connection = connect_to_localhost();
 if (!$connection) {
  header("HTTP/1.1 500 Internal Server Error");
 } else {
  $session_status = validate_and_extend_session($connection, $session_id);
  if ($session_status == 0) {
   $_SESSION["id"] = $session_id;
   $post_data = json_decode(file_get_contents("php://input"), true);
   $property_listing_id = $post_data["id"];
   $property_sale_id = purchase_listing($connection, $session_id, $property_listing_id);
   $connection->close();
   if ($property_sale_id == null) {
    echo "{ \"status\": 1 }";   #Stay on Page
   } else {
    $hexed_property_sale_id = bin2hex($property_sale_id);
    echo "{ \"property_sale_id\": \"$hexed_property_sale_id\", \"status\": 0 }"; #success
   }
  } else {
   echo "{ \"status\": 2 }";    #Redirect
  }
 }
} else {
 echo "{ \"status\": 2 }";      #Redirect
}

?>