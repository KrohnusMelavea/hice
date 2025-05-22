<?php

function generate_scripts(array $scripts) {
 if (count($scripts) == 0) {
  return "";
 }
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/script.html");
 $generated_scripts = sprintf($template, $scripts[0]);
 for ($i = 1; $i < count($scripts); ++$i) {
  $generated_scripts = $generated_scripts . "\n" . sprintf($template, $scripts[$i]);
 }
 return $generated_scripts;
}

?>