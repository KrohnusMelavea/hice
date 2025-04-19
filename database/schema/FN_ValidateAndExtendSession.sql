DELIMITER ;;
CREATE FUNCTION
 `DB_Hice`.`FN_ValidateAndExtendSession`
 (
  vSessionId
   BINARY(16)
 )
 RETURNS INT
 READS SQL DATA
BEGIN
 DECLARE
  dtInteraction
  DATETIME;
 SET dtInteraction = NULL;
 SELECT 
  `DB_Hice`.`TB_Session`.`dtInteraction`
 INTO
  dtInteraction
 FROM
  `DB_Hice`.`TB_Session`
 WHERE
  `DB_Hice`.`TB_Session`.`vId` = vSessionId;
 IF (dtActionOn = NULL)
 THEN
  RETURN 1;
 ELSE
  IF (DATE_ADD(dtInteraction, INTERVAL 1 DAY) < NOW())
  THEN
   DELETE FROM
    `DB_Hice`.`TB_Session`
   WHERE
    `DB_Hice`.`TB_Session`.`vId` = vSessionId;
   return 2;
  ELSE
   UPDATE
    `DB_Hice`.`TB_Session`
   SET
    `DB_Hice`.`TB_Session`.`dtInteraction` = NOW()
   WHERE
    `DB_Hice`.`TB_Session`.`vId` = vSessionId;
   RETURN 0;
  END IF;
 END IF;
END;;
DELIMITER ;