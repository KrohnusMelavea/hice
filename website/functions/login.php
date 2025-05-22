<?php

function login(
 mysqli $connection, 
 string $email, 
 string $password, 
 int $ip
) {
 $statement = $connection->prepare("SELECT `DB_Hice`.`FN_Login`(?, ?, ?)");
 $statement->bind_param("ssi", $email, $password, $ip);
 $statement->execute();
 $result = $statement->get_result();
 $data = $result->fetch_row();
 return $data[0];
}

?>