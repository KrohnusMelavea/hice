CREATE TRIGGER
 `DB_Hice`.`TG_PropertyInsert`
AFTER INSERT ON
 `DB_Hice`.`TB_Property`
FOR EACH ROW
 INSERT INTO
  `DB_Hice`.`TB_PropertyHistory`
  (
   `vPropertyId`,
   `sAddress`,
   `uSurfaceAreaM2`,
   `uFloorCount`,
   `uBedroomCount`,
   `uBathroomCount`,
   `uRoomCount`,
   `cPropertyType`,
   `vActionBy`
  )
 VALUE
  (
   NEW.`vId`,
   NEW.`sAddress`,
   NEW.`uSurfaceAreaM2`,
   NEW.`uFloorCount`,
   NEW.`uBedroomCount`,
   NEW.`uBathroomCount`,
   NEW.`uRoomCount`,
   NEW.`cPropertyType`,
   `DB_Hice`.`FN_GetCurrentDatabaseUserId`()
  )