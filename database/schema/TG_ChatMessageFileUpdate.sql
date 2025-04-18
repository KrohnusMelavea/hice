CREATE TRIGGER
 `DB_Hice`.`TG_ChatMessageFileUpdate`
AFTER UPDATE ON
 `DB_Hice`.`TB_ChatMessageFile`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_ChatMessageFileHistory`
  (
   `vChatMessageFileId`,
   `vFileId`,
   `sFileName`,
   `bIsDeleted`,
   `vActionBy`,
   `cActionType`
  )
 VALUE
  (
   NEW.`vId`,
   NEW.`vFileId`,
   NEW.`sFileName`,
   NEW.`bIsDeleted`,
   `DB_Hice`.`FN_GetCurrentDatabaseUserId`(),
   IF(NEW.`bIsDeleted` = 0, 'u', 'd')
  )