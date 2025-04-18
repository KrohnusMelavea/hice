CREATE TABLE
 `DB_Hice`.`TB_ChatMessageFile`
(
 `vId` 
  BINARY(16) 
  NOT NULL 
  DEFAULT(UUID_TO_BIN(UUID())),

 `vChatMessageId` 
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
  NOT NULL 
  DEFAULT(0),

 CONSTRAINT 
  `ChatMessageFile_PK` 
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT 
  `ChatMessageFile_ChatMessage_FK` 
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
  `ChatMessageFile_File_FK`
 FOREIGN KEY
 (
  `vFileId`
 )
 REFERENCES
  `DB_Hice`.`TB_File`
  (
   `vId`
  )
)