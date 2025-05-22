DELIMITER ;;
CREATE FUNCTION
 `DB_Hice`.`FN_Register`
 (
  sFirstName
   NVARCHAR(255),
  sLastName
   NVARCHAR(255),
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
 IF EXISTS
 (
  SELECT
   1
  FROM
   `DB_Hice`.`TB_User`
  WHERE
   `DB_Hice`.`TB_User`.`sEmail` = sEmail
 )
 THEN
  RETURN NULL;
 ELSE
 BEGIN
  DECLARE 
   vId 
   BINARY(16);
  DECLARE
   vSessionId
   BINARY(16);
  SET vId = UUID_TO_BIN(UUID());
  SET vSessionId = UUID_TO_BIN(UUID());
  INSERT INTO
   `DB_Hice`.`TB_User`
   (
    `vId`,
    `sFirstName`,
    `sLastName`,
    `sEmail`,
    `sPassword`,
    `cType`
   )
  VALUE
  (
   vId,
   sFirstName,
   sLastName,
   sEmail,
   sPassword,
   'u'
  );
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
    vId,
    uIP
   );
  RETURN vSessionId;
 END;
 END IF;
END;;
DELIMITER ;
