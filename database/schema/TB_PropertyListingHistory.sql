CREATE TABLE
 `DB_Hice`.`TB_PropertyListingHistory`
(
 `vId`
  BINARY(16)
  NOT NULL
  DEFAULT(UUID_TO_BIN(UUID())),

 `vPropertyListingId`
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
  `PropertyListingHistory_PK`
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT
  `PropertyListingHistory_PropertyListing_FK`
 FOREIGN KEY
 (
  `vPropertyListingId`
 )
 REFERENCES
  `DB_Hice`.`TB_PropertyListing`
  (
   `vId`
  )
)