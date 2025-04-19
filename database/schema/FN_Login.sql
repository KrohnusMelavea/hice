DELIMITER ;;
CREATE FUNCTION
 `DB_Hice`.`FN_Login`
 (
  sEmail
   VARCHAR(255),
  sPassword 
   VARCHAR(255),
  uIP
   INTEGER UNSIGNED
 )
 RETURNS BINARY(16)
 READS SQL DATA
BEGIN
 DECLARE 
  vSessionId 
   BINARY(16);
 DECLARE
  vUserId
   BINARY(16);
 DECLARE
  sUserPassword
   VARCHAR(255);
 SET vUserId = NULL;
 SELECT
  `DB_Hice`.`TB_User`.`vId`,
  `DB_Hice`.`TB_User`.`sPassword`
 INTO 
  vUserId, 
  sUserPassword
 FROM
  `DB_Hice`.`TB_User`
 WHERE
  `DB_Hice`.`TB_User`.`sEmail` = sEmail;
 IF (vUserId = NULL)
 THEN
  RETURN NULL;
 ELSE
  IF (sUserPassword = sPassword)
  THEN
   SET vSessionId = UUID_TO_BIN(UUID());
   INSERT INTO
    `DB_Hice`.`TB_Session`
    (
     `vId`,
     `vUserId`,
     `uIP`
    )
   VALUE
    (
     vSessionId,
     vUserId,
     uIP
    );
   RETURN vSessionId;
  ELSE
   RETURN UUID_TO_BIN('00000000-0000-0000-0000-000000000000');
  END IF;
 END IF;
END;;
DELIMITER ;