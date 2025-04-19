CREATE TABLE
 `DB_Hice`.`TB_ChatMessageHistory`
(
 `vId`
  BINARY(16) 
  NOT NULL 
  DEFAULT(UUID_TO_BIN(UUID())),

 `vChatMessageId` 
  BINARY(16) 
  NOT NULL,

 `sMessage`
  NVARCHAR(4000) 
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
  `ChatMessageHistory_PK` 
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT 
  `ChatMessageHistory_ChatMessage_FK` 
 FOREIGN KEY 
 (
  `vChatMessageId`
 ) 
 REFERENCES 
  `DB_Hice`.`TB_ChatMessage`
  (
   `vId`
  ),
 CONSTRAINT
  `ChatMessageHistory_DatabaseUser_FK`
 FOREIGN KEY
 (
  `vActionBy`
 )
 REFERENCES
  `DB_Hice`.`TB_DatabaseUser`
  (
   `vId`
  )
)