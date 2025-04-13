CREATE TRIGGER
 `DB_Hice`.`TG_ChatFileInsert`
AFTER INSERT ON
 `DB_Hice`.`TB_ChatFile`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_ChatFileHistory`
  (
   `vChatFileId`,
   `vFileId`,
   `sFileName`,
   `vActionBy`
  )
 VALUE
  (
   NEW.`vId`,
   NEW.`vFileId`,
   NEW.`sFileName`,
   `DB_Hice`.`FN_GetCurretnDatabaseUserId`()
  )