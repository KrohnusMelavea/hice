<?php

require_once("models/house_listing.php");

function get_property_listing_by_id_if_session_user_owned(
 mysqli $connection, 
 string $id
) {
 $statement = $connection->prepare("CALL `DB_Hice`.`SP_GetPropertyListingByIdIfSessionUserOwned`(UNHEX(?), UNHEX(?))");
 $statement->bind_param("ss", $id, $_SESSION["id"]);
 $statement->execute();
 $result = $statement->get_result();
 if ($result->num_rows == 0) {
  return null;
 } else {
  $data = $result->fetch_assoc();
  return house_listing::from_associative_array($data);
 }
}

?>