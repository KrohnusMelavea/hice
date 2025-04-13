CREATE TABLE 
 `DB_Hice`.`TB_DatabaseUser`
(
 `vId` 
  BINARY(16) 
  NOT NULL 
  DEFAULT(UUID_TO_BIN(UUID())),
 `sUserDomain` 
  CHAR(255) 
  CHARACTER SET 
   'ascii' 
  COLLATE 
   'ascii_general_ci' 
  NOT NULL,
 `sUserName` 
  CHAR(32) 
  CHARACTER SET 
   'utf8mb3' 
  COLLATE 
   'utf8mb3_bin' 
  NOT NULL,

 CONSTRAINT 
  `DatabaseUser_PK` 
 PRIMARY KEY
 (
  `vId`
 ),
 CONSTRAINT 
  `DatabaseUser_MySqlUser_FK` 
 FOREIGN KEY 
 (
  `sUserDomain`, 
  `sUserName`
 ) 
 REFERENCES 
  `mysql`.`user`
  (
   `Host`, 
   `User`
  )
)