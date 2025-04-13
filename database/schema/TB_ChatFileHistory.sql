CREATE TABLE
 `DB_Hice`.`TB_ChatFileHistory`
(
 `vId` 
  BINARY(16) 
  NOT NULL 
  DEFAULT(UUID_TO_BIN(UUID())),

 `vChatFileId` 
  BINARY(16) 
  NOT NULL,

 `vFileId`
  BINARY(16)
  NOT NULL,
 `sFileName`
  VARCHAR(255)
  NULL,
 
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
  `ChatFileHistory_PK` 
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT 
  `ChatFileHistory_ChatFile_FK` 
 FOREIGN KEY 
 (
  `vChatFileId`
 ) 
 REFERENCES 
  `DB_Hice`.`TB_ChatFile`
  (
   `vId`
  ),
 CONSTRAINT
  `ChatFileHistory_File_FK`
 FOREIGN KEY
 (
  `vFileId`
 )
 REFERENCES
  `DB_Hice`.`TB_ChatFileHistory`
  (
   `vId`
  )
)