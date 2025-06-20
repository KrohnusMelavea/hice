<?php

require_once("models/house_listing.php");

function get_property_listing_by_id_if_session_user_owned(
 mysqli $connection, 
 string $id
) {
 $statement = $connection->prepare("CALL `DB_Hice`.`SP_GetPropertyListingByIdIfSessionUserOwned`(UNHEX(?), ?)");
 $statement->bind_param("ss", $id, $_SESSION["id"]);
 $statement->execute();
 $result = $statement->get_result();
 $data = $result->fetch_assoc();
 if ($data == null) {
  return null;
 } else {
  return house_listing::from_associative_array($data);
 }
}

?>