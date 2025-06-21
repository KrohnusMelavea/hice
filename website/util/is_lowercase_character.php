<?php

require_once("ORDINAL_CHARACTER.php");

function is_lowercase_character(int $ordinal_character) {
 return $ordinal_character >= ORDINAL_CHARACTER::LOWER_A && $ordinal_character <= ORDINAL_CHARACTER::LOWER_Z;
}

?>