CREATE TABLE
 `DB_Hice`.`TB_ChatMessage`
(
 `vId` 
  BINARY(16) 
  NOT NULL 
  DEFAULT(UUID_TO_BIN(UUID())),

 `vChatId` 
  BINARY(16) 
  NOT NULL,
 `vUserId` 
  BINARY(16) 
  NOT NULL,

 `sMessage` 
  NVARCHAR(4000) 
  NOT NULL,

 `bIsDeleted`
  BOOLEAN
  NOT NULL
  DEFAULT(0),

 CONSTRAINT 
  `ChatMessage_PK` 
 PRIMARY KEY 
 (
  `vId`
 ),
 CONSTRAINT 
  `ChatMessage_Chat_FK` 
 FOREIGN KEY 
 (
  `vChatId`
 ) 
 REFERENCES 
  `DB_Hice`.`TB_Chat`
  (
   `vId`
  ),
 CONSTRAINT 
  `ChatMessage_User_FK` 
 FOREIGN KEY 
 (
  `vChatId`
 ) 
 REFERENCES 
  `DB_Hice`.`TB_User`
  (
   `vId`
  )
)