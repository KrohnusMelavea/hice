CREATE TABLE
 `DB_Hice`.`TB_PropertySale`
(
 `vId`                BINARY(16) NOT NULL DEFAULT(UUID_TO_BIN(UUID())),

 `vPropertyListingId` BINARY(16) NOT NULL,
 `vBuyerUserId`       BINARY(16) NOT NULL,
 `vSellerUserId`      BINARY(16)     NULL DEFAULT NULL,

 `dtCreatedOn`        DATETIME   NOT NULL DEFAULT(NOW()),
 `vCreatedBy`         BINARY(16) NOT NULL,

 `bIsDeleted`         BOOLEAN    NOT NULL DEFAULT 0,

 CONSTRAINT
  `PropertySale_PK`
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT 
  `PropertySale_PropertyListing_FK`
 FOREIGN KEY 
 (
  `vPropertyListingId`
 )
 REFERENCES
  `DB_Hice`.`TB_PropertyListing`
  (
   `vId`
  ),
 CONSTRAINT
  `PropertySale_User_FK0`
 FOREIGN KEY
 (
  `vBuyerUserId`
 )
 REFERENCES
  `DB_Hice`.`TB_User`
  (
   `vId`
  ),
 CONSTRAINT
  `PropertySale_User_FK1`
 FOREIGN KEY
 (
  `vSellerUserId`
 )
 REFERENCES
  `DB_Hice`.`TB_User`
  (
   `vId`
  ),
 CONSTRAINT
  `PropertySale_DatabaseUser_FK`
 FOREIGN KEY
 (
  `vCreatedBy`
 )
 REFERENCES
  `DB_Hice`.`TB_DatabaseUser`
  (
   `vId`
  )
)