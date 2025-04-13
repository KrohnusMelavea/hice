CREATE TABLE 
 `DB_Hice`.`TB_SessionHistory`
(
 `vId` 
  BINARY(16) 
  NOT NULL 
  DEFAULT(UUID_TO_BIN(UUID())),

 `vUserId` 
  BINARY(16) 
  NOT NULL,

 `dtActionOn` 
  DATETIME 
  NOT NULL 
  DEFAULT(NOW()),
 `uActionAt` 
  INTEGER UNSIGNED 
  NOT NULL, 

 CONSTRAINT 
  `SessionHistory_PK` 
 PRIMARY KEY 
 (
  `vId`
 ),
 CONSTRAINT 
  `SessionHistory_Session_FK` 
 FOREIGN KEY 
 (
  `vUserId`
 ) 
 REFERENCES 
  `DB_Hice`.`TB_Session`
  (
   `vUserId`
  ),
 CONSTRAINT 
  `SessionHistory_User_FK` 
 FOREIGN KEY 
 (
  `vUserId`
 ) 
 REFERENCES 
  `DB_Hice`.`TB_User`
  (
   `vId`
  )
)