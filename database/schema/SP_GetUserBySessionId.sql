DELIMITER ;;
CREATE PROCEDURE
 `DB_Hice`.`SP_GetUserBySessionId`
 (
  vSessionId BINARY(16)
 )
BEGIN
 SELECT
  `DB_Hice`.`TB_User`.`sFirstName`,
  `DB_Hice`.`TB_User`.`sLastName`,
  `DB_Hice`.`TB_User`.`sEmail`,
  `DB_Hice`.`TB_User`.`cType`
 FROM
  `DB_Hice`.`TB_User`
 INNER JOIN
  `DB_Hice`.`TB_Session` ON
   `DB_Hice`.`TB_Session`.`vUserId` = `DB_Hice`.`TB_User`.`vId`
 WHERE
  NOT `DB_Hice`.`TB_User`.`bIsDeleted`
   AND
  `DB_Hice`.`TB_Session`.`vId` = vSessionId;
END;;
DELIMITER ;