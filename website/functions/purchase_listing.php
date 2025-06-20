<?php

function purchase_listing(
 mysqli $connection, 
 string $session_id, 
 string $property_listing_id
) {
 $statement = $connection->prepare("SELECT `DB_Hice`.`FN_PurchaseListing`(?, UNHEX(?))");
 $statement->bind_param("ss", $session_id, $property_listing_id);
 $statement->execute();
 $result = $statement->get_result();
 $data = $result->fetch_row();
 return $data[0];
}

?>