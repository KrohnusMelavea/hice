<?php

namespace common;

function guid_bytes_to_hex($bytes /* byte...16 */): string {
 // file_put_contents("php://stdout", "\n" . ord($bytes[ 0]));
 file_put_contents("php://stdout", "\n" . (($bytes)));
 file_put_contents("php://stdout", "\n" . (ord($bytes[ 0])));
 file_put_contents("php://stdout", "\n" . (ord($bytes[ 0]) & 0xf));
 file_put_contents("php://stdout", "\n" . (ord($bytes[ 0]) >> 4));
 file_put_contents("php://stdout", "\n" . (ord($bytes[ 1]) & 0xf));
 file_put_contents("php://stdout", "\n" . (ord($bytes[ 1]) >> 4));
 file_put_contents("php://stdout", "\n" . (ord($bytes[ 2]) & 0xf));
 file_put_contents("php://stdout", "\n" . (ord($bytes[ 2]) >> 4));
 file_put_contents("php://stdout", "\n" . (ord($bytes[ 3]) & 0xf));
 file_put_contents("php://stdout", "\n" . (ord($bytes[ 3]) >> 4));
 file_put_contents("php://stdout", "\n" . (ord($bytes[ 4]) & 0xf));
 file_put_contents("php://stdout", "\n" . (ord($bytes[ 4]) >> 4));

 return
  dechex((string)(ord($bytes[ 0]) >> 4)) . dechex((string)(ord($bytes[ 0]) & 0xf)) . dechex((string)(ord($bytes[ 1]) >> 4)) . dechex((string)(ord($bytes[ 1]) & 0xf)) .
  dechex((string)(ord($bytes[ 2]) >> 4)) . dechex((string)(ord($bytes[ 2]) & 0xf)) . dechex((string)(ord($bytes[ 3]) >> 4)) . dechex((string)(ord($bytes[ 3]) & 0xf)) .
  '-' .
  dechex((string)(ord($bytes[ 4]) >> 4)) . dechex((string)(ord($bytes[ 4]) & 0xf)) . dechex((string)(ord($bytes[ 5]) >> 4)) . dechex((string)(ord($bytes[ 5]) & 0xf)) .
  '-' .
  dechex((string)(ord($bytes[ 6]) >> 4)) . dechex((string)(ord($bytes[ 6]) & 0xf)) . dechex((string)(ord($bytes[ 7]) >> 4)) . dechex((string)(ord($bytes[ 7]) & 0xf)) .
  '-' .
  dechex((string)(ord($bytes[ 8]) >> 4)) . dechex((string)(ord($bytes[ 8]) & 0xf)) . dechex((string)(ord($bytes[ 9]) >> 4)) . dechex((string)(ord($bytes[ 9]) & 0xf)) .
  '-' .
  dechex((string)(ord($bytes[10]) >> 4)) . dechex((string)(ord($bytes[10]) & 0xf)) . dechex((string)(ord($bytes[11]) >> 4)) . dechex((string)(ord($bytes[11]) & 0xf)) .
  dechex((string)(ord($bytes[12]) >> 4)) . dechex((string)(ord($bytes[12]) & 0xf)) . dechex((string)(ord($bytes[13]) >> 4)) . dechex((string)(ord($bytes[13]) & 0xf)) .
  dechex((string)(ord($bytes[14]) >> 4)) . dechex((string)(ord($bytes[14]) & 0xf)) . dechex((string)(ord($bytes[15]) >> 4)) . dechex((string)(ord($bytes[15]) & 0xf));
}

?>