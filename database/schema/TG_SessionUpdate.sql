CREATE TRIGGER
 `DB_Hice`.`TG_SessionUpdate`
AFTER UPDATE ON
 `DB_Hice`.`TB_Session`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_SessionHistory`
  (
   `vUserId`,
   `uActionAt`
  )
 VALUE
  (
   NEW.`vUserId`,
   NEW.`uIP`
  )