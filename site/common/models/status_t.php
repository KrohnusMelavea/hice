<?php

namespace common\models;

class status_t {
 public $data; /* any */
 public $status; /* int */

 function __construct($data /* any */, $status /* int */ = 0) {
  $this->data = $data;
  $this->status = $status;
 } 
}

?>