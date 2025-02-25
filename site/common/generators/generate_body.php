<?php

namespace common\generators;

function generate_body($navigation /* string */, $body /* string */) /* string */ {
 $BODY_RAW = file_get_contents("{$_SERVER['DOCUMENT_ROOT']}/templates/body.html");
 return sprintf($BODY_RAW, $navigation, $body);
}

?>