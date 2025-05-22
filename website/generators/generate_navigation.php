<?php

function generate_navigation() {
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/navigation.html");
 return sprintf($template, "/images/profile.png");
}

?>