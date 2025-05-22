<?php

require_once("models/house_listings_item.php");
require_once("filters/house_listings_filter.php");

function get_property_listings_by_filter(
 mysqli $connection, 
 house_listings_filter $filter
) {
 $statement = $connection->prepare("CALL `DB_Hice`.`SP_GetPropertyListingsByFilter`(?)");
 $statement->bind_param("s", $filter->search_phrase);
 $statement->execute();
 $result = $statement->get_result();
 $data = $result->fetch_all(MYSQLI_ASSOC);
 return house_listings_item::from_associative_array($data);
}

?>