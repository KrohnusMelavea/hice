<?php

function register(
 mysqli $connection, 
 string $firstname, 
 string $lastname, 
 string $email, 
 string $password, 
 int $ip
) {
 $statement = $connection->prepare("SELECT `DB_Hice`.`FN_Register`(?, ?, ?, ?, ?)");
 $statement->bind_param("ssssi", $firstname, $lastname, $email, $password, $ip);
 $statement->execute();
 $result = $statement->get_result();
 $data = $result->fetch_row();
 return $data[0];
}

?>