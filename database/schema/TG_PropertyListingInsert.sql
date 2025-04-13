CREATE TRIGGER
 `DB_Hice`.`TG_PropertyListingInsert`
AFTER INSERT ON
 `DB_Hice`.`TB_PropertyListing`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_PropertyListingHistory`
  (
   `vPropertyListingId`,
   `uPriceCents`,
   `cSaleType`,
   `vActionBy`
  )
 VALUE
  (
   NEW.`vId`,
   NEW.`uPriceCents`,
   NEW.`cSaleType`,
   `DB_Hice`.`FN_GetCurrentDatabaseUserId`()
  )