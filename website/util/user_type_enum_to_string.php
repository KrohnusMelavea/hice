<?php

function user_type_enum_to_string(string $user_type) {
 switch ($user_type) {
 case 'u': return "User";
 case 'r': return "Realtor";
 case 's': return "System";
 case 'a': return "Admin";
 default: return "Invalid";
 }
}

?>