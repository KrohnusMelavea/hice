CREATE TRIGGER
 `DB_Hice`.`TG_ChatMessageInsert`
AFTER INSERT ON
 `DB_Hice`.`TB_ChatMessage`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_ChatMessageHistory`
  (
   `vChatMessageId`,
   `sMessage`,
   `vActionBy`
  )
 VALUE
  (
   NEW.`vId`,
   NEW.`sMessage`,
   `DB_Hice`.`FN_GetCurrentDatabaseUserId`()
  )