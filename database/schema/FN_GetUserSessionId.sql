DELIMITER ;;

CREATE FUNCTION
 `DB_Hice`.`FN_GetUserSessionId`
 (
  vUserId BINARY(16)
 )
 RETURNS BINARY(16)
 READS SQL DATA
BEGIN
 DECLARE vSessionId BINARY(16) DEFAULT NULL;

 SELECT
  `DB_Hice`.`TB_Session`.`vId`
 INTO
  vSessionId
 FROM
  `DB_Hice`.`TB_Session`
 WHERE
  `DB_Hice`.`TB_Session`.`vUserId` = vUserId;

 RETURN vSessionId;
END;;

DELIMITER ;