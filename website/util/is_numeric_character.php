<?php

require_once("ORDINAL_CHARACTER.php");

function is_numeric_character(int $ordinal_character) {
 return ($ordinal_character >= ORDINAL_CHARACTER::NUM0 && $ordinal_character <= ORDINAL_CHARACTER::NUM9);
}

?>