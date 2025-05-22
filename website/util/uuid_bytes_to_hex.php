<?php

function uuid_string_to_hex(string $bytes) {
 $HEX_CODES = [
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  'a',
  'b',
  'c',
  'd',
  'e',
  'f'
 ];

 return 
  $HEX_CODES[ord($bytes[ 0]) >> 4] . $HEX_CODES[ord($bytes[ 0]) & 15] .
  $HEX_CODES[ord($bytes[ 1]) >> 4] . $HEX_CODES[ord($bytes[ 1]) & 15] .
  $HEX_CODES[ord($bytes[ 2]) >> 4] . $HEX_CODES[ord($bytes[ 2]) & 15] .
  $HEX_CODES[ord($bytes[ 3]) >> 4] . $HEX_CODES[ord($bytes[ 3]) & 15] .
  $HEX_CODES[ord($bytes[ 4]) >> 4] . $HEX_CODES[ord($bytes[ 4]) & 15] .
  $HEX_CODES[ord($bytes[ 5]) >> 4] . $HEX_CODES[ord($bytes[ 5]) & 15] .
  $HEX_CODES[ord($bytes[ 6]) >> 4] . $HEX_CODES[ord($bytes[ 6]) & 15] .
  $HEX_CODES[ord($bytes[ 7]) >> 4] . $HEX_CODES[ord($bytes[ 7]) & 15] .
  $HEX_CODES[ord($bytes[ 8]) >> 4] . $HEX_CODES[ord($bytes[ 8]) & 15] .
  $HEX_CODES[ord($bytes[ 9]) >> 4] . $HEX_CODES[ord($bytes[ 9]) & 15] .
  $HEX_CODES[ord($bytes[10]) >> 4] . $HEX_CODES[ord($bytes[10]) & 15] .
  $HEX_CODES[ord($bytes[11]) >> 4] . $HEX_CODES[ord($bytes[11]) & 15] .
  $HEX_CODES[ord($bytes[12]) >> 4] . $HEX_CODES[ord($bytes[12]) & 15] .
  $HEX_CODES[ord($bytes[13]) >> 4] . $HEX_CODES[ord($bytes[13]) & 15] .
  $HEX_CODES[ord($bytes[14]) >> 4] . $HEX_CODES[ord($bytes[14]) & 15] .
  $HEX_CODES[ord($bytes[15]) >> 4] . $HEX_CODES[ord($bytes[15]) & 15];
}

?>