<?php

function generate_styles(array $styles) {
 if (count($styles) == 0) {
  return "";
 }
 $template = file_get_contents("$_SERVER[DOCUMENT_ROOT]/templates/style.html");
 $generated_styles = sprintf($template, $styles[0]);
 for ($i = 1; $i < count($styles); ++$i) {
  $generated_styles = $generated_styles . "\n" . sprintf($template, $styles[$i]);
 }
 return $generated_styles;
}

?>