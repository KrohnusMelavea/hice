<?php

function generate_body($navigation, $body) {
 $body_template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/body.html");
 return sprintf($body_template, $navigation, $body);
}

?>