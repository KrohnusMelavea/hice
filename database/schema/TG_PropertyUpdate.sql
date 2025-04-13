CREATE TRIGGER
 `DB_Hice`.`TG_PropertyUpdate`
AFTER UPDATE ON
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
   `bIsDeleted`,
   `vActionBy`,
   `vActionType`
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
   NEW.`bIsDeleted`,
   `DB_Hice`.`FN_GetCurrentDatabaseUserId`(),
   IF(NEW.`bIsDeleted` = 0, 'u', 'd')
  )