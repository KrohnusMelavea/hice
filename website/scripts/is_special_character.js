function is_special_character(ordinal_character) {
 return (
  (ordinal_character >= ORDINAL_CHARACTER.EXCLAMANTION_MARK && ordinal_character <= ORDINAL_CHARACTER.FORWARD_SLASH) ||
  (ordinal_character >= ORDINAL_CHARACTER.COLON             && ordinal_character <= ORDINAL_CHARACTER.AT           ) ||
  (ordinal_character >= ORDINAL_CHARACTER.OPEN_BRACKET      && ordinal_character <= ORDINAL_CHARACTER.BACKTICK     ) ||
  (ordinal_character >= ORDINAL_CHARACTER.OPEN_BRACE        && ordinal_character <= ORDINAL_CHARACTER.TILDE        )
 );
}