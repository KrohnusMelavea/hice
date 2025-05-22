<?php

require_once("models/house_listing.php");

function get_property_listing_by_id(
 mysqli $connection, 
 string $id
) {
 $statement = $connection->prepare("CALL `DB_Hice`.`SP_GetPropertyListingById`(UNHEX(?))");
 $statement->bind_param("s", $id);
 $statement->execute();
 $result = $statement->get_result();
 $data = $result->fetch_assoc();
 return house_listing::from_associative_array($data);
}

?>