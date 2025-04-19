CREATE TRIGGER
 `DB_Hice`.`TG_PropertySaleInsert`
BEFORE INSERT ON
 `DB_Hice`.`TB_PropertySale`
FOR EACH ROW
 SET NEW.`vCreatedBy` = `DB_Hice`.`FN_GetCurrentDatabaseUserId`()