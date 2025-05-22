<?php

require_once("models/database_credentials.php");

function connect_to_localhost() {
 $credentials = database_credentials::load_localhost();
 return mysqli_connect(
  $credentials->host,
  $credentials->user,
  $credentials->password,
  $credentials->database,
  $credentials->port
 );
}

?>