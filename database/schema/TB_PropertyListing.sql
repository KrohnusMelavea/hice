CREATE TABLE
 `DB_Hice`.`TB_PropertyListing`
(
 `vId`
  BINARY(16)
  NOT NULL
  DEFAULT(UUID_TO_BIN(UUID())),

 `vPropertyId`
  BINARY(16)
  NOT NULL,

 `uPriceCents`
  INTEGER UNSIGNED
  NULL,
 `cSaleType`
  ENUM('s', 'r', 'a')
  NOT NULL,

 `bIsDeleted`
  BOOLEAN
  NOT NULL
  DEFAULT(0),

 CONSTRAINT
  `PropertyListing_PK`
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT
  `PropertyListing_Property_FK`
 FOREIGN KEY
 (
  `vPropertyId`
 )
 REFERENCES
  `DB_Hice`.`TB_Property`
  (
   `vId`
  )
)