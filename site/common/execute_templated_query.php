<?php

namespace common;

require_once("{$_SERVER['DOCUMENT_ROOT']}/common/fill_query_template.php");
require_once("{$_SERVER['DOCUMENT_ROOT']}/common/execute_atomic_query.php");

function execute_templated_query($template_name /* string */, ...$args /* any... */): models\status_t {
 $query = fill_query_template($template_name, ...$args);
 $result = execute_atomic_query($query);
 return $result;
}

?>