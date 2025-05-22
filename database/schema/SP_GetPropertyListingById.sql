DELIMITER ;;
CREATE PROCEDURE
 `DB_Hice`.`SP_GetPropertyListingById`
 (
  vId 
   BINARY(16)
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
 WHERE
  `DB_Hice`.`TB_PropertyListing`.`vId` = vId;
END;;
DELIMITER ;