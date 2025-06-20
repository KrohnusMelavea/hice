DELIMITER ;;

CREATE FUNCTION
 `DB_Hice`.`FN_GetSessionUserId`
 (
  vSessionId BINARY(16)
 )
 RETURNS BINARY(16)
 READS SQL DATA
BEGIN
 DECLARE vUserId BINARY(16) DEFAULT NULL;

 SELECT
  `DB_Hice`.`TB_Session`.`vUserId`
 INTO
  vUserId
 FROM
  `DB_Hice`.`TB_Session`
 WHERE
  `DB_Hice`.`TB_Session`.`vId` = vSessionId;

 RETURN vUserId;
END;;

DELIMITER ;