<?php

namespace common\generators;

function generate_page($header /* string */, $body /* string */) /* string */ {
 $PAGE_TEMPLATE = file_get_contents("{$_SERVER['DOCUMENT_ROOT']}/templates/page.html");
 return sprintf($PAGE_TEMPLATE, $header, $body);
}

?>