DELIMITER ;;
CREATE PROCEDURE
 `DB_Hice`.`SP_GetChatsBySessionId`
 (
  vSessionId
   BINARY(16)
 )
BEGIN
 SELECT
  `DB_Hice`.`TB_Chat`.`vId`,
  `Realtor`.`sFirstName`,
  `Realtor`.`sLastName`
 FROM
  `DB_Hice`.`TB_Session`
 INNER JOIN
  `DB_Hice`.`TB_User` ON
   `DB_Hice`.`TB_User`.`vId` = `DB_Hice`.`TB_Session`.`vUserId`
 INNER JOIN
  `DB_Hice`.`TB_Chat` ON
   `DB_Hice`.`TB_Chat`.`vUserId` = `DB_Hice`.`TB_User`.`vId`
 INNER JOIN
  `DB_Hice`.`TB_User` AS `Realtor` ON
   `Realtor`.`vId` = `DB_Hice`.`TB_Chat`.`vRealtorId`
 WHERE
  `DB_Hice`.`TB_Session`.`vId` = vSessionId;
END;;
DELIMITER ;