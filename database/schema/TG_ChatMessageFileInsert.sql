CREATE TRIGGER
 `DB_Hice`.`TG_ChatMessageFileInsert`
AFTER INSERT ON
 `DB_Hice`.`TB_ChatMessageFile`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_ChatMessageFileHistory`
  (
   `vChatMessageFileId`,
   `vFileId`,
   `sFileName`,
   `vActionBy`
  )
 VALUE
  (
   NEW.`vId`,
   NEW.`vFileId`,
   NEW.`sFileName`,
   `DB_Hice`.`FN_GetCurrentDatabaseUserId`()
  )