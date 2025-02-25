<?php

function get_parent_directory($directory /* string */): string {
 if ($directory[-1] == '/' || $directory[-1] == '\\') {
  $directory = substr($directory, 0, -1);
 };
 $path = explode('/', str_replace('\\', '/', $directory));
 array_pop($path);
 return join("/", $path);
}

?>