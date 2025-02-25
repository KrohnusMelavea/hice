<?php

namespace common\generators;
use common;

require_once("{$_SERVER['DOCUMENT_ROOT']}/common/transformed_string_join.php");

const SCRIPT_MARKUP_TEMPLATE = "<script src=\"%s\" />";

function generate_scripts_list($script_sources /* array[string] */) /* string */ {
 return common\transformed_string_join($script_sources, fn($script_source) => sprintf(SCRIPT_MARKUP_TEMPLATE, $script_source), '\n');
}

function generate_header($title /* string */, $scripts /* array[string] */, $body /* string */) /* string */ {
 $HEADER_RAW = file_get_contents("{$_SERVER['DOCUMENT_ROOT']}/templates/header.html");
 return sprintf($HEADER_RAW, $title, $body);
}

?>