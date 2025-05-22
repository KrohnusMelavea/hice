<?php

function generate_page(string $header, string $body) {
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/page.html");
 return sprintf($template, $header, $body);
}

?>