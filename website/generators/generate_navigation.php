<?php

function generate_navigation() {
 $navigation_template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/navigation.html");
 return sprintf($navigation_template);
}

?>