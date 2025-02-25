<?php

namespace common\models;

require_once("{$_SERVER['DOCUMENT_ROOT']}/common/guid_bytes_to_hex.php");
use common;

class detailed_house_listing {
 public $address /* string */;
 public $image_id /* guid */;

 function __construct($address /* string */, $image_id /* guid */) {
  $this->address = $address;
  $this->image_id = $image_id;
 }

 static function from_associative_singular_array($data): detailed_house_listing {
  return new detailed_house_listing($data[0]["sHouseAddress"], common\guid_bytes_to_hex($data[0]["vHouseListingImageID"]));
 }
}

?>