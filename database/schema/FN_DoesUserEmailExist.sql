DELIMITER ;;

CREATE FUNCTION
 `DB_Hice`.`FN_DoesUserEmailExist`
 (
  sEmail VARCHAR(255)
 )
 RETURNS BOOLEAN
 READS SQL DATA
BEGIN
 DECLARE bDoesUserEmailExist BOOLEAN;

 SET bDoesUserEmailExist = EXISTS
 (
  SELECT
   1
  FROM
   `DB_Hice`.`TB_User`
  WHERE
   `DB_Hice`.`TB_User`.`sEmail` = sEmail
 );

 RETURN bDoesUserEmailExist;
END;

DELIMITER ;