DELIMITER ;;

CREATE FUNCTION
 `DB_Hice`.`FN_GetMostRecentSessionInteractionDateTime`
 (
  vSessionId BINARY(16)
 )
 RETURNS DATETIME
 READS SQL DATA
BEGIN
 DECLARE dtInteraction DATETIME DEFAULT NULL;

 SELECT 
  `DB_Hice`.`TB_Session`.`dtInteraction`
 INTO
  dtInteraction
 FROM
  `DB_Hice`.`TB_Session`
 WHERE
  `DB_Hice`.`TB_Session`.`vId` = vSessionId;

 RETURN dtInteraction;
END;

DELIMITER ;