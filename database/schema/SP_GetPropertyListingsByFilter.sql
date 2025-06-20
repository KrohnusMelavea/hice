DELIMITER ;;

CREATE PROCEDURE
 `DB_Hice`.`SP_GetPropertyListingsByFilter`
 (
  sSearchPhrase NVARCHAR(255)
 )
BEGIN
 SELECT
  `DB_Hice`.`TB_PropertyListing`.`vId`,
  `DB_Hice`.`TB_Property`.`sAddress`,
  `DB_Hice`.`TB_PropertyListing`.`uPriceCents`,
  `DB_Hice`.`TB_PropertyListing`.`sDescription`
 FROM
  `DB_Hice`.`TB_PropertyListing`
 INNER JOIN
  `DB_Hice`.`TB_Property` ON
   `DB_Hice`.`TB_Property`.`vId` = `DB_Hice`.`TB_PropertyListing`.`vPropertyId`
 WHERE
  NOT `DB_Hice`.`TB_PropertyListing`.`bIsDeleted`
 ORDER BY
  `DB_Hice`.`FN_PercentageOfWordsInString`
  (
   sSearchPhrase, 
   `DB_Hice`.`TB_Property`.`sAddress`
  )
  DESC;
END;;

DELIMITER ;