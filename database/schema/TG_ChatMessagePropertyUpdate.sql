CREATE TRIGGER
 `DB_Hice`.`TG_ChatMessagePropertyUpdate`
AFTER UPDATE ON
 `DB_Hice`.`TB_ChatMessageProperty`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_ChatMessagePropertyHistory`
  (
   `vChatMessagePropertyId`,
   `vPropertyId`,
   `bIsDeleted`,
   `vActionBy`,
   `cActionType`
  )
 VALUE
  (
   NEW.`vId`,
   NEW.`vPropertyId`,
   NEW.`bIsDeleted`,
   `DB_Hice`.`FN_GetCurrentDatabaseUserId`(),
   IF(NEW.`bIsDeleted` = 0, 'u', 'd')
  )