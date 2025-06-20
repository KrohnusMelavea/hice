DELIMITER ;;

CREATE FUNCTION
 `DB_Hice`.`FN_GetLeastTalkativeRealtorId`()
 RETURNS BINARY(16)
 READS SQL DATA
BEGIN
 DECLARE vRealtorId BINARY(16) DEFAULT NULL;

 SELECT
  `DB_Hice`.`TB_User`.`vId`
 INTO
  vRealtorId
 FROM
  `DB_Hice`.`TB_User`
 INNER JOIN
  `DB_Hice`.`TB_Chat` ON
   `DB_Hice`.`TB_Chat`.`vRealtorId` = `DB_Hice`.`TB_User`.`vId`
 INNER JOIN
  `DB_Hice`.`TB_ChatMessage` ON
   `DB_Hice`.`TB_ChatMessage`.`vUserId` = `DB_Hice`.`TB_User`.`vId`
    AND
   `DB_Hice`.`TB_ChatMessage`.`vChatId` = `DB_Hice`.`TB_Chat`.`vId`
 WHERE
  NOT `DB_Hice`.`TB_User`.`bIsDeleted`
   AND
  NOT `DB_Hice`.`TB_Chat`.`bIsDeleted`
   AND
  NOT `DB_Hice`.`TB_ChatMesssage`.`bIsDeleted`
 ORDER BY
 (
  SELECT
   MAX(`DB_Hice`.`TB_ChatMessageHistory`.`dtActionOn`)
  FROM
   `DB_Hice`.`TB_ChatMessageHistory`
  WHERE
   `DB_Hice`.`TB_ChatMessageHistory`.`vChatMessageId` = `DB_Hice`.`TB_ChatMessage`.`vId`
 );

 RETURN vRealtorId;
END;;

DELIMITER ;