<?php

function get_property_listings_by_session_id(mysqli $connection) {
 $statement = $connection->prepare("CALL `DB_Hice`.`SP_GetPropertyListingsBySessionId`(?)");
 $statement->bind_param("s", $_SESSION["id"]);
 $statement->execute();
 $result = $statement->get_result();
 $data = $result->fetch_all(MYSQLI_ASSOC);
 return house_listings_item::from_associative_array($data);
}

?>