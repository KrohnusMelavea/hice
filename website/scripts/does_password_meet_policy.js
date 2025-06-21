function does_password_meet_policy(password) {
 if (password.length < 16 || password.length > 255) {
  return false;
 }

 let index = 0;
 let contains_special_character = false;
 let contains_lowercase_character = false;
 let contains_uppercase_character = false;
 let contains_numeric_character = false;
 while (true) {
  const ordinal_character = password.charCodeAt(index);

  if (is_special_character(ordinal_character)) {
   contains_special_character = true;
  } else if (is_lowercase_character(ordinal_character)) {
   contains_lowercase_character = true;
  } else if (is_uppercase_character(ordinal_character)) {
   contains_uppercase_character = true;
  } else if (is_numeric_character(ordinal_character)) {
   contains_numeric_character = true;
  }

  ++index;
  if (contains_special_character && contains_lowercase_character && contains_uppercase_character && contains_numeric_character) {
   return true;
  }
  if (index === password.length) {
   return false;
  }
 }
}