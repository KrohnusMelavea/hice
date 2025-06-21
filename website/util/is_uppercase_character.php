<?php

require_once("ORDINAL_CHARACTER.php");

function is_uppercase_character(int $ordinal_character) {
 return ($ordinal_character >= ORDINAL_CHARACTER::UPPER_A && $ordinal_character <= ORDINAL_CHARACTER::UPPER_Z);
}

?>