CREATE TABLE 
 `DB_Hice`.`TB_User`
(
 `vId` 
  BINARY(16) 
  NOT NULL 
  DEFAULT(UUID_TO_BIN(UUID())),

 `sFirstName` 
  NVARCHAR(64) 
  NOT NULL,
 `sLastName` 
  NVARCHAR(64) 
  NOT NULL,

 `bIsDeleted` 
  BOOLEAN 
  NOT NULL 
  DEFAULT(0),

 `sEmail` 
  VARCHAR(255)
  NOT NULL,
 `sPassword` 
  VARCHAR(255) 
  NOT NULL,

 `cType` 
  ENUM('u', 'r', 's', 'a') 
  NOT NULL,

 CONSTRAINT 
  `User_PK` 
 PRIMARY KEY 
 (
  `vId`
 ),
 CONSTRAINT
  `User_Email_UK`
 UNIQUE
 (
  `sEmail`
 )
)