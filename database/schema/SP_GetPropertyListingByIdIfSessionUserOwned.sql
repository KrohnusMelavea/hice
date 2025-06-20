DELIMITER ;;

CREATE PROCEDURE
 `DB_Hice`.`SP_GetPropertyListingByIdIfSessionUserOwned`
 (
  vId        BINARY(16),
  vSessionId BINARY(16)
 )
BEGIN
 SELECT
  `DB_Hice`.`TB_PropertyListing`.`vId`,
  `DB_Hice`.`TB_Property`.`sAddress`,
  `DB_Hice`.`TB_PropertyListing`.`sDescription`,
  `DB_Hice`.`TB_Property`.`uSurfaceAreaM2`,
  `DB_Hice`.`TB_Property`.`uBedroomCount`,
  `DB_Hice`.`TB_Property`.`uBathroomCount`,
  `DB_Hice`.`TB_Property`.`uFloorCount`,
  `DB_Hice`.`TB_PropertyListing`.`uPriceCents`
 FROM
  `DB_Hice`.`TB_Property`
 INNER JOIN
  `DB_Hice`.`TB_PropertyListing` ON
   `DB_Hice`.`TB_PropertyListing`.`vPropertyId` = `DB_Hice`.`TB_Property`.`vId`
 INNER JOIN
  `DB_Hice`.`TB_PropertySale` ON
   `DB_Hice`.`TB_PropertySale`.`vPropertyListingId` = `DB_Hice`.`TB_PropertyListing`.`vId`
 INNER JOIN
  `DB_Hice`.`TB_Session` ON
   `DB_Hice`.`TB_Session`.`vId` = vSessionid
 WHERE
  NOT `DB_Hice`.`TB_Property`.`bIsDeleted`
   AND
  `DB_Hice`.`TB_PropertyListing`.`bIsDeleted`
   AND
  NOT `DB_Hice`.`TB_PropertySale`.`bIsDeleted`
   AND
  `DB_Hice`.`TB_PropertyListing`.`vId` = vId
   AND
  `DB_Hice`.`TB_PropertySale`.`vBuyerUserId` = `DB_Hice`.`TB_Session`.`vUserId`;
END;;

DELIMITER ;