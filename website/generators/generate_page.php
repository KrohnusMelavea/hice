<?php

function generate_page($header, $body) {
 $page_template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/page.html");
 return sprintf($page_template, $header, $body);
}

?>