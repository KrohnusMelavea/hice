CREATE TRIGGER
 `DB_Hice`.`TG_SessionUpdate`
AFTER UPDATE ON
 `DB_Hice`.`TB_Session`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_SessionHistory`
  (
   `vUserId`,
   `dtInteraction`,
   `uActionAt`
  )
 VALUE
  (
   NEW.`vUserId`,
   NEW.`dtInteraction`,
   NEW.`uIP`
  )