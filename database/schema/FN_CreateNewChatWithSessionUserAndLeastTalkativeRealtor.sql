DELIMITER ;;

CREATE FUNCTION
 `DB_Hice`.`FN_CreateNewChatWithSessionUserAndLeastTalkativeRealtor`
 (
  vSessionId BINARY(16)
 )
 RETURNS BINARY(16)
 READS SQL DATA
BEGIN
 DECLARE vRealtorId BINARY(16) DEFAULT NULL;
 DECLARE vChatId    BINARY(16);
 DECLARE vUserId    BINARY(16);

 SET vRealtorId = `DB_Hice`.`FN_GetLeastTalkativeRealtorId`();

 IF (vRealtorId = NULL)
 THEN
  RETURN NULL;
 END IF;

 SET vChatId = UUID_TO_BIN(UUID());
 SET vUserId = `DB_Hice`.`FN_GetSessionUserId`
 (
  vSessionId
 );

 INSERT INTO
  `DB_Hice`.`TB_Chat`
  (
   `vId`,
   `vUserId`,
   `vRealtorId`
  )
 VALUE
 (
  vChatId,
  vUserId,
  vRealtorId
 );

 RETURN vChatId;
END;;

DELIMITER ;