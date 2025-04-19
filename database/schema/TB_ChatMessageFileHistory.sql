CREATE TABLE
 `DB_Hice`.`TB_ChatMessageFileHistory`
(
 `vId` 
  BINARY(16) 
  NOT NULL 
  DEFAULT(UUID_TO_BIN(UUID())),

 `vChatMessageFileId` 
  BINARY(16) 
  NOT NULL,

 `vFileId`
  BINARY(16)
  NOT NULL,
 `sFileName`
  VARCHAR(255)
  NULL,

 `bIsDeleted`
  BOOLEAN
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
  `ChatMessageFileHistory_PK` 
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT 
  `ChatMessageFileHistory_ChatMessageFile_FK` 
 FOREIGN KEY 
 (
  `vChatMessageFileId`
 ) 
 REFERENCES 
  `DB_Hice`.`TB_ChatMessageFile`
  (
   `vId`
  ),
 CONSTRAINT
  `ChatMessageFileHistory_File_FK`
 FOREIGN KEY
 (
  `vFileId`
 )
 REFERENCES
  `DB_Hice`.`TB_File`
  (
   `vId`
  ),
 CONSTRAINT
  `ChatMessageFileHistory_DatabaseUser_FK`
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