DELIMITER ;;

CREATE FUNCTION
 `DB_Hice`.`FN_Logout`
 (
  vSessionId BINARY(16)
 )
 RETURNS BOOLEAN
 READS SQL DATA
BEGIN
 DECLARE uDeletedSessionCount INTEGER UNSIGNED DEFAULT 0;

 DELETE FROM
  `DB_Hice`.`TB_Session`
 WHERE
  `DB_Hice`.`TB_Session`.`vId` = vSessionId;

 SELECT
  ROW_COUNT()
 INTO
  uDeletedSessionCount;

 RETURN uDeletedSessionCount;
END;;

DELIMITER ;