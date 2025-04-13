CREATE TRIGGER 
 `DB_Hice`.`TG_UserInsert` 
AFTER INSERT ON 
 `DB_Hice`.`TB_User`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_UserHistory`
  (
   `vUserId`,
   `sFirstName`,
   `sLastName`,
   `sEmail`,
   `sPassword`,
   `cType`,
   `vActionBy`
  )
 VALUE
  (
   NEW.`vId`,
   NEW.`sFirstName`,
   NEW.`sLastName`,
   NEW.`sEmail`,
   NEW.`sPassword`,
   NEW.`cType`,
   `DB_Hice`.`FN_GetCurrentDatabaseUserId`()
  )