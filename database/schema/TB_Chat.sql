CREATE TABLE 
 `DB_Hice`.`TB_Chat`
(
 `vId` 
  BINARY(16) 
  NOT NULL 
  DEFAULT(UUID_TO_BIN(UUID())),

 `vUserId` 
  BINARY(16) 
  NOT NULL,
 `vRealtorId` 
  BINARY(16) 
  NULL,

 `bIsDeleted` 
  BOOLEAN 
  NOT NULL 
  DEFAULT(0),

 CONSTRAINT 
  `Chat_PK` 
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT 
  `Chat_User_FK` 
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
  `Chat_Realtor_FK` 
 FOREIGN KEY 
 (
  `vRealtorId`
 ) 
 REFERENCES 
  `DB_Hice`.`TB_User`
  (
   `vId`
  )
)