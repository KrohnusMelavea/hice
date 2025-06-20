DELIMITER ;;

CREATE PROCEDURE
 `DB_Hice`.`SP_GetPropertyListingsBySessionId`
 (
  vSessionId BINARY(16)
 )
BEGIN
 SELECT
  `DB_Hice`.`TB_PropertySale`.`vId`,
  `DB_Hice`.`TB_Property`.`sAddress`,
  `DB_Hice`.`TB_PropertyListing`.`uPriceCents`,
  `DB_Hice`.`TB_PropertyListing`.`sDescription`
 FROM
  `DB_Hice`.`TB_Session`
 INNER JOIN
  `DB_Hice`.`TB_PropertySale` ON
   `DB_Hice`.`TB_PropertySale`.`vBuyerUserId` = `DB_Hice`.`TB_Session`.`vUserId`
 INNER JOIN
  `DB_Hice`.`TB_PropertyListing` ON
   `DB_Hice`.`TB_PropertyListing`.`vId` = `DB_Hice`.`TB_PropertySale`.`vPropertyListingId`
 INNER JOIN
  `DB_Hice`.`TB_Property` ON
   `DB_Hice`.`TB_Property`.`vId` = `DB_Hice`.`TB_PropertyListing`.`vPropertyId`
 WHERE
  NOT `DB_Hice`.`TB_PropertySale`.`bIsDeleted`
   AND
  `DB_Hice`.`TB_PropertyListing`.`bIsDeleted`
   AND
  NOT `DB_Hice`.`TB_Property`.`bIsDeleted`
   AND
  `DB_Hice`.`TB_Session`.`vId` = vSessionId;
END;;

DELIMITER ;