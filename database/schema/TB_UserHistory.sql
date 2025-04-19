CREATE TABLE 
 `DB_Hice`.`TB_UserHistory`
(
 `vId` 
  BINARY(16) 
  NOT NULL 
  DEFAULT(UUID_TO_BIN(UUID())),

 `vUserId` 
  BINARY(16) 
  NOT NULL,

 `sFirstName` 
  NVARCHAR(64) 
  NOT NULL,
 `sLastName` 
  NVARCHAR(64) 
  NOT NULL,

 `sEmail` 
  VARCHAR(255) 
  NOT NULL,
 `sPassword` 
  VARCHAR(255) 
  NOT NULL,

 `cType` 
  ENUM('u', 'r', 's', 'a') 
  NOT NULL,

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
  `UserHistory_PK` 
 PRIMARY KEY 
 (
  `vId`
 ),
 CONSTRAINT 
  `UserHistory_User_FK` 
 FOREIGN KEY 
 (
  `vUserId`
 ) 
 REFERENCES 
  `DB_Hice`.`TB_User`
  (
   `vId`
  ),
 CONSTRAINT
  `UserHistory_User_Email_FK`
 FOREIGN KEY
 (
  `sEmail`
 )
 REFERENCES
  `DB_Hice`.`TB_User`
  (
   `sEmail`
  )
)