<?php

namespace common\generators;

function generate_navigation() /* string */ {
 return sprintf(file_get_contents("{$_SERVER['DOCUMENT_ROOT']}/templates/navigation.html"));
}

?>