CREATE TABLE 
 `DB_Hice`.`TB_Session`
(
 `vId`           BINARY(16)       NOT NULL DEFAULT(UUID_TO_BIN(UUID())),

 `vUserId`       BINARY(16)       NOT NULL,

 `uIP`           INTEGER UNSIGNED NOT NULL,
 
 `dtInteraction` DATETIME         NOT NULL DEFAULT(NOW()),

 CONSTRAINT 
  `Session_PK` 
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT 
  `Session_User_UK` 
 UNIQUE
 (
  `vUserId`
 ),
 CONSTRAINT 
  `Session_User_FK` 
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