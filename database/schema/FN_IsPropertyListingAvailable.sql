DELIMITER ;;

CREATE FUNCTION
 `DB_Hice`.`FN_IsPropertyListingAvailable`
 (
  vPropertyListingId BINARY(16)
 )
 RETURNS BOOLEAN
 READS SQL DATA
BEGIN
 DECLARE bIsPropertyListingAvailable BOOLEAN;
 
 SET bIsPropertyListingAvailable = EXISTS
 (
  SELECT
   1
  FROM
   `DB_Hice`.`TB_PropertyListing`
  WHERE
   `DB_Hice`.`TB_PropertyListing`.`vId` = vPropertyListingId
    AND
   NOT `DB_Hice`.`TB_PropertyListing`.`bIsDeleted`
 );

 RETURN bIsPropertyListingAvailable;
END;;

DELIMITER ;