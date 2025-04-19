CREATE TRIGGER
 `DB_Hice`.`TG_SessionDelete`
AFTER DELETE ON
 `DB_Hice`.`TB_Session`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`SessionHistory`
  (
   `vUserId`,
   `uIP`,
   `cActionType`
  )
 VALUE
  (
   OLD.`vUserId`,
   OLD.`uIP`,
   'd'
  )