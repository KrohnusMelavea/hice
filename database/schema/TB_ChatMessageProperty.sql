CREATE TABLE
 `DB_Hice`.`TB_ChatMessageProperty`
(
 `vId`
  BINARY(16) 
  NOT NULL 
  DEFAULT(UUID_TO_BIN(UUID())),

 `vChatMessageId`
  BINARY(16)
  NOT NULL,
 `vPropertyId`
  BINARY(16)
  NOT NULL,

 `bIsDeleted`
  BOOLEAN
  NOT NULL
  DEFAULT(0),

 CONSTRAINT
  `ChatMessageProperty_PK`
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT
  `ChatMessageProperty_ChatMessage_FK`
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
  `ChatMessageProperty_Property_FK`
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