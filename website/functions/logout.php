<?php

function logout(
 mysqli $connection, 
 string $session_id
) {
 $statement = $connection->prepare("SELECT `DB_Hice`.`FN_Logout`(?)");
 $statement->bind_param("s", $session_id);
 $statement->execute();
 $result = $statement->get_result();
 $data = $result->fetch_row();
 return $data[0];
}

?>