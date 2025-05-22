<?php

function validate_and_extend_session(
 mysqli $connection,
 string $session_id
) {
 $statement = $connection->prepare("SELECT `DB_Hice`.`FN_ValidateAndExtendSession`(?)");
 $statement->bind_param("s", $session_id);
 $statement->execute();
 $result = $statement->get_result();
 $data = $result->fetch_row();
 return $data[0];
}

?>