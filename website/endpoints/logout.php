<?php

require_once("util/connect_to_localhost.php");
require_once("functions/logout.php");

session_start();

if (isset($_SESSION["id"])) {
 $connection = connect_to_localhost();
 if (!$connection) {
  header("HTTP/1.1 500 Internal Server Error");
 } else {
  $session_id = $_SESSION["id"];
  $success = logout($connection, $session_id);
  $connection->close();
  unset($_SESSION["id"]);
 }
}

?>