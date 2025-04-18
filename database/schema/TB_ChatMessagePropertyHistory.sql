CREATE TABLE
 `DB_Hice`.`TB_ChatMessagePropertyHistory`
(
 `vId`
  BINARY(16)
  NOT NULL
  DEFAULT(UUID_TO_BIN(UUID())),
 
 `vChatMessagePropertyId`
  BINARY(16)
  NOT NULL,
 `vPropertyId`
  BINARY(16)
  NOT NULL,

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
  `ChatMessagePropertyHistory_PK`
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT
  `ChatMessagePropertyHistory_ChatMessageProperty_FK`
 FOREIGN KEY
 (
  `vChatMessagepropertyId`
 )
 REFERENCES
  `DB_Hice`.`TB_ChatMessageProperty`
  (
   `vId`
  ),
 CONSTRAINT
  `ChatMessagePropertyHistory_Property_FK`
 FOREIGN KEY
 (
  `vPropertyId`
 )
 REFERENCES
  `DB_Hice`.`TB_Property`
  (
   `vId`
  )
)