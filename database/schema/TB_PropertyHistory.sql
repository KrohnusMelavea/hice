CREATE TABLE
 `DB_Hice`.`TB_PropertyHistory`
(
 `vId`
  BINARY(16)
  NOT NULL
  DEFAULT(UUID_TO_BIN(UUID())),

 `vPropertyId`
  BINARY(16)
  NOT NULL,
 
 `sAddress`
  NVARCHAR(255)
  NOT NULL,
 `uSurfaceAreaM2`
  INTEGER UNSIGNED
  NULL,
 `uFloorCount`
  INTEGER UNSIGNED
  NOT NULL,
 `uBedroomCount`
  INTEGER UNSIGNED
  NOT NULL,
 `uBathroomCount`
  INTEGER UNSIGNED
  NOT NULL,
 `uRoomCount`
  INTEGER UNSIGNED
  NOT NULL,
 `cPropertyType`
  ENUM('a', 'h')
  NOT NULL,

 `bIsDeleted`
  BOOLEAN
  NOT NULL
  DEFAULT(0),

 `dtActionOn`
  DATETIME
  NOT NULL
  DEFAULT(NOW()),
 `vActionBy`
  BINARY(16)
  NOT NULL,
 `cActionType`
  ENUM('c', 'u', 'd')
  NOT NULL
  DEFAULT('c'),

 CONSTRAINT
  `PropertyHistory_PK`
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT
  `PropertyHistory_Property_FK`
 FOREIGN KEY
 (
  `vPropertyId`
 )
 REFERENCES
  `DB_Hice`.`TB_Property`
  (
   `vId`
  ),
 CONSTRAINT
  `PropertyHistory_DatabaseUser_FK`
 FOREIGN KEY
 (
  `vActionBy`
 )
 REFERENCES
  `DB_Hice`.`TB_DatabaseUser`
  (
   `vId`
  )
)