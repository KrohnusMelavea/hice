CREATE TABLE
 `DB_Hice`.`TB_Property`
(
 `vId`            BINARY(16)       NOT NULL DEFAULT(UUID_TO_BIN(UUID())),

 `sAddress`       NVARCHAR(255)    NOT NULL,
 `uSurfaceAreaM2` INTEGER UNSIGNED     NULL,
 `uFloorCount`    INTEGER UNSIGNED NOT NULL DEFAULT(1),
 `uBedroomCount`  INTEGER UNSIGNED NOT NULL DEFAULT(1),
 `uBathroomCount` INTEGER UNSIGNED NOT NULL DEFAULT(1),
 `uRoomCount`     INTEGER UNSIGNED NOT NULL DEFAULT(1),
 `cPropertyType`  ENUM('a', 'h')   NOT NULL,

 `bIsDeleted`     BOOLEAN          NOT NULL DEFAULT(0),
 
 CONSTRAINT
  `Property_PK`
 PRIMARY KEY
 (
  `vId`
 )
)