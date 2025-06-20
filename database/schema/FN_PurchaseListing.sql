DELIMITER ;;

CREATE FUNCTION
 `DB_Hice`.`FN_PurchaseListing`
 (
  vSessionId         BINARY(16),
  vPropertyListingId BINARY(16)
 )
 RETURNS BINARY(16)
 READS SQL DATA
BEGIN 
 DECLARE vPropertySaleId             BINARY(16);
 DECLARE bIsPropertyListingAvailable BOOLEAN;

 SET bIsPropertyListingAvailable = `DB_Hice`.`FN_IsPropertyListingAvailable`(vPropertyListingId);
 IF (NOT bIsPropertyListingAvailable)
 THEN
  RETURN NULL;
 ELSE
 BEGIN
  SET vPropertySaleId = UUID_TO_BIN(UUID());

  UPDATE
   `DB_Hice`.`TB_PropertyListing`
  SET
   `DB_Hice`.`TB_PropertyListing`.`bIsDeleted` = 1
  WHERE
   `DB_Hice`.`TB_PropertyListing`.`vId` = vPropertyListingId;

  INSERT INTO
   `DB_Hice`.`TB_PropertySale`
   (
    `vId`,
    `vPropertyListingId`,
    `vBuyerUserId`
   )
  VALUE
  (
   vPropertySaleId,
   vPropertyListingId,
   `DB_Hice`.`FN_GetSessionUserId`(vSessionId)
  );
  RETURN vPropertySaleId;
 END;
 END IF;
END;;

DELIMITER ;