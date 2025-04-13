CREATE TRIGGER
 `DB_Hice`.`TG_GetCurrentDatabaseUserId`
AFTER UPDATE ON
 `DB_Hice`.`TB_ChatFile`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_ChatFileHistory`
  (
   `vChatFileId`,
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
   `DB_Hice`.`FN_GetCurretnDatabaseUserId`(),
   IF(NEW.`bIsDeleted` = 0, 'u', 'd')
  )