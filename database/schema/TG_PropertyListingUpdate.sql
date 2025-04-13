CREATE TRIGGER
 `DB_Hice`.`TG_PropertyListingUpdate`
AFTER UPDATE ON
 `DB_Hice`.`TB_PropertyListing`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_PropertyListingHistory`
  (
   `vPropertyListingId`,
   `uPriceCents`,
   `cSaleType`,
   `bIsDeleted`,
   `vActionBy`,
   `cActionType`
  )
 VALUE
  (
   NEW.`vId`,
   NEW.`uPriceCents`,
   NEW.`cSaleType`,
   NEW.`bIsDeleted`,
   `DB_Hice`.`FN_GetCurrentDatabaseUserId`(),
   IF(NEW.`bIsDeleted` = 0, 'u', 'd')
  )