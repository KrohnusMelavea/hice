<?php

require_once("models/user.php");

function get_user_by_session_id(
 mysqli $connection, 
 string $session_id
) {
 $statement = $connection->prepare("CALL `DB_Hice`.`SP_GetUserBySessionId`(UNHEX(?))");
 $statement->bind_param("s", $session_id);
 $statement->execute();
 $result = $statement->get_result();
 $data = $result->fetch_assoc();
 if ($data == null) {
  return null;
 } else {
  return user::from_associative_array($data);
 }
}

?>