CREATE TRIGGER
 `DB_Hice`.`TG_ChatMessagePropertyInsert`
AFTER INSERT ON
 `DB_Hice`.`TB_ChatMessageProperty`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_ChatMessagePropertyHistory`
  (
   `vChatMessagePropertyId`,
   `vPropertyId`,
   `vActionBy`
  )
 VALUE
  (
   NEW.`vId`,
   NEW.`vPropertyId`,
   `DB_Hice`.`FN_GetCurrentDatabaseUserId`()
  )