<?php

namespace common;

require_once("{$_SERVER['DOCUMENT_ROOT']}/common/get_parent_directory.php");

function fill_query_template($template_name /* string */, ...$args): string {
 $template_directory = get_parent_directory($_SERVER['DOCUMENT_ROOT']) . "/data/query_templates/" . $template_name . ".sql";
 $template = file_get_contents($template_directory);
 return sprintf($template, ...$args);
}

?>