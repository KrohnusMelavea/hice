<?php

function generate_header($title /* string */) {
 $header_template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/header.html");
 return sprintf($header_template, $title, "");
}

?>