DELIMITER ;;

CREATE FUNCTION
 `DB_Hice`.`FN_GetCurrentDatabaseUserId`()
 RETURNS BINARY(16)
 READS SQL DATA
BEGIN
 DECLARE vDatabaseUserId BINARY(16);
 DECLARE sUser           CHAR(255);
 DECLARE sUserDomain     CHAR(255);
 DECLARE sUserName       CHAR(32);

 SET sUser       = CURRENT_USER();
 SET sUserDomain = SUBSTRING_INDEX(sUser, '@', -1);
 SET sUserName   = SUBSTRING_INDEX(sUser, '@', 1);

 SELECT
  `DB_Hice`.`TB_DatabaseUser`.`vId`
 INTO 
  vDatabaseUserId
 FROM
  `DB_Hice`.`TB_DatabaseUser`
 WHERE
  `DB_Hice`.`TB_DatabaseUser`.`sUserDomain` = sUserDomain
    AND
  `DB_Hice`.`TB_DatabaseUser`.`sUserName` = sUserName;

 RETURN vDatabaseUserId;
END;;

DELIMITER ;