CREATE TRIGGER
 `DB_Hice`.`TG_ChatMessageUpdate`
AFTER UPDATE ON
 `DB_Hice`.`TB_ChatMessage`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_ChatMessage`
  (
   `vChatMessageId`,
   `sMessage`,
   `bIsDeleted`,
   `vActionBy`,
   `cActionType`
  )
 VALUE
  (
   NEW.`vId`,
   NEW.`sMessage`,
   NEW.`bIsDeleted`,
   `DB_Hice`.`FN_GetCurrentDatabaseUserId`(),
   IF(NEW.`bIsDeleted` = 0, 'u', 'd')
  )