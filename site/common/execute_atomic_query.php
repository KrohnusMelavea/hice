<?php

namespace common;

require_once("{$_SERVER['DOCUMENT_ROOT']}/common/invoke.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/models/status_t.php");

function execute_atomic_query($query /* string */): models\status_t {
 $connection = mysqli_connect("localhost", "root", "", "DB_Hice");
 $result = invoke(function() use ($connection, $query): models\status_t {
  $connection_error_code = mysqli_connect_errno();
  if ($connection_error_code) {
   return new models\status_t(null, $connection_error_code);
  } else {
   $result = mysqli_query($connection, $query);
   $data = array();
   while ($row = $result->fetch_assoc()) {
    $data[] = $row;
   }
   mysqli_free_result($result);
   return new models\status_t($data, $connection_error_code);
  }
 });
 mysqli_close($connection);
 return $result;
}

?>