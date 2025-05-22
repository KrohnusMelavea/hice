<?php

class database_credentials {
 public string $host;
 public int $port;
 public string $user;
 public string $password;
 public string $database;

 public function __construct(
  string $host,
  int $port,
  string $user,
  string $password,
  string $database
 ) {
  $this->host = $host;
  $this->port = $port;
  $this->user = $user;
  $this->password = $password;
  $this->database = $database;
 }

 public static function deserialise(string $json) {
  $data = json_decode($json, true);
  return new database_credentials(
   $data["host"],
   $data["port"],
   $data["user"],
   $data["password"], 
   $data["database"]
  );
 }

 public static function load_localhost() {
  $credentials = file_get_contents("$_SERVER[DOCUMENT_ROOT]/secrets/localhost_database_credentials.json");
  return database_credentials::deserialise($credentials);
 }
}

?>