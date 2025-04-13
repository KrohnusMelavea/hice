CREATE TABLE
 `DB_Hice`.`TB_ChatFile`
(
 `vId` 
  BINARY(16) 
  NOT NULL 
  DEFAULT(UUID_TO_BIN(UUID())),

 `vChatId` 
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
  `ChatFile_PK` 
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT 
  `ChatFile_Chat_FK` 
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
  `ChatFile_File_FK`
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