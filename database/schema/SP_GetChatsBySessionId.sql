DELIMITER ;;

CREATE PROCEDURE
 `DB_Hice`.`SP_GetChatsBySessionId`
 (
  vSessionId BINARY(16)
 )
BEGIN
 SELECT
  `DB_Hice`.`TB_Chat`.`vId`,
  `Realtor`.`sFirstName`,
  `Realtor`.`sLastName`
 FROM
  `DB_Hice`.`TB_Session`
 INNER JOIN
  `DB_Hice`.`TB_User` AS `User` ON
   `User`.`vId` = `DB_Hice`.`TB_Session`.`vUserId`
 INNER JOIN
  `DB_Hice`.`TB_Chat` ON
   `DB_Hice`.`TB_Chat`.`vUserId` = `User`.`vId`
 INNER JOIN
  `DB_Hice`.`TB_User` AS `Realtor` ON
   `Realtor`.`vId` = `DB_Hice`.`TB_Chat`.`vRealtorId`
 WHERE
  NOT `User`.`bIsDeleted`
   AND
  NOT `DB_Hice`.`TB_Chat`.`bIsDeleted`
   AND
  NOT `Realtor`.`bIsDeleted`
   AND
  `DB_Hice`.`TB_Session`.`vId` = vSessionId;
END;;

DELIMITER ;