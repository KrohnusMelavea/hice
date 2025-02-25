USE DB_Hice;

DROP TABLE IF EXISTS TB_HouseListingImage;
DROP TABLE IF EXISTS TB_HouseListing;
DROP TABLE IF EXISTS TB_House;

CREATE TABLE TB_House (
 `vID` BINARY(16) NOT NULL,

 `sAddress` VARCHAR(256) NOT NULL,
 `uSurfaceAreaM2` INTEGER NOT NULL,

 CONSTRAINT `House_PK` PRIMARY KEY (`vID`)
);
CREATE TABLE TB_HouseListing (
 `vID` BINARY(16) NOT NULL,

 `vHouseID` BINARY(16) NOT NULL,
 
 `dtmCreatedOn` DATETIME                                  NOT NULL, -- A house can have multiple historic listings, and you only want the most recent one.
 `uPriceCents`  INTEGER                                       NULL, -- If NULL, house either cannot or has not been valuated
 `uSaleType` ENUM('Sale', 'Auction', 'Negotiate', 'Rent') NOT NULL,

 CONSTRAINT `HouseListing_PK` PRIMARY KEY (`vID`),
 CONSTRAINT `HouseListing_House_FK` FOREIGN KEY (`vHouseID`) REFERENCES `TB_House`(`vID`)
);
CREATE TABLE TB_HouseListingImage (
 `vID` BINARY(16) NOT NULL,

 `vHouseListingID` BINARY(16) NOT NULL,

 CONSTRAINT `HouseListingImage_PK` PRIMARY KEY (`vID`),
 CONSTRAINT `HouseListingImage_HouseListing_FK` FOREIGN KEY (`vHouseListingID`) REFERENCES `TB_HouseListing`(`vID`)
);